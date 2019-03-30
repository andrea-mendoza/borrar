class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authorize_admin, only: [:create, :update]

  def indexgit 
    @users = User.where(:career => current_user.career).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def change_password
    @user =  current_user
  end

  change_path = '/users/change_password'

  def update_password
    @user = current_user
    if(current_user.valid_password?(params[:user][:current_password]))
      different_password
    else
      redirect_to change_path, alert: 'Debe ingresar su contraseña.'
    end
  end

  private

  def different_password
    if (params[:user][:password] == params[:user][:password_confirmation])
      without_password
    else
      flash[:alert] = "Las contraseñas no coinciden."
      redirect_back fallback_location: change_path
    end
  end

  def without_password
    if (params[:user][:password].blank?)
      redirect_to change_path, alert: 'Las contraseñas no pueden estar en blanco.'
    else
      bad_password
    end
  end

  def bad_password
    if (params[:user][:password] == params[:user][:current_password])
      redirect_to change_path, alert: 'No se puede usar la misma contraseña.'
    else
      current_user.password = params[:user][:password]
      saveCurrentUser
    end
  end

  def saveCurrentUser
    if current_user.save
      flash[:alert] = "Se cambio la contraseña correctamente."
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      redirect_to change_path, alert: 'La contraseña debe tener al menos 6 caracteres.'
    end
  end

  def authorize_admin
    return unless !current_user.director? && !current_user.present?
    redirect_to root_path, alert: 'Solo Directores!'
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :username, :career, :phone, :role, :email, :admin_role, :tutor_role, :relator_role, :professor_role, :professional_degree, :password, :password_confirmation)
  end
end
