defmodule Inmana.Welcomer do
  # receber nome e idade do usuario, se usuario se chamar 'banana' e tiver idade '42', recebe uma mensagem especial
  # se for maior de idade, recebe mensagem normal
  # se for menor de idade, retorna erro
  # nome do usuario é tratado para entradas erradas

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

  defp evaluate(name, age) do
    {:error, "you shall not pass #{name}"}
  end
end
