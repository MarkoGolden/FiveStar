class ProductPolicy < ApplicationPolicy
  def index?
    @user.admin? ? true : false
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
end