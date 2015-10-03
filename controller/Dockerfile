FROM 0x0l/notebook:latest

RUN mkdir /var/run/sshd \
 && apt-get install -y openssh-server \
 && pip3 install -q git+https://github.com/Supervisor/supervisor.git

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start_controller.sh /usr/local/bin/start_controller.sh
RUN chmod u+x /usr/local/bin/start_controller.sh

EXPOSE 22
ENTRYPOINT ["/usr/local/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
