class ApplicationController < ActionController::API
  def authenticate
    authorization_header = request.headers[:authorization]
    secret = Rails.application.secrets.secret_key_base

    begin
      @token = authorization_header.split(" ")[1]
    rescue
      return render json: {errors: "token not passed"}, status: :unauthorized
    end

    if !Allowedlist.find_by(token: @token)
      return render json: {errors: "user not logged in"}, status: :unauthorized
    else
      begin
        payload = JWT.decode(@token, secret)[0]
        @user = User.find(payload["user_id"])
      rescue
        render json: {errors: "token not decodable"}, status: :unauthorized
      end
    end
  end
end
