class ApplicationController < ActionController::API
  def authenticate
    get_token
    if !Allowedlist.find_by(token: @token)
      return render json: {errors: "user not logged in"}, status: :unauthorized
    else
      begin
        payload = JWT.decode(@token, @secret)[0]
        @user = User.find(payload["user_id"])
      rescue
        render json: {errors: "token not decodable"}, status: :unauthorized
      end
    end
  end

  def check_responder
    get_token 
    if !Allowedlist.find_by(token: @token)
      render json: {errors: "Responder not logged in/no token passed"}, status: :unauthorized
      return
    else
      begin
        payload = JWT.decode(@token, @secret)[0]
        @responder = Responder.find(payload["responder_id"])
      rescue
        binding.irb
        render json: {errors: "token not decodable"}, status: :unauthorized
      end
    end
  end

 
  private

  def get_token
    authorization_header = request.headers[:authorization]
    @secret = Rails.application.secrets.secret_key_base

    begin
      @token = authorization_header.split(" ")[1]
    rescue
      return
    end
  end
end
