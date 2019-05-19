module UsersHelper
  def user_avatar(user)
    return user.avatar if user.avatar.attached?
    return 'https://bit.ly/2EhQpzA' if user.gender == 'male'
    'https://bit.ly/2Jt3jyO'
  end
end
