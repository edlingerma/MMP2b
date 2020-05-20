module FormHelpers
    def signup(username, password)
        visit signup_path;
            fill_in 'user_username', with: username
            fill_in 'user_name', with: 'Sepp'
            fill_in 'user_password', with: password
            fill_in 'user_password_confirmation', with: password
            find('input[name="commit"]').click
    end
  end