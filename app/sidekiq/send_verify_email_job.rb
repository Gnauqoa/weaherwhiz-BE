class SendVerifyEmailJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    user.verifications.last.update!(
      active: false
    ) if user.verifications.last.present?
    verification = Verification.create!(
      user_id: user.id,
      verification_code: SecureRandom.hex(10),
      expires_at: 5.minutes.from_now,
    )
    UserMailer.verify_email(user, verification).deliver
  end
end