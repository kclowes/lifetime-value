def create_admin(overrides = {})
  User.create!({
                 name: 'Some User',
                 email: 'admin@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 admin: true
               }.merge(overrides))
end

def create_user(overrides = {})
  User.create!({
                 name: "User#{rand}",
                 email: "email#{rand}@example.com",
                 password: 'password',
                 password_confirmation: 'password',
                 admin: false,
               }.merge(overrides))
end

def create_subscription_event(overrides = {})
  raise "User required" unless overrides.include?(:user)
  SubscriptionEvent.create!({
                 event_type: "subscribed",
                 date: Date.today,
                 price_per_month_in_cents: 700,
               }.merge(overrides))
end