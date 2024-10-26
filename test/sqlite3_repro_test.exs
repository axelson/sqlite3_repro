defmodule Sqlite3ReproTest do
  use ExUnit.Case
  doctest Sqlite3Repro

  test "greets the world" do
    assert Sqlite3Repro.hello() == :world
  end
end
