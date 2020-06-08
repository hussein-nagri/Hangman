defmodule MyAppWeb.HangmanController do
  use MyAppWeb, :controller

  def new_game(conn, _params) do
    render(conn, "new_game.html")
  end
end
