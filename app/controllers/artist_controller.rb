class ArtistController < ApplicationController
    get "/" do
    erb :welcome
  end

  get "/artists" do
    @artists = Artist.all
    erb :index
  end

  get "/artists/new" do
    erb :new
  end

  post "/artists" do
    artist = Artist.create(params)
    redirect to ("/artists/#{artist.id}")
  end

  get "/artists/:id" do
    @artist = Artist.find(params[:id])
    erb :show
  end

  get "/artists/:id/edit" do
    @artist = Artist.find(params[:id])
    erb :edit
  end

  patch "/artists/:id" do 
    artist = Artist.find(params[:id])
    artist.update(name: params[:name], age: params[:age], bio:params[:bio])
    redirect to ("/artists/#{artist.id}") 
  end

  delete "/artists/:id" do
    artist = Artist.find(params[:id])
    artist.delete
    redirect to("/artists")
  end

end
