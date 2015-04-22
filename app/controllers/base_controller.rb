class BaseController < ActionController::Base
	before_action :check_signature

	private
  	def check_signature
    	@calc = Digest::SHA1.hexdigest [Settings.wechat.token, params[:timestamp], params[:nonce]].sort.join
    	unless @calc == params[:signature]
      	render text: "Promission Deny"
    end
  end 
end