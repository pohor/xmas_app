class OccasionMailer < ApplicationMailer
  default from: ENV['MAILER_EMAIL']

  def occasion_created_email(user, occasion)
    @user = user
    @occasion = occasion
    mail(to: @user.email, subject: "Occasion created!")
  end

  def drawing_lots_email(gifter, occasion, giftee)
    @gifter = gifter
    @occasion = occasion
    @giftee = giftee
    mail(to: @gifter.user.email, subject: "You've drawn a new giftee for #{@occasion.name}!")
  end
end
