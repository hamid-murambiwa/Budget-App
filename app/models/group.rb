class Group < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_and_belongs_to_many :proceedings, dependent: :destroy

    validates :name, presence: true
end
