class AldebaranConectionRebbitMQ
  require 'bunny'

  def initialize
    @auth = AUTH['habbit']
  end

  def connection_rabbtmq(row_name)
    STDOUT.sync = true
    $conn =  Bunny.new(:host => ENVIRONMENT['rabbitmq'], :port => @auth['port'], :vhost => @auth['vhost'], :user => @auth['username'], :password => @auth['password'])
    $conn.start
    ch  = $conn.create_channel
    x   = ch.fanout(row_name)
    #publish
    queue = ch.queue(row_name, :durable => true)
    #get message
    queue.subscribe(block: true, auto_delete: true) do |delivery_info, properties, body|
     $body = JSON.parse(body)
     $conn.close
    end
  end
end
