# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

describe Comment do
  describe 'after_create' do
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      @comment = Comment.new(body: 'My comment', post: @post, user_id: 10_000)
    end

    context "with user's permission" do
      it 'sends am email to users who have favorited the post' do
        @user.favorites.where(post: @post).create

        allow(FavoriteMailer)
          .to receive(:new_comment)
          .with(@user, @post, @comment)
          .and_return(double(deliver: true))

        @comment.save
      end

      it "does not send emails to users who haven't" do
        expect(FavoriteMailer).not_to receive(:new_comment)

        @comment.save
      end
    end

    context 'without permission' do
      before { @user.update_attribute(:email_favorites, false) }

      it 'does not send emails, even to users who have favorited' do
        @user.favorites.where(post: @post).create

        expect(FavoriteMailer)
          .not_to receive(:new_comment)
      end
    end
  end
end
