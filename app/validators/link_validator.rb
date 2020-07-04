class LinkValidator < ActiveModel::Validator
  def validate(record)
    begin
    uri = URI.parse(record.link)
    rescue URI::InvalidURIError
    end
    unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS) && !uri.host.nil?
      record.errors.add(:link, "The link is an invalid url")
    end
  end
end