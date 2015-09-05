defmodule FooApi.BarTest do
  use FooApi.ModelCase

  alias FooApi.Bar

  @valid_attrs %{barnism: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bar.changeset(%Bar{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bar.changeset(%Bar{}, @invalid_attrs)
    refute changeset.valid?
  end
end
