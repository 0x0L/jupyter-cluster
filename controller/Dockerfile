FROM 0x0l/notebook:latest

RUN mkdir /var/run/sshd \
 && apt-get install -y \
      openssh-server \
      supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start_controller.sh /usr/local/bin/start_controller.sh
RUN chmod u+x /usr/local/bin/start_controller.sh

EXPOSE 22
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
