# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # パスワードはアルファベット半角大文字小文字と数字の混合のみ可能にし、文字数制限は8〜15字以内とする
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,15}\z/.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  # emailは＠と.の使用を必須にする
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # nameは入力必須にする
  validates :name, presence: true
  # accountは入力必須、重複禁止
  validates :account, presence: true, uniqueness: true

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
end
