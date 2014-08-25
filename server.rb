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

# def read_csv(filename)
#   stats = []
#   CSV.foreach('filename', headers: true) do |row|
#     stats << row.to_hash
#   end
#   stats
# end




#######################################
#######################################
#              Routes
#######################################
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

# read_csv('/public/game_stats.csv')

get '/leaderboard' do
  @stats = stats
  erb :'/leaderboard'
end

