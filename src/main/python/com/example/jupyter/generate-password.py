from jupyter_server.auth import passwd

# Generate encrypted password
hashed_password = passwd(algorithm='sha1')
print(hashed_password)
