module ApplicationHelper
  def display_links
    if @auth
      link_to("Overview", overview_path) +
      link_to("Chores", chores_path) +
      link_to("New Transaction", transactions_path) +
      link_to("Logout", logout_path, :method => :delete)
    else
      link_to("Register", register_path) +
      link_to("Login", login_path)
    end
  end
end
