# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :muspha,
  ecto_repos: [Muspha.Repo]

# Configures the endpoint
config :muspha, MusphaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "whFpcPtcFik8da0CtbCl5RVjebMZsIHFrUGUty05JzyGtlTRt2Xjb+AuWP07nBdq",
  render_errors: [view: MusphaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Muspha.PubSub,
  live_view: [signing_salt: "vW4oPGuI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
