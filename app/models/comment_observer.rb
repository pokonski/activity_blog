class CommentObserver < ActiveRecord::Observer
  include ActionView::Helpers::TextHelper

  def after_create(comment)
    comment.commentable.create_activity key: "post.commented", params: {comment: truncate(comment.comment, length: 30)}
  end
end
