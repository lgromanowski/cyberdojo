
module TimeInWordsHelper

  include ActionView::Helpers::TextHelper

  # Something akin to git log --relative-date option
  # Used on dashboard
  
  def time_in_words(seconds)
    years,days,hours,minutes,seconds = time_split(seconds)
    
    if years > 0
      pluralize(years, 'year')
    elsif days > 0
      pluralize(days, 'day')
    elsif hours > 0
      pluralize(hours, 'hour')
    elsif minutes > 0
      pluralize(minutes, 'minute')
    else  
      pluralize(seconds, 'second')
    end
  end
  
  def time_split(seconds)
    minutes,seconds = seconds.divmod(60)
    hours,minutes = minutes.divmod(60)
    days,hours = hours.divmod(24)
    years,days = days.divmod(365)
    
    [years,days,hours,minutes,seconds]
  end
  
  def time_unsplit(years, days, hours, minutes, seconds)
    seconds_per_min  = 60
    seconds_per_hour = 60*60
    seconds_per_day  = 24*60*60
    seconds_per_year = 365*24*60*60
  
    years * seconds_per_year + 
    days * seconds_per_day + 
    hours * seconds_per_hour + 
    minutes * seconds_per_min +
    seconds
  end
  
end