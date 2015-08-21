require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('/lib/**/*.rb')
require('pry')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
    erb(:index)
end

###### Stylists Side #######
get('/stylists') do
    @stylists = Stylist.all()
    erb(:stylists)
end

post('/stylists') do
    name = params['name']
    specialty = params['specialty']
    stylist = Stylist.new({:id => nil, :name => name, :specialty => specialty, :rating => 0})
    stylist.save()
    @stylists = Stylist.all()
    erb(:stylists)
end

patch('/stylists') do
    name = params['name']
    specialty = params['specialty']
    rating = params['rating'].to_i
    id = params['id'].to_i
    stylist = Stylist.find(id)
    stylist.update({:name => name, :specialty => specialty, :rating => rating})
    @stylists = Stylist.all()
    erb(:stylists)
end

get('/stylists/:id') do
    id = params['id'].to_i
    @stylist = Stylist.find(id)
    erb(:stylist_edit)
end

get('/stylists/:id/delete') do
    id = params['id'].to_i
    stylist = Stylist.find(id)
    stylist.delete
    @stylists = Stylist.all()
    erb(:stylists)
end

get('/stylists/:id/clients') do
    id = params['id'].to_i
    @stylists = Stylist.find(id)
    erb(:stylist_clients)
end

post('/stylists/:id/clients') do
    id = params['id'].to_i
    @stylists = Stylist.find(id)
    name = params['name']
    hairtype = params['hairtype']
    rating = params['rating'].to_i
    client = Client.new({:id => nil, :stylist_id => @stylists.id(), :name => name, :hairtype => hairtype, :rating => rating})
    client.save()
    erb(:stylist_clients)
end
#########Client Side ############
get('/clients') do
    @clients = Client.all()
    erb(:clients)
end

patch('/clients') do
    client = Client.find(params['id'].to_i)
    name = params['name']
    hairtype = params['hairtype']
    stylist_id = params['stylist_id'].to_i
    rating = params['rating'].to_i
    client.update({:name => name, :hairtype => hairtype, :stylist_id => stylist_id, :rating => rating})
    @clients = Client.all()
    erb(:clients)
end

get('/clients/:id') do
    @client = Client.find(params['id'].to_i)
    @stylists = Stylist.all
    erb(:client_edit)
end

patch('/clients/:id') do
    @stylists = Stylist.all
    client = Client.find(params['id'].to_i)
    name = params['name']
    hairtype = params['hairtype']
    rating = params['rating'].to_i
    stylist_id = params['stylist_id'].to_i
    client.update({:name => name, :hairtype => hairtype, :rating => rating, :stylist_id => stylist_id})
    @clients = Client.all
    erb(:clients)
end
