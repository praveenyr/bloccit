class PostsController < ApplicationController
  def index
    @posts = Post.all
        @posts.each_with_index do|post,index|
        if index%5==0
           post.title = "SPAM"
        end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    @post.title = params[:post][:title]
    @post.body = params[:post][:body] 
    
    if @post.save
      flash[notice] = "Post was saved"
      redirect_to @post
    else
      flash.now[:alert] = "There was an error trying to save the post.Please try again later"
      render :edit
    end
  end
  
  def create
  
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[notice] = "Post was saved"
      redirect_to @post
    else
      flash.now[:alert] = "There was an error trying to save the post.Please try again later"
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully. "
      redirect_to posts_path
    else
      flash[:alert] = "There was an error trying to delete the post"
      render :show
    end
  end
  
end
