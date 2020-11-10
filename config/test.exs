use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :short_url, ShortUrlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :short_url, ShortUrl.Repo,
  username: System.get_env("POSTGRES_TEST_USER"),
  password: System.get_env("POSTGRES_TEST_PASSWORD"),
  database: System.get_env("POSTGRES_TEST_DATABASE"),
  hostname: System.get_env("HOST"),
  pool: Ecto.Adapters.SQL.Sandbox
