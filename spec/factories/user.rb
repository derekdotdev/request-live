FactoryBot.define do
  factory :user do
    email 'maxwellmears@gmail.com'
    password 'password'

    transient do
      admin false
      entertainer false
      requester false
    end

    after :build do |user, options|
      # build roles instead of create to avoid hitting the db to keep things fast
      user.roles << build(:role, :admin) if options.admin
      user.roles << build(:role, :entertainer) if options.entertainer
      user.roles << build(:role, :requester) if options.requester
    end

    # We might have to use this in the future if we find we have to create 
    # because #build isn't enough
    # after :create do |user, options|
      # user.add_role(:admin) if options.admin
      # user.add_role(:entertainer) if options.entertainer
      # user.add_role(:requester) if options.requester
    # end
  end
end
