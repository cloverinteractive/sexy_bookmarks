require 'sexy_bookmarks/version'
require 'sexy_bookmarks/engine'
require 'sexy_bookmarks/exceptions'
require 'sexy_bookmarks/macros_helper'

module SexyBookmarks
  def self.included(base)
    base.extend(ClassMethods)
  end
end

class ActionController::Base
  self.helper SexyBookmarks::MacrosHelper
end
