require "rails_helper"

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:creator).class_name("User").with_foreign_key("user_id") }

  it { is_expected.to have_many(:participations) }

  it { is_expected.to have_many(:users).through(:participations) }

  it { is_expected.to validate_presence_of(:title) }

  describe "#available_seats" do
    let(:event) { create(:event) }
    subject { event.available_seats }

    context "when there is no limit" do
      it { is_expected.to be_nil }
    end

    context "when there is a limit" do
      let(:event) { create(:event, limit: 3) }

      it { is_expected.to eq(3) }
    end
  end

  describe "#available_seats?" do
    let(:event) { create(:event) }
    subject { event.available_seats? }

    context "when there is no limit" do
      it { is_expected.to eq(true) }
    end

    context "when there is a limit" do
      let(:event) { create(:event, limit: 0) }

      it { is_expected.to eq(false) }
    end
  end
end
