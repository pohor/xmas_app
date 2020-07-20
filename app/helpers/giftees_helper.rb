module GifteesHelper
  def has_gifter?(giftee)
    giftee.gifter.present?
  end

  def presents_reserved_by_gifter_for_giftee(giftee, gifter)
    giftee.presents.where(gifter_id: gifter.id)
  end
end