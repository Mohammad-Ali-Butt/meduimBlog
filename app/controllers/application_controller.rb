class ApplicationController < ActionController::Base
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError do |exception|
        flash[:error] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end

    before_action :authenticate_user!
end
