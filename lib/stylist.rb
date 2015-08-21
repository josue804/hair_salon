class Stylist
    attr_reader(:id, :name, :specialty, :rating)

    define_method(:initialize) do |attributes|
        @id = attributes['id']
        @name = attributes['name']
        @specialty = attributes['specialty']
        @rating = attributes['rating']
    end

    define_singleton_method(:all) do
        returned_stylists = DB.exec("SELECT * FROM stylists;")
        stylists = []
        returned_stylists.each() do |stylist|
            @id = stylist['id'].to_i()
            @name = stylist['name']
            @specialty = stylist['specialty']
            @rating = stylist['rating'].to_i()
            stylists.push(Stylist.new({:id => @id, @name => name, @specialty => specialty, @rating => rating}))
        end
        stylists
    end
end
