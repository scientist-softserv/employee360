class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if @user == current_user || current_user.admin?
    else
      redirect_to root_url, alert: 'Access denied.'
    end
  end
end
