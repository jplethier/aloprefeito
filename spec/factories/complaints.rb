# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    description 'Descricao'
    resolved false
    anonymous false
  end
end
