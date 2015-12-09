class RoleController < ApplicationController
  def index
    if cookies[:user_id].present?
      roles = User.find(cookies[:user_id])
      cookies[:roles] = Role.find(roles.role_id)
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
end
