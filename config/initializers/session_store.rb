# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_maxfunmobile_session',
  :secret      => 'c6f3a92f65fada970eac69eb0906ad6dd1f3ddf75e531501e73bd4da3c913209747c452b715ec30d6eedf6fae5378ff3a5f23790a25d9d49fdea2c7a0eaced2e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
