defmodule FalconPlusApi.Sig do

  def start_link do

    ret = Agent.start_link(fn -> %{} end, name: __MODULE__)

    Application.get_env(:falcon_plus_api, :sigs, []) 
      |> Enum.map(fn opts -> FalconPlusApi.Sig.add_sig(opts) end)

    ret
  end

  defp _extract(opts) do
    
    with {:ok, name} <- Map.fetch(opts, "name"),
         {:ok, sig} <- Map.fetch(opts, "sig") do

      {:ok, name, Poison.encode!(%{"name" => name, "sig" => sig})}
    else
      :error -> :error
    end

  end

  def add_sig(opts) do
    case _extract(opts) do
      {:ok, name, sig} ->
        Agent.update(__MODULE__, fn map -> Map.put(map, name, sig) end)
      _ -> :error
    end
  end

  def get_sig(name) do

    Agent.get(__MODULE__, fn map -> Map.get(map, name) end)

  end

  def all_sig do

    Agent.get(__MODULE__, fn map -> map end)

  end

end
