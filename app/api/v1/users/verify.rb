module V1
  module Users
    class Verify < Base
      namespace :users do
        resources :verify do
          desc 'Verify with pin code', summary: 'Verify account with pin code'
          put ":id/:code" do
            verification = Verification.find_by(verification_code: params[:code])
            
            return error!('Verification code not found', 404) unless verification.present?
            return error!('Verification code has expired', 410) if verification.expires_at < Time.current || !verification.active
            return error!('Verification code has been used', 410) unless verification.verified_at.nil?

            verification.update(verified_at: Time.current)
            user = User.find(verification.user_id)
            user.update!(
              verified: true
            )
            format_response({ message: "Verify success" })
          end
        end
      end
    end
  end
end