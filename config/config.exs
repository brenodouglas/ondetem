# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :onde_tem, ecto_repos: [OndeTem.Repo]
config :onde_tem, OndeTem.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "onde_tem_repo",
  username: "user",
  password: "pass",
  hostname: "localhost",
  port: 54320
  
config :maru,
      OndeTem.API,
      versioning: [
        using: :path
      ],
      http: [port: 8880]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "OndeTEM",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "AL0H8OvP5NuboUoj8Pb3zpBcDyEJN907wMxrCy7H2062i3IRPF5NQ546jIJU3uQX5KN2QB_Cq6R_SUqyVZSNpIfC",
  serializer: OndeTem.Serializer
# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :onde_tem, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:onde_tem, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
