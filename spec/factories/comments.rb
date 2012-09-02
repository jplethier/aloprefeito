FactoryGirl.define do
  factory :comment do
    comment "comentario.."
    user
    commentable { FactoryGirl.create :complaint }
  end
end
