def login(user)
  setup_mock_auth_response('uid' => user.uid)
  get root_path
  follow_redirect!
  follow_redirect!
  follow_redirect!
end

def setup_mock_auth_response(response)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(response)
end

def setup_mock_auth_failure
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
end
