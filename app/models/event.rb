class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :participations, dependent: :destroy

  has_many :users, through: :participations

  validates :title, presence: true

  def available_seats
    return if limit.nil?

    limit - participations.count
  end

  def available_seats?
    limit.nil? || (limit - participations.count) > 0
  end
end
