class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_many :attendances
  has_many :attendee, through: :attendances, source: :user

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
end
