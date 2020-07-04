class Present < ApplicationRecord
  include ActiveModel::Validations
  validates_with LinkValidator

  has_one :gifter
  belongs_to :giftee, optional: true

  validates :name, presence: true

  def scrapped_present
    @scrapped_present ||=
    begin
      LinkThumbnailer.generate(link)
    rescue LinkThumbnailer::Exceptions => e
      nil
    end
  end

  def scrapped_present_thumbnail
    scrapped_present.present? ? scrapped_present&.images.first.to_s : scrapped_present
  end
end
