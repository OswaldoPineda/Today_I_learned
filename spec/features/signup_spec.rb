# frozen_string_literal: true

require "rails_helper"

describe "Sign un", type: :feature do
  before :each do
    @user = FactoryBot.build(:user)
    visit '/users/sign_up'
  end

  it "signs me up" do
    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirm Password', with: @user.password
    end
    click_button 'Sign up'
    expect(page).to have_content ' Welcome! You have signed up successfully'
  end

  it "signs me in with empty values" do
    within("#new_user") do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Confirm Password', with: ''
    end
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
