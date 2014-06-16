module ApplicationHelper
  def nav
    [
      { url: '#highlights', class: 'bt_highlights', description: 'Home' },
      { url: '#server_information', class: 'bt_server_information', description: 'Info' },
      { url: '#extra_information', class: 'bt_extra_information', description: 'Eventos' },
      { url: '#highlights', class: 'bt_highlights', description: 'Guias' },
      { url: '#join_game', class: 'bt_join_game', description: 'Registro' },
      { url: '#footer', class: 'bt_footer', description: 'Contato' }
    ]
  end
end
