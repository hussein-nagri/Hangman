defmodule Dictionary.WordList do


  @me __MODULE__
  def start_link() do
    Agent.start_link(fn -> word_list() end, name: @me)
  end

  def random_word() do
    if :random.uniform < 0.33 do
      Agent.get(@me, fn _ -> exit(:boom) end)
    end
    Agent.get(@me, &Enum.random/1)
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
