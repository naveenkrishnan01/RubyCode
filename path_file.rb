class PathFile
  def initialize
     @filename = "#{ENV['HOME']}/RubyCode/input1.txt"
  end

   def to_path
     @filename
  end
end
  pathfile = PathFile.new
  
 puts  File.open(pathfile).each_line.count
