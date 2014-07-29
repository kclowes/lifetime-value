require 'rails_helper'

feature 'Reporting' do
  scenario 'admin can see who the current members are' do
    create_admin(name: 'Admin User')
    subscribed_user = create_user(name: 'Subscribed User')

    create_subscription_event(user: subscribed_user, event_type: 'subscribed')

    visit root_path
    fill_in 'user[email]', with: 'admin@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'
    click_on 'Current Members'
    within("table") do
      expect(page).to have_content 'Subscribed User'
      expect(page).to have_no_content 'Admin User'
    end
  end

  scenario 'non-admin users see a 404 page when trying to view current members' do
    create_user(email: 'user@example.com', password: 'password')
    visit root_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'
    click_on 'Current Members'

    expect(page).to have_content '404'
  end
end