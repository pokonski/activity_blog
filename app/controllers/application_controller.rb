class ApplicationController < ActionController::Base
  protect_from_forgery

  # Necessary include if you plan on access controller instance
  # in Procs passed to #tracked method in your models
  include PublicActivity::StoreController
  include ActionView::Helpers::TextHelper  
end
