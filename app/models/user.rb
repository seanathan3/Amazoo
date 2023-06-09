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
    has_secure_password

    validates :name,
        presence: true,
        length: { maximum: 50 },
        format: { without: URI::MailTo::EMAIL_REGEXP, message: "can't be an email" }


    validates :email,
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

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.authenticate(password)
            return user
        else
            return nil
        end
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end


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


    has_many :cart_items,
        class_name: :CartItem,
        primary_key: :id,
        foreign_key: :user_id,
        dependent: :destroy

    has_many :reviews,
        class_name: :Review,
        primary_key: :id,
        foreign_key: :commenter_id,
        dependent: :destroy

end
