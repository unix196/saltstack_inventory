
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}

push_inventory_to_salt_master_cache:
  module.run:
    - cp.push_dir:
      - path: /tmp/{{ grains.host }}/
      - upload_path: /inventory


delete_inventory_dir_/tmp/{{ grains.host }}/:
  file.absent:
    - name: /tmp/{{ grains.host }}
