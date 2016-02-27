class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => token
    )

    # Would not do this if not sample app
    u = User.find_or_initialize_by(email: params[:stripeEmail])
    u.stripe_customer_id = customer.id unless should_save = u.stripe_customer_id
    u.password = SecureRandom.uuid unless should_save ||= u.encrypted_password
    u.save if !u.id || should_save

    t = Thing.includes(:user).find(params[:id] || 4 )

    charge = Stripe::Charge.create(
      :customer    => u.stripe_customer_id || customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :metadata => {"thing_id" => t.id},
      :stripe_account => "{#{t.user.stripe_user_id}}"
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
