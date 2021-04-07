require './lib/player'
require 'RSpec'

describe Player do

  it 'exists' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})

    expect(roy).to be_instance_of(Player)
  end

  it 'can return name of player' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})

    expect(roy.name).to eq("Roy Kent")
  end

  it 'can return position of player' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})

    expect(roy.position).to eq("Center Midfielder")
  end

  it 'can return salary of player' do
    roy = Player.new({name: "Roy Kent",
                      position: "Center Midfielder",
                      salary: 1_000_000})

    expect(roy.salary).to eq(1_000_000)
  end 
end
