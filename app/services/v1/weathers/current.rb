module V1
  module Weathers
    class Current < ServiceBase
      attr_reader :params

      def initialize(params)
        @params = params.merge(key: ENV["WEATHER_API_KEY"])
      end
  
      def call
        if params[:location_id].nil?
          location_id = AutoComplete.new(q: params[:q]).call.success["id"] 
        elsif
          location_id = params[:location_id]
        end

        current = Weather.where(
                              location_id:, 
                              date: Date.current
        ).to_a
        return Success(current.first) if current.length > 0

        params_arr = params.sort.to_h.map { |k, v| "#{k}=#{v}" }.sort
        params_str = params_arr.join('&')
        result = HTTParty.get(
          "#{ENV["WEATHER_API_HOST"]}/forecast.json?#{params_str}&days=#{1}"
        )

        result["forecast"]["forecastday"].each do |forecastday|
          Weather.create!(
            day: forecastday["day"],
            date_epoch: forecastday["date_epoch"],
            astro: forecastday["astro"],
            hour: forecastday["hour"],
            location_id:,
            date: Date.parse(forecastday["date"]).beginning_of_day
          ) if Weather.where(location_id:, date: Date.parse(forecastday["date"]).beginning_of_day).to_a.length == 0
        end
        Success(result)
      end
    end
  end
end