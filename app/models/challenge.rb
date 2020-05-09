class Challenge < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :requests
  has_many :users, :through => :requests
  has_many :activities
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }
end
