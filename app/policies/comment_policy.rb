class CommentPolicy
  attr_reader :current_user, :user
  
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    user == current_user || !user.private? || user.followers.include?(current_user)
  end
end
