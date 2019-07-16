class ApplicationController < ActionController::API
  def current_user
    return if request.headers['Authorization'].blank?

    token = request.headers['Authorization'].split(' ').last

    return if token.blank?

    result = JsonWebToken.decode(token)

    return unless result

    User.find_by(id: result[:user_id])
  end
end
