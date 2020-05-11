class Activity < ApplicationRecord
  belongs_to :challenge
  has_many :entries, dependent: :delete_all
end
