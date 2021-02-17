
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set pip_dict = salt['pip.list']() %}

pip_list:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/pip.txt
    - makedirs: True
    - contents: |
        {{ pip_dict | json }}
