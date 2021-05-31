FROM faddat/sos-lite



COPY motd /etc/motd

# COPY gaia.service /etc/systemd/system/gaia.service

ENV GOPATH=/go



# Download starport, so we can join the network
RUN git clone https://github.com/faddat/starport --branch arm64-mac-linux && \
        cd starport && \
        make install && \
        cp /go/bin/starport /usr/bin/starport



