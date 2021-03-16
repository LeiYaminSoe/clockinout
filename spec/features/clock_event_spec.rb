require 'rails_helper'
require 'support/spec_test_helper'

RSpec.feature "ClockEvent", :type => :feature do
  scenario "Add ClockEvent" do
    visit "/clock_events"
    #find("option[value='1']").select_option
    #find("option[value='2']").select_option
    #within('new_clock_event') do
    #  fill_in "event_time", :with => "2021/03/16 21:53"
    #end
    #click_button "Save"

    expect(page).to have_http_status "200"
  end
end
