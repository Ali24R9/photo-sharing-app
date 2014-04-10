require 'spec_helper'

feature "user sign up" do
  scenario "successfully signs up" do
    visit root_path
    fill_in "User name", with: "Cat"
    fill_in "Password", with: "dog"
    fill_in "Password confirmation", with: "dog"
    click_button "Create User"
  end
end
