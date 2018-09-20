# BP 节点启动步骤

0. BP配置：  
  2 核CPU & 16 GB 内存
  
1. Clone这个工程到刚刚启动的BP机器上：  
  `git clone https://github.com/eosiosg/bp-tutorial`
  
2. 安装eos:  
	a.`git clone https://github.com/EOSIO/eos --recursive && cd eos`；  
	b. git checkout到需要的版本上；  
	c. `git submodule update --init --recursive`；  
	d. run `./eosio_build.sh`, build的过程可能需要超过30分钟；  
	e. `sudo ./eosio_install.sh`.  
  
3. 运行 `cleos` 以确认eos是否安装成功
  
4. 配置BP节点:  
  修改config-dir/config.ini，替换producer-name和signature-provider为所需要的bp account和bp 出块签名的key

5. 在`bp-tutorial`路径下启动eos BP节点:  
  `./start_node.sh`
  
6. 确认node运行状态：  
	a. 运行`cleos get info`，确认`chain_id` 为 `aca376f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906`;  
	b. 运行`tail -f logs/eos.log`，确认有类似`2018-09-20T04:12:52.136 thread-0   producer_plugin.cpp:330       on_incoming_block    ] Received block 284bc2507c03a1d0... #17347206 @ 2018-09-20T04:12:52.000 signed by xxxxxxxx [trxs: 10, lib: 17346873, conf: 0, latency: 136 ms]` 的日志(node第一次启动接收块的速度比较慢，需要耐心等待几分钟），证明节点正在正常同步，初次同步可能需要10个小时。  
 

# 注册BP & 领取BP收益

0. 等待BP node同步完成。

1. 在BP机器上或本地（推荐），重复执行上面的1～3步骤，确认eos安装成功。

2. 启动钱包服务：  
  在`bp-tutorial`路径下，运行`./start_wallet.sh`

3. 导入BP私钥至钱包：  
	a. 运行`cleos wallet create --file wallet.pw`, 创建默认钱包;  
	b. 运行`cleos wallet import --private-key *****PRIVATE_KEY*****`, 导入BP private key。  
	* 每次需要使用钱包里的key签名时，需确认钱包处于解锁状态，若钱包上锁，运行`cleos wallet unlock --password *****WALLET_PASSWORD*****`, 钱包的密码在`wallet.pw`文件中。

4. 注册BP：  
  `cleos system regproducer **BP的ACCOUNT NAME** **出块签名的PUBLIC KEY** **BP官网的URL**`
	* BP的官网 (e.g. https://eosio.sg) 中需要包括一个BP相关信息的 bp.json 文件 (e.g. https://eosio.sg/bp.json) 用来展示给社区。可以参考本工程的`bp-sample.json`

5. 领取BP收益：  
  `cleos system claimrewards **BP的ACCOUNT NAME**`
 	* BP收益每24小时只能领取一次






