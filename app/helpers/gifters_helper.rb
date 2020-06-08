module GiftersHelper
  def has_giftee?(gifter)
    gifter.giftees.any?
  end
end