class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :user_id
  has_many :likes
  has_many :comments

  def admin?
    role == 'admin'
  end

  # validates :name, presence: true
  # validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
