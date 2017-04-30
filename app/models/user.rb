class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

         has_many :posts
         validates :nombres, presence: true
         validates :apellidos, presence: true
         validates :nickname, presence: true
         validates :nickname, uniqueness: true
end