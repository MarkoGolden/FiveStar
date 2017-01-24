class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.present?
        Customer.where(user_id: @user.all_agents)
      else
        scope.none
      end
    end
  end

  def index?
    @user.admin? || @user.agent? ||  @user.franchise? ? true : false
  end

  def new?
    index?
  end

  def edit?
    index?
  end

  def show?
    index?
  end

  def destroy?
    index?
  end
end
