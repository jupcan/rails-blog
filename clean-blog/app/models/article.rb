class Article < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
    validates :user_id, presence: true
    belongs_to :user
    belongs_to :category
    has_many :comments
end