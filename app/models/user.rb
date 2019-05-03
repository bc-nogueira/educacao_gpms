class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student
  has_one :teacher

  accepts_nested_attributes_for :student

  validates :name, :gender, :birthdate, presence: true
  validates :cpf, uniqueness: true

  enum gender: [:female, :male, :other]

  def teacher?
    teacher.present?
  end
end
