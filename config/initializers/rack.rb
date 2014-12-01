# http://stackoverflow.com/questions/10998852/error-h13-connection-closed-without-response-heroku
Rack::Utils.key_space_limit = 262144 # デフォルト: 65536
