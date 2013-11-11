

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
  database: 'p2pc-1_development' )
# create
########################################
get '/' do
  # Look in app/views/index.erb
  @notes = Note.all.sort
  erb :all
end

post '/' do
  p params
  # user = User.create(username: params[:username], email: params[:emal])
  @note = Note.create(notetext: params[:notetext])
  redirect '/notes'
end

# read
########################################
get '/notes' do
  p Note.all
  @notes = Note.all.sort
  erb :all
end

# update
########################################
get '/update/:id' do
  @note = Note.find(params[:id])
  erb :update
end

post '/update/:id' do
  p params
  @note = Note.find(params[:id])
  @note.update_attributes(notetext: params[:notetext])
  redirect '/notes'
end

# delete
########################################
post '/delete/sure/:id' do
  @note = Note.find(params[:id])
  erb :delete
end

post '/delete/:id' do
  Note.find(params[:id]).destroy
  redirect '/notes'
end