class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @users = User.all.order(id: :desc).page(params[:page]).per(5)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content], 
      user_id: @current_user.id,
      point: params[:point]
    )
    @post.save

    if @post.save
      flash[:notice] = "投稿完了！"
    redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.point = params[:point]
    if @post.save
      flash[:notice]="上書き完了！"
    redirect_to("/posts/index")
    else 
      flash[:notice]="上書き失敗"
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "不正アクセス"
      redirect_to("/posts/index")
    end
  end
end
