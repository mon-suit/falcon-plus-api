defmodule FalconPlusApi do

  def start(_, _) do

    import Supervisor.Spec
    
    children = [ worker(FalconPlusApi.Sig, []) ]

    Supervisor.start_link(children, strategy: :one_for_one, name: FalconPlusApi.Supervisor)
  end

end
