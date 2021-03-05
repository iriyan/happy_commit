class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  def posts
    return Post.where(user_id: self.id)
  end

  def goals
    return Goal.where(user_id: self.id)
  end

  def status
    score = 0
    Post.where(user_id: self.id).each do |post|
      score += post.point
  end

    case score
    when 0..99
      "ビギナー"
    when 100..199
      "ルーキー"
    when 200..399
      "レギュラー"
    when 400..699
      "エース"
    when 700..999
      "ベテラン"
    when 1000..10000
      "マスター"
    end
  end

  def total_score
    score = 0
    Post.where(user_id: self.id).each do |post|
      score += post.point
    end

    return score
  end



  has_many :posts
  has_many :goals
  has_many :comments, dependent: :destroy
  
end
