class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  # GET /messages
  get '/messages' do
    #get all messages ordered by time created in asc
    messages = Message.all.order(created_at: :ASC)

    #return as JSON array
    messages.to_json
  end

  #POST /messages
  post '/messages' do
    #create new message from params attributes
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )

    #return newly created message as JSON
    message.to_json
  end

  #PATCH /messages/:id
  patch '/messages/:id' do
    #find message that matches the id
    message = Message.find(params[:id])

    #update the body of the message
    message.update(body: params[:body])

    #return updated message as JSON
    message.to_json
  end
  
  #DELETE /messages/:id
  delete '/messages/:id' do
    #find message that matches the id
    message = Message.find(params[:id])

    #delete the message
    message.destroy

    #return the deleted message as JSON
    message.to_json
  end
end
