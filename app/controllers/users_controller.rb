class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user == current_user || current_user.admin?
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

  def user_params
    params.require(:user).permit(:name, :email, :start_date, :title, :github_handle, :last_promotion, :current_compensation, :due_for_promotion, :review_document, :last_1_on_1, :next_1_on_1)
  end
end
