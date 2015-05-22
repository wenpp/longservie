class User < ActiveRecord::Base
  def self.find_or_create(openId)
    user = User.where(wechatopenid: openId).first || User.create_wechat_user(wechatopenid: openId)
  end


  def self.create_wechat_user(openId)
  	user = User.new
  	user.wechatopenid = openId
  	
  end
end
