# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { @post = build(:post) }

  describe 'validate fields' do
    before(:each) do
      @user = build(:user)
      subject.user = @user
    end

    it 'valid' do
      expect(subject).to be_valid
    end

    it 'empty title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'empty content' do
      subject.content = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'add_labels' do
    it 'valid' do
      @label = create(:label)
      subject.add_labels(@label.name)
      expect(subject.labels).to_not be_empty
    end
  end

  describe 'add_user' do
    it 'valid' do
      @user = create(:user)
      subject.add_user(@user)
      expect(subject.user).to be_nil
    end
  end
end
