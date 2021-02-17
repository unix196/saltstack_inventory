
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set osnumber = salt['grains.get']('osrelease_info')[0] %}

{% if osnumber >= 8  %}

{% set kernelpkg = salt['kernelpkg.active']() %}
{% set kmod_list = salt['kmod.mod_list']() %}

kernelpkg:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/kernelpkg.txt
    - makedirs: True
    - contents: |
        {{ kernelpkg }}

kmod_list:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/kmod.txt
    - makedirs: True
    - contents: |
        {{ kmod_list | json }}

{% endif %}
