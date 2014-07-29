class SubscriptionEventsController < ApplicationController

  def index
    @subscription_events = SubscriptionEvent.includes(:user).order(:date)
  end

  def show
    if current_user.admin?
      @members = User.current_members
    else
      render :file => Rails.root.join('public', '404.html'), :status => 404
    end
  end
end