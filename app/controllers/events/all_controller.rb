module Events
  class AllController < ApplicationController
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
      authorize %i[events all]

      @events = Event.all
    end

    private

      def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_back_or_to(root_path)
      end
  end
end
