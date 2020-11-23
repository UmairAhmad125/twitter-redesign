module UserHelper
  def check_photo(user)
    (user.Photo.attached? && user.CoverImage.attached?)
  end
end
