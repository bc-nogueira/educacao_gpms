class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_commontator

  has_one :student
  has_one :teacher

  has_one_attached :avatar

  accepts_nested_attributes_for :student

  validates :name, :gender, :birthdate, presence: true
  validates :cpf, uniqueness: true

  enum gender: [:female, :male, :other]

  def student?
    student.present?
  end

  def teacher?
    teacher.present?
  end

  def user_avatar_url
    return avatar.service_url if avatar.attached?
    return 'https://bit.ly/2EhQpzA' if gender == 'male'
    'https://bit.ly/2Jt3jyO'
  end
end
