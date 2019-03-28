class OpenMic
  attr_reader :location,
              :date,
              :performers

  def initialize(location:, date:)
    @location   = location
    @date       = date
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    jokes_told = @performers.flat_map do |performer|
      performer.jokes
    end
    jokes_told.uniq.count != jokes_told.count
  end

end
