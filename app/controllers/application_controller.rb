class ApplicationController < ActionController::API
  def current_user
    return if request.headers['Authorization'].blank?

    token = request.headers['Authorization'].split(' ').last

    return if token.blank?

    begin
      result = JsonWebToken.decode(token)
      User.find_by(id: result[:user_id])
    rescue JWT::ExpiredSignature
      self.status = 401
    end
  end
end
