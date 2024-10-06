# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

organizer1 = User.find_or_initialize_by(email: 'organizer1@example.com', role: :organizer)
organizer1.password = organizer1.password_confirmation = 'qwerty'
organizer1.save! if organizer1.new_record?

organizer2 = User.find_or_initialize_by(email: 'organizer2@example.com', role: :organizer)
organizer2.password = organizer2.password_confirmation = 'qwerty'
organizer2.save! if organizer2.new_record?

participant = User.find_or_initialize_by(email: 'participant@example.com', role: :participant)
participant.password = participant.password_confirmation = 'qwerty'
participant.save! if participant.new_record?
