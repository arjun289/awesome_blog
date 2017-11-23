defmodule AwesomeBlog.Data do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      alias AwesomeBlog.Repo
    end
  end
end