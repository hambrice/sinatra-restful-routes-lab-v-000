class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    erb :recipes
  end

  get '/new' do
    erb :new
  end

  post '/show' do
    @recipe = Recipe.create(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    erb :show
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    @user = User.find_by(id: params[:id])
    @user.destroy
    erb :delete
  end


end
