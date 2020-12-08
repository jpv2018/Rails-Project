class Judge < ApplicationRecord
    #validates :first_name, presence: true
    #validates :last_name, presence: true
    #validates :organization, presence: true
    #validates :email, presence: true, uniqueness: true
    #validates :password, presence: true
    #has_secure_password
    has_many :scores
    has_many :players, through: :scores
end
