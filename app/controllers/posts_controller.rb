class PostsController < ApplicationController
  
  before_action :require_sign_in, except: :show

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    @post.assign_attributes(post_params) 
    
    if @post.save
      flash[notice] = "Post was saved"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error trying to save the post.Please try again later"
      render :edit
    end
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    
    if @post.save
      flash[notice] = "Post was saved"
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error trying to save the post.Please try again later"
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully. "
      redirect_to @post.topic
    else
      flash[:alert] = "There was an error trying to delete the post"
      render :show
    end
  end
  
  private
 
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
end
