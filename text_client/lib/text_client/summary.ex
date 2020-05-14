defmodule TextClient.Summary do
  def display(game = %{ tally: tally }) do
    IO.puts [
      "\n",
      "Words so far: #{Enum.join(tally.letters, " ")}\n",
      "Guesses left: #{tally.turns_left}\n",
      "Guessed letters: #{MapSet.to_list(tally.guess) |> Enum.join()}",
    ]
    game
  end
end
