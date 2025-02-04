FROM mageia:7

ADD rpm*.tar.gz /
RUN urpmi --auto libgtk+2 pulseaudio "typelib(DBusGLib)" fping \
libxt xdg-utils abattis-cantarell-fonts wget && urpmi /*.rpm && rm -f ./*.rpm && urpmi --clean && \
wget http://linux.palemoon.org/datastore/release/palemoon-29.4.4.linux-x86_64-gtk2.tar.xz && \
tar -xvf /*.tar.xz; rm -f /*.tar.xz && echo "SocksPort 9055" >> /etc/tor/torrc && \
echo -e '#!/bin/bash\n\n/usr/bin/tor --runasdaemon 1 --defaults-torrc \
/usr/share/tor/defaults-torrc -f /etc/tor/torrc\n \
/bridges/bridges & /palemoon/palemoon' > /start.sh && chmod 665 /start.sh

CMD ["/bin/bash","-c","/start.sh"]

