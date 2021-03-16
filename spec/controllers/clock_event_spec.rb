require 'rails_helper'
require 'support/spec_test_helper'

RSpec.describe ClockEventsController, type: :controller do
  include SpecTestHelper
  context "when logged in" do
    before do
      user = create(:user)
      login(user)
    end

    it "display clock_events index page" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "when create clock_event" do
    before do
      user = create(:user)
      login(user)
    end

    it "create clock_event" do
      expect {create(:clock_event)}.to change(ClockEvent, :count).by(1)
    end
  end

  context "when update clock_event" do
    before do
      user = create(:user)
      login(user)
    end

    it "update clock_event" do
      clock_event = create(:clock_event, :event_time => "2021-03-15 03:49:00")
      expect(clock_event.event_time).to eq '2021-03-15 03:49:00'
    end
  end

  describe "POST #create" do
    before do
      user = create(:user)
      login(user)
      @params = { clock_event: { user_id: user.id, event_type: 1, event_action: 1, event_time: "2021-03-14 03:49:00", created_at: "2021-03-14 03:49:00",updated_at: "2021-03-14 03:49:00"} }
    end

    context "with valid attributes" do
      it "create new user" do
        expect{post :create, :params => @params}.to change(ClockEvent, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    it "changes clock_event's attributes" do
      clock_event = create(:clock_event)
      clock_event.update(attributes_for(:clock_event, event_time: '2021-03-15 03:49:00'))
      clock_event.reload
      expect(clock_event.event_time).to eq("2021-03-15 03:49:00")
    end

    it "redirects to clocks_path" do
      clock_event = create(:clock_event)
      clock_event.update(attributes_for(:clock_event, event_time: '2021-03-15 03:49:00'))
      expect(response).to have_http_status(200)
    end
  end
end
