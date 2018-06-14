require_relative('../models/student.rb')

# Student.delete_all()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => 'Gryffindor',
  'age' => '11'
})

student2 = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house' => 'Slytherin',
  'age' => '11'
})

student3 = Student.new({
  'first_name' => 'Cho',
  'last_name' => 'Chang',
  'house' => 'Ravenclaw',
  'age' => '11'
})

student1.save()
student2.save()
student3.save()
