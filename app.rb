require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('/lib/**/*.rb')

# DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
    erb(:index)
end

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

get('/clients') do
    @client = Client.all()
    erb(:clients)
end
