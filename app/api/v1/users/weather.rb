module V1
  module Users
    class Weather < Base
      namespace :weather do
        resources :forecast
          desc 'Get weather forecast', summary: "Get weather forecast"
          params do
            requires :q, type: String, desc: "Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name."
            optional :days, type: Integer, desc: ""
          end
          get do
            format_response(Weathers::Forecast.new(params).call)
          end
      end
    end
  end
end