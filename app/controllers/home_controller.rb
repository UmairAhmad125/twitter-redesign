class HomeController < ApplicationController
  before_action :logged_in_user
  def index; end
  def new
  end
  def create
  end
  private
  def logged_in_user
    unless signed_in?
       redirect_to user_session_path
    end
 end
end
