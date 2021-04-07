require './lib/league'
require './lib/team'
require './lib/player'
require 'RSpec'

describe League do

  it 'exists' do
    premier = League.new("Premier League")

    expect(premier).to be_instance_of(League)
  end

  it 'can return its name' do
    premier = League.new("Premier League")

    expect(premier.name).to eq("Premier League")
  end

  it 'has no teams by default' do
    premier = League.new("Premier League")

    expect(premier.teams).to eq([])
  end

  it 'can add teams' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt",
                      position: "Striker",
                      salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho",
                      position: "Midfielder",
                      salary: 5_200_000})

    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.teams).to eq([richmond, manchester])
  end

  it 'can return all captains in its teams' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt",
                      position: "Striker",
                      salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho",
                      position: "Midfielder",
                      salary: 5_200_000})

    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.captains).to eq([roy, fernandinho])
  end

  it 'can list players by team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt",
                      position: "Striker",
                      salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho",
                      position: "Midfielder",
                      salary: 5_200_000})

    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.players_by_team).to eq({richmond => ["Roy Kent", "Sam Obisanya"], manchester => ["Jamie Tartt", "Fernandinho"]})

  end

  it 'can return the most expensive player' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt",
                      position: "Striker",
                      salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho",
                      position: "Midfielder",
                      salary: 5_200_000})

    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq(["Fernandinho"])
  end

  xit 'can report players by salary range' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt",
                      position: "Striker",
                      salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho",
                      position: "Midfielder",
                      salary: 5_200_000})

    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.players_by_salary_range).to eq({
      "Over 0M" => ["Sam Obisanya"],
      "Over 1M" => ["Roy Kent", "Jaime Tartt"],
      "Over 2M" => [],
      "Over 3M" => [],
      "Over 4M" => [],
      "Over 5M" => ["Fernandinho"]
      })
    end
end
