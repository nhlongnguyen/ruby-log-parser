class PageViews
  def initialize(filepath)
    @file = File.open(filepath, 'r')
  end

  def call
    Hash.new(0).yield_self do |results|
      file.each do |line|
        page = line.split(' ')[0]
        results[page] += 1
      end

      parse_results(results)
    end
  end

  private

  attr_reader :file

  def parse_results(results)
    results
      .sort_by { |_page, count| count }
      .reverse
      .to_h
  end
end
