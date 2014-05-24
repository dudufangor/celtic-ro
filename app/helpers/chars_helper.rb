module CharsHelper
  def online_users
    if should_reload_online_users?
      @online_users = Char.chars_online.count
      @online_users_reloaded_at = Time.now
    end

    @online_users
  end

  def should_reload_online_users?
    @online_users_reload_interval = 5.minutes

    return true unless defined?(@online_users)
    return true unless defined?(@online_users_reloaded_at)
    return @online_users_reloaded_at + @online_users_reload_interval < Time.now
  end
end