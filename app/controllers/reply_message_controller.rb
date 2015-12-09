class ReplyMessageController < ApplicationController
	def update
		@reply = ReplyMessage.find(params[:id])
		if @reply.update(reply_params)
			redirect_to forum_path, :notice => t("editm")
		else
			render 'edit'
		end
	end

	def edit
		@reply = ReplyMessage.find(params[:id])
	end
	def destroy
		@reply = ReplyMessage.find(params[:id])
		@reply.destroy
		redirect_to forum_path, :notice => t("msgde")
	end
	private
	def reply_params
		 params.require(:reply_message).permit(:message_reply)
	end
end
