class User < ActiveRecord::Base
  attr_protected :id

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :uid,        :presence => true
  validates :provider,   :presence => true
  validates :email,      :presence => true

  has_many :complaints
end
