require 'pp'
require 'pry'

def game_hash
  { 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    },
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    }
  }
end
        

def num_points_scored(players_name)#want to iterate and #get to players
  game_hash.each do |place, team| #need variable for key #and value. when check values... place is the place #and team is each team's data.
    team.each do |attribute, data| #attribute returns team #name and data returns it's value. returns each key #value pair. #prying after every line of code is a good practice.
      if attribute == :players #will keep iterating until #stops at players attribute.
        data.each do |player|
        if player[:player_name] == players_name
          return player[:points]
        end
        end
      end
    end
  end
end 

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
        if player[:player_name] == players_name
          return player[:shoe] #just return shoe instead #of points because it is still in the same #subset of data. 
        end
        end
      end
    end
  end
end 

def team_colors(team_name)
  game_hash.each do |place, team| 
    if team[:team_name] == team_name #check to make sure #we are returning colors for specific team being #passed in. if it matches, return team's color 
      return team[:colors] 
    end
  end 
end 

def team_names #not using each because we are returning a new #array.
game_hash.map do |place, team|
  team[:team_name] #this will create a new array of the #team names. map is preferred over each when returning #a new array. 
  end
end   

def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data| #then we want to #iterate over the team data and deal with their #attribute and their data.
        if attributes == :players #also need to get into the players so use another if statement.
          data.each do |player|
          nums.push(player[:number])
          end
        end
      end
    end
  end
  return nums
end

def player_stats(players_name)
new_hash = {} #create new hash because want to return hash
game_hash.each do |place, team|
  team.each do |attributes, data| #iterate over team again so we can deal with each team's players. 
    if attributes == :players #check to make sure we are #dealing with player key-value
      data.each do |player|
        if player[:player_name] == players_name
          new_hash = player.delete_if do |k, v| #doesn't want player name included in the stats because the player name is not a stat, it is the player's name. delete_if belongs to hash class. will delete any key-value pair you tell it to in its block. so can have it delete any key that equals player_name and then it will return the new hash without the player name and it's value. (without player name and the name of the player)
            k == :player_name 
          end 
        end  
      end 
    end   
  end
 end 
 new_hash
end 

def big_shoe_rebounds 
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored 
  most_points = 0
  points_holder = ""
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points] 
        points_holder = player[:player_name] 
      end
    end
  end
  return points_holder
end
  
def winning_team 
  victorious_team = {}
  game_hash.values.each do |team|
    team_points = 0
    team[:players].each do |player|
      team_points += player[:points]
    end
    victorious_team[team[:team_name]] = team_points
  end
  victorious_team.key(victorious_team.values.max) 
end

def player_with_longest_name
  longest_name = []
  game_hash.values.each do |team| #.values just goes through the values of the key value pairs. 
    team[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
longest_name.max_by{|name| name.length}
end

def long_name_steals_a_ton?
  longest = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      longest[player[:player_name]] = player[:steals]
    end
  end

max_steals = longest.values.max
longest[longest.key(max_steals)] == max_steals

end
  
  
