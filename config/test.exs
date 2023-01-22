import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :clock, ClockWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "nN6RugBZBjXswjy2+bB4iCwgq5FrnIaOIPnyKDs8L6Oc6a0pReyiePrtUlqytHHa",
  server: false

# In test we don't send emails.
config :clock, Clock.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
