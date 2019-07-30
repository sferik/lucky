module Lucky::TimeHelpers
  def distance_of_time_in_words(from : Time, to : Time) : String
    minutes = (to - from).minutes
    seconds = (to - from).seconds
    hours = (to - from).hours
    days = (to - from).days

    return distance_in_days(days) if days != 0
    return distance_in_hours(hours) if hours != 0
    return distance_in_minutes(minutes) if minutes != 0
    distance_in_seconds(seconds)
  end

  def time_ago_in_words(from : Time) : String
    distance_of_time_in_words(from, Time.utc)
  end

  private def distance_in_days(distance : Int) : String
    case distance
    when 1...27   then distance == 1 ? "a day" : "#{distance} days"
    when 27...60  then "about a month"
    when 60...365 then "#{(distance / 30).round.to_i} months"
    when 365...730
      "about a year"
    when 730...1460
      "over #{(distance / 365).round.to_i} years"
    else
      "almost #{(distance / 365).round.to_i} years"
    end
  end

  private def distance_in_hours(distance : Int32) : String
    distance == 1 ? "an hour" : "#{distance} hours"
  end

  private def distance_in_minutes(distance : Int32) : String
    case distance
    when 1      then "a minute"
    when 2...45 then "#{distance} minutes"
    else
      "about an hour"
    end
  end

  private def distance_in_seconds(distance : Int32) : String
    distance == 1 ? "a second" : "#{distance} seconds"
  end
end
