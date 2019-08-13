class PostsController < ApplicationController

  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # debugger

    # @post.sub_ids = params[:sub_ids]
    # params[:subs_id].each do |sub_id|
    #   Postsub.create(post_id: @post.id, sub_id: sub_id)
    # end
    if @post.save
      redirect_to subs_url #post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    redirect_to subs_url unless current_user == @post.author
  end

  def update
    @post = Post.find_by(id: params[:id])
  

    if @post&.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to user_url(current_user)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end


  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

end
