FROM python:3.12-slim
RUN pip install --no-cache-dir -I snmpsim-lextudio snmpsim-data-lextudio
RUN useradd --create-home --shell /bin/bash snmp
WORKDIR /home/snmp
COPY . .
USER snmp
CMD ["snmpsim-command-responder", "--data-dir=./data", "--agent-udpv4-endpoint=0.0.0.0:1611"]