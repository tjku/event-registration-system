require "rails_helper"

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:creator).class_name("User").with_foreign_key("user_id") }

  it { is_expected.to have_many(:participations) }

  it { is_expected.to have_many(:users).through(:participations) }

  it { is_expected.to validate_presence_of(:title) }
end
