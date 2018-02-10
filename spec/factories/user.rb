FactoryBot.define do
  factory :user do
    email 'maxwellmears@gmail.com'
    password 'password'
  end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
