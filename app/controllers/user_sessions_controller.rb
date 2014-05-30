class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(:user, notice: 'Logado!')
    else
      flash.now[:alert] = 'Falha ao tentar se logar!'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:home, notice: 'Deslogado!')
  end
end