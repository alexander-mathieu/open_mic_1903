require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < MiniTest::Test

  def setup
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User.new("Sal")
    @ali = User.new("Ali")
  end

  def test_user_exists
    assert_instance_of User, @sal
  end

  def test_user_has_a_name
    assert_equal "Sal", @sal.name
  end

  def test_by_default_user_has_0_joke
    assert_empty @sal.jokes
  end

  def test_user_can_learn_jokes
    @sal.learn(@joke_1)
    assert_same @joke_1, @sal.jokes[0]
    assert_equal 1, @sal.jokes.count

    @sal.learn(@joke_2)
    assert_same @joke_2, @sal.jokes[1]
    assert_equal 2, @sal.jokes.count
  end

  def test_user_can_tell_another_user_a_joke
    @sal.tell(@ali, @joke_1)
    assert_equal 1, @ali.jokes.count
    assert_same @joke_1, @ali.jokes[0]

    @sal.tell(@ali, @joke_2)
    assert_equal 2, @ali.jokes.count
    assert_same @joke_2, @ali.jokes[1]
  end

  def test_user_can_recall_jokes_by_joke_id
    @sal.tell(@ali, @joke_1)
    assert_equal @joke_1, @ali.joke_by_id(1)

    @sal.tell(@ali, @joke_2)
    assert_equal @joke_2, @ali.joke_by_id(2)
  end

end
