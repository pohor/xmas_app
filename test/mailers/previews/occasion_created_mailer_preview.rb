# Preview all emails at http://localhost:3000/rails/mailers/occasion_created_mailer
class OccasionMailerPreview < ActionMailer::Preview
  def occasion_created_mail_preview
    OccasionMailer.occasion_created_email(User.first, Occasion.first)
  end
end
