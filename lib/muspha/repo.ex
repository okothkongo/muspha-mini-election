defmodule Muspha.Repo do
  use Ecto.Repo,
    otp_app: :muspha,
    adapter: Ecto.Adapters.Postgres
end
