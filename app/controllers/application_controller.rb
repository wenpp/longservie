class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  # 被动返回消息
  #<xml>
  #  <ToUserName><![CDATA[toUser]]></ToUserName>
  #  <FromUserName><![CDATA[fromUser]]></FromUserName>
  #  <CreateTime>12345678</CreateTime>
  #  <MsgType><![CDATA[text]]></MsgType>
  #  <Content><![CDATA[你好]]></Content>
  #</xml>
  def respond_message(author, sender, msg)
    message = {
      ToUserName: sender,
      FromUserName: author,
      CreateTime: Time.now.to_i,
      MsgType: 'text',
      Content: msg
    }

    message.to_xml(root: "xml", children: "item", skip_instruct: true, skip_types: true)
  end
end
