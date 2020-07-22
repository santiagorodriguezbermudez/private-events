require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  describe 'New user' do
    it 'User path is correct' do
      # Access Home Page
      visit('/')

      # Go to Sign Up page
      click_button('Sign Up')
      sleep 1

      # Sign up
      fill_in('user[username]', with: 'Test')
      fill_in('user[email]', with: 'test@email.com')
      sleep 1
      click_button('Create')

      # Log out of the session
      visit('/')
      click_button('Logout')

      # Log in
      visit('/')
      click_button('Login')
      sleep 1
      fill_in('Username', with: 'Test')
      sleep 1
      click_button('Login')
      sleep 1

      # Go to Create New Event page
      click_link('Create event')
      sleep 1

      # Create New Event
      fill_in('event[name]', with: 'This is a party test')
      fill_in('event[location]', with: 'A test location')
      fill_in('event[description]', with: 'This is a party description test')
      sleep 1
      click_button('Create Event')

      # Add the user as an attendee to the event
      visit('/events/1')
      sleep 1
      fill_in('username', with: 'Test')
      click_button('invite')
      sleep 2

      # Go to the user profile
      visit('/users/1')
      # Farewell my friends
      click_link('Logout')
    end
  end
end
