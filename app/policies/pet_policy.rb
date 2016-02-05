class PetPolicy < ApplicationPolicy
  def create?
    current_user?
    user.admin?
  end
end
