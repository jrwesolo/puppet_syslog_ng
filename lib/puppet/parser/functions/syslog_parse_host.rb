module Puppet::Parser::Functions
  newfunction(:syslog_parse_host, :type => :rvalue) do |args|
    if args.empty?
      { 'address' => nil, 'port' => nil }
    else
      case args[0]
      when /^\[(?<address>.+)\]:(?<port>\d+)$/
        address, port = $~[:address], $~[:port]
      when /^(?<address>[^:]+):(?<port>\d+)$/
        address, port = $~[:address], $~[:port]
      else
        address, port = args[0], nil
      end
      { 'address' => address, 'port' => port }
    end
  end
end
