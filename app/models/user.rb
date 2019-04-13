class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student
  has_one :teacher # TODO: Verificar se precisa colocar optional: true

  accepts_nested_attributes_for :student

  enum gender: [:female, :male, :other]

  def teacher?
    teacher.present?
  end
end
