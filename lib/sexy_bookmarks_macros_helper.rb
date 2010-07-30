module SexyBookmarksMacrosHelper
  
  def available_social_networks
    if @available_socials.nil?
      socials             = File.new( File.join(File.dirname(__FILE__), 'fixtures', 'socials.yml') )
      @available_socials  = YAML::load socials
      socials.close
    end
    
    @available_socials
  end

  def show_sexy_bookmarks( content, socials = nil, per_row = 8 )
    socials = available_social_networks.keys if socials.nil?
    
    list_items = socials.collect do |social|

      link_url = available_social_networks[social.to_s]['url'].to_s.gsub( /SHORT_TITLE|TITLE/, content[:title].to_s )
      link_url = link_url.gsub( /FETCH_URL|PERMALINK/, content[:permalink].to_s )
      link_url = link_url.gsub( /POST_SUMMARY|SEXY_TEASER/, content[:post_summary].to_s ).gsub(/SITE_NAME/, content[:site_name].to_s )
      link_url = link_url.gsub( /TWITT_CAT/, content[:twitt_cat].to_s ).gsub( /DEFAULT_TAGS/, content[:default_tags].to_s )
      link_url = link_url.gsub( /YAHOOTEASER/, content[:yahooteaser].to_s ).gsub( /YAHOOCATEGORY/, content[:yahoocategory].to_s )
      link_url = link_url.gsub( /YAHOOMEDIATYPE/, content[:yahoomediatype].to_s )
      
      link_options  = { 
        :href   => link_url, 
        :rel    => :nofollow, 
        :title  => available_social_networks[social.to_s]['message'],
        :class  => :external
      }  
      link          = content_tag( 'a', available_social_networks[social.to_s]['message'], link_options )
      content_tag( 'li', link, :class => 'shr-' + social.to_s )
    end
    
    unordered_list = content_tag( 'ul', list_items, :class => 'socials' )
    content_tag( 'div', unordered_list, { :class => 'shr-bookmarks shr-bookmarks-expand shr-bookmarks-center shr-bookmarks-bg-shr', :id => 'sexybookmarks' } ) + reveal_social_list(socials.count, per_row)
  end
  
  def include_sexy_bookmarks_if_needed
    stylesheet_link_tag "sexybookmarks/style.css" if @uses_sexy_bookmarks
  end
  
  def reveal_social_list(total, per_row)    
    rows = ( total / Float(per_row ) % 2 == 0 ) ? total / per_row : ( total / per_row ) + 1
    javascript = %{
      $(document).ready(function() {
        $(".socials").hover(function(){ 
          $("#sexybookmarks").delay(500).animate({ height: "#{rows*32}px" }, 750); 
          },
          function(){ 
            $("#sexybookmarks").animate({ height: "32px"}, 750); 
          });
      });
    }
    
    content_tag('script', javascript, :type => 'text/javascript')
  end
end