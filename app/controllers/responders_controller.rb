require 'securerandom'

class RespondersController < ApplicationController
  # before_action :check_responder, only: [:logout]
  def create
    uid = SecureRandom.alphanumeric(7)
    @responder = Responder.new(code: uid)
    if @responder.save
      render json: {message: "please remember your code: #{@responder.code}"}
    else
      render json: {errors: @responder.errors}, status: 400
    end
  end

  def login
    responder = Responder.find_by(code: params[:code])
    if !responder
      render json: {errors: "you passed wrong code"}, status: 400
    else
      secret = Rails.application.secrets.secret_key_base
      payload = {responder_id: responder.id}
      token = JWT.encode(payload, secret)
      jwt = Allowedlist.find_by(token: token) || Allowedlist.create(token: token)
      render json: {token: token}
    end
  end

  def logout
    token = Allowedlist.find_by(token: @token)
    if token.destroy
      render json: {message: "responder logged out"}, status: 200
    else
      render json: {errors: "couldn't log out"}, status: 400
    end
  end
end
