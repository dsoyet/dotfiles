alias bah='packer build --only=qemu.vm --var-file=os_pkrvars/bootstrap/archlinux.pkrvars.hcl packer_templates'
alias bnx='packer build --only=qemu.vm --var-file=os_pkrvars/bootstrap/nix.pkrvars.hcl packer_templates'
alias cos='rclone mount remote:/bootstrap /cos --daemon'
alias wget='aria2c -x 16'
alias cki='vagrant box add outlook.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol xacklinux-VAGRANTSLASH-xacklinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f fake6; unset box; vagrant up fake6'
alias wh='vagrant box add xack.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol xacklinux-VAGRANTSLASH-xacklinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f fake6; unset box; vagrant up fake6'
alias ach='vagrant box add arch.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol xacklinux-VAGRANTSLASH-xacklinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f devbox3; unset box; vagrant up devbox3'
alias kal='vagrant box add kali.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol xacklinux-VAGRANTSLASH-xacklinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f fake1; unset box; vagrant up fake1'
alias mint='vagrant box add mint.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol xacklinux-VAGRANTSLASH-xacklinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f fake1; unset box; vagrant up fake1'
alias reload='vagrant box add arch.json --force; cd ~/code; su -c "virsh vol-delete --pool default --vol archlinux-VAGRANTSLASH-archlinux_vagrant_box_image_20240901.259602_box_0.img"; vagrant destroy -f devbox3; unset box; vagrant up devbox3; vagrant reload devbox3'
alias df='df -x tmpfs -h'
alias vcs='vcsi -w 1920 -g 2x8 --metadata-position hidden '
alias diffpkg='diff <(pacman -Qeq|sort) <(cat ~/code/base ~/code/pkg|sort)'
alias rdp='vagrant rdp fake6 -- /cert:ignore /smart-sizing:2400x1350 /scale:180 /f'
alias redo='vagrant destroy -f /offline[1-4]/;vagrant up /offline[1-4]/'
alias map='ssh -o User=Share -o Port=22 -o UserKnownHostsFile=/dev/null -o ExitOnForwardFailure=yes -o ControlMaster=no -o StrictHostKeyChecking=no -o PasswordAuthentication=yes -o ForwardX11=no -n -L 0.0.0.0:3289:192.168.122.54:3389 -N 192.168.122.54'

# 获取当前 CPU 核数
CPU_CORES=$(nproc)

# 查找所有 MP3 文件并并发处理
#find . -type f -name "*.mp3" | xargs -I {} -P "$CPU_CORES" bash -c 'remove_mp3_images "$@"' _ {}
