require "rails_helper"

RSpec.describe "/events", type: :request do
  let(:user) { create(:user, :organizer) }

  before do
    sign_in user
  end

  let(:valid_attributes) {
    { title: "Lorem Ipsum" }
  }

  let(:invalid_attributes) {
    { title: "" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      user.created_events.create! valid_attributes

      get events_url

      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      event = user.created_events.create! valid_attributes

      get event_url(event)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_event_url

      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      event = user.created_events.create! valid_attributes

      get edit_event_url(event)

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Event" do
        expect {
          post events_url, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created event" do
        post events_url, params: { event: valid_attributes }

        expect(response).to redirect_to(event_url(Event.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Event" do
        expect {
          post events_url, params: { event: invalid_attributes }
        }.to change(Event, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post events_url, params: { event: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: "New Title" }
      }

      it "updates the requested event" do
        event = user.created_events.create! valid_attributes

        patch event_url(event), params: { event: new_attributes }

        event.reload
        expect(event.title).to eq("New Title")
      end

      it "redirects to the event" do
        event = user.created_events.create! valid_attributes

        patch event_url(event), params: { event: new_attributes }

        event.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        event = user.created_events.create! valid_attributes

        patch event_url(event), params: { event: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested event" do
      event = user.created_events.create! valid_attributes

      expect {
        delete event_url(event)
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = user.created_events.create! valid_attributes

      delete event_url(event)

      expect(response).to redirect_to(events_url)
    end
  end
end
