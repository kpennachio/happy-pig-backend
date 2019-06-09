class Api::V1::AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      jwt = encode_token({user_id: user.id})
      render json: {user: user, jwt: jwt}
    else
      render json: {errors: "Please enter the correct username and password!"}
    end
  end

  def auto_login
    user = curr_user
    if user
      render json: user
    else
      render json: {errors: "No current user"}
    end
  end
end
