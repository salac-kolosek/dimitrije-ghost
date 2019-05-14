class UserPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    user.admin? || record == user
  end

  def update?
    user.admin? || recorc == user
  end
end