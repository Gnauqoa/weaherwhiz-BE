class WeatherForecast
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location, type: Object
  field :days, type: Integer
  field :current, type: Object
  field :forecast, type: Object
  field :location_id, type: String 
  field :date, type: Date
end
