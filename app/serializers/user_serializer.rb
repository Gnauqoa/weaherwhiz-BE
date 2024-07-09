# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notification_each_day, :location_id, :location_query, :phone, :birth, :email, :first_name, :last_name, :created_at, :updated_at
end