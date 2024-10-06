require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:created_events).class_name("Event").inverse_of(:creator) }

  it { is_expected.to have_many(:participations) }

  it { is_expected.to have_many(:events).through(:participations) }

  it { is_expected.to define_enum_for(:role).with_values(participant: 0, organizer: 1) }
end
