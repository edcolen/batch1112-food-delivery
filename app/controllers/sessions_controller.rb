require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for('username')
    password = @view.ask_for('password')
    user = @employee_repository.find_by_username(username)
    return user if user && user.password == password

    @view.wrong_credentials
    login
  end
end
