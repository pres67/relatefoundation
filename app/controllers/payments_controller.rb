class PaymentsController < ApplicationController

  require 'uri'

  before_filter :page_load, :only => [:new, :confim]

  
  def new
    
    query_string = request.query_string.gsub(/&?sig=.*/, '')
    expected_sig = Digest::SHA1.hexdigest(query_string + "r3l@t31nst1tut3")
    
    if params[:sig] != expected_sig
      render :action => "invalid"
      return
    end
    
    @signature = params[:sig] # just for testing
    @amount = params[:amount]
    @description = params[:description]
    @user_id = params[:user_id]
    @callb = params[:callb]
    Customer.find_by_user_id(@user_id) || Customer.create!(:user_id => @user_id)
       
  end
  
  def cancel
    uri = URI.parse(params[:callb])
    add_params(uri, 'result' => 'cancel')
    sign_uri(uri)
    ::Callback.create!(:url => uri.to_s)
    redirect_to uri.to_s
  end
  
  def confirm
    
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
           
      user_id = @result.transaction.custom_fields[:user_id]
      customer = Customer.find_by_user_id(user_id)
      if customer.nil?
        raise "Customer not found: #{user_id}"
      end
      customer.update_attributes!(
        :first_name => @result.transaction.customer_details.first_name, 
        :last_name => @result.transaction.customer_details.last_name, 
        :email => @result.transaction.customer_details.email
      )
  
      Transaction.create!( 
        :transaction_id =>@result.transaction.id, 
        :type => @result.transaction.type, 
        :amount => @result.transaction.amount, 
        :status => @result.transaction.status, 
        :braintree_created_at => @result.transaction.created_at, 
        :braintree_updated_at => @result.transaction.updated_at, 
        :token => @result.transaction.credit_card_details.token, 
        :bin => @result.transaction.credit_card_details.bin, 
        :last_4 => @result.transaction.credit_card_details.last_4, 
        :card_type => @result.transaction.credit_card_details.card_type, 
        :expiration_date => @result.transaction.credit_card_details.expiration_date, 
        :cardholder_name => @result.transaction.credit_card_details.cardholder_name, 
        :customer_location => @result.transaction.credit_card_details.customer_location, 
        :first_name => @result.transaction.customer_details.first_name,
        :last_name => @result.transaction.customer_details.last_name, 
        :email => @result.transaction.customer_details.email, 
        :masked_number => @result.transaction.id, 
        :callb => @result.transaction.custom_fields[:callb], 
        :user_id => @result.transaction.custom_fields[:user_id], 
        :custom_fields_dump => @result.transaction.custom_fields.inspect, 
        :transaction_dump => @result.transaction.inspect
      )

      callb = URI.parse(@result.transaction.custom_fields[:callb])
      add_params(callb, 'result' => 'success')
      sign_uri(callb)
      redirect_to callb.to_s
          
    else
  
      TransactionFailure.create!(:status => "failure", :result_dump => @result.inspect, :result_params_dump => @result.params.inspect)
  
      @amount = @result.params[:transaction][:amount]
      @description = ''
      @user_id = @result.params[:transaction][:custom_fields][:user_id]
      @callb = @result.params[:transaction][:custom_fields][:callb]
  
      render :action => "new"
    
    end
  end
 
 
  protected
  
  # expects and returns a URI object
  def add_params(uri, param_hash)
    if uri.query.blank?
      uri.query = ""
    else
      uri.query += "&"
    end
    uri.query += param_hash.to_param
  end
  
  def sign_uri(uri)
    sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
    add_params(uri, 'sig' => sig)
  end
  
  def page_load
    PageLoad.create!(:url => request.url)
  end
 
end
