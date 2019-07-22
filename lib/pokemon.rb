class Pokemon
  
  attr_accessor :name, :type, :id, :hp, :db
  
  @@all =[]
  
  def initialize(name, type, id, hp = nil, db)
    @name = name
    @type = type
    @id = id
    @hp = hp
    @db = db
    @@all << self 
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL
    
    db.execute(sql, [name, type])
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?;
    SQL
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id, pokemon[1], pokemon[2], pokemon[3], db )
  end

end
