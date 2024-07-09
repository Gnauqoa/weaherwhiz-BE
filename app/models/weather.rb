class Weather
  include Mongoid::Document
  include Mongoid::Timestamps

  field :day, type: Object
  field :date_epoch, type: String
  field :astro, type: Object
  field :hour, type: Array 
  field :date, type: Date
  field :location_id, type: String
end
