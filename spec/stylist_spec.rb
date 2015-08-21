require('spec_helper')

describe(Stylist) do

    before() do
        @stylist = Stylist.new({:id => nil, :name => "Jeff", :specialty => "Wavy", :rating => 4})
    end

    describe('.all') do
        it('returns nothing at first') do
            expect(Stylist.all()).to(eq([]))
        end
    end

    describe('#==') do
        it('overrides the equality operator to only compare non-id attributes') do
            stylist_2 = Stylist.new({:id => nil, :stylist_id => 1, :name => "Jeff", :specialty => "Wavy", :rating => 4})
            expect(@stylist).to(eq(stylist_2))
        end
    end

    describe('#save') do
        it('saves a stylist onto the stylists table') do
            @stylist.save()
            expect(Stylist.all()).to(eq([@stylist]))
        end
    end

    describe('#update') do
        it('updates a stylist in the database') do
            @stylist.save()
            @stylist.update({:name => "Courtney", :specialty => "Curly", :rating => 9})
            expect(@stylist.name()).to(eq("Courtney"))
            expect(@stylist.specialty()).to(eq("Curly"))
            expect(@stylist.rating()).to(eq(9))
        end
    end

    describe('#delete') do
        it('deletes a stylist in the database') do
            @stylist.save()
            @stylist.delete()
            expect(Stylist.all()).to(eq([]))
        end
    end

    describe('.find') do
        it('finds a stylist based on their id') do
            @stylist.save()
            expect(Stylist.find(@stylist.id())).to(eq(@stylist))
        end
    end
end
