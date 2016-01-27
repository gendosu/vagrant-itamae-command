# vagrant-itamae-command

vagrant-itamae-command is a vagrant plugin for [Itamae](https://github.com/ryotarai/itamae)

When used in conjunction with vagrant-serverspec.
"sudo_password" is duplicated
In order to use at the same time.
It was not required to call the Itamae

## Example

```ruby
Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :itamae-command do |config|
    # execute command with sudo privilege(true or false)
    config.sudo = true

    # recipes(String or Array)
    config.recipes = ['./recipe.rb']

    config.json = './node.json'
  end
end
```

## Installation

```ruby
vagrant plugin install vagrant-itamae-command
```

## Contributing

1. Fork it ( https://github.com/gendosu/vagrant-itamae-command/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
