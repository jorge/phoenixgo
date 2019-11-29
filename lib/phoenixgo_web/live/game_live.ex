defmodule PhoenixgoWeb.GameLive do
  alias Phoenixgo.Game
  use Phoenix.LiveView
  require Logger

  def render(assigns) do
    Phoenixgo.GameView.render("index.html", assigns)
  end

  # sets up the assigns in the `socket` to set the initial state for the view
  def mount(_session, socket) do
    game = %Game{}
    {:ok, assign(socket, game: game, state: Game.state(game))}

  end

  def handle_event("place", index, %{assigns: assigns} = socket) do
    new_game = Game.place(assigns.game, String.to_integer(index))
    {:noreply, assign(socket, game: new_game, state: Game.state(new_game))}
  end

  def handle_event("jump", destination, %{assigns: %{game: game}} = socket) do
    new_game = Game.jump(game, String.to_integer(destination))
    {:noreply, assign(socket, game: new_game, state: Game.state(new_game))}
  end
end
