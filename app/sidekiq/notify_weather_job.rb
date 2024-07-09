  class NotifyWeatherJob
    include Sidekiq::Job

    def perform
      users = User.where(notification_each_day: true)
      users.each do |user|
        forecast = (V1::Weathers::Current.new(location_id: user.location_id, q: user.location_query).call.success)
        UserMailer.daily_weather_notification(user, forecast).deliver
      end
    end
  end