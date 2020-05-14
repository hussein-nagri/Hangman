defmodule TextClient.Player do

  alias TextClient.{Prompter, Mover, State, Summary}

  def play(%State{tally: %{game_state: :won} }) do
    exit_with_message('You win!')
  end

  def play(%State{tally: %{game_state: :lost} }) do
    exit_with_message('You lost :(')
  end

  def play(game = %State{tally: %{ game_state: :good_guess }}) do
   continue_with_message(game, 'Good guess')
  end

  def play(game = %State{tally: %{ game_state: :bad_guess }}) do
   continue_with_message(game, 'Bad guess')
  end

  def play(game = %State{tally: %{ game_state: :already_used }}) do
   continue_with_message(game, 'Already used that word')
  end

  def play(game) do
    continue(game)
  end



  def continue_with_message(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end


  def exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end



end
