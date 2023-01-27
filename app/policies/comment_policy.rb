class CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin? || @record.commenter_id == user.id
  end
end