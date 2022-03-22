 .defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "Quando todos os parametros são validos, retornar a info do IMC", %{conn: conn} do

      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{"result"
      => %{"Dani" => 24.158817968558527,
      "Diego" => 22.22222222222222,
      "Joao" => 22.99262444384723,
      "Rafael" => 24.897060231734173,
      "Ricardo" => 25.127830533235937}}

        assert expected_response == response

    end

    test "Quando os parametros são inválidos, retornar Erro", %{conn: conn} do

      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening file"}

        assert response == expected_response

    end
  end
end
