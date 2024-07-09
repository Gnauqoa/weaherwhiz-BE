module V1
  module Weathers
    class Forecast < ServiceBase
      attr_reader :params

      def initialize(params)
        @params = params.merge(key: ENV["WEATHER_API_KEY"])
      end
  
      def call
        query = AutoComplete.new(q: params[:q]).call.success

        forecasts = WeatherForecast.where(
                              location_id: 2717932, 
                              date: Date.current
        ).to_a
        return Success(forecasts.first) if forecasts.length > 0

        params_arr = params.sort.to_h.map { |k, v| "#{k}=#{v}" }.sort
        params_str = params_arr.join('&')
        result = HTTParty.get(
          "#{ENV["WEATHER_API_HOST"]}/forecast.json?#{params_str}"
        )

        WeatherForecast.create!(
          location: result["location"],
          current: result["current"],
          forecast: result["forecast"],
          location_id: query["id"],
          date: Date.current
        )
        Success(result)
      end
    end
  end
end