# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class Entry < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :user, :activity, :amount, presence: true
  validates_numericality_of :amount
  validates_length_of :amount, minimum: 1
end
