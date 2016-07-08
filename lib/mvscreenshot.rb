require "mvscreenshot/version"
require "rb-fsevent"
require "fileutils"

module Mvscreenshot
  class Watcher
    
    def initialize(opts = {})
      apply_defaults({
        dir: "~/Desktop",
        dest: "~/Pictures/ScreenShots",
        open: "Preview",
        out_format: "screenshot_%Y%m%dt%H%M%S",
        parse_format: "Screen Shot %Y-%m-%d at %l.%M.%S %p"
      }.merge(opts))
    end
    
    def watch
      fsevent = FSEvent.new
      fsevent.watch File.expand_path(@dir) do |directories|
        glob = File.expand_path(File.join(@dir, 'Screen\ Shot*.*'))
        Dir[glob].each { |image| move image }
      end
      fsevent.run
    end
    
    def move(image)
      new_name = date_of(image).strftime(@out_format) + File.extname(image)
      new_path = File.expand_path(File.join(@dest, new_name))
      FileUtils.mkdir_p File.expand_path @dest
      FileUtils.mv(image, new_path)
      `open -a #{@open} '#{new_path}'` if @open
    end

    def date_of(file)
      DateTime.strptime(File.basename(file, File.extname(file)), @parse_format)
    end
    
    private
    
    def apply_defaults(hash)
      hash.each { |key, value| instance_variable_set "@#{key}", value }
    end
    
  end
end