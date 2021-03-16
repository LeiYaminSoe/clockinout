require 'rails_helper'
require 'support/spec_test_helper'

RSpec.feature "User management", :type => :feature do
  scenario "Login" do
    visit "/sessions/new"
    within('form#new_user') do
      fill_in "user_email", :with => "test@example.com"
      fill_in "user_password", :with => "test1234"
    end
    click_button "Login_user"

    expect(page).to have_http_status "200"
  end
  scenario "Add New User" do
    visit "/users/new"
    within('form#new_user') do
      fill_in "user_username", :with => "test"
      fill_in "user_email", :with => "test@example.com"
      fill_in "user_password", :with => "test1234"
      fill_in "user_password_confirmation", :with => "test1234"
      find("option[value='2']").select_option

    end
    click_button "Save"

    expect(page).to have_http_status "200"
  end
  scenario "Edit User" do
    user = create(:user)
    url = "/users/" + user.id.to_s + "/edit"
    edit_form = "form#edit_user_" + user.id.to_s
    visit url
    #within(edit_form) do
    #  fill_in "user_username", :with => "new_name"
    #end
    #click_button "Save"

    expect(page).to have_http_status "200"
  end
end
