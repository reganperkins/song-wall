# Homepage (Root path)

enable :sessions

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :'index'
end

post '/signup' do
  @user = User.create!(
    email: params[:email],
    password: params[:password],
    username: params[:username]
  )
  session[:user_id] = @user.id
  redirect '/songs'
end

get '/login' do
  erb :'login'
end

post '/login' do
  @user = User.where(username: params[:username], password: params[:password]).first
 
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
    artist:  params[:artist]
  )
  @track.save
  redirect '/songs'
end

get '/songs/new' do
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
