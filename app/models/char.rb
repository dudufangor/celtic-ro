class Char < ActiveRecord::Base
    self.table_name = 'char'

    # associations
    belongs_to :user, foreign_key: 'account_id'

    # scopes
    scope :chars_online, -> { where(online: true) }
end