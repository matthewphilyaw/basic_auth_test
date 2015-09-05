defmodule FooApi.PageController do
  use FooApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
