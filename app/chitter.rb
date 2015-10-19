require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'helpers/application_helper'
class Chitter < Sinatra::Base

  USER_PERMITTED_PARAMS = [:email, :name, :username, :password, :password_confirmation]

  enable :sessions
  set :session_secret, '8h2e9h%$@##&#@&$)^@#ADIZdfgwd'
  register Sinatra::Flash

  use Rack::MethodOverride

  get '/' do
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    user = current_user
    user.peeps.create(content: params[:new_peep])
    redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(user_permitted_params(params))
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to('/peeps')
  end


  ###########################################

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  def user_permitted_params(parameters)
    parameters.map{|key,value|[key.to_sym, value] if USER_PERMITTED_PARAMS.include?(key.to_sym)}.to_h
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
