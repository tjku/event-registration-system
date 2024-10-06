class EventPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.organizer?
        user.created_events
      else
        user.events
      end
    end
  end

  def index?
    true
  end

  def show?
    user.organizer? && record.creator == user
  end

  def create?
    user.organizer?
  end

  def new?
    create?
  end

  def update?
    user.organizer? && record.creator == user
  end

  def edit?
    update?
  end

  def destroy?
    user.organizer? && record.creator == user
  end
end
