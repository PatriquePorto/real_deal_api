defmodule RealDealApiWeb.AccountController do
  use RealDealApiWeb, :controller

  alias RealDealApiWeb.{Auth.Guardian, Auth.ErrorResponse}
  alias RealDealApi.{Accounts, Accounts.Account, Users, Users.User}

  plug :is_authorized_account when action in [:update, :delete]

  action_fallback RealDealApiWeb.FallbackController

  defp is_authorized_account(conn, _opts) do
    %{params: %{"account" => params}} = conn
    account = Accounts.get_account!(params["id"])
    if conn.assigns.account.id == account.id do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  def index(conn, _params) do
    accounts = Accounts.list_accounts()
    render(conn, "index.json", accounts: accounts)
  end
#Function create user account
  def create(conn, %{"account" => account_params}) do
    with {:ok, %Account{} = account} <- Accounts.create_account(account_params),
          {:ok, %User{} = _user} <- Users.create_user(account, account_params) do
      authorize_account(conn, account.email, account_params["hash_password"])
    end
  end
#Function sign_in account
def sign_in(conn, %{"email" => email, "hash_password" => hash_password}) do
   authorize_account(conn, email, hash_password)
end

defp authorize_account(conn, email, hash_password) do
  case Guardian.authenticate(email, hash_password) do
    {:ok, account, token} ->
      conn
      |> Plug.Conn.put_session(:account_id, account.id)
      |> put_status(:ok)
      |> render("account_token.json", %{account: account, token: token})
    {:error, :unauthorized} -> raise ErrorResponse.Unauthorized, message: "Email or Password incorrect."
  end
end
#Function Refresh session token account
def refresh_session(conn, %{}) do
  token = Guardian.Plug.current_token(conn)
  {:ok, account, new_token} = Guardian.authenticate(token)
  conn
  |> Plug.Conn.put_session(:account_id, account.id)
  |> put_status(:ok)
  |> render("account_token.json", %{account: account, token: new_token})

end
#Function sign_out account
def sign_out(conn, %{}) do
  account = conn.assigns[:account]
  token = Guardian.Plug.current_token(conn)
  Guardian.revoke(token)
  conn
  |> Plug.Conn.clear_session()
  |> put_status(:ok)
  |> render("account_token.json", %{account: account, token: nil})
end

  def show(conn, %{"id" => id}) do
    account = Accounts.get_full_account(id)
    render(conn, "full_account.json", account: account)
  end
#Function update account
  def update(conn, %{"account" => account_params}) do
    account = Accounts.get_account!(account_params["id"])

    with {:ok, %Account{} = account} <- Accounts.update_account(account, account_params) do
      render(conn, "show.json", account: account)
    end
  end
#Function delete account
  def delete(conn, %{"id" => id}) do
    account = Accounts.get_account!(id)

    with {:ok, %Account{}} <- Accounts.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
