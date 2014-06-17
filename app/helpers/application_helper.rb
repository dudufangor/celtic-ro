module ApplicationHelper
  def nav
    [
      { url: '', class: 'bt_highlights', description: 'Home' },
      { url: '', class: 'bt_server_information', description: 'Info' },
      { url: '', class: 'bt_extra_information', description: 'Eventos' },
      { url: '', class: 'bt_guias', description: 'Guias' },
      { url: '', class: 'bt_join_game', description: 'Registro' },
      { url: '', class: 'bt_footer', description: 'Contato' }
    ]
  end
end