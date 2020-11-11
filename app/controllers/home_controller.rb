class HomeController < ApplicationController
  before_action :logged_in_user
  def index
      followers = current_user.followed.ids
      followers.push(current_user.id)
      suggested = User.where.not(id: followers).desc
      @who_to = Array.new
      if suggested.ids.count >= 4
         @who_to = selected(suggested.to_a)
      else
         @who_to = suggested
      end
      @opinion = Opinion.all.desc
  end

  def follow
      Following.create(follower_id: current_user.id, followed_id: params[:id])
      redirect_to root_path
  end

  private
   def logged_in_user
      unless signed_in?
         redirect_to user_session_path
      end
   end
   
   def get_random(array)
      array.sample
   end

   def selected(array)
      new_array = Array.new
      4.times do 
         random_item = get_random(array)
         new_array.push(random_item)
         array.delete(random_item)
      end
      new_array
   end
end
