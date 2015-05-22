class BaseController < ApplicationController
	before_action :create_or_login

	private 
	def create_or_login
		@user = User.find_or_create(params[:fromUser])
	end
end