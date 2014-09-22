require 'dotenv'
Dotenv.load

require 'geminabox'

$data_dir = ENV['DATA_DIR'] || './data'
FileUtils.mkdir_p($data_dir)

Geminabox.data = $data_dir

run Geminabox::Server
