module UserHelpers
  def default_user
    User.new(
      nickname: 'nickname',
      email: 'testuser@testuser.com',
      password: 'mysecretpassword',
      password_confirmation: 'mysecretpassword',
      bio: 'im a nice guy')
  end

  def moderator_user
    usr = UserHelpers::default_user
    usr.role = 'moderator'
    usr
  end

  def admin_user
    usr = UserHelpers::default_user
    usr.role = 'admin'
    usr
  end
end
