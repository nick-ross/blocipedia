class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.build_subscription(params[:subscription])
    if @subscription.save_with_payment
      redirect_to root_path, :notice => "Thank you for 
        subscribing!"
    else
      render :new
    end
  end
end
