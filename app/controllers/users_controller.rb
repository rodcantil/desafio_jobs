class UsersController < ApplicationController
before_action :authenticate_user!, except: [ :index, :show ]


before_action only: [ :index, :show ] do
  authorize_request([ "admin" ])
end



def index
  @users = User.all
end

# GET /offers/1 or /offers/1.json
def show
  @user = User.find(params[:id])
end

private
def set_user
  @user = User.find(params.expect(:id))
end
def user_params
  params.require(:user).permit(:name, :image, :email, :age, :phone, :occupation, :year_exp, :role)
end
end
