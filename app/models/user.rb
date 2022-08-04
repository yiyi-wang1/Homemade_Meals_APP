class User < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy

    before_validation :downcase_email
    validates :email, presence: true, uniqueness: {case_sensitive: false}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
    has_secure_password

    private
    def downcase_email
        self.email = self.email.downcase
    end

end
