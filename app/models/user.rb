class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :rooms  #自分が作った施設
  has_many :reserved_rooms, through: :reservations, source: :room #予約した施設
  has_one_attached :icon
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
end
