

class PaymentsController < ApplicationController
  def new
    @amount = params[:amount]
    @description = params[:description]
    @callback = params[:callback]
    @user_id = params[:user_id]
    @signature = params[:sig]
  end

  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
      render :action => "confirm"
    else
      @amount = calculate_amount
      render :action => "new"
    end
  end

  protected

  def calculate_amount

    @amount = params[:amount]
    
    # in a real app this be calculated from a shopping cart, determined by the product, etc.
    #"100.00"
  end
end
