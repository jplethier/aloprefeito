class Complaint < ActiveRecord::Base
  attr_protected :id

  validates :description, :presence => true
  validates :resolved,    :inclusion => { in: [true, false] }
  validates :anonymous,   :inclusion => { in: [true, false] }

  before_save :auto_add_interest_to_complainer

  belongs_to :user
  has_many :interests
  has_many :attachments

  def auto_add_interest_to_complainer
    self.interests.build(:user => self.user)
    self.user = nil if self.anonymous?
    true
  end
end
