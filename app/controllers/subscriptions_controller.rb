class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.build_subscription(params[:subscription])
    if @subscription.save_with_payment
      current_user.update_attribute(:role, 'premium')
      redirect_to root_path, :notice => "Thank you for
        subscribing!"
    else
      render :new
    end
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_token)
    if customer.cancel_subscription
      current_user.update_attribute(:role, 'member')
      current_user.subscription.destroy
      redirect_to root_path, :notice => "Your subscription has been canceled"

    else
      flash[:notice] = "Sorry, cancelling your subscription failed."
      render :edit
    end

  end
end
