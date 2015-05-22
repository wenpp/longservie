class WechatController < ApplicationController
	before_action :check_signature

	def verify
		render text: params[:echostr] #验证签名成功，返回echostr
	end

	def route
		if params[:xml] != nil
			msgType = params[:xml][:MsgType]
			case msgType

				when "event"
					if params[:xml][:Event] == "VIEW"
						case params[:xml][:EventKey]
							when "/home"
								redirect_to home_url_path({:fromUser=>params[:xml][:FromUserName]})
						end
					end
				when "text" #message
					byebug
					#redirect_to message_response_path({:fromUser => params[:xml][:FromUserName], :content => params[:xml][:Content]})
					#puts "I'm wechat text"
					render "echo", :formats => :xml
			end
			
		end
	end

	private
	def check_signature
		@calc = Digest::SHA1.hexdigest [Rails.configuration.token, params[:timestamp], params[:nonce]].sort.join
		unless @calc == params[:signature]
			render text: "Promission Deny", :status=>403
		end
	end
end