module ApplicationHelper
  def user_link(user)
    if user
      link_to user.best_name_possible, user_path(user)
    else
      "unknown user"
    end
  end
end
