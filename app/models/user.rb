class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_protected :id

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :uid,        :presence => true
  validates :provider,   :presence => true
  validates :email,      :presence => true, :uniqueness => true

  has_many :complaints

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.find_by_email(data.email)
      user.update_attributes!(:first_name => data.first_name, :fb_token => access_token.credentials.token)
      user
    end
  end

  def facebook_profile_picture(size = "normal")
    begin
      FbGraph::User.fetch(uid).picture(size)
    rescue Exception
      nil
    end
  end

  def self.apply_omniauth(data)
    user_info = data.info
    User.new(:email => user_info.email, :first_name => user_info.first_name, :last_name => user_info.last_name, :provider => "facebook", :uid => data.uid, :fb_token => data.credentials.token)
  end

end
