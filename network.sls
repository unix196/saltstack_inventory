
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set network_interfaces_dict = salt['network.interfaces']() %}

network.interfaces:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/network_interfaces.txt
    - makedirs: True
    - contents: |
        {{ network_interfaces_dict | json }}
