class StoriesPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    user.admin? || user.editor? || record.owner == user
  end

  def update?
    user.admin? || user.editor? || record.owner == user
  end
end
