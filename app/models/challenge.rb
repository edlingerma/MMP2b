class Challenge < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :requests, dependent: :destroy
  has_many :users, :through => :requests
  has_many :activities, dependent: :destroy
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }
end