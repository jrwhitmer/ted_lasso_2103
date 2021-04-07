require './lib/player'
require './lib/team'

class League

  attr_reader :name,
              :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      #cannot use original captain method here on each team because of the interaction pattern wanting the whole player classes returned in the array this time. (Annoying on purpose? Just in case.)
      team.whole_captain_player_class
    end
  end

  def players_by_team
    players_names = @teams.map do |team|
      team.players.map do |player|
        player.name
      end
    end

    players_by_team = {@teams.first => players_names[0], @teams.last => players_names[1]}
  end

  def most_expensive_player
    captains = @teams.map do |team|
      team.whole_captain_player_class
    end

    ascending_captains = captains.sort_by do |captain|
      captain.salary
    end

    descending_captains = ascending_captains.reverse
    most_expensive_player = [descending_captains.first.name]

  end
#could not get this to work, ran out of time
  def players_by_salary_range
    over_0mil = @teams.map do |team|
      team.players.find_all do |player|
        player.salary < 1_000_000
      end
    end
    over_0mil.flatten!
    names_over_0mil = over_0mil.map do |player|
      player.name
    end
    over_1mil = @teams.map do |team|
      team.players.find_all do |player|
          1_000_000 >= player.salary < 2_000_000
      end
    end
    over_1mil.flatten!
    names_over_1mil = over_0mil.map do |player|
      player.name
    end
    over_2mil = @teams.map do |team|
      team.players.find_all do |player|
          2_000_000 >= player.salary < 3_000_000
      end
    end
    over_2mil.flatten!
    names_over_2mil = over_0mil.map do |player|
      player.name
    end
    over_3mil = @teams.map do |team|
      team.players.find_all do |player|
        3_000_000 >= player.salary < 4_000_000
      end
    end
    over_3mil.flatten!
    names_over_3mil = over_0mil.map do |player|
      player.name
    end
    over_4mil = @teams.map do |team|
      team.players.find_all do |player|
        4_000_000 >= player.salary < 5_000_000
      end
    end
    over_4mil.flatten!
    names_over_4mil = over_0mil.map do |player|
      player.name
    end
    over_5mil = @teams.map do |team|
      team.players.find_all do |player|
        player.salary >= 5_000_000
      end
    end
    over_5mil.flatten!
    names_over_5mil = over_0mil.map do |player|
      player.name
    end

    players_by_salary_range = {
      "Over 0M" => [names_over_0mil],
      "Over 1M" => [names_over_1mil],
      "Over 2M" => [names_over_2mil],
      "Over 3M" => [names_over_3mil],
      "Over 4M" => [names_over_4mil],
      "Over 5M" => [names_over_5mil],
    }
  end
end
