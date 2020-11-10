module ApplicationHelper
    def check_dp(user)
        return (user.Photo.attached?) 
    end
end
