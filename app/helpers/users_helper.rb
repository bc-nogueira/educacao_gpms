module UsersHelper
  def teacher_avatar(teacher)
    return teacher.user.avatar if teacher.user.avatar.attached?
    return 'https://bit.ly/2EhQpzA' if teacher.gender == 'male'
    'https://bit.ly/2Jt3jyO'
  end
end
