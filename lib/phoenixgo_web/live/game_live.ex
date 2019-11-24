defmodule PhoenixgoWeb.GameLive do
  alias Phoenixgo.State
  use Phoenix.LiveView
  require Logger

  def render(assigns) do
    Phoenixgo.GameView.render("index.html", assigns)
  end

  # sets up the assigns in the `socket` to set the initial state for the view
  def mount(_session, socket) do
    {:ok, assign(socket, state: %State{})}
  end

  def handle_event("place", index, %{assigns: assigns} = socket) do
    new_state = State.place(assigns.state, String.to_integer(index))
    {:noreply, assign(socket, state: new_state)}
  end
end
