class AccountsController < ApplicationController

  def does_user_exist(username)
    user = Account.find_by(:user_name => username)
    if user
      return true
    else
      return false
    end
  end

  def authorization_check
    if session[:current_user] == nil
      redirect '/not_authorized'
    else
      return true
    end
  end

  get '/' do
    authorization_check
    @user_name = session[:current_user].user_name
    erb :login
  end

  get '/not_authorized' do
    erb :not_authorized
  end

  # registration for user
  get '/register' do
    erb :register
  end

  post '/register' do
    p params
    # check is the user someone is trying to register exists or NOT
    if does_user_exist(params[:user_name]) == true
      return {:message => 'bam...our user does exist!!'}.to_json
      # return erb :view_name
    end

  user = Account.create(user_name: params[:user_name], user_email: params[:user_email], password: params[:password])
    p user
    # session is a hash!
    session[:current_user] = user

    erb :create
  end

  get '/login' do
    erb :login
  end

  get '/welcome_back' do
    erb :welcome_back
  end

  post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])
    if user
      session[:current_user] = user
      redirect '/account/welcome_back'
    else
      @message = 'Your password or account is incorrect'
      erb :login
      end
  end

end
# ## logout
# get '/logout' do
#   authorization_check
#   session[:current_user] = nil
#   redirect '/'
# end
