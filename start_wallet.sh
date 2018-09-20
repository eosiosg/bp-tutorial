nohup keosd -d ./wallet --config-dir ./wallet --http-server-address localhost:8900 > ./logs/wallet.log 2>&1 &
echo $! > ./wallet.pid
