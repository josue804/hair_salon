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

    define_method(:delete) do
        DB.exec("DELETE FROM stylists WHERE id = #{@id}")
        DB.exec("DELETE FROM clients WHERE stylist_id = #{@id}")
    end

    define_singleton_method(:find) do |find_id|
        returned_stylist = DB.exec("SELECT * FROM stylists WHERE id = #{find_id};")
        stylists = []
        returned_stylist.each do |stylist|
            id = stylist['id'].to_i
            name = stylist['name']
            specialty = stylist['specialty']
            rating = stylist['rating'].to_i
            stylists.push(Stylist.new({:id => id, :name => name, :specialty => specialty, :rating => rating}))
        end
        stylists.first()
    end

    define_method(:clients) do
        returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id};")
        clients = []
        returned_clients.each do |client|
            id = client['id'].to_i
            name = client['name']
            hairtype = client['hairtype']
            rating = client['rating'].to_i
            clients.push(Client.new({:id => id, :name => name, :hairtype => hairtype, :rating => rating}))
        end
        clients
    end
end
