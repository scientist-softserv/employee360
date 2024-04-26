class SalaryHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :authorize_admin, only: [:index, :new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
  end

  def show
    # This will automatically render the 'show.html.erb' template
  end

  def new
    @salary_history = @user.salary_histories.build
  end

  def create
    @salary_history = @user.salary_histories.build(salary_history_params)

    if @salary_history.current_salary
      # Update user's other salary histories to set current_salary to false
      @user.salary_histories.where.not(id: @salary_history.id).update_all(current_salary: false)
    end

    if @salary_history.save
      redirect_to user_salary_histories_path(@user), notice: 'Salary History was successfully created.'
    else
      render :new
    end
  end

  def edit
    @salary_history = @user.salary_histories.find(params[:id])
  end

  def update
    if @salary_history.update(salary_history_params)
      if @salary_history.current_salary
        # Update user's other salary histories to set current_salary to false
        @user.salary_histories.where.not(id: @salary_history.id).update_all(current_salary: false)
      end

      redirect_to user_salary_history_path(@user, @salary_history), notice: 'Salary History was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @salary_history.destroy
    redirect_to user_salary_histories_path(@user), notice: 'Salary History was successfully destroyed.'
  end

  private

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = "Only administrators can access this page."
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def salary_history_params
    params.require(:salary_history).permit(:job_title, :salary, :change_date, :change_reason, :current_salary, :user_id)
  end
end
