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
## make an array of the teams
teams = []
stats.each do |row|
  teams << stats[:home_team].to_s
  teams << stats[:away_team].to_s
end

teams.uniq
puts teams

# def team_record(teams, wins, losses)
#   CSV.open('public/team_record.csv', ab) do |row|
#     row << ['Team', 'Wins', 'Losses']
#     row << [teams, wins, losses]
#   end
# end
