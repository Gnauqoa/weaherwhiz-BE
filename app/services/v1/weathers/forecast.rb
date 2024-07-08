module V1
  module Weathers
    class Forecast < ServiceBase
      attr_reader :params

      def initialize(params)
        @params = params.merge(key: ENV["WEATHER_API_KEY"])
      end
  
      def call
        params_arr = params.sort.to_h.map { |k, v| "#{k}=#{v}" }.sort
        params_str = params_arr.join('&')
        HTTParty.get(
          "#{ENV["WEATHER_API_HOST"]}/forecast.json?#{params_str}"
        )
      end
    end
  end
end