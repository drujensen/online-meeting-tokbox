Kemalyst::Handler::Session.config do |config|
  # The name of the cookie used to store the session data
  #
  config.key = "_online-meeting.session"

  # The secret is used to avoid the session data being changed.  The session
  # data is stored in a cookie.  To avoid changes being made, a security token
  # is generated using this secret.  To generate a secret, you can use the
  # following command:
  # crystal eval "require \"secure_random\"; puts SecureRandom.hex(64)"
  #
  config.secret = "bdd429e83f834c1cce789ac9f5a26891a3ba524cdb8aaecd94f64be3063c8693081f052e2b6e1978f2894e28eac2ee2407bff48fb9d2752e724e5e16e7eb8108"
end
