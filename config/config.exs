# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :awesome_blog,
  ecto_repos: [AwesomeBlog.Repo]

# Configures the endpoint
config :awesome_blog, AwesomeBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mQ1tTg4/jaYpmtV98ML/NBb6GHlSzzauXA2e1GHzEIig2IyYflAnIlrACxBSWNKp",
  render_errors: [view: AwesomeBlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AwesomeBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "AwesomeBlog",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: AwesomeBlogWeb.GuardianSerializer,
  secret_key: "Mk34GYVQgRHwi6BJCsKGqPQeT1MOWGf8CRoR9dUWm022+MYSAE94idxrKTziXI7f"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
