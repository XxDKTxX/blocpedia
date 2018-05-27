class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
   
  end                

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end

  def update?
    user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    Wiki.user.present?
  end

  # def scope
  #   Pundit.policy_scope!(user, record.class)
  # end

  # class Scope
  #   attr_reader :user, :scope

  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     scope
  #   end
  # end
end
