defmodule Phoenixgo.Game do
  alias Phoenixgo.{Game, State}
  defstruct  history: [%State{}], index: 0

  def state(%Game{history: history, index: index}) do
    Enum.at(history, index)
  end

  def place(%Game{history: history, index: index} = game, position) do
    new_state =
      game
      |> Game.state()
      |> State.place(position)
    %{game | history: [new_state | Enum.slice(history, index..-1)], index: 0}
  end

  def jump(game, destination) do
    %{game | index: destination}
  end

  def history?(%Game{history: history}, index) when index >= 0 and length(history) > index do
    true
  end

  def history?(_game, _index), do: false
end
