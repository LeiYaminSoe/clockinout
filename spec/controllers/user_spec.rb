require 'rails_helper'
require 'support/spec_test_helper'

RSpec.describe UsersController, type: :controller do
  include SpecTestHelper
  let(:user) { create(:user) }
  context "when logged in" do
    before do
      @user = create(:user)
      login(@user)
    end

    it "display clock_events index page" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    before do
      @params = { user: { username: "test", email: "test@example.com",password: "test1234", password_confirmation: "test1234",user_role: "2"  } }
    end
    context "with valid attributes" do
      it "create new user" do
        expect{post :create, :params => @params}.to change(User, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    it "changes user's attributes" do
      user = create(:user)
      user.update(attributes_for(:user, username: 'new_name'))
      user.reload
      expect(user.username).to eq("new_name")
    end

    it "redirects to users_path" do
      user = create(:user)
      user.update(attributes_for(:user, username: 'new_name'))
      expect(response).to have_http_status(200)
    end
  end
end
