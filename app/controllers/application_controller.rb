class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do

    erb :new

  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])    
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect '/recipes'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])

    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])

    redirect "/recipes/#{@recipe.id}"
  end


end
