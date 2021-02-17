
{% set tstamp = salt["cmd.run"]("date +%Y-%m-%d") %}
{% set user_getent_dict = salt['user.getent']() %}

user_getent:
  file.managed:
    - name: /tmp/{{ grains.host }}/{{ tstamp }}/user_getent.txt
    - makedirs: True
    - contents: |
        {{ user_getent_dict | json }}
