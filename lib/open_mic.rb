class OpenMic
  attr_reader :location,
              :date,
              :performers

  def initialize(location:, date:)
    @location   = location
    @date       = date
    @performers = []
    @jokes_told = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    @performers.each do |performer|
      @jokes_told << performer.jokes
    end
    if @jokes_told.flatten.uniq.count == @jokes_told.flatten.count
      true
    else
      false
    end
  end

end
