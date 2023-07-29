class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    # binding.pry # Execution will pause here, and you can inspect @user and params[:user_id]
    @user = User.find(params[:user_id])
    @goals = @user.goals
  end

  def show
    # Show individual goal details if needed
  end

  def new
    @goal = @user.goals.build
  end

  def create
    @goal = @user.goals.build(goal_params)

    if @goal.save
      redirect_to user_goals_path(@user), notice: 'Goal was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Edit goal details if needed
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_goals_path(@goal.user), notice: 'Goal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_goals_path(@goal.user), notice: 'Goal was successfully destroyed.'
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description)
  end
end
