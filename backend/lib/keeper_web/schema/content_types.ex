defmodule KeeperWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :folder do
    field(:id, :id)
    field(:name, :string)
    field(:color, :string)
  end

  object :bookmark do
    field(:id, :id)
    field(:folder_id, :integer)
    field(:title, :string)
    field(:description, :string)
    field(:link, :string)
  end
end
