class CompanyPolicy
  attr_reader :user, :company

  def initialize(user, company)
    @user = user
    @company = company
  end

  def index?
    return true if user.admin? || user.student? || user.employer?
  end

  def show?
    return true if user.admin? || user.student? || user.employer?
  end

  def create?
    return true if user.admin? || user.employer?
    false

  end

  def new?
    create?
  end

  def update?
    return true if user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, company)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      Scope
    end
  end
end
