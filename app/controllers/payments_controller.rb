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
         #@newurl = @callback + "?result=invalid"
            render :action => "invalid"
       end
  end

  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
      render :action => "confirm"
        
        #url = @callback
        # parse url into URI object
        #uri = URI.parse(url)
        # add ampersand if other params are already present in the url
        #uri.query += "&" if uri.query.present?
        # add payment result to callback url (success or cancel)
        #uri.query += "result=success"
        # generate a signature for the url
        #sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
        # add the signature to the url
        #uri.query += "&sig=#{sig}"
        # extract out the new url as a string
        #signed_url = uri.to_s
      
    else
      
      #url = @callback
      # parse url into URI object
      #uri = URI.parse(url)
      # add ampersand if other params are already present in the url
      #uri.query += "&" if uri.query.present?
      # add payment result to callback url (success or cancel)
      #uri.query += "result=cancel"
      # generate a signature for the url
      #sig = Digest::SHA1.hexdigest(uri.query + "r3l@t31nst1tut3")
      # add the signature to the url
      #uri.query += "&sig=#{sig}"
      # extract out the new url as a string
      #signed_url = uri.to_s
      
      @callback = get_callback
      @amount = calculate_amount
      render :action => "new"
    end
  end

  protected

  def calculate_amount
    @amount = params[:amount]    
  end

end
