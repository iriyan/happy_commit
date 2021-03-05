class Fight < ApplicationRecord
  validates :user_id, {presence: true}
  validates :goal_id, {presence: true}
end
