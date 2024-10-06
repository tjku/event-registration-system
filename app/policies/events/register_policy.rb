module Events
  class RegisterPolicy < ApplicationPolicy
    def create?
      user.participant?
    end
  end
end
