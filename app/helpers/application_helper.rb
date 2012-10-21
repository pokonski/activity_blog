module ApplicationHelper
  # For generating time tags calculated using jquery.timeago
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

  # Shortcut for outputing proper ownership of objects,
  # depending on who is looking
  def whose?(user, object)
    case object
      when Post
        owner = object.author
      when Comment
        owner = object.user
      else
        owner = nil
    end
    if user and owner
      if user.id == owner.id
        "his"
      else
        "#{owner.nickname}'s"
      end
    else
      ""
    end
  end

  # Check if object still exists in the database and display a link to it,
  # otherwise display a proper message about it.
  # This is used in activities that can refer to
  # objects which no longer exist, like removed posts.
  def link_to_trackable(object, object_type)
    if object
      link_to object_type.downcase, object
    else
      "a #{object_type.downcase} which does not exist anymore"
    end
  end
end
