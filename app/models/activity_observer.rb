class ActivityObserver < ActiveRecord::Observer
  observe PublicActivity::Activity

  def after_create(activity)
    Pusher['public_activity'].trigger('new-activity', {activity_id: activity.id})
  end
end
