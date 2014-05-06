require 'net/http'
require 'json'

api_key = ENV['CODECLIMATE_API_KEY'] || ''
config = YAML::load_file('config/codeclimate.yml')

def get_gpa(api_key, repo_name)
  uri = URI.parse("https://codeclimate.com/api/repos/#{repo_name}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  request.set_form_data({api_token: api_key})
  response = http.request(request)
  stats = JSON.parse(response.body)
end

SCHEDULER.every '10s', :first_in => 0 do |job|
  config['repos'].each do |repo|
    gpa = get_gpa(api_key, repo[1])
    current_gpa = gpa['last_snapshot']['gpa'].to_f
    last_gpa = gpa['previous_snapshot']['gpa'].to_f

    send_event("codeclimate-#{repo[0]}", {current: current_gpa, last: last_gpa})
  end
end
