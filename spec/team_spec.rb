require './lib/player'
require './lib/team'
require 'RSpec'

describe Team do

  it 'exists' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond).to be_instance_of(Team)
  end

  it 'can return the name of a team' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.name).to eq("AFC Richmond")
  end

  it 'can return the coach of a team' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.coach).to eq("Ted Lasso")
  end

  it 'can return the players of a team' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.players).to eq([roy, sam])
  end

  it 'can return the total salary of a team' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.total_salary).to eq(1_600_000)
  end

  it 'can return who the captain of a team is' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.captain).to eq("Roy Kent")
  end

  it 'can return positions filled on a team' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya",
                      position: "Right-back Defender",
                      salary: 600_000})

    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    expect(richmond.positions_filled).to eq(["Center Midfielder", "Right-back Defender"])
  end
  
end
