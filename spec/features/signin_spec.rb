# frozen_string_literal: true

require 'rails_helper'

describe 'Sign in', type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
  end

  it 'signs me in with a not confirmed account' do
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'test1234'
    end
    click_button 'Log in'
    expect(page).to have_content 'You have to confirm your email address before continuing.'
  end

  it 'signs me in' do
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'test1234'
    end
    @user.confirm
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
  end

  it 'signs me in with empty values' do
    within('#new_user') do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
end
