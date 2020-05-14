defmodule Dictionary.WordList do

  def random_word(word_list) do
    Enum.random(word_list)
  end


  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |>  File.read!()
    |> String.split( ~r/\n/)

  end


  def swap_tuple({a,b}) do
  {b,a}
  end

  def is_same({a,a}) do
    true
  end
  def is_same({a,a}) do
    true
  end


end


