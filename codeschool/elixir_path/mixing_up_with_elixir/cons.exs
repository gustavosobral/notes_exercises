# Cons operator
[head | tail] = ["Elixir", "Ruby", "JavaScript"]

defmodule Language do
  def print_list([head | tail]) do
    IO.puts head
    print_list(tail)
  end

  def print_list([]) do
  end
end

Language.print_list(["Elixir", "Ruby", "JavaScript"])
