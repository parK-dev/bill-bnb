class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    #record.user == user
    user
  end

  def create?
    user
  end

  def new?
    user
  end
end
