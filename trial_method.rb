################
# First I need to make an array of the teams and make them unique:
#  [Partiots, Broncos, Steelers, Colts]
# Then, I need to turn those teams into keys in an array of hashes.
# [{"Patriots"=>}
#  {"Broncos" =>}
#  {"Steelers" =>}
#  {"Colts" =>}]
#
# Next, I need to iterate through the game_stats hash and
# 1) assign wins to each team
# 2) assign losses to each team
# so that my final array looks like:
# [{"Patriots" => [3, 0]},
#  {"Broncos" => [1, 2]},
#  {"Steelers" => [0, 1]},
#  {"Colts" => [0, 2]}]
#
#Then, this array can be sorted to a table to display as the leaderboard
#################
#################
# BONUS #
# Clicking on the team name will navigate to a team page
# on the team page, there will be:
# the team record
# the games played, opponent and scores
#################
################
require 'pry'
require 'csv'

def read_csv(filename)
  stats = []
  CSV.foreach(filename, headers: true, header_converters: :symbol) do |eachrow|
    stats << eachrow
  end
  stats
end

stats = read_csv('public/game_stats.csv')

teams = []

stats.each do |row|
  teams << row[:home_team]
  teams << row[:away_team]
end
  teams.uniq!

team_records = {}
stats.each do |game|
  # figure out who the winner/losers are
  if game[:home_score] > game[:away_score]
    winner = game[:home_team]
    loser = game[:away_team]
  else
    winner = game[:away_team]
    loser = game[:home_team]
  end

  if !team_records.has_key?(winner)
    team_records[winner] = [1, 0]
  else
    team_records[winner][0] += 1
  end

  if !team_records.has_key?(loser)
    team_records[loser] = [0, 1]
  else
    team_records[loser][1] += 1
  end
end
binding.pry

# after processing the first game
# team_records = {"Patriots" => [1, 0], "Broncos" => [0, 1]}
#
# after processing second game
# team_records = {"Patriots" => [1, 0], "Broncos" => [1, 1], "Colts" => [0, 1]}

###SHOULD BE:
#team_records = {"Patriots" => [3, 0],
#                  "Broncos" => [1,1],
#                  "Colts" => [0,2],
#                 "Steelers" => [0,1]}

#######SORT THE RECORDS ACCORDING TO WINS & LOSSES
# standings = team_records.sort_by {|team, win| win}
##### DOESN'T WORK AT ALL#########

# standings = {"Patriots" => [3,0]
#               "Broncos" => [1,1]
#               "Steelers" => [0,1]
#               "Colts" => [0,2]}

# get 'team/:team' do
#   @stats = stats
#   @team = params[:team]
#   erb :team
# end
