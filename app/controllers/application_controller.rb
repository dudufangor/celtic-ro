class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render file: "#{ Rails.root }/public/404.html", layout: nil, status: '404 Not Found'
  end

  private
  def not_authenticated
    redirect_to :login, alert: 'Você deve se logar antes de prosseguir.'
  end
end