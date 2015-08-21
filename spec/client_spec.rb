require('spec_helper')

describe(Client) do

    before() do
        @stylist = Stylist.new({:id => nil, :name => 'Courtney', :specialty => 'Straight', :rating => 9})
        @stylist.save()
        @client = Client.new({:id => nil, :stylist_id => @stylist.id(), :name => "Jessica", :rating => 9})
    end

    describe('.all') do
        it('returns nothing at first') do
            expect(Client.all()).to(eq([]))
        end
    end

    describe('#==') do
        it('overrides the equality operator to only compare non-id attributes') do
            client_2 = Client.new({:id => nil, :stylist_id => @stylist.id(), :name => 'Jessica', :rating => 9})
            expect(@client).to(eq(client_2))
        end
    end

    describe('#save') do
        it('saves a client onto the clients table') do
            @client.save()
            expect(Client.all()).to(eq([@client]))
        end
    end

    describe('#update') do
        it('updates a client in the database') do
            @client.save()
            @client.update({:stylist_id => 4, :name => "Josue", :rating => 9})
            expect(@client.stylist_id()).to(eq(4))
            expect(@client.name()).to(eq("Josue"))
            expect(@client.rating()).to(eq(9))
        end
    end

    describe('#delete') do
        it('deletes a client in the database') do
            @client.save()
            @client.delete()
            expect(Client.all()).to(eq([]))
        end
    end

    describe('.find') do
        it('finds a client based on their id') do
            @client.save()
            expect(Client.find(@client.id())).to(eq(@client))
        end
    end
end
