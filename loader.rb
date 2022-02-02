class Loader
  def self.json_loader(path)
    file = File.read(path)
    JSON.parse(file)
  end
end