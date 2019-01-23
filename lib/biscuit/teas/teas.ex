defmodule Biscuit.Teas do
  @moduledoc """
  The Teas context.
  """

  import Ecto.Query, warn: false
  alias Biscuit.Repo

  alias Biscuit.Teas.Tea

  @doc """
  Returns the list of tea.

  ## Examples

      iex> list_tea()
      [%Tea{}, ...]

  """
  def list_tea do
    Repo.all(Tea)
  end

  @doc """
  Gets a single tea.

  Raises `Ecto.NoResultsError` if the Tea does not exist.

  ## Examples

      iex> get_tea!(123)
      %Tea{}

      iex> get_tea!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tea!(id), do: Tea |> Ecto.Query.preload(:brewings) |> Repo.get!(id)

  @doc """
  Creates a tea.

  ## Examples

      iex> create_tea(%{field: value})
      {:ok, %Tea{}}

      iex> create_tea(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tea(attrs \\ %{}) do
    %Tea{}
    |> Tea.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tea.

  ## Examples

      iex> update_tea(tea, %{field: new_value})
      {:ok, %Tea{}}

      iex> update_tea(tea, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tea(%Tea{} = tea, attrs) do
    tea
    |> Tea.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tea.

  ## Examples

      iex> delete_tea(tea)
      {:ok, %Tea{}}

      iex> delete_tea(tea)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tea(%Tea{} = tea) do
    Repo.delete(tea)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tea changes.

  ## Examples

      iex> change_tea(tea)
      %Ecto.Changeset{source: %Tea{}}

  """
  def change_tea(%Tea{} = tea) do
    Tea.changeset(tea, %{})
  end
end
