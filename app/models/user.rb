# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, :name, length: { maximum: 50 }
  has_many :requests
  has_many :entries
  has_many :challenges, :through => :requests

  private

  def self.find_or_create_with_omniauth(auth)
    # look for an existing authorisation
    # provider + uid uniquely identify a user
    User.find_or_create_by!(
      provider: auth['provider'],
      name: auth.info['name'],
      username: auth.info['name'],
      password_digest: '1234567890'
    )
  end
end
