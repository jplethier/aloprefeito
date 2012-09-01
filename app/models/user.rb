class User < ActiveRecord::Base
  attr_protected :id

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :uid,        :presence => true
  validates :provider,   :presence => true
  validates :email,      :presence => true

  has_many :complaints

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.uid = auth.uid
      user.provider = auth.provider
      user.email = auth.info.email
      user.fb_token = auth.credentials.token
      user.save!
    end
  end

end
