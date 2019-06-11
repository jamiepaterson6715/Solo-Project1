require ("sinatra")
require ("sinatra/contrib/all")
require_relative ( "../models/tag.rb")
also_reload ( "../models/*" )

# lists
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

# creates new tag
get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

post '/tags' do
  @tags = Tag.new(params)
  @tags.save
redirect to '/tags'
end

# deletes a tag
post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to '/tags'
end

# edits a specific tag
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb(:"tags/edit")

  # @tags = Tag.all
  # erb(:"tags/edit")
end

# edits existing  tag in database - relates to above
post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags/#{params['id']}"
  # after creation of show page this will work - hopefully
end
