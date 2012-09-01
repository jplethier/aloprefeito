class Interest < ActiveRecord::Base
  attr_protected :id

  validates :send_email,   :inclusion => { in: [true, false] }
  validates :user_id,      :presence => true, :uniqueness => { :scope => :complaint_id }
  validates :complaint_id, :presence => true, :uniqueness => { :scope => :user_id }

  belongs_to :user
  belongs_to :complaint
end
