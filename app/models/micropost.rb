class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
end
