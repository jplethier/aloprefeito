# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    title 'Titulo'
    description 'Description'
    resolved false
    anonymous false
    user { FactoryGirl.build(:user) }
    after(:build) do |complaint|
      if complaint.maps.empty?
        FactoryGirl.build(:gmaps_attachment, :complaint => complaint)
      end
    end

    #factory :complaint_with_user do
    #  anonymous false
    #
    #end
  end
end
