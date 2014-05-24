class Char < ActiveRecord::Base
  self.table_name = 'char'

  # associations
  belongs_to :user, foreign_key: 'account_id'

  # scopes
  scope :chars_online, -> { where(online: true) }

  def reset!
    update_attributes(last_map: save_map, last_x: save_x, last_y: save_y)
  end
end