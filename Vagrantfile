Vagrant.configure('2') do |config|
  # share port 8080 inside VM a
  config.vm.network 'forwarded_port', guest: 80, host: 8080
  config.ssh.insert_key = false

  config.vm.synced_folder '.',
                          '/vagrant',
                          mount_options: ['dmode=775,fmode=755']
  config.vm.box = 'bento/centos-7.8'

  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = "pip3"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.playbook = "provision_me.yml"
    ansible.version = "2.9.21"
    ansible.verbose = 'v'
  end

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
end
