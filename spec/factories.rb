FactoryBot.define do
  factory :user do
    username {"test"}
    email {"test@example.com"}
    password {"test1234"}
    password_confirmation {"test1234"}
    user_role {"2"}
  end

  factory :clock_event do
    before(:create) { |object| object.user = create(:user)}
    event_type {1}
    event_action {1}
    event_time {"2021-03-14 03:49:00"}
    created_at {"2021-03-14 03:49:00"}
    updated_at {"2021-03-14 03:49:00"}
  end
end
