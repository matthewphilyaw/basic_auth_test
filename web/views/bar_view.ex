defmodule FooApi.BarView do
  use FooApi.Web, :view

  def render("index.json", %{bars: bars}) do
    %{data: render_many(bars, FooApi.BarView, "bar.json")}
  end

  def render("show.json", %{bar: bar}) do
    %{data: render_one(bar, FooApi.BarView, "bar.json")}
  end

  def render("bar.json", %{bar: bar}) do
    %{id: bar.id,
      barnism: bar.barnism}
  end
end
