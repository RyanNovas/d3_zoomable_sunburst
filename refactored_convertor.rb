require 'json'
require 'pry'

class Parser

  def initialize
    @file = File.read('json_template.json')
    @file2 = File.read('sample.json')
    @sunburst = JSON.parse(@file)
    @network = {"nodes"=>[], "links"=>[]}
    binding.pry
  end

  def push_to_nodes
    @sunburst.each do |k,v|
      @network['nodes'].push |






# def self.conversion (json, output, relation = nil)
#   relation = {'parents' =>[]} if relation == nil
#   @relation = relation
#   json.map do |k,v|
#     if k == "children" && v != 'null'
#       relation['parents'].push({output["nodes"].last['trackName'] => v})
#       @relation = relation
#       v.each {|c| conversion(c,output, relation)}
#     end
#     if k != "children" || (k=='children' && v=='null')
#       initializer(k,v,output)
#     end
#   end
#   puts @relation
# end
#
# def self.initializer (k,v,output)
#     if k == 'trackName'
#       output["nodes"].push({k => v})
#     elsif k != 'trackName'
#       output["nodes"].last[k] = v
#     end
# end

#
#
# output = conversion(@sunburst, network)

# def self.link_builder
#
# end

puts network

end
x = Parser.new
