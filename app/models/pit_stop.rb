class PitStop < ApplicationRecord
  belongs_to :trip
  validates :name, :location, :remarks, presence: true
end
