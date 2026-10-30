class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  # GET /outlet_types
  def index
    authorize! :read, User
    users =  current_user.admin? ? User.all : [current_user]
    render json: users, status: :ok
  end

end
