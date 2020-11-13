class HomeController < ApplicationController
  before_action :logged_in_user
  def index
    followers = current_user.followed.ids
    followers.push(current_user.id)
    suggested = User.where.not(id: followers).desc
    @who_to = []
    @who_to = if suggested.ids.count >= 4
                selected(suggested.to_a)
              else
                suggested
              end
    @opinion = Opinion.all.desc
  end

  def follow
    Following.create(follower_id: current_user.id, followed_id: allowed_params)
    redirect_to users_show_path('id' => allowed_params)
  end

  def unfollow
    f = Following.where(followed_id: allowed_params, follower_id: current_user.id)
    Following.delete(f)
    redirect_to users_show_path('id' => allowed_params)
  end

  private

  def allowed_params
    params.require(:id)
  end

  def logged_in_user
    redirect_to user_session_path unless signed_in?
  end

  def get_random(array)
    array.sample
  end

  def selected(array)
    new_array = []
    4.times do
      random_item = get_random(array)
      new_array.push(random_item)
      array.delete(random_item)
    end
    new_array
  end
end
