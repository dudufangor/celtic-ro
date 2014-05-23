class UsersController < ApplicationController  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:userid, :email, :user_pass, :sex))

    if @user.save
      flash[:success] = 'Cadastro efetuado!'
      redirect_to new_user_path
    else
      render action: 'new'
    end
  end
end