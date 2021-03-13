require 'rails_helper'

RSpec.describe User, type: :model do
  it "Valid if username, email, password, password_confirmation, user_role are present" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if there is no username" do
    user = User.new(username: nil, email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if there is no email" do
    user = User.new(username: "test", email: nil, password: "test1234", password_confirmation: "test1234", user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if email is incorrect format" do
    user = User.new(username: "test", email: "test1234", password: "test1234", password_confirmation: "test1234", user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if there is no password"  do
    user = User.new(username: "test", email: "test@example.com", password: nil, password_confirmation: "test1234", user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if there is no password_confirmation"  do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: nil, user_role: 2)
    expect(user).to be_valid
  end
  it "Invalid if there is no user_role" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test1234", user_role: nil)
    expect(user).to be_valid
  end
  it "Invalid if password and password_confirmation do not match" do
    user = User.new(username: "test", email: "test@example.com", password: "test1234", password_confirmation: "test14", user_role: 2)
    expect(user).to be_valid
  end
end
