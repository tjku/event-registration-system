require "rails_helper"

RSpec.describe "Events::Register", type: :request do
  let(:event) { create(:event) }
  let(:user) { create(:user, :participant) }

  before do
    sign_in user
  end

  describe "POST /create" do
    it "registers to the event" do
      expect {
        post event_register_url(event)
      }.to change(Participation, :count).by(1)
    end

    it "redirects to the event page" do
      post event_register_url(event)

      expect(response).to redirect_to(events_url)
    end
  end
end
