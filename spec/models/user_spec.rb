require 'rails_helper'

describe User do
  it 'will return current members' do
    create_user
    subscribed_user = create_user(name: 'Subscribed User')
    unsubscribed_user = create_user(name: 'Unsubscribed User')
    resubscribed_user = create_user(name: 'Resubscribed User')
    changed_user = create_user(name: 'Changed User')

    create_subscription_event(user: subscribed_user, event_type: 'subscribed')
    create_subscription_event(user: unsubscribed_user, event_type: 'subscribed')
    create_subscription_event(user: unsubscribed_user, event_type: 'unsubscribed')
    create_subscription_event(user: changed_user, event_type: 'changed')

    create_subscription_event(user: resubscribed_user, event_type: 'subscribed')
    create_subscription_event(user: resubscribed_user, event_type: 'unsubscribed')
    create_subscription_event(user: resubscribed_user, event_type: 'subscribed')

    expect(User.current_members).to match_array([subscribed_user, resubscribed_user, changed_user])
  end
end