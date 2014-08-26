#Acceptance Criteria:

#navigate to a page /leaderboard
#to view the summary of the league.
#Each team is displayed on this page.
#For each team, I can see how many wins and losses they have.
#[**OPTIONAL CHALLENGE**]Teams are sorted first by
#the number of wins they have (teams with more wins are ranked higher)
#and second by the number of losses they have (teams with more losses are ranked lower).
#####



#NON CORE
#Acceptance Criteria:

#I can navigate to /teams/Patriots to view the team's information. I can navigate to a similar URL for each team.
#I can see the team's total wins and losses.
#I can also see the results of each game they have played,
#including the name of the opposing team and the scores for each team.
########

require 'csv'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views_folder, File.dirname(__FILE__) + '/views'

#######################################
#             Methods
#######################################

def read_csv(filename)
   stats = []
   CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |eachrow|
     stats << eachrow
   end
   stats
 end

#######################################
#######################################
#              Routes
#######################################

stats = read_csv('public/game_stats.csv')

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

teams = []
stats.each do |row|
  teams << row[:home_team]
  teams << row[:away_team]
end
  teams.uniq!


## team_records looks like: {"Patriots"=>[3, 0], "Broncos"=>[1, 1], "Colts"=>[0, 2], "Steelers"=>[0, 1]}
binding.pry

sorted_teams = teams.sort_by do |team|
  -team_records[team][0]
  team_records[team][1]
end

 get '/leaderboard' do
   @team_records = team_records
   @sorted_teams = sorted_teams
   erb :leaderboard
 end

# get 'team/:team' do
#   @stats = stats
#   @team = params[:team]
#   erb :'team'
# end
