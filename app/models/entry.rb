class Entry < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :user, :activity, :amount, presence: true
  validates_length_of :amount, minimum: 1
  validates_numericality_of :amount
end
