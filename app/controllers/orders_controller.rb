class OrdersController < ApplicationController

  def show
  # if session[:customer_id] == SignedupUser.find(session[:customer_id])
  # @user = SignedupUser.find(session[:customer_id]).customer.order.last
  # @order = Order.find(params[:id])
  # render :json => { :order => @order,
  #                   :cart_items => @order.cart_items,
  #                   :contact_info => @user.contact_info }
  # else
    @order = Order.find(params[:id])
    render :json => { :order => @order,
                      :cart_items => @order.cart_items }
  # end

end

def complete
  @order = Order.find(session[:order_id])
  @order.order_status_id = 2
  render json: @order
end

end
