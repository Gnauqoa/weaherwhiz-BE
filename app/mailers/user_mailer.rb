class UserMailer < ApplicationMailer
  def verify_email(user, verification)
    @user = user
    @verification = verification
    mail(to: user.email, subject: "Verify your account")
  end
end
