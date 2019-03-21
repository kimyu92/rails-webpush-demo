# frozen_string_literal: true

class UserNotification < ApplicationRecord
  belongs_to :user

  validates :auth_key, presence: true
  validates :endpoint, presence: true
  validates :p256dh_key, presence: true
  validates :user, presence: true
end
