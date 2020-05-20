# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  validates :user, :challenge, presence: true
  validates_uniqueness_of :user_id, :scope => [:challenge_id]
  delegate :name, :to => :user, :prefix => true
end
