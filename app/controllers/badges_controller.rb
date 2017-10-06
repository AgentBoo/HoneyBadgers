class BadgesController < ApplicationController
  def index
    @badges = Badge.where(featured: true)
    render json: @badges
  end

  def all
    @badges = Badge.all.order(:id)
    render json: @badges
  end

  def add
        # reset_session
        if session[:customer_id].nil?
          @customer = Customer.create
          session[:customer_id] = @customer.id
        end

        if session[:order_id].nil?
          @order = Order.create(customer_id: session[:customer_id])
          session[:order_id] = @order.id
        end

        if CartItem.find_by(badge_id: params[:badge_id]).nil?
          @cart_item = CartItem.new(badge_params)
          @cart_item.order_id = session[:order_id]
          @cart_item.save
        else
          @cart_item = CartItem.find_by(badge_id: params[:badge_id])
          @cart_item.update(quantity: params[:quantity].to_i + @cart_item.quantity.to_i)
        end

        redirect_back(fallback_location: root_path)
    end

    def update
      @cart_item = CartItem.find_by(badge_id: params[:badge_id])
      @cart_item.update(badge_update_params)
      redirect_back(fallback_location: root_path)
    end

    def delete
      @cart_item = CartItem.find(params[:badge_id])
      @cart_item.destroy
      redirect_back(fallback_location: root_path)
    end

    private
    def customer_params
      params.permit(:email)
    end

    def badge_update_params
      params.permit(:unit_price, :quantity)
    end

    def badge_params
      params.permit(:badge_id, :unit_price, :quantity)
    end

end
