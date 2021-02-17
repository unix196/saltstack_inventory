
{% set disks_list = salt['partition.get_block_device']() %}
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}

{%- for disk  in disks_list %}
{% set disk_path = '/dev/' ~ disk  %}
{% set partition_info = salt['partition.list'](disk_path) %}
Partition_list_disk_{{ disk }}:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/{{ disk }}_partition_info.txt
    - makedirs: True
    - contents: |
        {{ partition_info | json }}

smart_info_disk_{{ disk }}:
  cmd.run:
    - name: smartctl  -i /dev/{{ disk }} > /tmp/{{ grains.host }}/{{ tstamp }}/{{ disk }}_smart.txt
{% endfor %}
