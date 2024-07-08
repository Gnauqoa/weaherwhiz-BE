# frozen_string_literal: true

class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :phone, :birth, :email, :first_name, :last_name, :created_at, :updated_at
end
