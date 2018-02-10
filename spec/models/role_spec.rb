describe Role, type: :model do
  let(:role) { build(:role) }

  it 'has a valid factory' do
    expect(role).to be_valid
  end
end
