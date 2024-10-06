class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :participations, dependent: :destroy

  has_many :users, through: :participations

  validates :title, presence: true
end
