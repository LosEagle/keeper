defmodule KeeperWeb.Resolvers.Folder do
  def list_folders(_parent, _args, _resolution) do
    res =
      Keeper.Folder
      |> Keeper.Repo.all()

    {:ok, res}
  end

  def create_folder(_parent, args, _resolution) do
    new_folder = %Keeper.Folder{
      name: args.name,
      color: if is_map_key(args, :color) do args.color else nil end
    }

    Keeper.Repo.insert(new_folder)
  end
end
