module Events
  class RegisterController < ApplicationController
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def create
      event = Event.find(params[:event_id])
      authorize %i[events register]

      respond_to do |format|
        if Events::Register.new(event: event).call(user: current_user)
          format.html { redirect_to events_path, notice: "User was successfully registered to the event '#{event.title}'." }
          format.json { render :show, status: :created, location: event }
        else
          format.html { redirect_to events_path, notice: "User cannot be registered to the event '#{event.title}'." }
          format.json { render :show, status: :unprocessable_entity, location: event }
        end
      end
    end

    private

      def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_back_or_to(root_path)
      end
  end
end
