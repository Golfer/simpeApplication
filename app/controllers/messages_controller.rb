class MessagesController < ApplicationController
  before_action :set_message, only: %i(show destroy update)
  before_action :set_messages, only: %i(index reply)
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge(user: current_user))
    respond_with({}) do |format|
      if @message.save
        UserNotificationMailer.sent_to_requester(@message).deliver
        UserNotificationMailer.send_request_to_support(@message).deliver
        format.html do
          redirect_to messages_path, notice: 'Request was created!'
        end
      else
        format.html { render :new }
      end
    end
  end

  def reply
    @message = Message.find(params['id'])
    @message.reply = params[:message][:reply] if params[:message]
    if params[:message]
      if @message.save
        UserNotificationMailer.reply_from_support(@message).deliver
        render action: :index
      end
    else
      render :reply
    end
  end

  def update
    if @message.update(message_params)
      render action: :show
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html do
        flash[:success] =
        redirect_to root_path, notice: 'Message successfully destroyed.'
      end
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:id, :title, :text, :reply)
    end

    def set_messages
      @messages ||= Message.all
    end
end
