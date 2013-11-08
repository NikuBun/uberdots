#!/usr/bin/env ruby
require 'rubygems'
require 'nmap/parser'




def convert(status="", print_status=status.empty?)
	# Protip: nmap -oX file.xmlls
	file_path = File.expand_path(ARGV[0])
	puts "Generating table for #{file_path}"

	parser = Nmap::Parser.parsefile(file_path)
	headers = [ "IP Address", "Hostnames"]
	headers << "Status" if print_status

	rows = []
	rows << headers
	parser.hosts(status).each do |host|
		data = [
			host.ipv4_addr, 
			host.hostnames.join(", ")
		]
		data << host.status if print_status
		rows << data 
	end

	row_size = rotate(rows).map{|x| x.max {|a,b| a.length <=> b.length}.length} 
	rows.map! do |row|
		row.inject([0,[]]) do |m, col|
			m[1] << col.ljust(row_size[m[0]])
			m[0] += 1
			m
		end[1]
	end
	puts "^ " + rows.shift.join(" ^ ") + " |"
	rows.each do |row|
		puts "^ " + row.join(" | ") + " |" 
	end
end

# THIS ROTATES ARRAYS, TRUST ME
def rotate(array)
	array.inject([]) { |c2, row| row.each_with_index { |col, index| c2[index] ||= [] and c2[index] << col}; c2 }
end

convert