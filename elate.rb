require 'pry'
require 'json'
file = File.read('./elation_programming_assignment/initial_lab_results.json')

def elate(input, result_id)
  parsed_input = JSON.parse(input)
  given_result = parsed_input.find { |result| result['result_id'] == result_id }
  filtered_results = parsed_input.find_all { |result| result['patient_id'] == given_result['patient_id'] && result['name'] == given_result['name'] }
  last_three_results = filtered_results.sort_by { |result| result['date'] }.last(3)
  { last_three_results: last_three_results, result_id: result_id }.to_json
end

elate(file, 126)