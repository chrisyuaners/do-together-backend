class User < ApplicationRecord
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :events, through: :groups
  has_many :activities, through: :events
  has_many :attendees, dependent: :destroy
  validates :username, uniqueness: true

  has_secure_password
end
