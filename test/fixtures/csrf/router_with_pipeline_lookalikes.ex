defmodule PhoenixApp.Router do
  use PhoenixApp.Web, :router

  # A variable and a local call that share the name `pipeline` are not
  # pipeline definitions.
  def call(conn, _opts) do
    case lookup(conn) do
      {metadata, pipeline} -> {metadata, pipeline}
      :error -> :error
    end
  end

  def build(map, keyword), do: pipeline(map, keyword)

  pipeline :browser do
    plug(:fetch_session)
  end
end
