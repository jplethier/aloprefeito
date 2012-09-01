FactoryGirl.define do
  factory :attachment do
    gmaps false
    complaint { FactoryGirl.create(:complaint) }
    factory :url_attachment do
      url 'www.google.com'
    end
    factory :gmaps_attachment do
      latitude 0
      longitude 0
      gmaps true
    end
  end
end
