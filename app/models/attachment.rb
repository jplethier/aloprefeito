class Attachment < ActiveRecord::Base
  attr_protected :id
  has_attached_file :attachment

  TYPES = {:font => 1, :embed => 2, :map => 3, :picture => 4}

  validates :latitude, :presence => true,  :if => :map?
  validates :longitude, :presence => true, :if => :map?

  belongs_to :complaint
  scope :mappable, where(:type => TYPES[:map])


  def map?
    self.type == TYPES[:map]
  end

  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
   "#{self.street}, #{self.city}, #{self.country}"
  end

end