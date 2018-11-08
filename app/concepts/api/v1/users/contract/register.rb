# frozen_string_literal: true

module Api::V1::Users::Contract
  class Register < Reform::Form
    property :email
    property :password
    property :password_confirmation

    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }

    validate :password_ok?

    def password_ok?
      errors.add(:password, I18n.t('errors.password_missmatch')) if password != password_confirmation
    end
  end
end
