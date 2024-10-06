require "rails_helper"

RSpec.describe "Events::All", type: :request do
  let(:user) { create(:user, :participant) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get events_all_index_url

      expect(response).to be_successful
    end
  end
end
