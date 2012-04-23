require "net/ssh"

class RunCommand
  attr_reader :last_cmd_output
  attr_accessor :base_directory

  def initialize(args = {})
    @host = args[:host] || 'localhost'
    ssh_opts = {:paranoid => false}
    @ssh = Net::SSH.start(args[:host], args[:user], ssh_opts)
  end

  def run(cmd)
    run_cmd = (@base_directory ? "cd #{@base_directory} && " : "") + cmd + " 2>&1"
    @last_cmd_output = run_remote(run_cmd)
  end

  ##################################################################################
  private 

  # Stolen from http://stackoverflow.com/a/3386375
  def run_remote(cmd)
    stdout_data = ""
    exit_code = nil
    
    @ssh.open_channel do |channel|
      channel.exec(cmd) do |ch, success|
        unless success
          abort "FAILED: couldn't execute command (ssh.channel.exec)"
      end
      
      channel.on_data do |ch,data|
        stdout_data+=data
      end

      channel.on_request("exit-status") do |ch,data|
        exit_code = data.read_long
      end
    end
  end

  @ssh.loop
    raise "FAILED host: #{@host}\nreturn code: #{exit_code}\ncmd: #{cmd}\noutput: #{stdout_data}" unless exit_code == 0
    return stdout_data
  end
end
