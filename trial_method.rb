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
# [{"Patriots" => 3, 0},
#  {"Broncos" => 1, 2},
#  {"Steelers" => 0, 1},
#  {"Colts" => 0, 2}]
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
#################

stats = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]

teams = []
stats.each do |row|
  teams << row[:home_team]
  teams << row[:away_team]
end
  teams.uniq!

#teams = [Patriots, Broncos, Colts, Steelers]

##################CALCULATE TEAM WINS###############
########## HOW TO DO IT FOR ALL TEAMS?? ############
team_wins = []
  stats.each do |row|
    if row[:home_team] == "Patriots" && row[:home_score] > row[:away_score]
      team_wins << 1
    elsif row[:away_team] == "Patriots" && row[:away_score] > row[:home_score]
      team_wins << 1
    else
      team_wins << 0
    end
  end

  team_wins = team_wins.inject(:+)

##################CALCULATE TEAM LOSSES#############
########## HOW TO DO IT FOR ALL TEAMS?? ############
team_losses = []
  stats.each do |row|
    if row[:home_team] == params[:home_team] && row[:home_score] < row[:away_score]
      team_wins << 1
    elsif row[:away_team] == params[:home_team] && row[:away_score] < row[:home_score]
      team_losses << 1
    else
      team_losses << 0
    end
  end

  team_losses = team_losses.inject(:+)

####COMBINE THE WINS & LOSSES WITH THE TEAMS
team_records = {}
teams.each{|x| team_records[x] = team_wins, team_losses}

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
