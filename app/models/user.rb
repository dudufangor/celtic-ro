class User < ActiveRecord::Base
  authenticates_with_sorcery!

  self.table_name = 'login'

  alias_attribute :username, :userid
  alias_attribute :password, :user_pass

  validates :email, confirmation: true
  validates :password, confirmation: true

  validates :password_confirmation, :email_confirmation,
    :username, :email, :password, :sex, presence: true

  validates :username, :email, uniqueness: true
  validates :sex, inclusion: %w(M F)
  validates :username, :password, length: { minimum: 6, maximum: 12 }, allow_blank: true
  validates :email, format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, allow_blank: true
  validates :username, :password, format: /\A[a-z0-9]+[-a-z0-9]*[a-z0-9]+\z/i, allow_blank: true

  # associations
  has_many :chars, foreign_key: 'account_id'
end