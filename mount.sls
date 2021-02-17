
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set mount_active_dict = salt['mount.active']() %}
{% set mount_fstab_dict = salt['mount.fstab']() %}

mount_active:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/mount_active.txt
    - makedirs: True
    - contents: |
        {{ mount_active_dict | json }}

mount_fstab:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/mount_fstab.txt
    - makedirs: True
    - contents: |
        {{ mount_fstab_dict | json }}
