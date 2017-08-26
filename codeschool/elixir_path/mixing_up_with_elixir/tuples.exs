# Tuples

defmodule Account do
  def parse_file({:ok, content}) do
    IO.puts content
  end

  def parse_file({:error, _}) do
    IO.puts "Error parsing the file"
  end
end

File.read('example.file') |> Account.parse_file
File.read('invalid-file') |> Account.parse_file
