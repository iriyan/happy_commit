class Goal < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 230}}
  validates :user_id, {presence: true}
  #def user
    #eturn User.find_by(id: self.user_id)
  #end
  belongs_to :user

  
end
