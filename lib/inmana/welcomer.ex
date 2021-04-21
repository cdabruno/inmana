defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()
    name |> String.trim() |> String.downcase() |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "you are very special"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "you shall not pass #{name}"}
  end
end
