require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end
  it "Valid if username, email, password, password_confirmation, user_role are present" do
    expect(@user).to be_valid
  end
  it "Invalid if there is no username" do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end
  it "Invalid if there is no email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
  it "Invalid if email is incorrect format" do
    user = build(:user, email: "test1234")
    expect(user).to_not be_valid
  end
  it "Invalid if there is no password"  do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end
  it "Invalid if there is no password_confirmation"  do
    user = build(:user, password_confirmation: nil)
    expect(user).to_not be_valid
  end
  it "Invalid if there is no user_role" do
    user = build(:user, user_role: nil)
    expect(user).to_not be_valid
  end
  it "Invalid if password and password_confirmation do not match" do
    user = build(:user, password: "test1234", password_confirmation: "1234test")
    expect(user).to_not be_valid
  end
end
