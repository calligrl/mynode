#!/bin/bash

# Message
echo "Stopping myNode services..."

# Mark we are shutting down
touch /tmp/shutting_down


# Stop additional services
systemctl stop glances lndhub netdata rtl webssh2 whirlpool dojo
systemctl stop btcpayserver btc_rpc_explorer specter caravan lnbits
systemctl stop thunderhub


# Manually stop services (backup)
/opt/mynode/dojo/docker/my-dojo/dojo.sh stop || true


# Stop core services
systemctl stop electrs loopd lnd quicksync bitcoind


# Sync filesystem
sync
