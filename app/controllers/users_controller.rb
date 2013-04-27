class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def switch_theme
    current_user.update_attribute(:theme, params[:name])
    redirect_to session[:previous_url]
  end

end
