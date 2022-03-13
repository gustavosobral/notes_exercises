require_relative 'team'

# Learned:
# - How to initialize hashes
# - Spaceship operator
# - How to fix a string size
class Tournament
  attr_reader :teams, :input

  def initialize(input)
    @input = input
    @teams = Hash.new { |hash, key| hash[key] = Team.new(key) }
  end

  def self.tally(input)
    new(input).tally
  end

  def tally
    lines = input.split("\n")
    lines.each do |line|
      process_match(line)
    end
    generate_report
  end

  private

  def process_match(match_line)
    team1, team2, result = match_line.split(';')
    if result == 'win'
      teams[team1].win
      teams[team2].loss
    elsif result == 'loss'
      teams[team1].loss
      teams[team2].win
    else
      teams[team1].draw
      teams[team2].draw
    end
  end

  def generate_report
    (header + teams_report).join("\n") + "\n"
  end

  def header
    ["Team                           | MP |  W |  D |  L |  P"]
  end

  def teams_report
    teams.values.sort.reverse.map { |team| team.to_s }
  end
end
