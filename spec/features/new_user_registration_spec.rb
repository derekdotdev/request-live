require 'rails_helper'

feature 'Visitor on sign up page', js: true do
  def sign_up_with_email(email, password, password_conf, user_type = 'Entertainer')
    click_button 'Sign up with Email'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirm password', with: password_conf

    find('#requester', visible: false).click if user_type == 'User'
    find('#entertainer', visible: false).click if user_type == 'Entertainer'

    click_button 'Sign up'
  end

  before(:each) { visit new_user_registration_path }

  feature 'signs up with email' do
    let(:valid_email) { 'valid@example.com' }
    let(:valid_password) { 'validPassword' }
    let(:invalid_email) { 'invalid-example.com' }
    let(:invalid_password) { 'badpw' }
    let(:missing_password) { '' }

    scenario 'email button is visible' do
      expect(page).to have_content('Sign up with Email')
    end

    scenario 'displays the email form dynamically' do
      click_button 'Sign up with Email'
      expect(page).to have_content('Sign up with Request Live.')
    end

    context 'with valid credentials' do
      scenario 'successfully signs up' do
        sign_up_with_email(valid_email, valid_password, valid_password)
        expect(page).to have_content(valid_email)
      end

      scenario 'successfully signs up an Entertainer' do
        sign_up_with_email(valid_email, valid_password, valid_password, 'Entertainer')
        expect(page).to have_content(valid_email)
        expect(User.last.type).to eq('Entertainer')
      end

      scenario 'successfully signs up a User' do
        sign_up_with_email(valid_email, valid_password, valid_password, 'User')
        expect(page).to have_content(valid_email)
        expect(User.last.type).to eq('User')
      end
    end

    context 'with invalid email' do
      scenario 'displays meaningful error message' do
        sign_up_with_email(invalid_email, valid_password, valid_password)
        expect(page).to have_content('Email is invalid')
      end
    end

    context 'with invalid password' do
      scenario 'displays meaningful error message' do
        sign_up_with_email(valid_email, invalid_password, invalid_password)
        expect(page).to have_content('Password is too short')
      end
    end

    context 'with missing passwords' do
      context 'with missing password' do
        scenario 'displays meaningful error message' do
          sign_up_with_email(valid_email, missing_password, missing_password)
          expect(page).to have_content('Password can\'t be blank')
        end
      end

      context 'with passwords that do not match' do
        scenario 'displays meaningful error message' do
          sign_up_with_email(valid_email, valid_password, missing_password)
          expect(page).to have_content('Password confirmation doesn\'t match')
        end
      end
    end
  end

  feature 'sign up with facebook' do
    scenario 'facebook button is visible' do
      expect(page).to have_content('Sign up with Facebook')
    end

    scenario 'test' do
      expect(true).to be(false)
    end
  end
end
