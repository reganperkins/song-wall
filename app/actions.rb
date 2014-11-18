# Homepage (Root path)

enable :sessions

before do
  @current_page = 'default'
end

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  @current_page = 'login'
  erb :'index'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    username: params[:username]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'index'
  end
end

get '/login' do
  @current_page = 'login'
  erb :'login'
end

post '/login' do
  @user = User.where(email: params[:email], password: params[:password]).first
 
  if @user
    session[:user_id] = @user.id
    redirect '/songs'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  # session[:user_id] = nil
  redirect '/login'
end

get '/songs' do
  @tracks = Track.all
  erb :'songs/index'
end

post '/songs' do
  @track = Track.new(
    song_title: params[:song_title],
    url: params[:url],
    artist:  params[:artist],
    user_id: current_user.id
  )
  @track.save
  redirect '/songs'
end

get '/songs/new' do
  @current_page = 'songs'
  erb :'songs/new'
end

post '/rating' do
  @user_rating = Rating.create(
    user_id: session[:user_id],
    track_id: params[:track_id],
    rating:  params[:rating]
  )
  redirect '/songs'
end

get '/songs/:id' do
  @track = Track.find params[:id]
  erb :'songs/show'
end