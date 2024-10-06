module Events
  class Register
    def initialize(event:)
      @event = event
    end

    def call(user:)
      participation = user.participations.find_or_initialize_by(event: event)

      return if participation.persisted?

      participation.save if event.available_seats? # FIXME: lock or transaction
    end

  private

    attr_reader :event
  end
end
