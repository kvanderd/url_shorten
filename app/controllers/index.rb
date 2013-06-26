require 'securerandom'

get '/' do
  @url = Url.all
  erb :index
end

post '/urls' do
  short = "http://" + SecureRandom.hex(3) 
  @url = Url.create(long: params[:long], short: short)
  @errors = @url.errors.full_messages
  if @url.errors.full_messages.length > 0
     @url = Url.all
    @errors
    erb :index
  else
  redirect "/"
  end
end

get '/:id' do
  @url = Url.find(params[:id])
  counter = @url.counter += 1
  @url.update_attributes(:counter => counter)
  redirect "#{@url.long}"
end


