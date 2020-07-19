module PresentsHelper
  def gifter_assigned?(present)
    present.giftee.gifter.present?
  end

  def eligible_to_reserve_the_present?(present)
    return false unless gifter_assigned?(present)

    present.giftee.gifter.user == current_user && present.gifter_id.blank?
  end

  def already_reserved_the_present?(present)
    return false unless gifter_assigned?(present)

    current_user.gifters.any? { |gftr| gftr.id == present.gifter_id }
  end

  def belongs_to_current_user?(present)
    present.giftee.user == current_user
  end

  def present_reserved_by(present)
    if already_reserved_the_present?(present)
      "You"
    else
      "Someone"
    end
  end
end