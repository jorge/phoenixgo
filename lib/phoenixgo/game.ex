defmodule Phoenixgo.Game do
  alias Phoenixgo.{Game, State}
  defstruct  history: [%State{}], index: 0


  def legal?(game, position) do
    State.legal?(Game.state(game), position) and not repeated_state?(game, position)
  end

  def repeated_state?(game, position) do
    %Game{history: [%State{positions: tentative_positions} | history]} =
      Game.place(game, position)
    Enum.any?(history, fn %State{positions: positions} ->
      positions == tentative_positions
    end)
  end

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
