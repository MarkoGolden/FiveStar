class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.present?
          if @user.admin?
            scope.all
          elsif @user.franchise?
            scope.where(customer: @user.scoped_customers)
          elsif @user.agent?
            scope.where(customer: @user.scoped_customers)
          else
            scope.none
          end
      else
          scope.none
      end
    end
  end
  
  def new?
    @user.admin? ? true : false
  end

  def import?
    @user.admin? ? true : false
  end

  def index?
    @user.admin? || @user.franchise? || @user.agent? ? true : false
  end
end
