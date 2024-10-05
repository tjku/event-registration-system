class EventsController < ApplicationController
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    authorize Event

    @events = policy_scope(Event)
  end

  # GET /events/1 or /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    authorize Event

    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events or /events.json
  def create
    authorize Event

    @event = policy_scope(Event).new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    authorize @event

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    authorize @event

    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back_or_to(root_path)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = policy_scope(Event).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title)
    end
end
