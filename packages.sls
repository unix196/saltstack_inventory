
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set packages_dict = salt['pkg.list_pkgs']() %}

packages_dict:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/packages.txt
    - makedirs: True
    - contents: |
        {{ packages_dict | json }}
