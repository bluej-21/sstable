class LogMerger

	def merge(*file_names)
		file_to_line = Hash.new
		file_names.each {|file_name|
			file = File.open(file_name, "r")
			line_to_file[file] = file.readline
		}

		
		while !file_to_line.empty? do
			min_line, file = line_to_file.min_by{|key,value| value}
			if file.eof?
				line_to_file.delete(file)
			else
				line_to_file[file] = file.readline
			end
		end 
	end


end
