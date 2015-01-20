class Micropost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  validates :title , presence: true
  validates :user_id , presence: true
  validates :content , presence: true, length: {maximum: 140 }
  default_scope -> { order('created_at DESC')}

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id in (?) or user_id = ?", followed_user_ids, user)
  end
end
