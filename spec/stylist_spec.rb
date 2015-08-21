require('spec_helper')

describe(Stylist) do

    before() do
        @stylist = Stylist.new({:id => nil, :stylist_id => 1, :name => "Jeff"})
    end

    describe('#all') do
        it('returns nothing at first') do
            expect(Stylist.all()).to(eq([]))
        end
    end
end
