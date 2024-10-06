class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event", inverse_of: :creator, dependent: :destroy

  has_many :participations, dependent: :destroy

  has_many :events, through: :participations

  enum :role, { participant: 0, organizer: 1 }
end
