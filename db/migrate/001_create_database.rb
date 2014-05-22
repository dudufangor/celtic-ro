class CreateDatabase < ActiveRecord::Migration
  def change
    create_table "atcommandlog", :primary_key => "atcommand_id", :force => true do |t|
      t.datetime "atcommand_date",                               :null => false
      t.integer  "account_id",                   :default => 0,  :null => false
      t.integer  "char_id",                      :default => 0,  :null => false
      t.string   "char_name",      :limit => 25, :default => "", :null => false
      t.string   "map",            :limit => 11, :default => "", :null => false
      t.string   "command",                      :default => "", :null => false
    end

    add_index "atcommandlog", ["account_id"], :name => "account_id"
    add_index "atcommandlog", ["char_id"], :name => "char_id"

    create_table "auction", :primary_key => "auction_id", :force => true do |t|
      t.integer "seller_id",                 :default => 0,  :null => false
      t.string  "seller_name", :limit => 30, :default => "", :null => false
      t.integer "buyer_id",                  :default => 0,  :null => false
      t.string  "buyer_name",  :limit => 30, :default => "", :null => false
      t.integer "price",                     :default => 0,  :null => false
      t.integer "buynow",                    :default => 0,  :null => false
      t.integer "hours",       :limit => 2,  :default => 0,  :null => false
      t.integer "timestamp",                 :default => 0,  :null => false
      t.integer "nameid",                    :default => 0,  :null => false
      t.string  "item_name",   :limit => 50, :default => "", :null => false
      t.integer "type",        :limit => 2,  :default => 0,  :null => false
      t.integer "refine",      :limit => 1,  :default => 0,  :null => false
      t.integer "attribute",   :limit => 1,  :default => 0,  :null => false
      t.integer "card0",       :limit => 2,  :default => 0,  :null => false
      t.integer "card1",       :limit => 2,  :default => 0,  :null => false
      t.integer "card2",       :limit => 2,  :default => 0,  :null => false
      t.integer "card3",       :limit => 2,  :default => 0,  :null => false
      t.integer "unique_id",   :limit => 8,  :default => 0,  :null => false
    end

    create_table "bonus_script", :id => false, :force => true do |t|
      t.string "char_id", :limit => 11,                     :null => false
      t.string "script",  :limit => 1024,                   :null => false
      t.string "tick",    :limit => 11,   :default => "0",  :null => false
      t.string "flag",    :limit => 3,    :default => "0",  :null => false
      t.string "type",    :limit => 1,    :default => "0",  :null => false
      t.string "icon",    :limit => 3,    :default => "-1", :null => false
    end

    create_table "branchlog", :primary_key => "branch_id", :force => true do |t|
      t.datetime "branch_date",                               :null => false
      t.integer  "account_id",                :default => 0,  :null => false
      t.integer  "char_id",                   :default => 0,  :null => false
      t.string   "char_name",   :limit => 25, :default => "", :null => false
      t.string   "map",         :limit => 11, :default => "", :null => false
    end

    add_index "branchlog", ["account_id"], :name => "account_id"
    add_index "branchlog", ["char_id"], :name => "char_id"

    create_table "buyingstore_items", :id => false, :force => true do |t|
      t.integer "buyingstore_id",              :null => false
      t.integer "index",          :limit => 2, :null => false
      t.integer "item_id",                     :null => false
      t.integer "amount",         :limit => 2, :null => false
      t.integer "price",                       :null => false
    end

    create_table "buyingstores", :force => true do |t|
      t.integer "account_id",                                :null => false
      t.integer "char_id",                                   :null => false
      t.string  "sex",        :limit => 1,  :default => "M", :null => false
      t.string  "map",        :limit => 20,                  :null => false
      t.integer "x",          :limit => 2,                   :null => false
      t.integer "y",          :limit => 2,                   :null => false
      t.string  "title",      :limit => 80,                  :null => false
      t.integer "limit",                                     :null => false
      t.integer "autotrade",  :limit => 1,                   :null => false
    end

    create_table "cart_inventory", :force => true do |t|
      t.integer "char_id",                  :default => 0, :null => false
      t.integer "nameid",                   :default => 0, :null => false
      t.integer "amount",                   :default => 0, :null => false
      t.integer "equip",                    :default => 0, :null => false
      t.integer "identify",    :limit => 2, :default => 0, :null => false
      t.integer "refine",      :limit => 1, :default => 0, :null => false
      t.integer "attribute",   :limit => 1, :default => 0, :null => false
      t.integer "card0",       :limit => 2, :default => 0, :null => false
      t.integer "card1",       :limit => 2, :default => 0, :null => false
      t.integer "card2",       :limit => 2, :default => 0, :null => false
      t.integer "card3",       :limit => 2, :default => 0, :null => false
      t.integer "expire_time",              :default => 0, :null => false
      t.integer "bound",       :limit => 1, :default => 0, :null => false
      t.integer "unique_id",   :limit => 8, :default => 0, :null => false
    end

    add_index "cart_inventory", ["char_id"], :name => "char_id"

    create_table "cashlog", :force => true do |t|
      t.datetime "time",                                     :null => false
      t.integer  "char_id",                 :default => 0,   :null => false
      t.string   "type",      :limit => 1,  :default => "S", :null => false
      t.string   "cash_type", :limit => 1,  :default => "O", :null => false
      t.integer  "amount",                  :default => 0,   :null => false
      t.string   "map",       :limit => 11, :default => "",  :null => false
    end

    add_index "cashlog", ["type"], :name => "type"

    create_table "char", :primary_key => "char_id", :force => true do |t|
      t.integer "account_id",                  :default => 0,     :null => false
      t.boolean "char_num",                    :default => false, :null => false
      t.string  "name",          :limit => 30, :default => "",    :null => false
      t.integer "class",         :limit => 2,  :default => 0,     :null => false
      t.integer "base_level",    :limit => 2,  :default => 1,     :null => false
      t.integer "job_level",     :limit => 2,  :default => 1,     :null => false
      t.integer "base_exp",      :limit => 8,  :default => 0,     :null => false
      t.integer "job_exp",       :limit => 8,  :default => 0,     :null => false
      t.integer "zeny",                        :default => 0,     :null => false
      t.integer "str",           :limit => 2,  :default => 0,     :null => false
      t.integer "agi",           :limit => 2,  :default => 0,     :null => false
      t.integer "vit",           :limit => 2,  :default => 0,     :null => false
      t.integer "int",           :limit => 2,  :default => 0,     :null => false
      t.integer "dex",           :limit => 2,  :default => 0,     :null => false
      t.integer "luk",           :limit => 2,  :default => 0,     :null => false
      t.integer "max_hp",        :limit => 3,  :default => 0,     :null => false
      t.integer "hp",            :limit => 3,  :default => 0,     :null => false
      t.integer "max_sp",        :limit => 3,  :default => 0,     :null => false
      t.integer "sp",            :limit => 3,  :default => 0,     :null => false
      t.integer "status_point",                :default => 0,     :null => false
      t.integer "skill_point",                 :default => 0,     :null => false
      t.integer "option",                      :default => 0,     :null => false
      t.integer "karma",         :limit => 1,  :default => 0,     :null => false
      t.integer "manner",        :limit => 2,  :default => 0,     :null => false
      t.integer "party_id",                    :default => 0,     :null => false
      t.integer "guild_id",                    :default => 0,     :null => false
      t.integer "pet_id",                      :default => 0,     :null => false
      t.integer "homun_id",                    :default => 0,     :null => false
      t.integer "elemental_id",                :default => 0,     :null => false
      t.integer "hair",          :limit => 1,  :default => 0,     :null => false
      t.integer "hair_color",    :limit => 2,  :default => 0,     :null => false
      t.integer "clothes_color", :limit => 2,  :default => 0,     :null => false
      t.integer "weapon",        :limit => 2,  :default => 0,     :null => false
      t.integer "shield",        :limit => 2,  :default => 0,     :null => false
      t.integer "head_top",      :limit => 2,  :default => 0,     :null => false
      t.integer "head_mid",      :limit => 2,  :default => 0,     :null => false
      t.integer "head_bottom",   :limit => 2,  :default => 0,     :null => false
      t.integer "robe",          :limit => 2,  :default => 0,     :null => false
      t.string  "last_map",      :limit => 11, :default => "",    :null => false
      t.integer "last_x",        :limit => 2,  :default => 53,    :null => false
      t.integer "last_y",        :limit => 2,  :default => 111,   :null => false
      t.string  "save_map",      :limit => 11, :default => "",    :null => false
      t.integer "save_x",        :limit => 2,  :default => 53,    :null => false
      t.integer "save_y",        :limit => 2,  :default => 111,   :null => false
      t.integer "partner_id",                  :default => 0,     :null => false
      t.integer "online",        :limit => 1,  :default => 0,     :null => false
      t.integer "father",                      :default => 0,     :null => false
      t.integer "mother",                      :default => 0,     :null => false
      t.integer "child",                       :default => 0,     :null => false
      t.integer "fame",                        :default => 0,     :null => false
      t.integer "rename",        :limit => 2,  :default => 0,     :null => false
      t.integer "delete_date",                 :default => 0,     :null => false
      t.integer "moves",                       :default => 0,     :null => false
      t.integer "unban_time",                  :default => 0,     :null => false
    end

    add_index "char", ["account_id"], :name => "account_id"
    add_index "char", ["guild_id"], :name => "guild_id"
    add_index "char", ["name"], :name => "name_key", :unique => true
    add_index "char", ["online"], :name => "online"
    add_index "char", ["party_id"], :name => "party_id"

    create_table "charlog", :id => false, :force => true do |t|
      t.datetime "time",                                                :null => false
      t.string   "char_msg",                 :default => "char select", :null => false
      t.integer  "account_id",               :default => 0,             :null => false
      t.integer  "char_num",   :limit => 1,  :default => 0,             :null => false
      t.string   "name",       :limit => 23, :default => "",            :null => false
      t.integer  "str",                      :default => 0,             :null => false
      t.integer  "agi",                      :default => 0,             :null => false
      t.integer  "vit",                      :default => 0,             :null => false
      t.integer  "int",                      :default => 0,             :null => false
      t.integer  "dex",                      :default => 0,             :null => false
      t.integer  "luk",                      :default => 0,             :null => false
      t.integer  "hair",       :limit => 1,  :default => 0,             :null => false
      t.integer  "hair_color",               :default => 0,             :null => false
    end

    create_table "chatlog", :force => true do |t|
      t.datetime "time",                                          :null => false
      t.string   "type",          :limit => 1,   :default => "O", :null => false
      t.integer  "type_id",                      :default => 0,   :null => false
      t.integer  "src_charid",                   :default => 0,   :null => false
      t.integer  "src_accountid",                :default => 0,   :null => false
      t.string   "src_map",       :limit => 11,  :default => "",  :null => false
      t.integer  "src_map_x",     :limit => 2,   :default => 0,   :null => false
      t.integer  "src_map_y",     :limit => 2,   :default => 0,   :null => false
      t.string   "dst_charname",  :limit => 25,  :default => "",  :null => false
      t.string   "message",       :limit => 150, :default => "",  :null => false
    end

    add_index "chatlog", ["src_accountid"], :name => "src_accountid"
    add_index "chatlog", ["src_charid"], :name => "src_charid"

    create_table "elemental", :primary_key => "ele_id", :force => true do |t|
      t.integer "char_id",                               :null => false
      t.integer "class",     :limit => 3, :default => 0, :null => false
      t.integer "mode",                   :default => 1, :null => false
      t.integer "hp",                     :default => 1, :null => false
      t.integer "sp",                     :default => 1, :null => false
      t.integer "max_hp",    :limit => 3, :default => 0, :null => false
      t.integer "max_sp",    :limit => 3, :default => 0, :null => false
      t.integer "atk1",      :limit => 3, :default => 0, :null => false
      t.integer "atk2",      :limit => 3, :default => 0, :null => false
      t.integer "matk",      :limit => 3, :default => 0, :null => false
      t.integer "aspd",      :limit => 2, :default => 0, :null => false
      t.integer "def",       :limit => 2, :default => 0, :null => false
      t.integer "mdef",      :limit => 2, :default => 0, :null => false
      t.integer "flee",      :limit => 2, :default => 0, :null => false
      t.integer "hit",       :limit => 2, :default => 0, :null => false
      t.integer "life_time",              :default => 0, :null => false
    end

    create_table "friends", :id => false, :force => true do |t|
      t.integer "char_id",        :default => 0, :null => false
      t.integer "friend_account", :default => 0, :null => false
      t.integer "friend_id",      :default => 0, :null => false
    end

    add_index "friends", ["char_id"], :name => "char_id"

    create_table "global_reg_value", :id => false, :force => true do |t|
      t.integer "char_id",    :default => 0,     :null => false
      t.string  "str",        :default => "",    :null => false
      t.string  "value",      :default => "0",   :null => false
      t.boolean "type",       :default => false, :null => false
      t.integer "account_id", :default => 0,     :null => false
    end

    add_index "global_reg_value", ["account_id"], :name => "account_id"

    create_table "guild", :id => false, :force => true do |t|
      t.integer "guild_id",                                      :null => false
      t.string  "name",           :limit => 24,  :default => "", :null => false
      t.integer "char_id",                       :default => 0,  :null => false
      t.string  "master",         :limit => 24,  :default => "", :null => false
      t.integer "guild_lv",       :limit => 1,   :default => 0,  :null => false
      t.integer "connect_member", :limit => 1,   :default => 0,  :null => false
      t.integer "max_member",     :limit => 1,   :default => 0,  :null => false
      t.integer "average_lv",     :limit => 2,   :default => 1,  :null => false
      t.integer "exp",            :limit => 8,   :default => 0,  :null => false
      t.integer "next_exp",                      :default => 0,  :null => false
      t.integer "skill_point",    :limit => 1,   :default => 0,  :null => false
      t.string  "mes1",           :limit => 60,  :default => "", :null => false
      t.string  "mes2",           :limit => 120, :default => "", :null => false
      t.integer "emblem_len",                    :default => 0,  :null => false
      t.integer "emblem_id",                     :default => 0,  :null => false
      t.binary  "emblem_data"
    end

    add_index "guild", ["char_id"], :name => "char_id"
    add_index "guild", ["guild_id"], :name => "guild_id", :unique => true

    create_table "guild_alliance", :id => false, :force => true do |t|
      t.integer "guild_id",                  :default => 0,  :null => false
      t.integer "opposition",                :default => 0,  :null => false
      t.integer "alliance_id",               :default => 0,  :null => false
      t.string  "name",        :limit => 24, :default => "", :null => false
    end

    add_index "guild_alliance", ["alliance_id"], :name => "alliance_id"

    create_table "guild_castle", :primary_key => "castle_id", :force => true do |t|
      t.integer "guild_id",   :default => 0, :null => false
      t.integer "economy",    :default => 0, :null => false
      t.integer "defense",    :default => 0, :null => false
      t.integer "triggerE",   :default => 0, :null => false
      t.integer "triggerD",   :default => 0, :null => false
      t.integer "nextTime",   :default => 0, :null => false
      t.integer "payTime",    :default => 0, :null => false
      t.integer "createTime", :default => 0, :null => false
      t.integer "visibleC",   :default => 0, :null => false
      t.integer "visibleG0",  :default => 0, :null => false
      t.integer "visibleG1",  :default => 0, :null => false
      t.integer "visibleG2",  :default => 0, :null => false
      t.integer "visibleG3",  :default => 0, :null => false
      t.integer "visibleG4",  :default => 0, :null => false
      t.integer "visibleG5",  :default => 0, :null => false
      t.integer "visibleG6",  :default => 0, :null => false
      t.integer "visibleG7",  :default => 0, :null => false
    end

    add_index "guild_castle", ["guild_id"], :name => "guild_id"

    create_table "guild_expulsion", :id => false, :force => true do |t|
      t.integer "guild_id",                 :default => 0,  :null => false
      t.integer "account_id",               :default => 0,  :null => false
      t.string  "name",       :limit => 24, :default => "", :null => false
      t.string  "mes",        :limit => 40, :default => "", :null => false
    end

    create_table "guild_member", :id => false, :force => true do |t|
      t.integer "guild_id",                 :default => 0,  :null => false
      t.integer "account_id",               :default => 0,  :null => false
      t.integer "char_id",                  :default => 0,  :null => false
      t.integer "hair",       :limit => 1,  :default => 0,  :null => false
      t.integer "hair_color", :limit => 2,  :default => 0,  :null => false
      t.integer "gender",     :limit => 1,  :default => 0,  :null => false
      t.integer "class",      :limit => 2,  :default => 0,  :null => false
      t.integer "lv",         :limit => 2,  :default => 0,  :null => false
      t.integer "exp",        :limit => 8,  :default => 0,  :null => false
      t.integer "exp_payper", :limit => 1,  :default => 0,  :null => false
      t.integer "online",     :limit => 1,  :default => 0,  :null => false
      t.integer "position",   :limit => 1,  :default => 0,  :null => false
      t.string  "name",       :limit => 24, :default => "", :null => false
    end

    add_index "guild_member", ["char_id"], :name => "char_id"

    create_table "guild_position", :id => false, :force => true do |t|
      t.integer "guild_id",               :default => 0,  :null => false
      t.integer "position", :limit => 1,  :default => 0,  :null => false
      t.string  "name",     :limit => 24, :default => "", :null => false
      t.integer "mode",     :limit => 1,  :default => 0,  :null => false
      t.integer "exp_mode", :limit => 1,  :default => 0,  :null => false
    end

    create_table "guild_skill", :id => false, :force => true do |t|
      t.integer "guild_id",              :default => 0, :null => false
      t.integer "id",       :limit => 2, :default => 0, :null => false
      t.integer "lv",       :limit => 1, :default => 0, :null => false
    end

    create_table "guild_storage", :force => true do |t|
      t.integer "guild_id",                 :default => 0, :null => false
      t.integer "nameid",                   :default => 0, :null => false
      t.integer "amount",                   :default => 0, :null => false
      t.integer "equip",                    :default => 0, :null => false
      t.integer "identify",    :limit => 2, :default => 0, :null => false
      t.integer "refine",      :limit => 1, :default => 0, :null => false
      t.integer "attribute",   :limit => 1, :default => 0, :null => false
      t.integer "card0",       :limit => 2, :default => 0, :null => false
      t.integer "card1",       :limit => 2, :default => 0, :null => false
      t.integer "card2",       :limit => 2, :default => 0, :null => false
      t.integer "card3",       :limit => 2, :default => 0, :null => false
      t.integer "expire_time",              :default => 0, :null => false
      t.integer "bound",       :limit => 1, :default => 0, :null => false
      t.integer "unique_id",   :limit => 8, :default => 0, :null => false
    end

    add_index "guild_storage", ["guild_id"], :name => "guild_id"

    create_table "homunculus", :primary_key => "homun_id", :force => true do |t|
      t.integer "char_id",                                   :null => false
      t.integer "class",       :limit => 3,  :default => 0,  :null => false
      t.integer "prev_class",  :limit => 3,  :default => 0,  :null => false
      t.string  "name",        :limit => 24, :default => "", :null => false
      t.integer "level",       :limit => 2,  :default => 0,  :null => false
      t.integer "exp",                       :default => 0,  :null => false
      t.integer "intimacy",                  :default => 0,  :null => false
      t.integer "hunger",      :limit => 2,  :default => 0,  :null => false
      t.integer "str",         :limit => 2,  :default => 0,  :null => false
      t.integer "agi",         :limit => 2,  :default => 0,  :null => false
      t.integer "vit",         :limit => 2,  :default => 0,  :null => false
      t.integer "int",         :limit => 2,  :default => 0,  :null => false
      t.integer "dex",         :limit => 2,  :default => 0,  :null => false
      t.integer "luk",         :limit => 2,  :default => 0,  :null => false
      t.integer "hp",                        :default => 1,  :null => false
      t.integer "max_hp",                    :default => 1,  :null => false
      t.integer "sp",                        :default => 1,  :null => false
      t.integer "max_sp",                    :default => 1,  :null => false
      t.integer "skill_point", :limit => 2,  :default => 0,  :null => false
      t.integer "alive",       :limit => 1,  :default => 1,  :null => false
      t.integer "rename_flag", :limit => 1,  :default => 0,  :null => false
      t.integer "vaporize",    :limit => 1,  :default => 0,  :null => false
    end

    create_table "hotkey", :id => false, :force => true do |t|
      t.integer "char_id",                                      :null => false
      t.integer "hotkey",       :limit => 1,                    :null => false
      t.boolean "type",                      :default => false, :null => false
      t.integer "itemskill_id",              :default => 0,     :null => false
      t.integer "skill_lvl",    :limit => 1, :default => 0,     :null => false
    end

    create_table "interlog", :id => false, :force => true do |t|
      t.datetime "time",                 :null => false
      t.string   "log",  :default => "", :null => false
    end

    create_table "interreg", :primary_key => "varname", :force => true do |t|
      t.string "value", :limit => 20, :null => false
    end

    create_table "inventory", :force => true do |t|
      t.integer "char_id",                  :default => 0, :null => false
      t.integer "nameid",                   :default => 0, :null => false
      t.integer "amount",                   :default => 0, :null => false
      t.integer "equip",                    :default => 0, :null => false
      t.integer "identify",    :limit => 2, :default => 0, :null => false
      t.integer "refine",      :limit => 1, :default => 0, :null => false
      t.integer "attribute",   :limit => 1, :default => 0, :null => false
      t.integer "card0",       :limit => 2, :default => 0, :null => false
      t.integer "card1",       :limit => 2, :default => 0, :null => false
      t.integer "card2",       :limit => 2, :default => 0, :null => false
      t.integer "card3",       :limit => 2, :default => 0, :null => false
      t.integer "expire_time",              :default => 0, :null => false
      t.integer "favorite",    :limit => 1, :default => 0, :null => false
      t.integer "bound",       :limit => 1, :default => 0, :null => false
      t.integer "unique_id",   :limit => 8, :default => 0, :null => false
    end

    add_index "inventory", ["char_id"], :name => "char_id"

    create_table "ipbanlist", :id => false, :force => true do |t|
      t.string   "list",   :default => "", :null => false
      t.datetime "btime",                  :null => false
      t.datetime "rtime",                  :null => false
      t.string   "reason", :default => "", :null => false
    end

    add_index "ipbanlist", ["list"], :name => "list"

    create_table "item_cash_db", :id => false, :force => true do |t|
      t.integer "tab",     :limit => 2,                :null => false
      t.integer "item_id", :limit => 2,                :null => false
      t.integer "price",   :limit => 3, :default => 0, :null => false
    end

    create_table "item_cash_db2", :id => false, :force => true do |t|
      t.integer "tab",     :limit => 2,                :null => false
      t.integer "item_id", :limit => 2,                :null => false
      t.integer "price",   :limit => 3, :default => 0, :null => false
    end

    create_table "item_db", :force => true do |t|
      t.string  "name_english",    :limit => 50, :default => "", :null => false
      t.string  "name_japanese",   :limit => 50, :default => "", :null => false
      t.integer "type",            :limit => 1,  :default => 0,  :null => false
      t.integer "price_buy",       :limit => 3
      t.integer "price_sell",      :limit => 3
      t.integer "weight",          :limit => 2,  :default => 0,  :null => false
      t.integer "attack",          :limit => 2
      t.integer "defence",         :limit => 2
      t.integer "range",           :limit => 1
      t.integer "slots",           :limit => 1
      t.integer "equip_jobs"
      t.integer "equip_upper",     :limit => 1
      t.boolean "equip_genders"
      t.integer "equip_locations", :limit => 3
      t.boolean "weapon_level"
      t.integer "equip_level",     :limit => 1
      t.boolean "refineable"
      t.integer "view",            :limit => 2
      t.text    "script"
      t.text    "equip_script"
      t.text    "unequip_script"
    end

    create_table "item_db2", :force => true do |t|
      t.string  "name_english",    :limit => 50, :default => "", :null => false
      t.string  "name_japanese",   :limit => 50, :default => "", :null => false
      t.integer "type",            :limit => 1,  :default => 0,  :null => false
      t.integer "price_buy",       :limit => 3
      t.integer "price_sell",      :limit => 3
      t.integer "weight",          :limit => 2,  :default => 0,  :null => false
      t.integer "attack",          :limit => 2
      t.integer "defence",         :limit => 2
      t.integer "range",           :limit => 1
      t.integer "slots",           :limit => 1
      t.integer "equip_jobs"
      t.integer "equip_upper",     :limit => 1
      t.boolean "equip_genders"
      t.integer "equip_locations", :limit => 3
      t.boolean "weapon_level"
      t.integer "equip_level",     :limit => 1
      t.boolean "refineable"
      t.integer "view",            :limit => 2
      t.text    "script"
      t.text    "equip_script"
      t.text    "unequip_script"
    end

    create_table "item_db2_re", :force => true do |t|
      t.string  "name_english",    :limit => 50, :default => "", :null => false
      t.string  "name_japanese",   :limit => 50, :default => "", :null => false
      t.integer "type",            :limit => 1,  :default => 0,  :null => false
      t.integer "price_buy",       :limit => 3
      t.integer "price_sell",      :limit => 3
      t.integer "weight",          :limit => 2,  :default => 0,  :null => false
      t.integer "attack",          :limit => 2
      t.integer "defence",         :limit => 2
      t.integer "range",           :limit => 1
      t.integer "slots",           :limit => 1
      t.integer "equip_jobs"
      t.integer "equip_upper",     :limit => 1
      t.boolean "equip_genders"
      t.integer "equip_locations", :limit => 3
      t.boolean "weapon_level"
      t.integer "equip_level",     :limit => 1
      t.boolean "refineable"
      t.integer "view",            :limit => 2
      t.text    "script"
      t.text    "equip_script"
      t.text    "unequip_script"
    end

    create_table "item_db_re", :force => true do |t|
      t.string  "name_english",    :limit => 50, :default => "", :null => false
      t.string  "name_japanese",   :limit => 50, :default => "", :null => false
      t.integer "type",            :limit => 1,  :default => 0,  :null => false
      t.integer "price_buy",       :limit => 3
      t.integer "price_sell",      :limit => 3
      t.integer "weight",          :limit => 2,  :default => 0,  :null => false
      t.string  "atk:matk",        :limit => 11
      t.integer "defence",         :limit => 2
      t.integer "range",           :limit => 1
      t.integer "slots",           :limit => 1
      t.integer "equip_jobs"
      t.integer "equip_upper",     :limit => 1
      t.boolean "equip_genders"
      t.integer "equip_locations", :limit => 3
      t.boolean "weapon_level"
      t.string  "equip_level",     :limit => 10
      t.boolean "refineable"
      t.integer "view",            :limit => 2
      t.text    "script"
      t.text    "equip_script"
      t.text    "unequip_script"
    end

    create_table "login", :primary_key => "account_id", :force => true do |t|
      t.string   "userid",          :limit => 23,  :default => "",  :null => false
      t.string   "user_pass",       :limit => 32,  :default => "",  :null => false
      t.string   "sex",             :limit => 1,   :default => "M", :null => false
      t.string   "email",           :limit => 39,  :default => "",  :null => false
      t.integer  "group_id",        :limit => 1,   :default => 0,   :null => false
      t.integer  "state",                          :default => 0,   :null => false
      t.integer  "unban_time",                     :default => 0,   :null => false
      t.integer  "expiration_time",                :default => 0,   :null => false
      t.integer  "logincount",      :limit => 3,   :default => 0,   :null => false
      t.datetime "lastlogin",                                       :null => false
      t.string   "last_ip",         :limit => 100, :default => "",  :null => false
      t.date     "birthdate",                                       :null => false
      t.integer  "character_slots", :limit => 1,   :default => 0,   :null => false
      t.string   "pincode",         :limit => 4,   :default => "",  :null => false
      t.integer  "pincode_change",                 :default => 0,   :null => false
      t.integer  "bank_vault",                     :default => 0,   :null => false
      t.integer  "vip_time",                       :default => 0,   :null => false
      t.integer  "old_group",       :limit => 1,   :default => 0,   :null => false
    end

    add_index "login", ["userid"], :name => "name"

    create_table "loginlog", :id => false, :force => true do |t|
      t.datetime "time",                                :null => false
      t.string   "ip",    :limit => 15, :default => "", :null => false
      t.string   "user",  :limit => 23, :default => "", :null => false
      t.integer  "rcode", :limit => 1,  :default => 0,  :null => false
      t.string   "log",                 :default => "", :null => false
    end

    add_index "loginlog", ["ip"], :name => "ip"

    create_table "mail", :force => true do |t|
      t.string  "send_name", :limit => 30, :default => "", :null => false
      t.integer "send_id",                 :default => 0,  :null => false
      t.string  "dest_name", :limit => 30, :default => "", :null => false
      t.integer "dest_id",                 :default => 0,  :null => false
      t.string  "title",     :limit => 45, :default => "", :null => false
      t.string  "message",                 :default => "", :null => false
      t.integer "time",                    :default => 0,  :null => false
      t.integer "status",    :limit => 1,  :default => 0,  :null => false
      t.integer "zeny",                    :default => 0,  :null => false
      t.integer "nameid",                  :default => 0,  :null => false
      t.integer "amount",                  :default => 0,  :null => false
      t.integer "refine",    :limit => 1,  :default => 0,  :null => false
      t.integer "attribute", :limit => 1,  :default => 0,  :null => false
      t.integer "identify",  :limit => 2,  :default => 0,  :null => false
      t.integer "card0",     :limit => 2,  :default => 0,  :null => false
      t.integer "card1",     :limit => 2,  :default => 0,  :null => false
      t.integer "card2",     :limit => 2,  :default => 0,  :null => false
      t.integer "card3",     :limit => 2,  :default => 0,  :null => false
      t.integer "unique_id", :limit => 8,  :default => 0,  :null => false
    end

    create_table "mapreg", :id => false, :force => true do |t|
      t.string  "varname", :limit => 32,                :null => false
      t.integer "index",                 :default => 0, :null => false
      t.string  "value",                                :null => false
    end

    add_index "mapreg", ["index"], :name => "index"
    add_index "mapreg", ["varname"], :name => "varname"

    create_table "memo", :primary_key => "memo_id", :force => true do |t|
      t.integer "char_id",               :default => 0,  :null => false
      t.string  "map",     :limit => 11, :default => "", :null => false
      t.integer "x",       :limit => 2,  :default => 0,  :null => false
      t.integer "y",       :limit => 2,  :default => 0,  :null => false
    end

    add_index "memo", ["char_id"], :name => "char_id"

    create_table "mercenary", :primary_key => "mer_id", :force => true do |t|
      t.integer "char_id",                                  :null => false
      t.integer "class",        :limit => 3, :default => 0, :null => false
      t.integer "hp",                        :default => 1, :null => false
      t.integer "sp",                        :default => 1, :null => false
      t.integer "kill_counter",                             :null => false
      t.integer "life_time",                 :default => 0, :null => false
    end

    create_table "mercenary_owner", :primary_key => "char_id", :force => true do |t|
      t.integer "merc_id",     :default => 0, :null => false
      t.integer "arch_calls",  :default => 0, :null => false
      t.integer "arch_faith",  :default => 0, :null => false
      t.integer "spear_calls", :default => 0, :null => false
      t.integer "spear_faith", :default => 0, :null => false
      t.integer "sword_calls", :default => 0, :null => false
      t.integer "sword_faith", :default => 0, :null => false
    end

    create_table "mob_db", :primary_key => "ID", :force => true do |t|
      t.text    "Sprite",                                  :null => false
      t.text    "kName",                                   :null => false
      t.text    "iName",                                   :null => false
      t.integer "LV",          :limit => 1, :default => 0, :null => false
      t.integer "HP",                       :default => 0, :null => false
      t.integer "SP",          :limit => 3, :default => 0, :null => false
      t.integer "EXP",         :limit => 3, :default => 0, :null => false
      t.integer "JEXP",        :limit => 3, :default => 0, :null => false
      t.integer "Range1",      :limit => 1, :default => 0, :null => false
      t.integer "ATK1",        :limit => 2, :default => 0, :null => false
      t.integer "ATK2",        :limit => 2, :default => 0, :null => false
      t.integer "DEF",         :limit => 2, :default => 0, :null => false
      t.integer "MDEF",        :limit => 2, :default => 0, :null => false
      t.integer "STR",         :limit => 2, :default => 0, :null => false
      t.integer "AGI",         :limit => 2, :default => 0, :null => false
      t.integer "VIT",         :limit => 2, :default => 0, :null => false
      t.integer "INT",         :limit => 2, :default => 0, :null => false
      t.integer "DEX",         :limit => 2, :default => 0, :null => false
      t.integer "LUK",         :limit => 2, :default => 0, :null => false
      t.integer "Range2",      :limit => 1, :default => 0, :null => false
      t.integer "Range3",      :limit => 1, :default => 0, :null => false
      t.integer "Scale",       :limit => 1, :default => 0, :null => false
      t.integer "Race",        :limit => 1, :default => 0, :null => false
      t.integer "Element",     :limit => 1, :default => 0, :null => false
      t.integer "Mode",        :limit => 2, :default => 0, :null => false
      t.integer "Speed",       :limit => 2, :default => 0, :null => false
      t.integer "aDelay",      :limit => 2, :default => 0, :null => false
      t.integer "aMotion",     :limit => 2, :default => 0, :null => false
      t.integer "dMotion",     :limit => 2, :default => 0, :null => false
      t.integer "MEXP",        :limit => 3, :default => 0, :null => false
      t.integer "MVP1id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP1per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP2id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP2per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP3id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP3per",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop2id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop2per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop3id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop3per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop4id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop4per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop5id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop5per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop6id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop6per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop7id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop7per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop8id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop8per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop9id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop9per",    :limit => 2, :default => 0, :null => false
      t.integer "DropCardid",  :limit => 2, :default => 0, :null => false
      t.integer "DropCardper", :limit => 2, :default => 0, :null => false
    end

    create_table "mob_db2", :primary_key => "ID", :force => true do |t|
      t.text    "Sprite",                                  :null => false
      t.text    "kName",                                   :null => false
      t.text    "iName",                                   :null => false
      t.integer "LV",          :limit => 1, :default => 0, :null => false
      t.integer "HP",                       :default => 0, :null => false
      t.integer "SP",          :limit => 3, :default => 0, :null => false
      t.integer "EXP",         :limit => 3, :default => 0, :null => false
      t.integer "JEXP",        :limit => 3, :default => 0, :null => false
      t.integer "Range1",      :limit => 1, :default => 0, :null => false
      t.integer "ATK1",        :limit => 2, :default => 0, :null => false
      t.integer "ATK2",        :limit => 2, :default => 0, :null => false
      t.integer "DEF",         :limit => 2, :default => 0, :null => false
      t.integer "MDEF",        :limit => 2, :default => 0, :null => false
      t.integer "STR",         :limit => 2, :default => 0, :null => false
      t.integer "AGI",         :limit => 2, :default => 0, :null => false
      t.integer "VIT",         :limit => 2, :default => 0, :null => false
      t.integer "INT",         :limit => 2, :default => 0, :null => false
      t.integer "DEX",         :limit => 2, :default => 0, :null => false
      t.integer "LUK",         :limit => 2, :default => 0, :null => false
      t.integer "Range2",      :limit => 1, :default => 0, :null => false
      t.integer "Range3",      :limit => 1, :default => 0, :null => false
      t.integer "Scale",       :limit => 1, :default => 0, :null => false
      t.integer "Race",        :limit => 1, :default => 0, :null => false
      t.integer "Element",     :limit => 1, :default => 0, :null => false
      t.integer "Mode",        :limit => 2, :default => 0, :null => false
      t.integer "Speed",       :limit => 2, :default => 0, :null => false
      t.integer "aDelay",      :limit => 2, :default => 0, :null => false
      t.integer "aMotion",     :limit => 2, :default => 0, :null => false
      t.integer "dMotion",     :limit => 2, :default => 0, :null => false
      t.integer "MEXP",        :limit => 3, :default => 0, :null => false
      t.integer "MVP1id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP1per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP2id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP2per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP3id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP3per",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop2id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop2per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop3id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop3per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop4id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop4per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop5id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop5per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop6id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop6per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop7id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop7per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop8id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop8per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop9id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop9per",    :limit => 2, :default => 0, :null => false
      t.integer "DropCardid",  :limit => 2, :default => 0, :null => false
      t.integer "DropCardper", :limit => 2, :default => 0, :null => false
    end

    create_table "mob_db2_re", :primary_key => "ID", :force => true do |t|
      t.text    "Sprite",                                  :null => false
      t.text    "kName",                                   :null => false
      t.text    "iName",                                   :null => false
      t.integer "LV",          :limit => 1, :default => 0, :null => false
      t.integer "HP",                       :default => 0, :null => false
      t.integer "SP",          :limit => 3, :default => 0, :null => false
      t.integer "EXP",         :limit => 3, :default => 0, :null => false
      t.integer "JEXP",        :limit => 3, :default => 0, :null => false
      t.integer "Range1",      :limit => 1, :default => 0, :null => false
      t.integer "ATK1",        :limit => 2, :default => 0, :null => false
      t.integer "ATK2",        :limit => 2, :default => 0, :null => false
      t.integer "DEF",         :limit => 2, :default => 0, :null => false
      t.integer "MDEF",        :limit => 2, :default => 0, :null => false
      t.integer "STR",         :limit => 2, :default => 0, :null => false
      t.integer "AGI",         :limit => 2, :default => 0, :null => false
      t.integer "VIT",         :limit => 2, :default => 0, :null => false
      t.integer "INT",         :limit => 2, :default => 0, :null => false
      t.integer "DEX",         :limit => 2, :default => 0, :null => false
      t.integer "LUK",         :limit => 2, :default => 0, :null => false
      t.integer "Range2",      :limit => 1, :default => 0, :null => false
      t.integer "Range3",      :limit => 1, :default => 0, :null => false
      t.integer "Scale",       :limit => 1, :default => 0, :null => false
      t.integer "Race",        :limit => 1, :default => 0, :null => false
      t.integer "Element",     :limit => 1, :default => 0, :null => false
      t.integer "Mode",        :limit => 2, :default => 0, :null => false
      t.integer "Speed",       :limit => 2, :default => 0, :null => false
      t.integer "aDelay",      :limit => 2, :default => 0, :null => false
      t.integer "aMotion",     :limit => 2, :default => 0, :null => false
      t.integer "dMotion",     :limit => 2, :default => 0, :null => false
      t.integer "MEXP",        :limit => 3, :default => 0, :null => false
      t.integer "MVP1id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP1per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP2id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP2per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP3id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP3per",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop2id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop2per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop3id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop3per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop4id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop4per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop5id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop5per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop6id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop6per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop7id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop7per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop8id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop8per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop9id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop9per",    :limit => 2, :default => 0, :null => false
      t.integer "DropCardid",  :limit => 2, :default => 0, :null => false
      t.integer "DropCardper", :limit => 2, :default => 0, :null => false
    end

    create_table "mob_db_re", :primary_key => "ID", :force => true do |t|
      t.text    "Sprite",                                  :null => false
      t.text    "kName",                                   :null => false
      t.text    "iName",                                   :null => false
      t.integer "LV",          :limit => 1, :default => 0, :null => false
      t.integer "HP",                       :default => 0, :null => false
      t.integer "SP",          :limit => 3, :default => 0, :null => false
      t.integer "EXP",         :limit => 3, :default => 0, :null => false
      t.integer "JEXP",        :limit => 3, :default => 0, :null => false
      t.integer "Range1",      :limit => 1, :default => 0, :null => false
      t.integer "ATK1",        :limit => 2, :default => 0, :null => false
      t.integer "ATK2",        :limit => 2, :default => 0, :null => false
      t.integer "DEF",         :limit => 2, :default => 0, :null => false
      t.integer "MDEF",        :limit => 2, :default => 0, :null => false
      t.integer "STR",         :limit => 2, :default => 0, :null => false
      t.integer "AGI",         :limit => 2, :default => 0, :null => false
      t.integer "VIT",         :limit => 2, :default => 0, :null => false
      t.integer "INT",         :limit => 2, :default => 0, :null => false
      t.integer "DEX",         :limit => 2, :default => 0, :null => false
      t.integer "LUK",         :limit => 2, :default => 0, :null => false
      t.integer "Range2",      :limit => 1, :default => 0, :null => false
      t.integer "Range3",      :limit => 1, :default => 0, :null => false
      t.integer "Scale",       :limit => 1, :default => 0, :null => false
      t.integer "Race",        :limit => 1, :default => 0, :null => false
      t.integer "Element",     :limit => 1, :default => 0, :null => false
      t.integer "Mode",        :limit => 2, :default => 0, :null => false
      t.integer "Speed",       :limit => 2, :default => 0, :null => false
      t.integer "aDelay",      :limit => 2, :default => 0, :null => false
      t.integer "aMotion",     :limit => 2, :default => 0, :null => false
      t.integer "dMotion",     :limit => 2, :default => 0, :null => false
      t.integer "MEXP",        :limit => 3, :default => 0, :null => false
      t.integer "MVP1id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP1per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP2id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP2per",     :limit => 2, :default => 0, :null => false
      t.integer "MVP3id",      :limit => 2, :default => 0, :null => false
      t.integer "MVP3per",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop1per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop2id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop2per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop3id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop3per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop4id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop4per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop5id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop5per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop6id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop6per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop7id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop7per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop8id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop8per",    :limit => 2, :default => 0, :null => false
      t.integer "Drop9id",     :limit => 2, :default => 0, :null => false
      t.integer "Drop9per",    :limit => 2, :default => 0, :null => false
      t.integer "DropCardid",  :limit => 2, :default => 0, :null => false
      t.integer "DropCardper", :limit => 2, :default => 0, :null => false
    end

    create_table "mob_skill_db", :id => false, :force => true do |t|
      t.integer "MOB_ID",          :limit => 2, :null => false
      t.text    "INFO",                         :null => false
      t.text    "STATE",                        :null => false
      t.integer "SKILL_ID",        :limit => 2, :null => false
      t.integer "SKILL_LV",        :limit => 1, :null => false
      t.integer "RATE",            :limit => 2, :null => false
      t.integer "CASTTIME",        :limit => 3, :null => false
      t.integer "DELAY",                        :null => false
      t.text    "CANCELABLE",                   :null => false
      t.text    "TARGET",                       :null => false
      t.text    "CONDITION",                    :null => false
      t.text    "CONDITION_VALUE"
      t.integer "VAL1",            :limit => 3
      t.integer "VAL2",            :limit => 3
      t.integer "VAL3",            :limit => 3
      t.integer "VAL4",            :limit => 3
      t.integer "VAL5",            :limit => 3
      t.text    "EMOTION"
      t.text    "CHAT"
    end

    create_table "mob_skill_db2", :id => false, :force => true do |t|
      t.integer "MOB_ID",          :limit => 2, :null => false
      t.text    "INFO",                         :null => false
      t.text    "STATE",                        :null => false
      t.integer "SKILL_ID",        :limit => 2, :null => false
      t.integer "SKILL_LV",        :limit => 1, :null => false
      t.integer "RATE",            :limit => 2, :null => false
      t.integer "CASTTIME",        :limit => 3, :null => false
      t.integer "DELAY",                        :null => false
      t.text    "CANCELABLE",                   :null => false
      t.text    "TARGET",                       :null => false
      t.text    "CONDITION",                    :null => false
      t.text    "CONDITION_VALUE"
      t.integer "VAL1",            :limit => 3
      t.integer "VAL2",            :limit => 3
      t.integer "VAL3",            :limit => 3
      t.integer "VAL4",            :limit => 3
      t.integer "VAL5",            :limit => 3
      t.text    "EMOTION"
      t.text    "CHAT"
    end

    create_table "mob_skill_db2_re", :id => false, :force => true do |t|
      t.integer "MOB_ID",          :limit => 2, :null => false
      t.text    "INFO",                         :null => false
      t.text    "STATE",                        :null => false
      t.integer "SKILL_ID",        :limit => 2, :null => false
      t.integer "SKILL_LV",        :limit => 1, :null => false
      t.integer "RATE",            :limit => 2, :null => false
      t.integer "CASTTIME",        :limit => 3, :null => false
      t.integer "DELAY",                        :null => false
      t.text    "CANCELABLE",                   :null => false
      t.text    "TARGET",                       :null => false
      t.text    "CONDITION",                    :null => false
      t.text    "CONDITION_VALUE"
      t.integer "VAL1",            :limit => 3
      t.integer "VAL2",            :limit => 3
      t.integer "VAL3",            :limit => 3
      t.integer "VAL4",            :limit => 3
      t.integer "VAL5",            :limit => 3
      t.text    "EMOTION"
      t.text    "CHAT"
    end

    create_table "mob_skill_db_re", :id => false, :force => true do |t|
      t.integer "MOB_ID",          :limit => 2, :null => false
      t.text    "INFO",                         :null => false
      t.text    "STATE",                        :null => false
      t.integer "SKILL_ID",        :limit => 2, :null => false
      t.integer "SKILL_LV",        :limit => 1, :null => false
      t.integer "RATE",            :limit => 2, :null => false
      t.integer "CASTTIME",        :limit => 3, :null => false
      t.integer "DELAY",                        :null => false
      t.text    "CANCELABLE",                   :null => false
      t.text    "TARGET",                       :null => false
      t.text    "CONDITION",                    :null => false
      t.text    "CONDITION_VALUE"
      t.integer "VAL1",            :limit => 3
      t.integer "VAL2",            :limit => 3
      t.integer "VAL3",            :limit => 3
      t.integer "VAL4",            :limit => 3
      t.integer "VAL5",            :limit => 3
      t.text    "EMOTION"
      t.text    "CHAT"
    end

    create_table "mvplog", :primary_key => "mvp_id", :force => true do |t|
      t.datetime "mvp_date",                                   :null => false
      t.integer  "kill_char_id",               :default => 0,  :null => false
      t.integer  "monster_id",   :limit => 2,  :default => 0,  :null => false
      t.integer  "prize",                      :default => 0,  :null => false
      t.integer  "mvpexp",       :limit => 3,  :default => 0,  :null => false
      t.string   "map",          :limit => 11, :default => "", :null => false
    end

    create_table "npclog", :primary_key => "npc_id", :force => true do |t|
      t.datetime "npc_date",                                 :null => false
      t.integer  "account_id",               :default => 0,  :null => false
      t.integer  "char_id",                  :default => 0,  :null => false
      t.string   "char_name",  :limit => 25, :default => "", :null => false
      t.string   "map",        :limit => 11, :default => "", :null => false
      t.string   "mes",                      :default => "", :null => false
    end

    add_index "npclog", ["account_id"], :name => "account_id"
    add_index "npclog", ["char_id"], :name => "char_id"

    create_table "party", :primary_key => "party_id", :force => true do |t|
      t.string  "name",        :limit => 24, :default => "", :null => false
      t.integer "exp",         :limit => 1,  :default => 0,  :null => false
      t.integer "item",        :limit => 1,  :default => 0,  :null => false
      t.integer "leader_id",                 :default => 0,  :null => false
      t.integer "leader_char",               :default => 0,  :null => false
    end

    create_table "pet", :primary_key => "pet_id", :force => true do |t|
      t.integer "class",       :limit => 3,  :default => 0,  :null => false
      t.string  "name",        :limit => 24, :default => "", :null => false
      t.integer "account_id",                :default => 0,  :null => false
      t.integer "char_id",                   :default => 0,  :null => false
      t.integer "level",       :limit => 2,  :default => 0,  :null => false
      t.integer "egg_id",      :limit => 2,  :default => 0,  :null => false
      t.integer "equip",       :limit => 3,  :default => 0,  :null => false
      t.integer "intimate",    :limit => 2,  :default => 0,  :null => false
      t.integer "hungry",      :limit => 2,  :default => 0,  :null => false
      t.integer "rename_flag", :limit => 1,  :default => 0,  :null => false
      t.integer "incuvate",                  :default => 0,  :null => false
    end

    create_table "picklog", :force => true do |t|
      t.datetime "time",                                     :null => false
      t.integer  "char_id",                 :default => 0,   :null => false
      t.string   "type",      :limit => 1,  :default => "P", :null => false
      t.integer  "nameid",                  :default => 0,   :null => false
      t.integer  "amount",                  :default => 1,   :null => false
      t.integer  "refine",    :limit => 1,  :default => 0,   :null => false
      t.integer  "card0",                   :default => 0,   :null => false
      t.integer  "card1",                   :default => 0,   :null => false
      t.integer  "card2",                   :default => 0,   :null => false
      t.integer  "card3",                   :default => 0,   :null => false
      t.integer  "unique_id", :limit => 8,  :default => 0,   :null => false
      t.string   "map",       :limit => 11, :default => "",  :null => false
    end

    add_index "picklog", ["type"], :name => "type"

    create_table "quest", :id => false, :force => true do |t|
      t.integer "char_id",               :default => 0,   :null => false
      t.integer "quest_id",                               :null => false
      t.string  "state",    :limit => 1, :default => "0", :null => false
      t.integer "time",                  :default => 0,   :null => false
      t.integer "count1",   :limit => 3, :default => 0,   :null => false
      t.integer "count2",   :limit => 3, :default => 0,   :null => false
      t.integer "count3",   :limit => 3, :default => 0,   :null => false
    end

    create_table "ragsrvinfo", :id => false, :force => true do |t|
      t.integer "index", :default => 0,  :null => false
      t.string  "name",  :default => "", :null => false
      t.integer "exp",   :default => 0,  :null => false
      t.integer "jexp",  :default => 0,  :null => false
      t.integer "drop",  :default => 0,  :null => false
    end

    create_table "sc_data", :id => false, :force => true do |t|
      t.integer "account_id",                             :null => false
      t.integer "char_id",                                :null => false
      t.integer "type",       :limit => 2,                :null => false
      t.integer "tick",                                   :null => false
      t.integer "val1",                    :default => 0, :null => false
      t.integer "val2",                    :default => 0, :null => false
      t.integer "val3",                    :default => 0, :null => false
      t.integer "val4",                    :default => 0, :null => false
    end

    add_index "sc_data", ["account_id"], :name => "account_id"
    add_index "sc_data", ["char_id"], :name => "char_id"

    create_table "skill", :id => false, :force => true do |t|
      t.integer "char_id",              :default => 0,     :null => false
      t.integer "id",      :limit => 2, :default => 0,     :null => false
      t.integer "lv",      :limit => 1, :default => 0,     :null => false
      t.boolean "flag",                 :default => false, :null => false
    end

    create_table "skill_homunculus", :id => false, :force => true do |t|
      t.integer "homun_id",              :null => false
      t.integer "id",                    :null => false
      t.integer "lv",       :limit => 2, :null => false
    end

    create_table "skillcooldown", :id => false, :force => true do |t|
      t.integer "account_id",                             :null => false
      t.integer "char_id",                                :null => false
      t.integer "skill",      :limit => 2, :default => 0, :null => false
      t.integer "tick",                                   :null => false
    end

    add_index "skillcooldown", ["account_id"], :name => "account_id"
    add_index "skillcooldown", ["char_id"], :name => "char_id"

    create_table "sstatus", :id => false, :force => true do |t|
      t.integer "index", :limit => 1, :default => 0,  :null => false
      t.string  "name",               :default => "", :null => false
      t.integer "user",               :default => 0,  :null => false
    end

    create_table "storage", :force => true do |t|
      t.integer "account_id",               :default => 0, :null => false
      t.integer "nameid",                   :default => 0, :null => false
      t.integer "amount",      :limit => 2, :default => 0, :null => false
      t.integer "equip",                    :default => 0, :null => false
      t.integer "identify",    :limit => 2, :default => 0, :null => false
      t.integer "refine",      :limit => 1, :default => 0, :null => false
      t.integer "attribute",   :limit => 1, :default => 0, :null => false
      t.integer "card0",       :limit => 2, :default => 0, :null => false
      t.integer "card1",       :limit => 2, :default => 0, :null => false
      t.integer "card2",       :limit => 2, :default => 0, :null => false
      t.integer "card3",       :limit => 2, :default => 0, :null => false
      t.integer "expire_time",              :default => 0, :null => false
      t.integer "bound",       :limit => 1, :default => 0, :null => false
      t.integer "unique_id",   :limit => 8, :default => 0, :null => false
    end

    add_index "storage", ["account_id"], :name => "account_id"

    create_table "vending_items", :id => false, :force => true do |t|
      t.integer "vending_id",                    :null => false
      t.integer "index",            :limit => 2, :null => false
      t.integer "cartinventory_id",              :null => false
      t.integer "amount",           :limit => 2, :null => false
      t.integer "price",                         :null => false
    end

    create_table "vendings", :force => true do |t|
      t.integer "account_id",                                :null => false
      t.integer "char_id",                                   :null => false
      t.string  "sex",        :limit => 1,  :default => "M", :null => false
      t.string  "map",        :limit => 20,                  :null => false
      t.integer "x",          :limit => 2,                   :null => false
      t.integer "y",          :limit => 2,                   :null => false
      t.string  "title",      :limit => 80,                  :null => false
      t.integer "autotrade",  :limit => 1,                   :null => false
    end

    create_table "zenylog", :force => true do |t|
      t.datetime "time",                                   :null => false
      t.integer  "char_id",               :default => 0,   :null => false
      t.integer  "src_id",                :default => 0,   :null => false
      t.string   "type",    :limit => 1,  :default => "S", :null => false
      t.integer  "amount",                :default => 0,   :null => false
      t.string   "map",     :limit => 11, :default => "",  :null => false
    end

    add_index "zenylog", ["type"], :name => "type"
  end
end