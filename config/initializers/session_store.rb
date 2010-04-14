# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ctd_session',
  :secret      => '1b0d31567530373db1a3518dea545e752efb8b7f72dcff423ac7b8a1258a55410e747f8429a8246793deeef384d4d3e0bab4970b4daa2b7e51c28af90612d674'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
