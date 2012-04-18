require 'test_helper'

module SexyBookmarks
  class MacrosHelperTest < ::ActionView::TestCase
    BOOKMARKS_DEFAULTS = { :title => 'foo', :permalink => 'http://mycoolsite.com/', :post_summary => 'bar' }

    test "controller respond to" do
      respond_to? :show_sexy_bookmarks
    end

    test "calling without needed keys raises" do
      assert_raise Exceptions::NotEnoughInfo do
        show_sexy_bookmarks({})
      end
    end

    test "calling without parameters raises" do
      assert_raise ArgumentError do
        show_sexy_bookmarks
      end
    end

    test "can call with minimum parameters" do
      assert bookmarks = Nokogiri::HTML( show_sexy_bookmarks BOOKMARKS_DEFAULTS ).root
      assert bookmarks.css('.shr-bookmarks').any? #shr-bookmarks div exists
      assert bookmarks.css('.shr-bookmarks ul li.shr-propeller').any?
    end

    test "can call with defined networks" do
      assert bookmarks = Nokogiri::HTML( show_sexy_bookmarks BOOKMARKS_DEFAULTS, [ :googlereader, :hackernews, :twitter ] )
      assert bookmarks.css('.shr-bookmarks').any?
    end
  end
end
