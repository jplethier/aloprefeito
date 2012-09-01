FactoryGirl.define do
  factory :attachment do
    gmaps false
    complaint { FactoryGirl.create(:complaint) }
    factory :gmaps_attachment do
      latitude 0
      longitude 0
      gmaps true
    end
  end
end
