get '/' do
	@notes = Note.all
  erb :index
end

get '/notes/new' do
	@note = Note.new
	erb :newnote
end

post '/notes/new' do
	# p params

	Note.create(title: params[:title], content: params[:content])
	redirect '/'
end

get '/notes/:id/edit' do
	@note = Note.find(params[:id])
	# return the Note with id == params[:id]
	erb :editnote  
end

put '/notes/:id/update' do
	note = Note.find(params[:id])
	note.update_attributes(title: params[:title], content: params[:content])
	redirect '/'
end

delete '/notes/:id/delete' do
	note=Note.find(params[:id])
	note.destroy
	redirect '/'
end