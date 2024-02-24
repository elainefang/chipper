class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :age_over_thirteen
end
