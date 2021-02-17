Set of states for inventorying your linux infrastructure using Saltstack.

In many files, the content in _json_ format.
In file _disk.sls_ module partition.get_block_device requires _parted_ package.


```
ls -1 /salt/cache/master/minions/test-server/files/inventory/2021-02-17

all-services.txt
_dev_md_0.txt
_dev_md_1.txt
_dev_md_2.txt
enabled-services.txt
kernelpkg.txt
kmod.txt
md_list.txt
mount_active.txt
mount_fstab.txt
network_interfaces.txt
packages.txt
pip.txt
sda_partition_info.txt
sda_smart.txt
sdb_partition_info.txt
sdb_smart.txt
...
```
where `/salt/cache/master` - _cachedir_ from salt-master config.
