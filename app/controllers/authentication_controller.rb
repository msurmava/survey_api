class AuthenticationController < ApplicationController
  before_action :authenticate, only: :logout
  def login
    user = User.find_by(email: params[:email])
    if !user
      render json: {errors: "#{params[:email]} is not valid email"}, status: 400
    else
      if !user.authenticate(params[:password])
       render json: {errors: "invalid password"}, status: 400
      else
        secret = Rails.application.secrets.secret_key_base
        payload = {user_id: user.id}
        token = JWT.encode(payload, secret)
        jwt = Allowedlist.find_by(token: token) || Allowedlist.create(token: token)
        render json: {token: token}
      end
    end
  end

  def logout
    token = Allowedlist.find_by(token: @token)
    token.destroy
    render json: {message: "logged out"}
   end
end
