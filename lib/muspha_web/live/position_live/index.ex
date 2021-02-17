defmodule MusphaWeb.PostionLive.Index do
  use MusphaWeb, :live_view
  alias Muspha.Accounts

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :positions, list_positions())}
  end

  defp list_positions do
    Accounts.list_positions()
  end
end
