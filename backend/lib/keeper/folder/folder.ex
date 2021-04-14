defmodule Keeper.Folder do
  use Ecto.Schema

  schema "folders" do
    field(:name, :string)
    field(:color, :string)
  end

  def changeset(folder, params \\ %{}) do
   folder
   |> Ecto.Changeset.cast(params, [:name, :color])
  end
end
