class EventPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      user.created_events
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
