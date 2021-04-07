require './lib/player'

class Team

  attr_reader :name,
              :coach,
              :players

  def initialize(name, coach, players = [])
    @name = name
    @coach = coach
    @players = players
  end

  def total_salary
    salaries = @players.map do |player|
      player.salary
    end
    salaries.sum
  end

  def captain
    players_in_ascending_order_by_salary = @players.sort_by do |player|
      player.salary
    end

    players_in_descending_order_by_salary = players_in_ascending_order_by_salary.reverse

    captain = players_in_descending_order_by_salary.first

    captain.name
  end

  def positions_filled
    positions_filled = @players.map do |player|
      player.position
    end 
  end

end
