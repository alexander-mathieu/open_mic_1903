require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < MiniTest::Test

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_joke_exists
    assert_instance_of Joke, @joke
  end

  def test_joke_has_an_id
    assert_equal 1, @joke.id
  end

  def test_joke_has_a_setup
    assert_equal "Why did the strawberry cross the road?", @joke.setup
  end

  def test_joke_has_a_punchline
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end
end
