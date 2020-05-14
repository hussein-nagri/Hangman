defmodule Dictionary.WordList do


  def start_link() do
    Agent.start_link(fn -> word_list() end)
  end

  def random_word(agent) do
    Agent.get(agent, &Enum.random/1)
  end


  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |>  File.read!()
    |> String.split( ~r/\n/)

  end


end




  # def swap_tuple({a,b}) do
  # {b,a}
  # end

  # def is_same({a,a}) do
  #   true
  # end
  # def is_same({a,a}) do
  #   true
  # end
