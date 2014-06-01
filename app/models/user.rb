class User < ActiveRecord::Base
  authenticates_with_sorcery!

  self.table_name = 'login'

  alias_attribute :username, :userid
  alias_attribute :password, :user_pass

  validates :password, confirmation: true, unless: -> { password.blank? }

  validates :username, :email, :sex, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, unless: -> { password.blank? }

  validates :username, :email, uniqueness: true
  validates :sex, inclusion: %w(M F)
  validates :username, :password, length: { minimum: 6, maximum: 20 }, allow_blank: true
  validates :email, format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, allow_blank: true
  validates :username, :password, format: /\A[a-z0-9]+[-a-z0-9]*[a-z0-9]+\z/i, allow_blank: true

  # associations
  has_many :chars, foreign_key: 'account_id'
end