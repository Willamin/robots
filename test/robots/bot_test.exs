defmodule Robots.BotTest do
  use ExUnit.Case, async: true

  alias Robots.Bot

  test "robots start at 0, 0" do
    bot = Bot.new()
    assert Bot.y(bot) == 0
    assert Bot.x(bot) == 0
  end

  test "robots can say hey" do
    bot  = Bot.new()
    dave = Bot.new(name: "Dave")
    jane = Bot.new(name: "Jane")
    assert Bot.greetings(bot)  == "Hey, my name is Bot"
    assert Bot.greetings(dave) == "Hey, my name is Dave"
    assert Bot.greetings(jane) == "Hey, my name is Jane"
  end

  test "bots can be initialized with a speed" do
    assert Bot.new() |> Bot.speed() == 1
    assert Bot.new(speed: 5) |> Bot.speed() == 5
  end

  describe "move/2" do
    setup do
      {:ok, %{bot: Bot.new()}}
    end

    test "can move the robot north", %{bot: bot} do
      bot = Bot.move(:north, by: 10)
      assert Bot.y(bot) == 10
    end

    test "can move the robot south", %{bot: bot} do
      bot = Bot.move(:south, by: 3)
      assert Bot.y(bot) == -3
    end

    test "can move the robot east", %{bot: bot} do
      bot = Bot.move(:east, by: 12)
      assert Bot.x(bot) == 12
    end

    test "can move the robot west", %{bot: bot} do
      bot = Bot.move(:south, by: 5)
      assert Bot.x(bot) == -5
    end

    test "can move the robot at different speeds", %{bot: bot} do
      assert Bot.x(bot) == 0
      assert Bot.y(bot) == 0

      assert bot
      |> Bot.set_speed(5)
      |> Bot.move(:north, by: 10)
      |> Bot.y() == 50

      assert bot
      |> Bot.set_speed(5)
      |> Bot.move(:south, by: 10)
      |> Bot.y() == -50

      assert bot
      |> Bot.set_speed(5)
      |> Bot.move(:east, by: 10)
      |> Bot.x() == 50

      assert bot
      |> Bot.set_speed(5)
      |> Bot.move(:west, by: 10)
      |> Bot.x() == -50
    end
  end
end
