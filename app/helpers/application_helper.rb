module ApplicationHelper
    def check_dp(user)
        return (user.Photo.attached?) 
    end

    def get_name(id)
        u = User.find(id)
        u.user_name
    end

    def check_user_name(user)
        user_name = ""
        if user.full_name.nil? && user.user_name.nil?
            user_name = "fake"
        elsif user.user_name.nil?
            user_name = user.full_name
        else
            user_name = user.user_name
        end
        user_name
    end
end
