defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  @desc "Representacao logica do Treinamento"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercises)
  end

  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "ID do Usuario"
    field :start_date, non_null(:string), description: "Data Inicial"
    field :end_date, non_null(:string), description: "Data Final"
    field :exercises, list_of(:create_exercise_input), description: "Lista de Exercicios"
    end
end
