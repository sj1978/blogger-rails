class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end