module V1
  module Users
    class VerifyPublic < PublicBase
      namespace :users do
        resources :verify do
          desc 'Verify with pin code', summary: 'Verify account with pin code'
          put ":id/:code" do
            verification = Verification.find_by(verification_code: params[:code])
            
            return error!('Verification code not found', 404) unless verification.present?
            return error!('Verification code has been used', 410) unless verification.verified_at.nil?
            return error!('Verification code has expired', 410) if verification.expires_at < Time.current || !verification.active

            verification.update(verified_at: Time.current)
            user = User.find(verification.user_id)
            user.update!(
              verified: true
            )
            format_response({ message: "Verify success" })
          end
          desc "Send verification code to user email" 
          post ":id" do
            user = User.find(user_id)
            return error!('Not found user', 404) if user.nil?

            user.verifications.last.update!(
              active: false
            ) if user.verifications.last.present?

            verification = Verification.create!(
              user_id: user.id,
              verification_code: SecureRandom.hex(10),
              expires_at: 5.minutes.from_now,
            )
            UserMailer.verify_email(user, verification).deliver

            format_response({ message: "Send email verify success" })
          end
        end
      end
    end
  end
end