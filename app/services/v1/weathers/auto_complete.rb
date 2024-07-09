module V1
  module Weathers
    class AutoComplete < ServiceBase
      attr_reader :params

      def initialize(params)
        @params = params.merge(key: ENV["WEATHER_API_KEY"])
      end
  
      def call
        params_arr = params.sort.to_h.map { |k, v| "#{k}=#{v}" }.sort
        params_str = params_arr.join('&')
        Success(HTTParty.get(
          "#{ENV["WEATHER_API_HOST"]}/search.json?#{params_str}"
        )[0])
      end
    end
  end
end