nohup nodeos --data-dir ./data --config-dir ./config-dir   > ./logs/eos.log 2>&1 &
echo $! > ./eos.pid
