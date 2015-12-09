class SessionsController < ApplicationController
	def new

	end

	def show
		reset_session
		redirect_to root_url, :notice => t("disconnected")
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			session[:user_id] = user.id
			session[:user_name] = user.name
			session[:roles] = Role.find(user.role_id)

			redirect_to root_url, :notice => t("connected")
		else
			render new
		end
	end

	def destroy
		reset_session
		redirect_to root_url, :notice => t("disconnected")
	end
end
