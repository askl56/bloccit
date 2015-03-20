class CommentsController < ApplicationController

  def create
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    # authorize @comment
    authorize @post
      if @comment.save
        flash[:notice] = "Comment was saved."
        redirect_to [@post.topic, @post]
      else
        flash[:error] = "There was an error saving the comment. Please try again."
        render :new
      end
    end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
     else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
