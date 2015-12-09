class RolesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    if session[:roles]['superadmin'] == 0
        redirect_to root_url, :notice => 'Oust !'
    end
    @roles = Role.all
  end

  def new
    if session[:roles]['superadmin'] == 0
          redirect_to root_url, :notice => 'Oust !'
    end
    @roles = Role.new
  end

  def create
    if session[:roles]['superadmin'] == 0
          redirect_to root_url, :notice => 'Oust !'
    end
    @roles = Role.new(role_params)
    if @roles.save
      redirect_to roles_path, notice: t("rolecre")
    else
      render 'new'
    end
  end

  def edit
      if session[:roles]['superadmin'] == 0
          redirect_to root_url, :notice => 'Oust !'
    end
  end

  def update
     if session[:roles]['superadmin'] == 0
          redirect_to root_url, :notice => 'Oust !'
    end
    if @roles.update(role_params)
      redirect_to roles_path, notice: t("roleup")
    else
      render 'edit'
    end
  end

  def destroy
    @roles.destroy
    respond_to do |format|
      format.html { redirect_to roles_path, notice: t("rolede") }
      format.json { head :no_content }
    end
  end

  def show
     if session[:roles]['superadmin'] == 0
          redirect_to root_url, :notice => 'Oust !'
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @roles = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :create_droit, :update_droit, :delete_droit, :superadmin)
    end
end
