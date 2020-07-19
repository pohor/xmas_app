module OccasionsHelper
  def allow_drawing?(occasion)
    return unless occasion.giftees.present?
    return unless occasion.gifters.present?

    occasion.giftees.length > 1 &&
      occasion.gifters.length > 1 &&
      occasion.giftees.any? { |gt| gt.gifter_id == nil }
  end

  def already_registered_as_gifter?(occasion)
    occasion.gifters.any? { |gifter| gifter.user_id == current_user.id }
  end
end