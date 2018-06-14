require('Minitest/autorun')
require_relative('../house.rb')
require('pry-byebug')

class HouseTest < MiniTest::Test

  def setup
    @house1 = House.new({
      'name' => 'Gryffindor',
      'logo' => '/gryffindor.png'
    })
  end

  def test_house_has_name()
    assert_equal('Gryffindor', @house1.name())
  end
end
