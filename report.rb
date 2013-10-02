#!/usr/bin/env ruby

require "rubygems"
require "ruport"
require "prawn"
require "pdf/reader"
require "pdf/writer"

class Document < Ruport::Controller
stage :body

def setup
self.data = Ruport::Data::Table.new(
  :column_names => %w(Make Model Year),
  :data => [
     %w(Nissan Skyline 1989),
     %w(Mercedes-Benz 500sl 2005),
     %w(Kia Sinatra 2008)
])
end
end

class MyFormatter < Ruport::Formatter::PDF
   renders :pdf, :for => Document

   def build_body
    draw_table(data, :width => 300)
  end
end
  Document.render(:pdf, :file => 'pdf_table.pdf')


