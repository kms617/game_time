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


#######################################
#             Methods
#######################################

def read_csv(filename)
  stats = []
  CSV.foreach('filename', headers: true) do |row|
    stats << row.to_hash
  end
  stats
end




#######################################
#######################################
#              Routes
#######################################

require ‘sinatra’
# require ‘sinatra/reloader’
require ‘pry’

get ‘/leaderboard’ do
     @stats = read_csv(‘game_stats.csv’)
binding.pry
     erb :’/ALC/leaderboard’
end

