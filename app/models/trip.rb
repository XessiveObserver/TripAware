class Trip < ApplicationRecord
    validates :name, :origin, :destination,
     :reason, :for_how_long, presence: true
    
    belongs_to :user
    has_many :pit_stops, dependent: :destroy
end
