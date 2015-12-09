class MessageController < ApplicationController
	def update
		@reply = Message.find(params[:id])
		if @reply.update(reply_params)
			redirect_to forum_path, :notice => t("editm")
		else
			render 'edit'
		end
	end

	def edit
		@reply = Message.find(params[:id])
	end
	def destroy
		@reply = Message.find(params[:id])
		@reply.destroy
		redirect_to forum_path, :notice => t("msgde")
	end
	private
	def reply_params
		 params.require(:message).permit(:message)
	end
end
