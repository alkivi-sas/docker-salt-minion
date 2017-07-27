FROM debian:stretch

ARG version=2017.7
ENV VERSION $version

RUN apt-get -qq update && \
    apt-get install -y wget apt-utils gnupg && \
    wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/apt/debian/9/amd64/${VERSION} stretch main" > /etc/apt/sources.list.d/saltstack.list && \
    apt-get update && apt-get install -y salt-minion && \
    mkdir -p /var/run/salt /etc/salt/pki/minion/minions && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN useradd --system salt && \
#    chown -R salt:salt /etc/salt /var/cache/salt /var/log/salt /var/run/salt && \
#    echo "user: salt" >> /etc/salt/minion

#VOLUME ['/etc/salt/pki', '/srv/salt']
ADD files/env.conf /etc/salt/minion.d/

ENTRYPOINT ["/usr/bin/salt-minion", "--log-file-level=quiet", "--log-level=debug"]
