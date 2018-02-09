require 'rails_helper'

RSpec.describe 'Sessions' do
  feature 'Visitor on admin dashboard page', js: true do
    let(:role) { Role.create!(name: :admin) }
    let(:user) { User.create!(email: 'user@example.org', password: 'user@example.org') }

    before { user.roles << role }

    feature 'Navigate to dashboard' do
      context 'when not logged in' do
        it 'redirects user to the sign in page' do
          visit rails_admin.dashboard_path
          expect(current_path).to eq(new_user_session_path)
        end
      end

      context 'when logged in' do
        context 'as admin' do
          it 'displays the dashboard' do
            sign_in user
            visit rails_admin.dashboard_path
            expect(current_path).to eq rails_admin.dashboard_path
          end
        end

        context 'as entertainer' do
          let(:role) { Role.create!(name: :requester) }

          it 'redirects to the sign in page' do
            sign_in user
            visit rails_admin.dashboard_path
            expect(current_path).to eq '/'
          end
        end
      end
    end
  end
end
