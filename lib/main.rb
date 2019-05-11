require 'sstable_client'


client = Client.new(5)


for i in 0..20
	client.put("key_#{i%5}", "value_#{i}")
end