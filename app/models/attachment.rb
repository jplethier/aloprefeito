class Attachment < ActiveRecord::Base
  attr_protected :id
  has_attached_file :attachment

  TYPES = {:font => 1, :embed => 2, :map => 3, :picture => 4}

  validates :latitude, :presence => true,  :if => :map?
  validates :longitude, :presence => true, :if => :map?

  belongs_to :complaint
  scope :mappable, where(:attachment_type => TYPES[:map])

  # TODO: caso a gente decida usar o embed para exibir o video na pagina de show
  # before_save :set_embed_url, :if => 'self.attachment_type.to_i == 2'

  # def set_embed_url
  #   if self.attachment_type.to_i == 2
  #     self.url.gsub('watch?v=', '/embed/')
  #   end
  # end

  def map?
    self.attachment_type == TYPES[:map]
  end

  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
   "#{self.street}, #{self.city}, #{self.country}"
  end

  def gmaps4rails_sidebar
    "Sou uma sidebar!"
  end

end