# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'post', type: :feature do
  before :each do
    @post = FactoryBot.build(:post)
    @user = FactoryBot.create(:user)
    FactoryBot.create(:label)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: User.last.email
      fill_in 'Password', with: 'test1234'
    end
    click_button 'Log in'
  end

  context 'create post' do
    it 'with correct values' do
      visit '/posts/new'
      find('input[name="post[title]"]').fill_in with: @post.title
      find('textarea[name="post[content]"]').fill_in with: @post.content
      click_on 'Save'
      expect(page).to have_content 'Post was successfully created'
    end

    it 'with empty title' do
      visit '/posts/new'
      find('textarea[name="post[content]"]').fill_in with: @post.content
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

  context 'edit post' do
    before :each do
      @post = FactoryBot.create(:post, :with_user)
    end

    it 'with correct values' do
      visit edit_post_path(@post)
      find('input[name="post[title]"]').fill_in with: @post.title
      find('textarea[name="post[content]"]').fill_in with: @post.content
      click_on 'Save'
      expect(page).to have_content 'Post was successfully updated'
    end

    it 'with empty title' do
      visit edit_post_path(@post)
      find('input[name="post[title]"]').fill_in with: ''
      find('textarea[name="post[content]"]').fill_in with: @post.content
      click_on 'Save'
      expect(page).to have_content "Title can't be blank"
    end

    it 'with empty content' do
      visit edit_post_path(@post)
      find('input[name="post[title]"]').fill_in with: @post.title
      find('textarea[name="post[content]"]').fill_in with: ''
      click_on 'Save'
      expect(page).to have_content "Content can't be blank"
    end
  end

  context 'delete post' do
    before :each do
      @post = FactoryBot.create(:post, :with_user)
    end

    it 'successfully' do
      visit posts_path(@post)
      click_on 'delete'
      expect(page).to have_content 'Post was successfully destroyed'
    end
  end

  context 'view post' do
    before :each do
      @post = FactoryBot.create(:post, :with_user)
    end

    it 'successfully' do
      visit post_path(@post)
      expect(page).to have_content @post.title
      expect(page).to have_content @post.content
    end
  end
end

# rubocop:enable Metrics/BlockLength
