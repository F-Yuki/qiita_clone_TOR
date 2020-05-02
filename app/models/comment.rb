class Comment < ApplicationRecord
  # bodyは入力必須
  validates :body, presence: true

  belongs_to :user
  belongs_to :article
end
