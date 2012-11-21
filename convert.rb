#!/usr/bin/env ruby
# encoding: UTF-8

require 'nokogiri'
require 'yaml'

# Daten-Verzeichnis anlegen und leeren
`mkdir data`
`rm data/*.yaml`


Dir.glob("html/*.html").each do |file|
  html  = File.open(file, "r:iso-8859-1").read
  
  # Die einzige große Tabelle eine Tabelle je Gemeinde umwandeln
  html.gsub! "\r</td></tr>", "\n</td></tr></table><table>"
  
  # HTML parsen
  doc = Nokogiri::HTML(html)

  # Tabellen durchlaufen
  doc.css("table").each do |table|
    data  = {}
    
    # Zeilen durchlaufen
    table.css("tr").each do |row|
      key, value = row.css("td").map(&:text).map(&:strip)
      
      # Zahlen in Fixnum/Float umwandeln
      value = value.gsub(" ","").to_i  if key   =~ /^Einwohner/
      value = value.gsub(",",".").to_f if value =~ /^\d+,\d+$/
      
      data[key] = value if value
    end
    
    # Gemeinde speichern
    File.open("data/" << data['Amtl.Gemeindeschlüssel'] << '.yaml', "w"){|f| f.puts data.to_yaml }
  end
end

