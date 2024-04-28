class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_title, only: [:show, :edit, :update]
  before_action :set_start_date, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    if @user == current_user || current_user.superadmin?
    else
      redirect_to root_url, alert: 'Access denied.'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_title
    @user = User.find(params[:id])
    @user_title = @user.salary_histories.where(current_salary: true).order(change_date: :desc).first&.job_title || "No title available"
    @user_title.to_s
  end

  def set_start_date
    @user = User.find(params[:id])
    @user_title = @user.salary_histories.order(change_date: :desc)
  end

  def user_params
    params.require(:user).permit(:name, :email, :start_date, :title, :github_handle, :last_promotion, :current_compensation, :review_document, :last_1_on_1, :next_1_on_1)
  end
end
