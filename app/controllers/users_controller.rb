class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = params[:user]

    if @user.save
      flash[:success] = 'Cadastro efetuado!'
      redirect_to new_user_path
    else
      render action: 'edit'
    end
  end
end