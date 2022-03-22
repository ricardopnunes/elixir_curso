defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  describe "calculate/1" do
    test "Qnd o arquivo existir retornar" do
      params = %{"filename" => "students.csv"}

      expected_response = {:ok, %{"Dani" => 24.158817968558527,
                             "Diego" => 22.22222222222222,
                             "Joao" => 22.99262444384723,
                             "Rafael" => 24.897060231734173,
                             "Ricardo" => 25.127830533235937}}
      response = Wabanex.IMC.calculate(params)

      assert response  == expected_response
    end

    test "Qnd o arquivo Não existir" do
      params = %{"filename" => "bana.csv"}

      expected_response = {:error, "Error while opening file"}
      response = Wabanex.IMC.calculate(params)

      assert response  == expected_response

    end
  end
end
