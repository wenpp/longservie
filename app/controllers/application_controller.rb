class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :check_signature


  private
	def check_signature
	@calc = Digest::SHA1.hexdigest [Rails.configuration.token, params[:timestamp], params[:nonce]].sort.join
	unless @calc == params[:signature]
			render text: "Promission Deny", :status=>403
		end
	end
end
