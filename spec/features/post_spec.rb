# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'post', type: :feature do
  before :each do
    @post = FactoryBot.build(:post)
    @user = FactoryBot.create(:user)
    @user.confirm
    FactoryBot.create(:label)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'test1234'
    end
    click_button 'Log in'
  end

  context 'created' do
    it 'with correct values' do
      visit '/posts/new'
      find('input[name="post[title]"]').fill_in with: @post.title
      find('input[name="post[content]"]', visible: false).set(@post.content)
      expect(page).to have_content 'Post was successfully created.'
    end

    it 'with empty title' do
      visit '/posts/new'
      find('input[name="post[content]"]', visible: false).set(@post.content)
      click_on 'Save'
      expect(page).to have_content "Title can't be blank"
    end

    it 'with empty content' do
      visit '/posts/new'
      find('input[name="post[title]"]').fill_in with: @post.content
      click_on 'Save'
      expect(page).to have_content "Content can't be blank"
    end
  end

  context 'edited' do
    before :each do
      visit '/posts/new'
      find('input[name="post[title]"]').fill_in with: @post.title
      find('input[name="post[content]"]', visible: false).set(@post.content)
      expect(page).to have_content 'Post was successfully created.'
      click_on 'My learned'
      find('#edit-selector').click
    end

    it 'with correct values' do
      find('input[name="post[title]"]').fill_in with: @post.title
      find('input[name="post[title]"]').fill_in with: 'New value'
      click_on 'Save'
      expect(page).to have_content 'Post was successfully updated'
    end

    it 'with empty title' do
      find('input[name="post[title]"]').fill_in with: ''
      click_on 'Save'
      expect(page).to have_content "Title can't be blank"
    end

    it 'with empty content' do
      find('input[name="post[content]"]', visible: false).set('')
      click_on 'Save'
      expect(page).to have_content "Content can't be blank"
    end
  end

  context 'deleted' do
    it 'successfully' do
      @post.user = @user
      @post.save!
      visit posts_path(@post)
      click_on 'delete'
      expect(page).to have_content 'Post was successfully destroyed'
    end
  end

  context 'viewed' do
    it 'successfully' do
      @post.user = @user
      @post.save!
      visit post_path(@post)
      expect(page).to have_content @post.title
    end
  end
end

# rubocop:enable Metrics/BlockLength
