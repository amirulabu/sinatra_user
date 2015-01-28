enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/login' do
  if_success = User.authenticate(params[:username],params[:pwd])
  if if_success == true
    session['pss'] = "true"
    redirect to('/')

  elsif if_success == false
    session['pss'] = "false"
    redirect to('/')
  end

end

get '/logout' do
  session['pss'] = "false"

  redirect to('/')
end

get '/create' do

  erb :create
end

get '/secretpage' do
  if session['pss'] == "true"
    erb :secretpage
  elsif session['pss'] == "false"
    redirect to('/')
  end
end

post '/createaccount' do
  User.create(name: params[:username], password:params[:pwd])
  redirect to('/')
end

