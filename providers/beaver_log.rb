action :create do
  path = new_resource.name
  type = new_resource.type || "syslog"
  tags = new_resource.tags || ["logstash"]
  add_field = new_resource.add_field || false

  node.set[:logstash][:beaver][:inputs] = [] unless node[:logstash][:beaver][:inputs]
  node.set[:logstash][:beaver][:inputs][node[:logstash][:beaver][:inputs].size] = {
    file: {
      path: path,
      type: type,
      tags: tags,
      add_field: add_field
    }
  }
  new_resource.updated_by_last_action(true)
end

action :delete do
  node.set[:logstash][:beaver][:inputs] = [] unless node[:logstash][:beaver][:inputs]
  node.set[:logstash][:beaver][:inputs].reject! do |i|
    i[:file][:path] == new_resource.name
  end
  new_resource.updated_by_last_action(true)
end
