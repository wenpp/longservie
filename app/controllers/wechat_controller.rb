class WechatController < ActionController::Base
	before_action :check_signature

	def token
		render text: params[:echostr]
	end

	private
  	def check_signature
    	@calc = Digest::SHA1.hexdigest ["Passw0rd", params[:timestamp], params[:nonce]].sort.join
    	unless @calc == params[:signature]
      	render text: "Promission Deny"
    end
  end 
end