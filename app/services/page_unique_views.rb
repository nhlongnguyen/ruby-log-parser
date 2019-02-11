require 'set'

class PageUniqueViews
  def initialize(filepath)
    @file = File.open(filepath, 'r')
  end

  def call
    Hash.new { |hash, key| hash[key] = Set.new }.yield_self do |results|
      file.each do |line|
        page, ip_address = line.split(' ')
        results[page].add(ip_address)
      end

      parse_results(results)
    end
  end

  private

  attr_reader :file

  def parse_results(results)
    results
      .sort_by { |_page, ip_addresses| ip_addresses.size }
      .reverse
      .map { |arr| [arr[0], arr[1].size] }
      .to_h
  end
end
