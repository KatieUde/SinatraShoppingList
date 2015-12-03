class ItemsController < ApplicationController

  #read (list)
  get '/' do
    @items = Item.all
    erb :read
  end

  #create
  get '/create' do
    erb :create
  end

  post '/create' do
    p params
    @items = Item.new
    @items.name = params[:name]
    @items.quantity = params[:quantity]
    @items.save
    # return view
    @message = 'You task was added!'
    erb :message
  end

  #update
  get '/update/:id' do
    p params
    @items = Item.find(params[:id])
    # return view
    erb :update
  end

  post '/update' do
    p params
    @items = Item.find(params[:id])
    @items.id = params[:id]
    @items.name = params[:name]
    @items.quantity = params[:quantity]
    @items.save
    # return view
    @message = 'You task was updated!'
    erb :message
  end

  #destroy
  get '/destroy/:id' do
    p params
    @items = Item.find(params[:id])
    # return view
    erb :destroy
  end
  post '/destroy' do

    @items = Item.find(params[:id])
    @items.destroy
    # return view
    @message = 'You task was destroyed! BUAHAHAHA'
    erb :message
  end


end
