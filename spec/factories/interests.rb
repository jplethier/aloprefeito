# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interest do
    send_email true
    
    user
    complaint
  end
end
