defmodule Phoenixgo.Game do
  alias Phoenixgo.{Game, State}
  defstruct  history: [%State{}]

  def state(%Game{history: [state | _]}) do
    state
  end

  def place(%Game{history: [state | _] = history} = game, position) do
    %{game | history: [State.place(state, position) | history]}
  end

end
