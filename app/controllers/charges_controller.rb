class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @amount = Event.find(params[:event_id]).price*100

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd',
  })

Attendance.create(event_id: Event.find(params[:event_id]).id, user_id: current_user.id, stripe_customer_id: customer.id)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
