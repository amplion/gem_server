require 'dotenv'
Dotenv.load

require 'geminabox'

$data_dir = ENV['DATA_DIR'] || './data'
FileUtils.mkdir_p($data_dir)

Geminabox.data = $data_dir

gem_server_token = ENV['GEM_SERVER_TOKEN'].freeze

raise "No token set" unless gem_server_token

use Rack::Auth::Basic, "Gems" do |username, password|
  gem_server_token == username
end

run Geminabox::Server
