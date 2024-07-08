class SendVerifyEmail < ApplicationJob
  queue_as :default

  def perform(user)
    verification = Verification.create!(
      user_id: user.id,
      verification_code: SecureRandom.hex(10),
      expires_at: 5.minutes.from_now,
    )
    UserMailer.verify_email(user, verification).deliver
  end
end