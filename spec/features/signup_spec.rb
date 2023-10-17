# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Sign up', type: :feature do
  before :each do
    @user = FactoryBot.build(:user)
    visit '/users/sign_up'
  end

  it 'signs me up' do
    within('#new_user') do
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirm Password', with: @user.password
    end
    click_button 'Sign up'
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
  end

  it 'signs me in with empty values' do
    within('#new_user') do
      fill_in 'Username', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Confirm Password', with: ''
    end
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end

  context 'signs me in' do
    before :each do
      @user = FactoryBot.create(:user)
    end

    it 'with repeated email' do
      within('#new_user') do
        fill_in 'Username', with: 'Test Email2'
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        fill_in 'Confirm Password', with: @user.password
      end
      click_button 'Sign up'
      expect(page).to have_content 'Email has already been taken'
    end

    it 'with repeated username' do
      within('#new_user') do
        fill_in 'Username', with: @user.username
        fill_in 'Email', with: 'usertest@test.com'
        fill_in 'Password', with: @user.password
        fill_in 'Confirm Password', with: @user.password
      end
      click_button 'Sign up'
      expect(page).to have_content 'Username has already been taken'
    end
  end
end

# rubocop:enable Metrics/BlockLength
