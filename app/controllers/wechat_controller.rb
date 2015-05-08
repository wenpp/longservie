class WechatController < ApplicationController
	def token
		render text: params[:echostr]
	end
end