require 'rails_helper'

RSpec.describe "ClockEvents", type: :request do
  describe "#index" do
    before do
      user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
      user.save
      clock_event = ClockEvent.new(event_type: 1, event_action: nil, event_time: "2021-03-14 03:49:00")
      clock_event.user = user
      clock_event.save
      @clock_events = ClockEvent.all
      get :index
    end

    it 'populates an array of all questions' do
      expect(@clock_events.size).to eq(1)
    end
  end
end
