module UserHelper
  def bio_or_none(bio)
    return bio if bio
    "User has not provided any bio."
  end
end
