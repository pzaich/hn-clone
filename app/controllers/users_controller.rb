class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @links = Kaminari::paginate_array(@user.links.all).page(params[:page]).per(10)
  end
end