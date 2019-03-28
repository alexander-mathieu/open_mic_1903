require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class OpenMicTest < MiniTest::Test

  def setup
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
  end

  def test_open_mic_exists
    assert_instance_of OpenMic, @open_mic
  end

  def test_open_mic_has_a_location
    assert_equal "Comedy Works", @open_mic.location
  end

  def test_open_mic_has_a_date
    assert_equal "11-20-18", @open_mic.date
  end

  def test_open_mic_by_default_has_no_performers
    assert_empty @open_mic.performers
  end

  def test_open_mic_can_welcome_performers
    @open_mic.welcome(@sal)
    assert_same @sal, @open_mic.performers[0]

    @open_mic.welcome(@ali)
    assert_same @ali, @open_mic.performers[1]
  end

  def test_open_mic_knows_if_jokes_has_been_repeated
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    refute @open_mic.repeated_jokes?

    @ali.tell(@sal, @joke_1)
    assert @open_mic.repeated_jokes?
  end

end
