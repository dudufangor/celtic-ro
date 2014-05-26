class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Cadastro efetuado!'
      redirect_to new_user_path
    else
      fix_builded_user
      render action: 'new'
    end
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:success] = 'Usuario Atualizado!'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

  def reset
    @char = Char.where(name: params[:name], account_id: current_user.account_id).first

    if @char
      @char.reset!
      sleep 1
      render nothing: true
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :sex,
      :username,
      :password,
      :password_confirmation,
      :email_confirmation
    )
  end

  def fix_builded_user
    errors = @user.errors
    @user = User.new
    errors.full_messages.each{ |e| @user.errors[:base] << e }
  end
end