class Post < ActiveRecord::Base
  attr_accessible :body, :title
  acts_as_commentable

  belongs_to :author, :class_name => "User"

  include PublicActivity::Model

  tracked :owner => proc {|controller, model| controller.current_user}, # set owner to current_user by default (check app/controllers/application_controller.rb)
          :params => {
            :summary => proc {|controller, model| controller.truncate(model.body, length: 30)}   # by default save truncated summary of the post's body
          }
end
