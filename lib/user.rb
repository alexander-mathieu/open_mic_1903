class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name  = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def joke_by_id(joke_id)
    @jokes.find do |joke|
      joke.id == joke_id
    end
  end

end
