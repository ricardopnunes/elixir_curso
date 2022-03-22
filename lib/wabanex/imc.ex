defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, contents}) do
    data =
      contents
      |> String.split("\n")
      |> Enum.map(fn line -> parse_linha(line) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  defp handle_file({:error, _reason}) do
    {:error, "Error while opening file"}
  end

  defp parse_linha(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([nome, altura, peso]), do: {nome, peso / (altura * altura)}
end
