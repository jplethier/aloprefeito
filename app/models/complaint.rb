class Complaint < ActiveRecord::Base
  attr_protected :id

  validates :description, :presence => true
  validates :resolved,    :inclusion => { in: [true, false] }
  validates :anonymous,   :inclusion => { in: [true, false] }

  belongs_to :user
end
