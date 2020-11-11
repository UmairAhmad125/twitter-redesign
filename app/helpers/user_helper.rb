module UserHelper
    def check_photo(user)
        return (user.Photo.attached? && user.CoverImage.attached?) 
    end
end
