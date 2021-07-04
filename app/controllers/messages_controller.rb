class MessagesController < ApplicationController
  before_action :setup_language

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(msg_params)

    if @message.save
      redirect_to "/#{lang}/messages/#{@message.key}"
    else
      render :new
    end
  end

  def show
    @message = Message.find_by!(key: params[:id])
    @url = request.original_url
    @qr = RQRCode::QRCode.new(@url)
    @hide_title = true
  end

  private

  def setup_language
    I18n.locale = lang
    cookies[:lang] = lang
  end

  def lang
    params[:locale] || cookies[:lang] || 'en'
  end

  def msg_params
    params.require(:message).permit(:content)
  end
end
