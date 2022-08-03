class User < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :reviews, dependent: :destroy

    validates :email, presence: true, uniqueness: {case_sensitive: false}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
    has_secure_password

end
