require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags( name ) VALUES ( $1 ) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    tag = Tag.new(result)
    return tag
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tag_data = SqlRunner.run(sql)
    tags = map_items(tag_data)
    return tags
  end

  def delete()
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(tag_data)
    return tag_data.map { |tag| Tag.new(tag) }
  end

end
