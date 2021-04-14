defmodule KeeperWeb.Schema do
  use Absinthe.Schema
  import_types(KeeperWeb.Schema.ContentTypes)

  alias KeeperWeb.Resolvers

  query do
    @desc "Get all bookmarks"
    field :bookmarks, list_of(:bookmark) do
      resolve(&Resolvers.Bookmark.list_bookmarks/3)
    end

    @desc "Get all folders"
    field :folders, list_of(:folder) do
      resolve(&Resolvers.Folder.list_folders/3)
    end
  end

  mutation do
    @desc "Create a bookmark"
    field :create_bookmark, type: :bookmark do
      arg(:folder_id, :integer)
      arg(:title, non_null(:string))
      arg(:description, :string)
      arg(:link, non_null(:string))

      resolve(&Resolvers.Bookmark.create_bookmark/3)
    end

    @desc "Create a folder"
    field :create_folder, type: :folder do
      arg(:name, :string)
      arg(:color, :string)

      resolve(&Resolvers.Folder.create_folder/3)
    end
  end
end
