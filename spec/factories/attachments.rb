FactoryGirl.define do
  factory :attachment do
    attachment_type { Attachment::TYPES[:url] }
    after(:build) do  |attachment|
      attachment.complaint ||= FactoryGirl.create(:complaint)
    end
    factory :url_attachment do
      attachment_type { Attachment::TYPES[:url] }
      url 'www.google.com'
    end
    factory :embed_attachment do
      attachment_type { Attachment::TYPES[:embed] }
      url 'http://www.youtube.com/watch?v=VrN-ODanwqM'
    end
    factory :gmaps_attachment do
      latitude 0
      longitude 0
      attachment_type { Attachment::TYPES[:gmap] }
    end
  end
end
