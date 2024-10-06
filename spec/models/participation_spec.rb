require "rails_helper"

RSpec.describe Participation, type: :model do
  let(:user) { create(:user, :participant) }
  let(:event) { create(:event) }

  subject { Participation.create!(user: user, event: event) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to belong_to(:event) }

  it { is_expected.to validate_uniqueness_of(:event).scoped_to(:user_id) }
end
