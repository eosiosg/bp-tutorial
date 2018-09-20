nohup nodeos --data-dir ./data-dir --config-dir ./config-dir --genesis-json ./config-dir/genesis.json  > ./logs/eos.log 2>&1 &
echo $! > ./eos.pid
