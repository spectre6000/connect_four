require "connect_four"

Dir[File.join(File.dirname(__FILE__), "../lib/connect_four.rb")]
  .each { |f| require f }
