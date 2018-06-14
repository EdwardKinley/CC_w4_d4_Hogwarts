require('pry')
require_relative('../db/sql_runner.rb')

class House

  attr_reader :name, :logo, :id

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING *"
    values = [@name, @logo]
    house = SqlRunner.run(sql, values)
    @id = house.first()['id'].to_i()
  end

  def self.map(data)
    return data.map{|datum| House.new(datum)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    return self.map(house)
  end

  def self.find_all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    self.map(houses)
  end

end

# binding.pry
# nil
