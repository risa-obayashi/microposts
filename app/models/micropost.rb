class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :users, through: :likes, source: :user
  
  def like(user)
    likes.find_or_create_by(user_id: user.id)
  end
  
  def dislike(user)
    like = likes.find_by(user_id: user.id)
    like.destroy if like
  end
  
  def like?(user)
    users.include?(user)
  end
end
