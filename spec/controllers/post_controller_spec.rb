# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#create' do
    login_user
    before(:each) do
      @label = create(:label)
    end

    context 'with valid attributes' do
      it 'creates a new post' do
        post_attributes = FactoryBot.attributes_for(:post)
        expect do
          post :create, params: {
            post: {
              title: post_attributes[:title],
              content: post_attributes[:content],
              label_name: @label.name
            }
          }
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the new contact' do
        post_attributes = FactoryBot.attributes_for(:post)
        post :create, params: {
          post: {
            title: post_attributes[:title],
            content: post_attributes[:content],
            label_name: @label.name
          }
        }
        expect(subject.response).to redirect_to(post_path(Post.last))
      end
    end

    # to add scenario with not valid attributes later
  end
end
