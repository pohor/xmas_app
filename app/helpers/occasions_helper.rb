module OccasionsHelper
  def allow_drawing?(occasion)
    return unless occasion.giftees.present?
    return unless occasion.gifters.present?

    occasion.giftees.length > 1 && occasion.gifters.length > 1
  end
end