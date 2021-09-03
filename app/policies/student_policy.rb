class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index
    true
  end

  def create?
    owner_or_admin?
  end

  def show?
    true
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user
  end
end
