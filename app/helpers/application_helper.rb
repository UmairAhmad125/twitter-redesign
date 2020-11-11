# rubocop:disable Layout/LineLength
module ApplicationHelper
  def check_dp(user)
    user.Photo.attached?
  end

  def get_name(id)
    u = User.find(id)
    u.user_name
  end

  def check_user_name(user)
    user_name = if user.full_name.nil? && user.user_name.nil?
                  'fake'
                elsif user.user_name.nil?
                  user.full_name
                else
                  user.user_name
                end
    user_name
  end

  def check_follower(user)
    follow = ''
    if user == current_user
      follow = (link_to '', users_show_path('id' => user.id), method: :post, class: 'fa fa-check-circle my-3').html_safe
    elsif map_followers(user) == true
      follow = (link_to '+', home_follow_path('id' => user.id), method: :post, class: 'font-wight-bold').html_safe
    elsif map_followers(user) == false
      follow = (link_to '-', home_unfollow_path('id' => user.id), method: :post, class: 'font-wight-bold mx-1').html_safe
    end
    follow
  end

  private

  def map_followers(user)
    get_ids = user.followers.map(&:id)
    check = if get_ids.include?(current_user.id)
              false
            else
              true
            end
    check
  end
end
# rubocop:enable Layout/LineLength
