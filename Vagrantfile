Vagrant.configure('2') do |config|
  config.ssh.insert_key = false

  config.vm.synced_folder '.',
                          '/vagrant',
                          mount_options: ['dmode=775,fmode=755']
  config.vm.box = 'bento/centos-7.9'

  # config.vm.provision "shell", path: "vagrant/provision_me.sh"

  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = "pip3"
    ansible.galaxy_role_file = "vagrant/requirements.yml"
    ansible.playbook = "vagrant/provision_me.yml"
    ansible.version = "2.10.7"
    ansible.verbose = 'v'
  end

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
end
