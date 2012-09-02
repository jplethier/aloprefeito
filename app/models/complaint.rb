class Complaint < ActiveRecord::Base
  attr_protected :id

  MAX_PICTURES = 3

  validates :description, :presence => true
  validates :resolved, :inclusion => { in: [true, false]}
  validates :anonymous, :inclusion => { in: [true, false]}

  before_validation :pictures_within_bounds
  before_validation :one_map_only
  before_validation :one_embed_only

  before_save :auto_add_interest_to_user

  belongs_to :user

  has_many :interests
  has_many :attachments

  has_many :pictures, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:picture]}
  has_many :fonts, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:font]}
  has_many :embeds, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:embed]}
  has_many :maps, :class_name => :Attachment, :conditions => {:attachment_type => Attachment::TYPES[:map]}

  accepts_nested_attributes_for :attachments

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
    return if self.maps.blank?
    errors.add(:base, "Too many embeds") if self.embeds.length > 1
  end

  def pictures_within_bounds
    return if self.pictures.blank?
    errors.add(:base, "Too many pictures") if self.pictures.length > MAX_PICTURES
  end

end
