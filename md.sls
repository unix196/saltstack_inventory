
{% set md_exist = salt['file.file_exists']("/proc/mdstat") %}

{% if md_exist is sameas true %}

{% set md_dict = salt['raid.list']() %}
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}

md_raid_list:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/md_list.txt
    - makedirs: True
    - contents: |
        {{ md_dict | json }}

{%- for key, value in md_dict.items() %}
{% set md_info = salt['raid.detail'](key) %}
md_raid_info{{ key|replace("/", "_") }}:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/{{ key |replace("/", "_") }}.txt
    - makedirs: True
    - contents: |
        {{ md_info | json }}
{% endfor %}

{% endif %}
