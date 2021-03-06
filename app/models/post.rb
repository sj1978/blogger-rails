class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :update_posts_counter
  after_destroy :update_posts_counter
  # validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
