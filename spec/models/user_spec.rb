# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  role                   :string
#  avatar                 :string
#  email_favorites        :boolean          default(TRUE)
#

require 'rails_helper'

describe User do
  describe '.top_rated' do
    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2) }
    end

    it 'returns users ordered by comments + posts' do
      expect(User.top_rated).to eq([@user2, @user1])
    end

    it "stores a 'posts_count' on user" do
      users = User.top_rated
      expect(users.first.posts_count).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect(users.first.comments_count).to eq(2)
    end
  end

  describe '#favorited(post)' do
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorites.find_by(post_id: @post.id)).to be_nil
    end

    it 'returns the appropriate favorite if it exists' do
      @user.favorites.where(post_id: @post.id).create
      expect(@user.favorites.find_by_post_id(@post.id)).not_to be_nil
    end
  end
end
