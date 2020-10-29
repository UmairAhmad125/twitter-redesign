module UserHelper
    def check_photo
        return false if !current_user.Photo
        true
    end
end
