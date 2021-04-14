defmodule Keeper.Bookmark do
  use Ecto.Schema

  schema "bookmarks" do
    field(:folder_id, :integer)
    field(:title, :string)
    field(:description, :string)
    field(:link, :string)
  end

  def changeset(bookmark, params \\ %{}) do
    bookmark
    |> Ecto.Changeset.cast(params, [:folder_id, :title, :description, :link])
  end
end
