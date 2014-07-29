class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :subscription_events


  def self.current_members
    joins(:subscription_events).reject { |member| member.subscription_events.last.event_type == 'unsubscribed' }.uniq
  end
end
