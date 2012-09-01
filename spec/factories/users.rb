# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Factory'
    last_name 'User'
    uid '12'
    provider 'Facebook'
    email 'factory@user.com'
  end
end
