class ChargesController < ApplicationController
  Stripe.api_key = "sk_test_T2e4HqYb4fZr41Xe1zUvI6ZF"

def new
end

def create
  # Amount in cents
  contact_info = ContactInfo.new(contact_params)
  contact_info.order_id = session[:order_id]
  contact_info.save

  @amount = Order.find(session[:order_id]).total.to_i * 100

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => "tok_bypassPending"
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_back(fallback_location root_path)
end
  render json: { success: "Payment has been made successfully"}

private
def contact_params
  params.permit(:first_name, :last_name, :address_line_1, :address_line_2, :city, :state, :zip, :phone, :special_instructions)
end
end
