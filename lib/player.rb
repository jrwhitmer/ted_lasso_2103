class Player

  def initialize(information = {})
    @information = information
  end

  def name
    @information[:name]
  end

  def position
    @information[:position]
  end

  def salary
    @information[:salary]
  end

end
