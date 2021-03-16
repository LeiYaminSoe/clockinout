require 'rails_helper'

RSpec.describe ClockEvent, type: :model do
  before(:all) do
    @clock_event = create(:clock_event)
  end

  it "Valid if user_id, event_type, event_action, event_time are present" do
    expect(@clock_event).to be_valid
  end
  it "Invalid if there is no User" do
    clock_event = build(:clock_event, user: nil)
    expect(clock_event).to_not be_valid
  end
  it "Invalid if there is no event_type" do
    clock_event = build(:clock_event, event_type: nil)
    expect(clock_event).to_not be_valid
  end
  it "Invalid if there is no event_action" do
    clock_event = build(:clock_event, event_action: nil)
    expect(clock_event).to_not be_valid
  end
  it "Invalid if there is no event_time" do
    clock_event = build(:clock_event, event_time: nil)
    expect(clock_event).to_not be_valid
  end
  it "Invalid if event_time is not datetime" do
    clock_event = build(:clock_event, event_time: "test1234")
    expect(clock_event).to_not be_valid
  end
end
