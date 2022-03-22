defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation


  @desc "Representacao logica do exercicio"
  object :exercises do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Nome do Usuario"
    field :youtube_video_url, non_null(:string), description: "Video do YouTube"
    field :protocol_description, non_null(:string), description: "Descricao do protocolo"
    field :repetitions, non_null(:string), description: "Repetições"
    end
end
