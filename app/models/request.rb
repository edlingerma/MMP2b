class Request < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  validates :user, :challenge, presence: true
  validates_uniqueness_of :user_id, :scope => [:challenge_id]
end
