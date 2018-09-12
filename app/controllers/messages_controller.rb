# Routes for Messages Flow
class MessagesController < ApplicationController
  # view all TO AND FROM users' messages
  get '/messages/messages' do
    erb :'/messages/messages'
  end

  # compose new message to a friend
  get '/messages/new_message' do
    erb :'messages/new_message'
  end

  post '/messages/send_message' do
    # binding.pry
    @message = Message.create(content: params[:message][:content], user_id: current_user.id, friend_id: params[:message][:friend_id])
    erb :"/messages/#{@message.id}"
  end

  # view a single message
  get '/messages/:id' do
    @message = Message.find(params[:id])
    erb :'messages/show_message'
  end

  # edit a message that belongs to user only
  get '/message/:id/edit' do
    @message = Message.find(params[:id])
    if @massage && current_user.messages.include?(@message)
      erb :'/messages/edit_message'
    else
      # TODO: Pop up warning for trying to edit other user's message.
      redirect "/messages/messages"
    end
  end

  patch '/messages/:id' do
    @message = Message.find(params[:id])
    @message.update(friend_id: params[:message][:friend_id], content: params[:message][:content])
    redirect "/messages/#{@message.id}"
  end

  # delete a message
  delete '/messages/:id' do
    @message = Message.find(params[:id])
    @message.delete
    redirect "/messages/messages"
  end
end
