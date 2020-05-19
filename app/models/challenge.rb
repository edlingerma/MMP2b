# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class Challenge < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :requests, dependent: :destroy
  has_many :users, through: :requests
  has_many :activities, dependent: :destroy
  has_many :entries, through: :activities
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }
  validates :title, :owner, presence: true
  validates :description, length: { maximum: 240 }
  validates :title, length: { maximum: 50 }
  has_one_attached :avatar
  validates :avatar, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'must be a JPEG or PNG' }
  def unconfirmed_requests
    requests.reject(&:confirmed)
  end

  def confirmed_requests
    requests.select do |request|
      request.confirmed && request.user != owner
    end
  end
end
