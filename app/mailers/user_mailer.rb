class UserMailer < ApplicationMailer
  def verify_email(user, verification)
    @user = user
    @verification = verification
    @FE_URL = ENV["FE_URL"]
    mail(to: user.email, subject: "Verify your account")
  end
  def daily_weather_notification(user,forecast)
    @user = user
    @forecast = forecast
    mail(to: user.email, subject: "Weather status today")
  end
end
