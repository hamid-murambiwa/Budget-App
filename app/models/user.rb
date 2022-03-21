class User < ApplicationRecord
    has_many :groups, dependent: :destroy
    has_many :proceedings, dependent: :destroy

    validates :name, :email, presence: true
    validates :email, uniqueness: true
end
