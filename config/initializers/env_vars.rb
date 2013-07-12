EnvVars = EECummings

EnvVars.configure do |c|
  c.variable do |var|
    var.name = 'GOOGLE_CONSUMER_KEY'
  end

  c.variable do |var|
    var.name = 'GOOGLE_CONSUMER_SECRET'
  end
end
