
   def format_time
     format = ENV.fetch('TIME_FORMAT') { '%D %r %z' }
     Time.now.strftime(format)
   end

puts "The script started at" + " " +  format_time

