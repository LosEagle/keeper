defmodule KeeperWeb.Resolvers.Bookmark do
  def list_bookmarks(_parent, _args, _resolution) do
    res =
      Keeper.Bookmark
      |> Keeper.Repo.all()

    {:ok, res}
  end

  def create_bookmark(_parent, args, _resolution) do
    new_bookmark = %Keeper.Bookmark{
      folder_id: if is_map_key(args, :folder_id) do args.folder_id else nil end,
      title: args.title,
      description: if is_map_key(args, :description) do args.description else nil end,
      link: args.link,
    }

    Keeper.Repo.insert(new_bookmark)
  end
end
