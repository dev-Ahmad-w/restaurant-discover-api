# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(current_user, _opts = {})
    render json:  { 
        code: 200, message: 'Logged in successfully.',
        data: UserSerializer.new(current_user)
      }, status: :ok
  end
  
  def respond_to_on_destroy
    render json: { message: 'You are logged out.' }, status: :ok 
  end
end
