module UserHelper
    def check_photo
        return (current_user.Photo.attached? && current_user.CoverImage.attached?) 
    end
end
