class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_many :attendances
  has_many :attendee, through: :attendances, source: :user

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ? ', Date.today)}
end
