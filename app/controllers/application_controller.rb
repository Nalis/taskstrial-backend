class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :authenticate_user_from_token!, only: [:tasks]
  after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

  def tasks
    render json: [{id: 1, name: 'One'}, {id: 2, name: 'Two'}]
  end

  def handle_options_request
    request.headers['HTTP_ORIGIN'] == 'http://localhost:4200' || request.headers['HTTP_ORIGIN'] == 'http://taskstrial.valentinaitken.com'
    head(:ok) if request.request_method == "OPTIONS"
  end

  def cors_set_access_control_headers
    if Rails.env == "development"
      headers['Access-Control-Allow-Origin'] = 'http://localhost:4200'
    else
      headers['Access-Control-Allow-Origin'] = 'http://taskstrial.valentinaitken.com'
    end

    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end
end
