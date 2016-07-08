require 'spec_helper'
require 'fileutils'

describe Mvscreenshot do
  it 'has a version number' do
    expect(Mvscreenshot::VERSION).not_to be nil
  end
  
  describe Mvscreenshot::Watcher do
    
    it 'Moves screenshots' do
      
      {
        "screenshot_30160708t094439.png" => 'Screen Shot 3016-07-08 at 9.44.39 AM.png',
        "screenshot_30160709t174439.gif" => 'Screen Shot 3016-07-09 at 5.44.39 PM.gif'
      }.each do |out_file, in_file|
        
        FileUtils.touch in_file
      
        watcher = Mvscreenshot::Watcher.new(
          dir: Dir.pwd,
          dest: Dir.pwd,
          open: false,
        ).move(File.join(Dir.pwd, in_file))
      
        expect(File.exists?(out_file)).to be true
        
        FileUtils.rm out_file
        
      end
    end
  end
  
end
