class UserMailer < ApplicationMailer
default to: Proc.new { User.where(["newletter = ?", "1"]).pluck(:email) }

def welcome_email(object, subject)
	@subject = subject
	mail(subject: object)
end
end
