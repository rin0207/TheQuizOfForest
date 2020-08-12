class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    has_many :questions
    has_many :likes, dependent: :destroy
    has_many :liked_question, through: :likes, source: :question

   attachment :image
end
