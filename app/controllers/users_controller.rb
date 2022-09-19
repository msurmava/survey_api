class UsersController < ApplicationController

  def index
    @users = User.all
    render json: {users: @users}
  end

  def create
    user = User.new(email: params[:email], password: params[:password])
    if user.save 
      render json: {message: "user created with email: #{user.email}"}
    else
      render json: {errors: user.errors}, status: 400
    end
  end
end
