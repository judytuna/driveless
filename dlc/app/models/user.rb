class User < ActiveRecord::Base
  has_one :baseline
  has_many :trips
  
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end # block optional

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end
end
