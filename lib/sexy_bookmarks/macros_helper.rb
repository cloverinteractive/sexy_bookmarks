module SexyBookmarks
  FIXTURES = YAML.load_file( File.join File.dirname( __FILE__ ), 'fixtures', 'socials.yml' )
  ADDITIONAL_KEYS = {
    :site_name      => /SITE_NAME/,
    :twitt_cat      => /TWITT_CAT/,
    :default_tags   => /DEFAULT_TAGS/,
    :yahooteaser    => /YAHOOTEASER/,
    :yahoocategory  => /YAHOOCATEGORY/,
    :yahoomediatype => /YAHOOMEDIATYPE/,
    :image          => /IMAGE/,
  }

  module MacrosHelper
    def available_social_networks
      @available_social_networks ||= ::HashWithIndifferentAccess.new( FIXTURES )
    end

    def show_sexy_bookmarks( content, socials = nil, per_row = 8 )
      content_keys = content.keys
      raise SexyBookmarks::Exceptions::NotEnoughInfo unless content_keys.include?(:title) && content_keys.include?(:permalink) && content_keys.include?(:post_summary)

      socials = socials.present? ? socials.map(&:to_s) : available_social_networks.keys
      content[:escaped_permalink] = CGI.escape content[:permalink]

      list_items = socials.map do |social|
        link_url    = available_social_networks[social][:image_url] unless content[:image].blank?
        link_url  ||= available_social_networks[social][:url]

        link_url.gsub! /SHORT_TITLE|TITLE/,        content[:title]
        link_url.gsub! /ESCAPED_PERMALINK/,        content[:escaped_permalink]
        link_url.gsub! /FETCH_URL|PERMALINK/,      content[:permalink]
        link_url.gsub! /POST_SUMMARY|SEXY_TEASER/, content[:post_summary]

        content.except( :title, :escaped_permalink, :permalink, :post_summary ).keys { |additional_key, expr| link_url.gsub! expr, additional_key }

        link_options  = {
          :href   => link_url,
          :rel    => :nofollow,
          :title  => available_social_networks[social][:message],
          :class  => :external
        }

        link  = content_tag( 'a', available_social_networks[social]['message'], link_options )
        content_tag( 'li', link, :class => 'shr-' + social )
      end.join('')

      unordered_list = content_tag( 'ul', list_items.html_safe, :class => 'socials' )
      content_tag( 'div', unordered_list.html_safe, { :class => 'shr-bookmarks shr-bookmarks-expand shr-bookmarks-center shr-bookmarks-bg-caring', :id => 'sexybookmarks' } ) + reveal_social_list( socials.count, per_row )
    end

    def reveal_social_list(total, per_row)
      rows = ( total / Float(per_row ) % 2 == 0 ) ? total / per_row : ( total / per_row ) + 1
      javascript = %{
        $(function() {
          $(".socials").hover(function(){
            $("#sexybookmarks").delay(500).animate({ height: "#{ rows * 32 }px" }, 750);
            },
            function(){
              $("#sexybookmarks").animate({ height: "32px"}, 750);
            });
        });
      }

      content_tag('script', javascript.html_safe, :type => 'text/javascript')
    end
  end
end
