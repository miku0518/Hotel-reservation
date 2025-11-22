class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user #どのユーザーが施設を作成したか
  has_many :reserved_users, through: :reservations, source: :user
  has_one_attached :image
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :hotelname, presence: true
  validates :hotelintoroduction, presence: true
  validates :adress, presence: true
end
