require 'spec_helper'
require 'rails_helper'

feature 'Visitor signs up' do
  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end

  scenario 'Sign in page loads' do
    visit new_user_registration_path
    expect(page).to have_content('Sign in with Facebook')
  end

  xscenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  xscenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  xscenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end
end
