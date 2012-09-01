class Attachment < ActiveRecord::Base
  attr_protected :id
  has_attached_file :attachment

  validates :latitude, :presence => true, :if => :gmaps?
  validates :longitude, :presence => true, :if => :gmaps?
  validates :gmaps,    :inclusion => { in: [true, false] }

  belongs_to :complaint

  scope :mappable, where(:gmaps => true)

  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
   "#{self.street}, #{self.city}, #{self.country}"
  end

end