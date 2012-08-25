class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]


  # User's blog with only his posts
  def blog
    @user = User.where(nickname: params[:id]).first
  end

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at DESC").where(trackable_type: "Post", trackable_id: @post).all
    @comment = Comment.new
    @comments = @post.comments
    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end
end
