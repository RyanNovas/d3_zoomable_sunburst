require 'json'
require 'pry'

class Parser

  def initialize
    @file = File.read('json_template.json')
    @sunburst = JSON.parse(@file)
    @sunburst['id'] = 'album_a_tribe_called_quest'
    @sunburst['level_id'] = 1
    @network = {"nodes"=>[], "links"=>[]}
  end

  def push_to_network
    pusher(@sunburst)
    @sunburst['children'].each do |a|
      child_helper(a, @sunburst)
      if a["children"]
        a["children"].each do |b|
          child_helper(b, a)
          if b["children"]
            b["children"].each do |c|
              child_helper(c, b)
            end
          end
        end
      end
    end
  end

  def child_helper(child, parent)
    child['level_id'] = parent['level_id'] + 1
    child['id'] = uid_builder(child)
    link_builder(parent, child)
    pusher(child)
  end

  def pusher(node)
    updated = node.dup
    updated.delete("children")
    @network['nodes'].push(updated)
  end

  def uid_builder(c)
    c["id"] = (c['trackName'] + '_' + c['artistName']).gsub(/\s+/, "_").downcase
    c["id"] = c["id"].gsub(/[\W]+/, "")
  end

  def link_builder(parent, child)
    @network["links"].push({"source" => parent["id"], 'target' => child["id"]})
  end


end
x = Parser.new
x.push_to_network
