class Activity < ApplicationRecord
  belongs_to :challenge
  has_many :entries, dependent: :destroy
  validates :goal, :challenge, :title, presence: true
  validates_length_of :description, maximum: 350
  validates_length_of :goal, minimum: 1
  validates_numericality_of :goal
  def amount
    entries.reduce(0) do |sum, entry|
      sum + entry.amount
    end
  end
end
