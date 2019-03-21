# frozen_string_literal: true

class ContentController < ApplicationController
	def index
		@users = User.all
	end

	def send_push
		mutable_params = permitted_params

		user = User.find_by(email: mutable_params[:user_email])
		message = mutable_params[:message].presence
		# User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all

		raise 'please run rails db:seed' if user.blank?

		user_notification = user.user_notifications.find_or_create_by!(
			auth_key: mutable_params[:subscription][:keys][:auth],
			endpoint: mutable_params[:subscription][:endpoint],
			p256dh_key: mutable_params[:subscription][:keys][:p256dh],
		)

		send_payload(user_notification, message)
		render body: nil
	end

	private

	def send_payload(user_notification, message)
		if user_notification.blank? || message.blank?
			puts "[send payload] - failed"
			return false
		end

	  Webpush.payload_send({
			endpoint: user_notification.endpoint,
	    message: message,
			p256dh: user_notification.p256dh_key,
			auth: user_notification.auth_key,
			ttl: 24 * 60 * 60,
			vapid: {
				subject: 'mailto:admin@example.com',
				public_key: ENV['VAPID_PUBLIC'],
				private_key: ENV['VAPID_PRIVATE'],
			},
			api_key: ENV['GCM_API_KEY'],
	  })

		puts "[send payload] - success"
		true
  end

	def permitted_params
		params.to_unsafe_hash.with_indifferent_access
	end
end
