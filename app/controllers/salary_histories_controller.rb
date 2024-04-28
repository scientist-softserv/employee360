class SalaryHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :authorize_user
  before_action :set_salary_history, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @salary_histories = @user.salary_histories.order(change_date: :desc)
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
    unless current_user.superadmin?
      flash[:alert] = "Only administrators can edit salary histories."
      redirect_to root_path
      return
    end

    @salary_history = @user.salary_histories.find(params[:id])
  end

  def update
    unless current_user.superadmin?
      flash[:alert] = "Only super administrators can update salary histories."
      redirect_to root_path
      return
    end

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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_salary_history
    @salary_history = @user.salary_histories.find(params[:id])
  end

  def salary_history_params
    params.require(:salary_history).permit(:job_title, :salary, :change_date, :change_reason, :current_salary, :user_id)
  end

  def authorize_user
    unless @user == current_user || current_user.superadmin?
      flash[:alert] = "You are not authorized to access this Salary History."
      redirect_to root_path
    end
  end

  def authorize_admin
    unless current_user.superadmin?
      flash[:alert] = "Only super administrators can access this page."
      redirect_to root_path
    end
  end
end
