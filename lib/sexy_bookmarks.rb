require 'sexy_bookmarks_macros_helper'

module SexyBookmarks
  def self.included(base)
    base.extend(ClassMethods)
  end

  def self.initialize
    return if @intialized

    SexyBookmarks.install
    @intialized = true
  end

  def self.install
    require 'fileutils'
    original_stylesheets  = File.join(File.dirname(__FILE__), 'sexybookmarks', 'assets', 'stylesheets', 'sexybookmarks' )
    original_images       = File.join(File.dirname(__FILE__), 'sexybookmarks', 'assets', 'images', 'sexybookmarks' )
    root = FileUtils.pwd # Using this as a substitute for Rails.root since that's not available, apparently
    destination           = File.join(root, 'app', 'assets')

    stylesheet_dest       = File.join(destination, 'stylesheets', 'sexybookmarks')
    stylesheet            = File.join(stylesheet_dest, 'style.css')

    images_dest           = File.join(root, 'public', 'images', 'sexybookmarks')

    unless File.exists?( stylesheet ) && FileUtils.identical?( File.join( original_stylesheets, 'style.css' ), stylesheet )
      if !File.exists?( stylesheet )
        begin
          puts "Creating directory #{stylesheet_dest}..."
          FileUtils.mkdir_p stylesheet_dest
          puts "Copying SexyBookmarks CSS to #{stylesheet_dest}..."
          FileUtils.cp_r "#{original_stylesheets}/.", stylesheet_dest
          puts "Successfully copied SexyBookmarks css."
        rescue
          puts "ERROR: Problem installing SexyBookmarks. Please manually copy "
          puts stylesheet
          puts "to"
          puts stylesheet_dest
        end
      end
    end

    unless File.exists?(images_dest)
      begin
        puts "Creating directory #{images_dest}..."
        FileUtils.mkdir_p images_dest
        puts "Copying SexyBookmarks images to #{images_dest}"
        FileUtils.cp_r "#{original_images}/.", images_dest
        puts "Successfully copied SexyBookmarks images"
      rescue
        puts "ERROR: Problem installing SexyBookmarks. Please manually copy the images in"
        puts original_images
        puts "to"
        puts images_dest
      end
    end
  end

  module ClassMethods
    def uses_sexy_bookmarks(options = {})
      proc = Proc.new do |current_class|
        current_class.instance_variable_set(:@uses_sexy_bookmarks, true)
      end

      before_filter(proc, options)
    end
  end

  self.initialize

end

class ActionController::Base
  include SexyBookmarks
  self.helper SexyBookmarksMacrosHelper
end
