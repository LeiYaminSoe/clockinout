class ClockEvent < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  validates :user_id, presence: true
  validates :event_type, presence: true
  validates :event_action, presence: true
  validates :event_time, presence: true
  validate do
    self.errors[:event_time] << "must be a valid date" unless (DateTime.parse(self.event_time.strftime("%Y/%m/%d %H:%m")) rescue false)
  end
end
