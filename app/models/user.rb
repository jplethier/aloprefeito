class User < ActiveRecord::Base
  attr_protected :id

  validates :first_name, :presence => true
end
