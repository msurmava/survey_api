class UsersController < ApplicationController
  def create
    user = User.new(email: params[:email], password_digest: params[:password])
    if user.save 
      render json: {message: "user created with email: #{user.email}"}
    else
      render json: {errors: user.errors}, status: 400
    end
  end
end
