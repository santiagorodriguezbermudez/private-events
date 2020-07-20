class Event < ApplicationRecord
    validates :date, presence: { message: "The event has to have a date"}
    belongs_to :creator, class_name: "User"

    has_many :user_events, foreign_key: :attended_event_id
    has_many :attendees, through: :user_events, source: :attendee, dependent: :delete_all 
end
