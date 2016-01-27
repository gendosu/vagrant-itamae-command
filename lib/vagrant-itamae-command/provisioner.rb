module VagrantPlugins
  module ItamaeCommand
    class Provisioner < Vagrant.plugin('2', :provisioner)
      def provision
        options = {
          node_json: config.json,
          node_yaml: config.yaml,
          sudo: config.sudo,
          shell: config.shell,
          host: @machine.ssh_info[:host],
          port: @machine.ssh_info[:port],
          user: @machine.ssh_info[:username],
          key:  @machine.ssh_info[:private_key_path][0]
        }

        option_params = []
        option_params << "--node_json=#{options[:node_json]}" if options[:node_json]
        option_params << "--node_yaml=#{options[:node_yaml]}" if options[:node_yaml]
        option_params << '--sudo' if options[:sudo]
        option_params << "--shell=#{options[:shell]}" if options[:shell]
        option_params << "--user=#{options[:user]}"
        option_params << "--host=#{options[:host]}"
        option_params << "--port=#{options[:port]}"
        option_params << "--key=#{options[:key]}"

        config.recipes.each do |recipe|
          system("itamae ssh --vagrant #{option_params.join(' ')} #{recipe}")
        end
      end
    end
  end
end
