# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class Activity < ApplicationRecord
  belongs_to :challenge
  has_many :entries, dependent: :destroy
  validates :goal, :challenge, :title, presence: true
  validates_length_of :description, maximum: 350
  validates :title, length: {:within => 5..50 }
  validates_length_of :goal, minimum: 1
  validates :unit, length: { maximum: 10 }
  validates_numericality_of :goal
  def amount
    entries.reduce(0) do |sum, entry|
      sum + entry.amount
    end
  end
  validates :goal, numericality: { greater_than_or_equal_to: :amount }, on: :update
end
