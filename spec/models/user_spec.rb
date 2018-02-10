describe User, type: :model do
  let(:role) { build(:role, :entertainer) }
  let(:user) { build(:user, roles: [role]) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'ActiveModel validations' do
    describe 'basic validations' do
      describe 'email' do
        it { expect(user).to validate_presence_of(:email).with_message(/can't be blank/) }
        it { expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
      end
    end

    describe 'format validations' do
      describe 'email' do
        it { expect(user).to allow_value('Maxwell Mears').for(:name) }
        it { expect(user).to allow_value('maxwellmears@gmail.com').for(:email) }
        it { expect(user).to_not allow_value('base@example').for(:email) }
        it { expect(user).to_not allow_value('blah').for(:email) }
      end
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(user).to have_many(:requests) }
    it { expect(user).to have_db_index(:email).unique(:true) }
  end

  describe 'ActiveRecord callbacks' do
    # TODO: send welcome email
    # let(:user) { create(:user) }
    # it { expect(user).to callback(:send_welcome_email).after(:create) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(user).to respond_to(:is_admin?) }
      it { expect(user).to respond_to(:is_entertainer?) }
      it { expect(user).to respond_to(:is_requester?) }
    end

    context 'executes methods correctly' do
      describe '#is_admin?' do
        context 'when admin role is present' do
          let(:role) { build(:role, :admin) }

          it 'returns true' do
            expect(user.is_admin?).to be(true)
          end
        end

        context 'when admin role is absent' do
          let(:role) { build(:role, :entertainer) }

          it 'returns false' do
            expect(user.is_admin?).to eq(false)
          end
        end
      end

      describe '#is_entertainer?' do
        context 'when entertainer role is present' do
          let(:role) { build(:role, :entertainer) }

          it 'returns true' do
            expect(user.is_entertainer?).to be(true)
          end
        end

        context 'when entertainer role is absent' do
          let(:role) { build(:role, :requester) }

          it 'returns false' do
            expect(user.is_entertainer?).to eq(false)
          end
        end
      end

      describe '#is_requester?' do
        context 'when requester role is present' do
          let(:role) { build(:role, :requester) }

          it 'returns true' do
            expect(user.is_requester?).to be(true)
          end
        end

        context 'when requester role is absent' do
          let(:role) { build(:role) }

          it 'returns false' do
            expect(user.is_requester?).to eq(false)
          end
        end
      end
    end
  end
end
