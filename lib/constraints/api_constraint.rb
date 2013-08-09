class ApiConstraint
  def matches?(request)
    token = request.params['api_key']
    token.present? && ApiKey.token_exists?(token)
  end
end
