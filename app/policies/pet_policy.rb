class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    return unless user
    user || user.admin
  end

  def show?
    true
  end

  def update?
    return unless user
    (record.user_id == user.id) || user.admin
  end

  def destroy?
    return unless user
    (record.user_id == user.id) || user.admin
  end
end
