module SexyBookmarks
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def uses_sexy_bookmarks(options = {})
      proc = Proc.new do |current_class|
        current_class.instance_variable_set(:@uses_sexy_bookmarks, true)
      end
      
      before_filter(proc, options)
    end
  end
end