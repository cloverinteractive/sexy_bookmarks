require 'test_helper'

class SexyBookmarksTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end

  test "sexy_bookmarks.css is found as an asset" do
    assert @app.assets['jquery.sexy_bookmarks.css']
    assert @app.assets['sexy_bookmarks.css']
  end
end
