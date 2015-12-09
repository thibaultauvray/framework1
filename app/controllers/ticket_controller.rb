class TicketController < ApplicationController
	def index
		@ticket = Ticket.where("user_id = ?", session[:user_id])
		rescue ActiveRecord::RecordNotFound
		@ticket = nil
	end

	def new
		@admin = User.where("role_id <> ?", 2)
		@ticket = Ticket.new
	end

	def create
		@ticket = Ticket.new(ticket_params)
		@ticket.etat = 0
		@ticket.user_id = session[:user_id]
		if @ticket.save
			redirect_to ticket_path, :notice => t("ticketcrea")
		else
			render 'new'
		end
	end

	def spool
		@spool = Ticket.where("admin = ?", session[:user_id])
	end

	def edit
		@ticket = Ticket.find(params[:id])
		@admin = User.where("role_id <> ?", 2)

	end
	def update
		@ticket = Ticket.find(params[:id])
		if @ticket.update(ticket_edit_params)
			redirect_to ticket_path, :notice => t('tickmod')
		else
			render 'edit'
		end
	end

	def createReply
		@reply = MessageTicket.new(reply_edit_params)
		@reply.user_id = session[:user_id]
		@reply.ticket_id = params[:id]
		if @reply.save
			redirect_to ticket_path, :notice => t("rpndu")
		else
			render 'reply'
		end
	end

	def reply
		@reply = MessageTicket.new
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	def open
		@open = Ticket.find(params[:id])
		@open.update(etat: '0')
		redirect_to :back
	end
	def close
		@open = Ticket.find(params[:id])
		@open.update(etat: '1')
		redirect_to :back

	end

	private

		def ticket_params
			params.require(:ticket).permit(:titre, :message, :admin)
		end
		def ticket_edit_params
			params.require(:ticket).permit(:admin, :etat)
		end
		def reply_edit_params
			params.require(:message_ticket).permit(:message_ticket)
		end
end
