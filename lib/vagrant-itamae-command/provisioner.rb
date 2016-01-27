module VagrantPlugins
  module ItamaeCommand
    class Provisioner < Vagrant.plugin('2', :provisioner)
      def provision
        option_params = []
        option_params << "--node_json=#{config.json}" if config.json
        option_params << "--node_yaml=#{config.yaml}" if config.yaml
        option_params << '--sudo' if config.sudo
        option_params << "--shell=#{config.shell}" if config.shell
        option_params << "--host=#{@machine.ssh_info[:host]}"
        option_params << "--port=#{@machine.ssh_info[:port]}"
        option_params << "--user=#{@machine.ssh_info[:username]}"
        option_params << "--key=#{@machine.ssh_info[:private_key_path][0]}"

        config.recipes.each do |recipe|
          system("itamae ssh --vagrant #{option_params.join(' ')} #{recipe}")
        end
      end
    end
  end
end
