class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  load_and_authorize_resource

  def index
    @goals = @user.goals
  end

  def show
    # This will automatically render the 'show.html.erb' template
  end

  def new
    @goal = @user.goals.build
  end

  def create
    @goal = @user.goals.build(goal_params)

    if @goal.save
      redirect_to user_goals_path(@user, @goal), notice: 'Goal was successfully created.'
    else
      render :new
    end
  end

  def edit
    # This will automatically render the 'edit.html.erb' template
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_goal_path(@user, @goal), notice: 'Goal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_goals_path(@user), notice: 'Goal was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :due_date)
  end
end
