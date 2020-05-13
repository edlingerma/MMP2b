class Entry < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :user, :activity, presence: true
end
