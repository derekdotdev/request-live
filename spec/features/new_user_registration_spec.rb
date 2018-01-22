require 'spec_helper'
require 'rails_helper'

feature 'Sign up page', js: true do
  def sign_up_with_email(email, password)
    click_button 'Sign up with Email'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirm password', with: password
    click_button 'Sign up'
  end

  before(:each) { visit new_user_registration_path }

  feature 'sign up with email' do
    let(:valid_email) { 'valid@example.com' }
    let(:valid_password) { 'password' }

    let(:invalid_email) { 'invalid email' }
    let(:invalid_password) { 'badpw' }

    scenario 'email button is visible' do
      expect(page).to have_content('Sign up with Email')
    end

    context 'with valid credentials' do
      scenario 'successfully signs up' do
        sign_up_with_email(valid_email, valid_password)
        expect(page).to have_content(valid_email)
      end
    end

    context 'with invalid email' do
      scenario 'shows meaningful error message' do
        sign_up_with_email(invalid_email, valid_password)
        expect(page).to have_content('Email is invalid')
      end
    end

    context 'with invalid password' do
      scenario 'shows meaningful error message' do
        sign_up_with_email(valid_email, invalid_password)
        expect(page).to have_content('Password is too short')
      end
    end
  end

  feature 'sign up with facebook' do
    scenario 'facebook button is visible' do
      expect(page).to have_content('Sign up with Facebook')
    end
  end
end
