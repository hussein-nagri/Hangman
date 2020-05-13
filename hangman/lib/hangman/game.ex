defmodule Hangman.Game do

  defstruct(
  turns_left: 7,
  game_state: :initializing,
  letters: [],
  used: MapSet.new()
  )


def new_game(word) do
    %Hangman.Game{
      letters: word |> String.codepoints
      }
  end

  def new_game() do
  new_game(Dictionary.random_word)

  end

  def make_move(game = %{game_state: state}, _guess) when state in [:won, :lost] do
    game
  end

  def make_move(game, guess) do
    #validate if it is a lowercase ascii given:  isLower = String.downcase(guess) |> String.equivalent?(guess)
    accept_move(game, guess, MapSet.member?(game.used, guess) )
  end

  def tally(game) do
    %{
    game_state: game.game_state,
    turns_left: game.turns_left,
    letters:    game.letters |> reveal_guess(game.used),
    }
  end


  ###########################################################################################

  defp accept_move(game, guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  defp accept_move(game, guess, _already_gueessed) do
    Map.put(game, :used, MapSet.put(game.used, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, _score_guess = true) do
    new_game_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.used)
    |> maybe_won()
    Map.put(game, :game_state, new_game_state)
  end

  defp score_guess(game = %{turns_left: 1} , _not_score_guess) do
    Map.put(game, :game_state, :lost)
  end


  defp score_guess(game = %{turns_left: turns_left} , _not_score_guess) do
      %{
      game |
      game_state: :bad_guess,
      turns_left: turns_left - 1
      }
  end

  defp reveal_guess(letters, used) do
    letters
    |> Enum.map(fn letter -> reveal_letter(letter, Mapset.member?(used, letter))end)
  end

  defp reveal_letter(letter, _in_mapset = true), do: letter
  defp reveal_letter(letter, _not_in_mapset), do: "_"



  defp maybe_won(_does_match = true), do: :won
  defp maybe_won(_doesnt_match), do: :good_guess


end
