class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
    json_render @user
  end

  def show
    @user = User.find_by(params[:id])
    json_render @user
  end

  def create
    @user = User.find_or_initialize_by(user_params)
    return user_exist if @user.persisted?
    if @user.save
      json_render @user, status: :created
    else
      json_render @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      json_render @user, status: :created
    else
      json_render @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(params[:id])
    user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_exist
      error = {error: 'user already exist'}
      json_render(error, status: :unprocessable_entity)
    end

    def user_params
      params.require(:user).permit(:sender_number, :pass_code, :service_provider)
    end
end
