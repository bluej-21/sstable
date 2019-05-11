lib = File.join(__dir__, 'lib')

task :default do
    sh "ruby -I #{lib} lib/main.rb"
end

task :console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

