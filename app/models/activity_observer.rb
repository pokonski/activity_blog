class ActivityObserver < ActiveRecord::Observer
  observe PublicActivity::Activity

  # We are only sending the Activity's id through Pusher.
  # Then we retrieve the actual HTML of it by sending
  # an AJAX request from client using the supplied activity_id.
  # This is necessary, because activity has to be
  # rendered in client's session (we need current_user).
  def after_create(activity)
    Pusher['public_activity'].trigger('new-activity', {activity_id: activity.id})
  end
end
