class UsersController < ApplicationController  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :sex, :username, :password, :password_confirmation, :email_confirmation))

    if @user.save
      flash[:success] = 'Cadastro efetuado!'
      redirect_to new_user_path
    else
      fix_builded_user
      render action: 'new'
    end
  end

  private
  def fix_builded_user
    errors = @user.errors
    @user = User.new
    errors.full_messages.each{ |e| @user.errors[:base] << e }
  end
end