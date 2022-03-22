defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "Qndo todos os parametros sao validos, retornar um changeset valido" do
      params = %{name: "Ricardo", email: "Ricardo@gmail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Ricardo", email: "Ricardo@gmail.com", password: "123456"},
        errors: []
      } = response
    end

    test "Qndo todos os parametros sao invalidosvalidos, retornar um changeset invalido" do
      params = %{name: "R", email: "Ricardo@gmail.com"}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response


      end
  end
end
