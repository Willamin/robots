defmodule Robots.Bot do
  defstruct x: 0, y: 0, name: "Bot", speed: 1

  def new do
    %Robots.Bot{}
  end

  def new(name: name) do
    Map.put(new, :name, name)
  end

  def new(speed: speed) do
    Map.put(new, :speed, speed)
  end

  def y(bot) do
    bot.y
  end

  def x(bot) do
    bot.x
  end

  def speed(bot) do
    bot.speed
  end

  def greetings(bot) do
    "Hey, my name is #{bot.name}"
  end

end
