require 'json'

class PersistData
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def save(data)
    arr = JSON.pretty_generate(data)
    File.write(file_path, arr.to_s)
  end

  def load
    [] unless File.exist?(file_path)

    JSON.parse(File.read(file_path))
  end
end
