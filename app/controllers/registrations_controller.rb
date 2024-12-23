# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [ :new, :create ]
  # skip_before_action :require_no_authentication, only: [ :new, :create ]
  skip_before_action :require_no_authentication

  def new
    redirect_to new_user_session_path, alert: "Debes iniciar sesión para acceder a esta página." unless user_signed_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Usuario registrado exitosamente." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :age, :phone, :occupation, :year_exp, :role, :email, :password, :password_confirmation)
  end
end
