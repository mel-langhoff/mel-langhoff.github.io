class Player
    attr_reader :player_name, :token

    def initialize(player_name, token)
        @player_name = player_name
        @token = token
    end
end