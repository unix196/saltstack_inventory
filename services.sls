
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set all_services_dict = salt['service.get_all']() %}
{% set enabled_services_dict = salt['service.get_enabled']() %}

all-services_list:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/all-services.txt
    - makedirs: True
    - contents: |
        {{ all_services_dict | json }}

enabled-services_list:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/enabled-services.txt
    - makedirs: True
    - contents: |
        {{ enabled_services_dict | json }}
