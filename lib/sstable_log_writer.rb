class LogWriter
	def write(file_name, memtable)
		File.open("#{file_name}", "w") do |file|
			memtable.each{ |k,v| file.write("#{k}:#{v}\n") }
		end
	end
end
