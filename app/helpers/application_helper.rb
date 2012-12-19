module ApplicationHelper
  def display_links
    if @auth
      link_to("Logout", logout_path, :method => :delete) +
      link_to("Family", profile_path) +
      link_to("Chores", chores_path) +
      link_to("Transactions", transactions_path) +
      link_to("Overview", overview_path)
    else
      link_to("Login", login_path) +
      link_to("Register", register_path)
    end
  end
end