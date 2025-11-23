class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :people, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :checkin_cannot_be_in_the_past
  validate :checkout_after_checkin


  private

  def checkin_cannot_be_in_the_past
    if checkin.present? && checkin < Date.today
      errors.add(:checkin, "は今日以降の日付にしてください")
    end
  end


  def checkout_after_checkin
    if checkin.present? && checkout.present? && checkout <= checkin
      errors.add(:checkout, "はチェックイン日より後にしてください")
    end
  end

  public
  def total_price
    return 0 unless checkin && checkout && people && room
    days = (checkout - checkin).to_i
    days * people * room.price
  end

end
