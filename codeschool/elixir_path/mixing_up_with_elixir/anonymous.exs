max_balance = fn(amount) -> "Max: #{amount}" end
max_balance.(300) |> IO.puts

# Anonymous functions example
defmodule Account do
  def run_transaction(balance, amount, transaction) do
    if balance <= 0 do
      "Cannot perform any transaction"
    else
      transaction.(balance, amount)
    end
  end
end

deposit = fn(balance, amount) -> balance + amount end
withdrawal = fn(balance, amount) -> balance - amount end

Account.run_transaction(1000, 20, withdrawal)
Account.run_transaction(1000, 20, deposit)

Account.run_transaction(0, 20, deposit)

# Shorthand operator
deposit = fn(balance, amount) -> balance + amount end
deposit = &(&1 + &2)

Enum.map([1, 2, 3, 4], &(&1 * 2)))
