class TopicController < ApplicationController
  def index
  	@topic = Topic.find(params[:id])
  	@message = Message.where("topic_id = ?", params[:id])
  end

  def create
  	@message = Message.new(topic_params)
  	@message.reply_id = params[:id_reply]
  	@message.topic_id = params[:id]
  	@message.user_id = session[:user_id]
  	if @message.save
  		redirect_to forum_path, :notice => t('msgsend')
  	else
  		render 'new'
  	end
  end

  def new
  	@message = Message.new
  end

  def new_reply
  	@reply = ReplyMessage.new
  end

  def editReply
    @reply = ReplyMessage.find(params[:id_reply])
  end

  def saveReply
    if @reply.update(reply_params)
      redirect_to forum_path, :notice => t("editm")
    else
      render 'editReply'
    end
  end

  def create_reply
  	@reply = ReplyMessage.new(reply_params)
  	@reply.message_id = params[:id_reply]
  	@reply.user_id = session[:user_id]
  	if @reply.save
  		redirect_to forum_path, :notice => t('msgsend')
  	else
  		render 'new_reply'
  	end
  end
  private
  def topic_params
  	params.require(:message).permit(:message)
  end
   def reply_params
  	params.require(:reply_message).permit(:message_reply, :message_id)
  end
end
