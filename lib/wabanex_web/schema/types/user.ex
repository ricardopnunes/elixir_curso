defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Representacao logica do usuario"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end


  input_object :create_user_input do
      field :name, non_null(:string), description: "Nome dos Usuarios"
      field :email, non_null(:string), description: "email dos Usuarios"
      field :password, non_null(:string), description: "senha dos Usuarios"
    end
end
