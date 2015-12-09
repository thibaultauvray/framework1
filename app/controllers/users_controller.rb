class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def create
	  @users = User.new(user_params)
    if @users.role_id == nil
      @users.role_id = 2
    end
    @roles = Role.all
		if @users.save
			redirect_to root_url, notice: t('canlog')
		else
			render 'new'
		end
	end
  def ma_send
      @object = params[:object]
      @subject = params[:subject]
      @user = User.where(["newletter = ?", "1"]).pluck(:email)  
      UserMailer.welcome_email(@object, @subject).deliver
      redirect_to root_url, notice: t('mail')
  end

  def newsletter
  end

  def set_fr
    cookies[:lang] = "fr"
    redirect_to :back
  end

  def set_en
    cookies[:lang] = "en"
    redirect_to :back
  end

  def edit
    if session[:roles]['update_droit'] == 0
      redirect_to root_url, notice: 'Oust !'
    end
    @roles = Role.all
  end
	def destroy
    @users.destroy
    redirect_to user_path
  end

  def new
    @users = User.new
    @roles = Role.all
  end

  def index
    if session[:roles].present? && session[:roles]['id'] == 2
      redirect_to root_url, notice: 'Oust !'
    end
    @users = User.all
    @roles = Role.all
  end

  def form_login
  	@users = User.new
  end

  def update
    respond_to do |format|
      @roles = Role.all
      @users.role_id = params[:role_id]
      if @users.update(user_params_edit)
        format.html { redirect_to action: 'index', notice: t('postup') }
        format.json { render :index, status: :ok, location: @users }
      else
        format.html { render :edit }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    if cookies[:user_id].present?
      roles = User.find(cookies[:user_id])
      cookies[:roles] = Role.find(roles.role_id)
    end

  end 
  def login
  	@users = User.new(user_params)
    @users = User.find_by_email(params[:email])
    if @users.password == params[:password]
      give_token
   else
      redirect_to 'form_login'
    end
  end


  def logout
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

	def user_params
		params.require(:user).permit(:name, :password, :email, :role_id, :newletter)
	end
  def user_params_edit
    params.require(:user).permit(:name, :email, :role_id, :newletter)
  end
end
