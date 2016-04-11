require "mvscreenshot/version"
require "rb-fsevent"
require "fileutils"

module Mvscreenshot
  class Watcher
    
    def self.watch(dir = "~/Desktop", dest = "~/Pictures/ScreenShots")
      fsevent = FSEvent.new
      fsevent.watch File.expand_path(dir) do |directories|
        Dir[File.join(File.expand_path(dir), '**/Screen\ Shot*.png')].each do |image|
          new_name = "screen_shot-#{Time.now.to_i.to_s}.png"
          new_path = File.expand_path(File.join(dest, new_name))
          FileUtils.mv(image, new_path)
          `open -a Preview '#{new_path}'`
        end
      end
      fsevent.run
    end
    
  end
end