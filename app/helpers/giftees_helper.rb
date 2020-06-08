module GifteesHelper
  def has_gifter?(giftee)
    giftee.gifter.present?
  end
end