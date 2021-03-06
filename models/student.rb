
require_relative('../db/sql_runner.rb')

class Student

  attr_reader(:first_name, :last_name, :house_id, :age, :id)

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i()
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def self.map(data)
    return data.map{|student| Student.new(student)}
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values)
    @id = student.first()['id'].to_i()
  end

  def house()
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [@house_id]
    house_hash = SqlRunner.run(sql, values).first()
    return House.new(house_hash)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    return self.map(student)
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    self.map(students)
  end

end
