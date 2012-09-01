FactoryGirl.define do
  factory :attachment do
    type { Attachment::TYPES[:url] }
    complaint { FactoryGirl.create(:complaint) }
    factory :url_attachment do
      url 'www.google.com'
    end
    factory :gmaps_attachment do
      latitude 0
      longitude 0
      type { Attachment::TYPES[:gmap] }
    end
  end
end
