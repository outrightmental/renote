require "thor"

class Renote < Thor
  desc "shake!", "Shakes the world"
  def shake!
    say "grrr"
  end
end

Renote.start