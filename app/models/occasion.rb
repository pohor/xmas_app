class Occasion < ApplicationRecord
  has_many :giftees
  has_many :gifters

  def draw_lots
    giftees.where(gifter_id: nil).length.times do
      gifters.each do |drawing_gifter|
        assign_giftee(drawing_gifter)
      end
    end
  end

  private

  def assign_giftee(drawing_gifter)
    giftees.each do |drawing_giftee|
      if drawing_giftee.gifter.blank?
        drawing_giftee.update(gifter: drawing_gifter)
      end
    end
  end
end
