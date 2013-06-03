#!/usr/bin/env ruby

require 'rubygems'
require 'date'

#************************************
# current date and manipulate the days
#***************************************
dat=Date.today
onsale = dat + 2
presale = dat - 2
#*****************************************
# convert to mm/dd/ccyyy
#*****************************************
conv_date_onsale = onsale.strftime("%m/%d/%Y")
conv_date_presale = presale.strftime("%m/%d/%Y")

puts conv_date_onsale
puts conv_date_presale

#*****************************************
# Write to file
#******************************************
File.open('onsal_txt.txt', 'w') do |t1|
  t1.puts "Onsale date :#{conv_date_onsale}\nPresale date:#{conv_date_presale}\n"
end





