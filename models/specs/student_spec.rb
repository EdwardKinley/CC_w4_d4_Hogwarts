require('Minitest/autorun')
require_relative('../student.rb')
require('pry-byebug')

class StudentTest < MiniTest::Test

  def setup
    @student1 = Student.new({
      'first_name' => 'Harry',
      'last_name' => 'Potter',
      'house' => 'Gryffindor',
      'age' => '11'
    })
  end

  def test_student_has_first_name
    assert_equal('Harry', @student1.first_name())
  end

  def test_student_full_name
    assert_equal('Harry Potter', @student1.full_name())
  end



end
