# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string           not null
#
class User < ApplicationRecord
    validates :name,
        presence: true,
        length: { in: 1..50 },
        format: { without: URI::MailTo::EMAIL_REGEXP, message: "can't be an email" }


    validates :email,
        presence: true,
        uniqueness: true,
        length: { in: 3..255 },
        format: { with: URI::MailTo::EMAIL_REGEXP }

    validates :password,
        length: { in: 6..255 },
        allow_nil: true

    validates :session_token,
        presence: true,
        uniqueness: true

    before_validation :ensure_session_token

    private
    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end
        token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end




end
