class PaymentsController < ApplicationController

require 'uri'

before_filter :page_load, :only => [:new, :confim]

  
  def new
    
    query_string = request.query_string.gsub(/&?sig=.*/, '')
    expected_sig = Digest::SHA1.hexdigest(query_string + "r3l@t31nst1tut3")
    
    @amount = params[:amount]
    @description = params[:description]
    @user_id = params[:user_id]
    @signature = params[:sig] 
    @callb = params[:callb]
    
       if params[:sig] != expected_sig
            render :action => "invalid"
       end
       
  end
  
  
  def confirm
    
    #when/if user cancels, send them back to their callback URL HOW TO DO THIS?
    
    if params['cancel']
       render :action => "redirect"
    else
      
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
             
       
      uri = URI.parse(@result.transaction.custom_fields[:callb])

      if uri.query.present?
        uri.query += "&result=success"
      else
        uri.query = "result=success"
      end

      sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
      uri.query += "&sig=#{sig}"
      signed_url = uri.to_s
      
      
    
  if(Customer.where(:user_id => params[:user_id]).first)
    #update record - HOW TO DO THIS? I KNOW MYSQL, BUT NOT THIS :)
  else
    
        
    Customer.create!( 
    :user_id => @result.transaction.custom_fields[:user_id], 
    :first_name => @result.transaction.customer_details.first_name, 
    :last_name => @result.transaction.customer_details.last_name, 
    :email => @result.transaction.customer_details.email, 
    :created_at => "12/12/2011", 
    :updated_at => "12/12/2011")
  
  end
  
    
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
    :created_at => @result.transaction.created_at, 
    :callb => signed_url, 
    :user_id => @result.transaction.custom_fields[:user_id], 
    :custom_fields_dump => @result.transaction.custom_fields.inspect, 
    :transaction_dump => @result.transaction.inspect
    )
  
  
      render :action => "confirm"
            
    else
      #HOW TO GET CALLBACK URL HERE -  WHY DOESN'T RESULT COME NERE?  WE COULDN'T GET IT TO SHOW WHEN WE FAILED
     /
      uri = URI.parse(@result.transaction.custom_fields[:callb])

      if uri.query.present?
        uri.query += "&result=cancel"
      else
        uri.query = "result=cancel"
      end

      sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
      uri.query += "&sig=/#{sig}"
     /signed_url = uri.to_s
    /
    
    #TransactionFailue.create!(:id => @result.transaction.id, :status => @result.transaction.status, :result_dump => @result.inspect, :result_params_dump => @result.transaction.inspect)
    
    
      render :action => "new"
      
    end
  end
 end
 
 
 protected
 
    def page_load
      
      PageLoad.create!(:url => request.url, :id => "what id?", :created_at => "12/12/2011")
      
    end
 
end
