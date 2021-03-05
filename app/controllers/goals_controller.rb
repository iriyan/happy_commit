class GoalsController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
    def index
      @goals = Goal.all.order(created_at: :desc).page(params[:page]).per(5)
      @users = User.all.order(id: :desc).page(params[:page]).per(5)
    end

    def show
      @goal = Goal.find_by(id: params[:id])
      @user = @goal.user
      @fights_count = Fight.where(goal_id: @goal.id).count
    end
  
    def new
      @goal = Goal.new
    end
  
    def create
      @goal = Goal.new(
        content: params[:content], 
        user_id: @current_user.id,
        month: params[:month],
        date: params[:date]
      )
      @goal.save
      
      if @goal.save
        flash[:notice] = "目標宣言！"
      redirect_to("/goals/index")
      else
        render("goals/new")
      end
    end
  
    def edit
      @goal=Goal.find_by(id: params[:id])
    end
  
    def update
      @goal=Goal.find_by(id: params[:id])
      @goal.content = params[:content]
      @goal.achievement = params[:achievement]
      @goal.month = params[:month]
      @goal.date = params[:date]
      if @goal.save
        flash[:notice]="上書き完了！"
      redirect_to("/goals/index")
      else 
        flash[:notice]="上書き失敗"
        render("goals/edit")
      end
    end
  
    def destroy
      @goal = Goal.find_by(id: params[:id])
      @goal.destroy
      flash[:notice] = "目標を削除"
      redirect_to("/goals/index")
    end
  
    def ensure_correct_user
      @goal = Goal.find_by(id: params[:id])
      if @goal.user_id != @current_user.id
        flash[:notice] = "不正アクセス"
        redirect_to("/goals/index")
      end
    end
  
end
