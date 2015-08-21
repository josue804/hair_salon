class Stylist
    attr_reader(:id, :name, :specialty, :rating)

    define_method(:initialize) do |attributes|
        @id = attributes[:id]
        @name = attributes[:name]
        @specialty = attributes[:specialty]
        @rating = attributes[:rating]
    end

    define_singleton_method(:all) do
        returned_stylists = DB.exec("SELECT * FROM stylists;")
        stylists = []
        returned_stylists.each do |stylist|
            id = stylist['id'].to_i
            name = stylist['name']
            specialty = stylist['specialty']
            rating = stylist['rating'].to_i
            stylists.push(Stylist.new({:id => id, :name => name, :specialty => specialty, :rating => rating}))
        end
        stylists
    end

    define_method(:==) do |other|
        name == other.name && specialty == other.specialty && rating == other.rating
    end

    define_method(:save) do
        result = DB.exec("INSERT INTO stylists (name, specialty, rating) VALUES ('#{@name}', '#{@specialty}', #{@rating}) RETURNING id;")
        @id = result.first.fetch('id').to_i
    end

    define_method(:update) do |attributes|
        @name = attributes[:name]
        @specialty = attributes[:specialty]
        @rating = attributes[:rating]
        DB.exec("UPDATE stylists SET name = '#{@name}', specialty = '#{@specialty}', rating = #{@rating} WHERE id = #{@id};")
    end
end
