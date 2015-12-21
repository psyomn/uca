module UserHelpers
  def default_user
    User.new(
      email: 'testuser@testuser.com',
      password: 'mysecretpassword',
      password_confirmation: 'mysecretpassword',
      bio: 'im a nice guy')
  end
end
