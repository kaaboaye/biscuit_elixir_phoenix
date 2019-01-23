defmodule Biscuit.Brewings do
  @moduledoc """
  The Brewings context.
  """

  import Ecto.Query, warn: false
  alias Biscuit.Repo

  alias Biscuit.Brewings.Brewing

  @doc """
  Returns the list of brewings.

  ## Examples

      iex> list_brewings()
      [%Brewing{}, ...]

  """
  def list_brewings do
    Repo.all(Brewing)
  end

  @doc """
  Gets a single brewing.

  Raises `Ecto.NoResultsError` if the Brewing does not exist.

  ## Examples

      iex> get_brewing!(123)
      %Brewing{}

      iex> get_brewing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brewing!(id), do: Repo.get!(Brewing, id)

  @doc """
  Creates a brewing.

  ## Examples

      iex> create_brewing(%{field: value})
      {:ok, %Brewing{}}

      iex> create_brewing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brewing(attrs \\ %{}) do
    %Brewing{}
    |> Brewing.changeset(attrs)
    |> IO.inspect()
    |> Repo.insert()
  end

  @doc """
  Updates a brewing.

  ## Examples

      iex> update_brewing(brewing, %{field: new_value})
      {:ok, %Brewing{}}

      iex> update_brewing(brewing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brewing(%Brewing{} = brewing, attrs) do
    brewing
    |> Brewing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Brewing.

  ## Examples

      iex> delete_brewing(brewing)
      {:ok, %Brewing{}}

      iex> delete_brewing(brewing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brewing(%Brewing{} = brewing) do
    Repo.delete(brewing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brewing changes.

  ## Examples

      iex> change_brewing(brewing)
      %Ecto.Changeset{source: %Brewing{}}

  """
  def change_brewing(%Brewing{} = brewing) do
    Brewing.changeset(brewing, %{})
  end
end
