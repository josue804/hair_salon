require('spec_helper')

describe(Stylist) do

    before() do
        @stylist = Stylist.new({:id => nil, :name => "Jeff", :specialty => "Curly", :rating => 4})
    end

    describe('.all') do
        it('returns nothing at first') do
            expect(Stylist.all()).to(eq([]))
        end
    end

    describe('#==') do
        it('overrides the equality operator to only compare non-id attributes') do
            stylist_2 = Stylist.new({:id => nil, :stylist_id => 1, :name => "Jeff", :specialty => "Curly", :rating => 4})
            expect(@stylist).to(eq(stylist_2))
        end
    end

    describe('#save') do
        it('saves a stylist onto the stylists table') do
            @stylist.save()
            expect(Stylist.all()).to(eq([@stylist]))
        end
    end
end
