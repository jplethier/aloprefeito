class Attachment < ActiveRecord::Base
  attr_protected :id
  has_attached_file :attachment, :path => ':rails_root/public/system/attachments/:id_partition/pictures/:filename', :url => '/system/attachments/:id_partition/pictures/:filename'

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

end