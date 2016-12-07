defmodule OndeTem.Models.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string
    field :email, :string
    field :password, :string
    field :plain_passowrd, :string, virtual: true
    timestamps
  end

  @required_fields ~w(username email password)
  @optional_fields ~w()

  def changset(type, params \\ :empty) do
    type
      |> cast(params, @required_fields, @optional_fields)
      |> unique_constraint(:username)
      |> unique_constraint(:email)
      |> validate_format(:email, ~r/@/)
      |> validate_length(:password, min: 5)
      |> put_change(:passowrd, params["plain_password"] |> hashed_password)
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  def login(params, repo) do
    user = repo.get_by(User, email: params["email"] |> String.downcase)
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end

end
