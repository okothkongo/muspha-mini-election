defmodule MusphaWeb.ElectorLive.Index do
  use MusphaWeb, :live_view
  alias Muspha.Accounts

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :electors, list_electors())}
  end

  defp list_electors do
    Accounts.list_electors()
  end
end
