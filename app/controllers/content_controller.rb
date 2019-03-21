class ContentController < ApplicationController
	def send_push
		user_notification = UserNotification.create!(
			auth_key: params[:subscription][:keys][:auth],
			endpoint: params[:subscription][:endpoint],
		  p256dh_key: params[:subscription][:keys][:p256dh],
		)
		User.where(auth_key: params[:subscription][:keys][:auth]).destroy_all
		user = User.create!(
			auth_key: params[:subscription][:keys][:auth],
			user_notification_id: user_notification.id,
		)
		send_payload(user)
		render body: nil
	end

	private

	def send_payload(user)
		message = permitted_params[:message].presence

		if user.user_notification_id.present?
		  user_notification = UserNotification.find(user.user_notification_id)
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
		  puts "success"
		else
		  puts "failed"
		end
  end

	def permitted_params
		params.to_unsafe_hash.with_indifferent_access
	end
end
