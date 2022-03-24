class Clock
  def initialize(hour: 0, minute: 0)
    @minutes = process_input(hour, minute)
  end

  def hour
    @minutes / 60
  end

  def minute
    @minutes % 60
  end

  def to_s
    "#{hour_to_s}:#{minute_to_s}"
  end

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  private

  def hour_to_s
    '%02d' % hour
  end

  def minute_to_s
    '%02d' % minute
  end

  def process_input(hour, minute)
    minutes = if minute.negative?
      -(minute.abs % 1440)
    else
      (minute % 1440)
    end

    result = minutes + ((hour % 24) * 60)

    if result.negative?
      1440 + result
    else
      result % 1440
    end
  end
end
