require 'tommy_bot/version'
require 'faraday'
require 'json'

class TommyBot
  def ok?
    endpoint = "api.test".freeze
    root = "https://slack.com/api/".freeze

    conn = Faraday.new(url: root) do |faraday|
      faraday.response :logger unless ENV['RUBY_ENV'] == 'test'
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get endpoint

    json = JSON.parse response.body
    json.fetch("ok")
  end

  private

  def config
    file = File.new("config/slack.yml", "r")
    YAML.load(file)
  end

  def key
    config['production']['key']
  end
end
