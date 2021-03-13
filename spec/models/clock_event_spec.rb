require 'rails_helper'

RSpec.describe ClockEvent, type: :model do
  it "Valid if user_id, event_type, event_action, event_time are present" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    user.save
    clock_event = ClockEvent.new(user_id: user, event_type: 1, event_action: 1, event_time: "2021-03-14 03:49:00")
    clock_event.user = user
    expect(clock_event).to be_valid
  end
  it "Invalid if there is no User" do
    clock_event = ClockEvent.new(event_type: 1, event_action: 1, event_time: "2021-03-14 03:49:00")
    clock_event.user = nil
    expect(clock_event).to be_valid
  end
  it "Invalid if there is no event_type" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    user.save
    clock_event = ClockEvent.new(event_type: nil, event_action: 1, event_time: "2021-03-14 03:49:00")
    clock_event.user = user
    expect(clock_event).to be_valid
  end
  it "Invalid if there is no event_action" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    user.save
    clock_event = ClockEvent.new(event_type: 1, event_action: nil, event_time: "2021-03-14 03:49:00")
    clock_event.user = user
    expect(clock_event).to be_valid
  end
  it "Invalid if there is no event_time" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    user.save
    clock_event = ClockEvent.new(event_type: 1, event_action: 1, event_time: nil)
    clock_event.user = user
    expect(clock_event).to be_valid
  end
  it "Invalid if event_time is not datetime" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    user.save
    clock_event = ClockEvent.new(event_type: 1, event_action: 1, event_time: "test1234")
    clock_event.user = user
    expect(clock_event).to be_valid
  end
end
