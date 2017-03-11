class CommentsController < ApplicationController
  
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.build(comment_params)
    comment.user = current_user
   
    if comment.save
      flash[notice] = "Comment was saved successfully"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error trying to save the comment.Please try again later"
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
 
    if comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end  
  
  private 
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def authorize_user
    comment = Comment.find(params[:id])
    unless comment = comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end    

end
