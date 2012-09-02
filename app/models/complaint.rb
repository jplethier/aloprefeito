class Complaint < ActiveRecord::Base

  acts_as_commentable

  attr_protected :id

  MAX_PICTURES = 3

  validates :description, :presence => true
  validates :title,       :presence => true
  validates :resolved,    :inclusion => { in: [true, false]}
  validates :anonymous,   :inclusion => { in: [true, false]}

  before_validation :pictures_within_bounds
  before_validation :one_map_only
  before_validation :one_embed_only
  before_validation :three_fonts_only

  before_save :auto_add_interest_to_user

  belongs_to :user

  has_many :interests
  has_many :attachments

  has_many :pictures, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:picture]}
  has_many :fonts, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:font]}
  has_many :embeds, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:embed]}
  has_many :maps, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:map]}

  accepts_nested_attributes_for :pictures

  accepts_nested_attributes_for :fonts

  accepts_nested_attributes_for :embeds

  accepts_nested_attributes_for :maps

  acts_as_taggable
  
  def auto_add_interest_to_user
    self.interests.build(:user => self.user)
    self.user = nil if self.anonymous?
    true
  end

  def one_map_only
    return if self.maps.blank?
    self.errors.add(:maps, "Too many maps") if self.maps.length > 1
  end

  def one_embed_only
    # eliminando o video se nao tiver sido cadastrado um  
    if self.embeds.first
      self.embeds -= [self.embeds.first] if self.embeds.first.url.nil? || self.embeds.first.url.blank?
    end

    return if self.embeds.blank?
    errors.add(:base, "Too many embeds") if self.embeds.length > 1
  end

  def pictures_within_bounds
    
    #removendo relacionamentos que estao vazios
    pictures_to_remove = []
    self.pictures.each do |pic|
      pictures_to_remove << pic if pic.attachment_file_name.nil?
    end
    pictures_to_remove.each do |pic|
      self.pictures -= [pic]
    end

    return if self.pictures.blank?
    errors.add(:base, "Too many pictures") if self.pictures.length > MAX_PICTURES
  end

  def three_fonts_only
    
    #removendo relacionamentos que estao vazios
    fonts_to_remove = []
    self.fonts.each do |font|
      fonts_to_remove << font if font.attachment_file_name.nil?
    end
    fonts_to_remove.each do |font|
      self.fonts -= [font]
    end

    return if self.fonts.blank?
    errors.add(:base, "Too many fonts") if self.fonts.length > 3
  end

end
