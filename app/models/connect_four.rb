class ConnectFour < ApplicationRecord
  def self.run
    otuput = `ruby app/lib/connect_four/connect4runner.rb`
    output.strip
  end
end