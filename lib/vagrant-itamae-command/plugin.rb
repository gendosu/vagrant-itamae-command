module VagrantPlugins
  module ItamaeCommand
    class Plugin < Vagrant.plugin('2')
      name 'itamae-command'
      provisioner(:"itamae-command") do
        require_relative 'provisioner'
        Provisioner
      end

      config(:"itamae-command", :provisioner) do
        require_relative 'config'
        Config
      end
    end
  end
end
