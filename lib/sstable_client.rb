require 'sstable_log_writer'
require 'objspace'

class Client  
  FILE_PREFIX = "ss_log"

  def initialize(size_limit)  
    @memtable = Hash.new
    @size_limit = size_limit
    @log_index = 0
    @file_num_limit = 10
    @log_writer = LogWriter.new()
    @log_merger = LogMerger.new()
  end  
  
  def put(key, value)
    @memtable[key] = value
    if @memtable.size == @size_limit
      file_name = "#{FILE_PREFIX}_#{@log_index}"
      @log_writer.write(file_name, @memtable.sort_by{|k,v| k})
      @log_index += 1
      @memtable.clear
    end

    if @log_index == 2
      file_names = []
      for i in 1..2
        file_names << "#{FILE_PREFIX}_#{@log_index-i}"
      end
      @log_merger.merge(*file_names)
    end

  end

  def get(key)
    @memtable[key]
  end

end  