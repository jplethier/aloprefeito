# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    description 'Descricao'
    resolved false
    anonymous false
    factory :complaint_with_user do
      user { FactoryGirl.create(:user) }
    end
  end
end
