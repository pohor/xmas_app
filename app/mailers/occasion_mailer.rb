class OccasionMailer < ApplicationMailer
  default from: 'notifications@presents_app.com'

  def occasion_created_email(user, occasion)
    @user = user
    @occasion = occasion
    mail(to: @user.email, subject: "Occasion created!")
  end
end
