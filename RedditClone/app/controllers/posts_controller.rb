class PostsController < ApplicationController

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @subs = Sub.all
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @subs = Sub.all
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.author_id = current_user.id
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
