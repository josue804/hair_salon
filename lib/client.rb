class Client
    attr_reader(:id, :stylist_id, :name, :hairtype, :rating)

    define_method(:initialize) do |attributes|
        @id = attributes[:id]
        @stylist_id = attributes[:stylist_id]
        @name = attributes[:name]
        @hairtype = attributes[:hairtype]
        @rating = attributes[:rating]
    end

    define_singleton_method(:all) do
        returned_clients = DB.exec("SELECT * FROM clients;")
        clients = []
        returned_clients.each do |client|
            id = client['id'].to_i
            stylist_id = client['stylist_id'].to_i
            name = client['name']
            hairtype = client['hairtype']
            rating = client['rating'].to_i
            clients.push(Client.new({:id => id, :stylist_id => stylist_id, :name => name, :hairtype => hairtype, :rating => rating}))
        end
        clients
    end

    define_method(:==) do |other|
        name == other.name && name == other.name && rating == other.rating && stylist_id == other.stylist_id && hairtype == other.hairtype
    end

    define_method(:save) do
        result = DB.exec("INSERT INTO clients (stylist_id, name, hairtype, rating) VALUES ('#{@stylist_id}', '#{@name}', '#{@hairtype}', #{@rating}) RETURNING id;")
        @id = result.first.fetch('id').to_i()
    end

    define_method(:update) do |attributes|
        @stylist_id = attributes[:stylist_id].to_i
        @name = attributes[:name]
        @hairtype = attributes[:hairtype]
        @rating = attributes[:rating]
        DB.exec("UPDATE clients SET stylist_id = '#{@stylist_id}', name = '#{@name}', hairtype = '#{@hairtype}', rating = #{@rating} WHERE id = #{@id};")
    end

    define_method(:delete) do
        DB.exec("DELETE FROM clients WHERE id = #{@id}")
    end

    define_singleton_method(:find) do |find_id|
        returned_client = DB.exec("SELECT * FROM clients WHERE id = #{find_id}")
        clients = []
        returned_client.each do |client|
            id = client['id']
            stylist_id = client['stylist_id'].to_i
            name = client['name']
            hairtype = client['hairtype']
            rating = client['rating'].to_i
            clients.push(Client.new({:id => id, :stylist_id => stylist_id, :name => name, :hairtype => hairtype, :rating => rating}))
        end
        clients.first()
    end
end
