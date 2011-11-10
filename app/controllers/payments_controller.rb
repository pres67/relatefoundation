require 'uri'

class PaymentsController < ApplicationController
  
  def new
    query_string = request.query_string.gsub(/&?sig=.*/, '')
    
    expected_sig = Digest::SHA1.hexdigest(query_string + "r3l@t31nst1tut3")
    
    @sig = expected_sig
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
        
        render :action => "confirm"
            
    else
     / 
      uri = URI.parse(@result.transaction.custom_fields[:callb])

      if uri.query.present?
        uri.query += "&result=cancel"
      else
        uri.query = "result=cancel"
      end

      sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
      uri.query += "&sig=#{sig}"
      signed_url = uri.to_s
      @uri2 = signed_url
      /
      render :action => "new"
      
    end
  end
end
