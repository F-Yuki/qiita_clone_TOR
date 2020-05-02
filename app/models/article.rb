class Article < ApplicationRecord
  # titleは入力必須、50文字以内
  validates :title, presence: true, length: { maximum: 50 }
  # bodyは入力必須
  validates :body, presence: true
  # 記事の値に意味を持たせる 下書き(draft)/公開済み(published)
  enum status: { draft: "draft", published: "published" }

  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
  belongs_to :user
end
