class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.present?
          if @user.admin?
            scope.all
          elsif @user.franchise?
            scope.where(owner: @user)
          elsif @user.agent?
            scope.where(owner: @user)
          else
            scope.none
          end
      else
          scope.none
      end
    end
  end

  def index?
    @user.admin? || @user.franchise? ? true : false
  end

  def new?
    index?
  end

  def edit?
    if @record.id == @user.id
      true
    elsif @user.admin? || @user.franchise?
      true
    else
      false
    end
  end

  def show?
    index?
  end

 end
