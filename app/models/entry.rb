class Entry < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :user, :activity, presence: true
  validates_length_of :goal, minimum: 1;
end
