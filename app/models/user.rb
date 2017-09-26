class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :preferred_timezone, presence: true

  has_many :posts, dependent: :destroy

  def display_name
    "#{first_name} #{last_name}"
  end
end
