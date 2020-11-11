class UsersController < ApplicationController
  # def index
  #     @user = User.all
  # end
  # def show
  #     @user = User.find(params[:id])
  #     @opinion = @user.opinions.ordered_by_most_recent
  # end
  def show
    @user = User.find(params[:id])
  end

  def all
    @user = User.all
  end
end
