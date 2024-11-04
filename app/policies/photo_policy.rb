class PhotoPolicy < ApplicationPolicy
  
  attr_reader :current_user, :photo

  def initialize(owner, photo)
    owner = Photo.where(:owner => current_user)
  end

# Pur policy is that a photo should only be seen by the owner or followers of the owner, unless the owner is not provate in which case anyone can see it.

  def index?
    true
  end

  def show?
    current_user == photo.owner ||
    !photo.owner.private? ||
    photo.owner.followers.include?(current_user)
  end

  def create?
    true
  end

  def update?
    current_user == photo.owner
  end

  def destroy?
    current_user == photo.owner
  end

end
