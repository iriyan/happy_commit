class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 230}}
  validates :user_id, {presence: true}
  validates :point, {presence: true}
  
  belongs_to :user

  def user
    return User.find_by(id: self.user_id)
  end

  has_many :comments, dependent: :destroy


end
