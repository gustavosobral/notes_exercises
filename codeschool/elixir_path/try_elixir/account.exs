defmodule Account do
  def balance(initial) do
    discount(initial, 10)
    |> interest(0.1)
    |> format("$")
  end

  def discount(total, amount) do
    total + amount
  end

  def interest(total, rate) do
    total + (total * rate)
  end

  def format(value, format) do
    "#{format}#{value}"
  end

  def print_sum do
    1..10
    |> Enum.sum
    |> IO.puts
  end

  def run_transaction(balance, amount, :deposit) do
    balance + amount
  end

  def run_transaction(balance, amount, :withdrawl) do
    balance - amount
  end
end

# Pipe operator
current_balance = Account.balance(1000)
IO.puts "Current balance: US #{current_balance}"

# Pipe operator
Account.print_sum

# Pattern matching and string interpolation
"Jose " <> last_name = "Jose Valim"
IO.puts last_name

# Pattern matching
data = ["Elixir", "Valim"]
[lang, author] = data
IO.puts "#{lang}, #{author}"

# Pattern matching and pipe operator
1000
|> Account.run_transaction(50, :deposit)
|> Account.run_transaction(30, :withdrawl)
|> IO.puts
