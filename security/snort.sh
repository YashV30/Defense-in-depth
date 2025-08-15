#!/bin/bash

# ========================================================
# Snort IDS Installation & Basic Configuration Script
# --------------------------------------------------------
# Tested on Debian-based systems
# This script installs Snort (v2.9.20) from source, 
# configures basic rules, and sets up required directories.
#
# NOTE: You must have root privileges to run this.
# ========================================================


sudo apt-get install -y bison ca-certificates flex gcc libdumbnet-dev libluajit-5.1-dev libnghttp2-dev libpcap-dev libpcre3-dev libssl-dev make openssl zlib1g-dev wget


sudo mkdir -p /usr/src/snort_src
sudo cp ../zip/daq-2.0.7.tar.gz snort-2.9.20.tar.gz /usr/src/snort_src
cd /usr/src/snort_src
sudo tar -zxf daq-2.0.7.tar.gz
cd  daq-2.0.7
sudo ./configure
suldo make
sudo make install

#Png image links :
#Create a symlink for multiple files: (File in Server)

sudo ln -s /usr/include/tirpc/netconfig.h /usr/include

sudo ln -s /usr/include/tirpc/rpc/rpc.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/types.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/xdr.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/auth.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/clnt_stat.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/clnt.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/clnt_soc.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/rpc_msg.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/auth_unix.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/auth_des.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/svc_auth.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/svc.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/svc_soc.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/pmap_clnt.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/pmap_prot.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/rpcb_clnt.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/rpcb_prot.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/svc_mt.h /usr/include/rpc

sudo ln -s /usr/include/tirpc/rpc/rpcent.h /usr/include/rpc


_________________________________________

#Install snort on (snort-2.9.20.tar.gz)

sudo tar -zxf snort-2.9.20.tar.gz
cd /usr/src/src_snort/snort-2*  
sudo  ./configure  
sudo make    
sudo make install   
sudo ldconfig (Load in the memory)  
sudo snort -v
sudo snort -i ens33 (Packet Capture Mode)

sudo groupadd snort  
sudo useradd snort -r -s /usr/sbin/nologin -c SNORT_IDS -g snort 

sudo mkdir -p /etc/snort/rules  
sudo mkdir /var/log/snort  
sudo mkdir /usr/local/lib/snort_dynamicrules

sudo cp /usr/src/snort_src/snort-2.9.20/etc/*.conf /etc/snort  
sudo cp /usr/src/snort_src/snort-2.9.20/etc/*.map /etc/snort

sudo touch /etc/snort/rules/white_list.rules  
sudo touch /etc/snort/rules/black_list.rules  
sudo touch /etc/snort/rules/local.rules

sudo chmod -R 5775 /etc/snort/  
sudo chmod -R 5775 /var/log/snort/  
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules/  
sudo chown -R snort:snort /etc/snort/  
sudo chown -R snort:snort /var/log/snort/  
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules/

sudo nano /etc/snort/snort.conf  
<br/> c:\snort\rules
var RULE_PATH /etc/snort/rules
var SO_RULE_PATH /etc/snort/so_rules
var PREPROC_RULE_PATH /etc/snort/preproc_rules 

change this for black and white list also.

var WHITE_LIST_PATH /etc/snort/rules
var BLACK_LIST_PATH /etc/snort/rules

Comment all the rules (step :7)  
except :- include local, blacklist and whitelist

# site specific rules
include $RULE_PATH/local.rules
include $RULE_PATH/white_list.rules
include $RULE_PATH/black_list.rules

add a rule in local rule
sudo nano /etc/snort/rules/local.rules
Inside file
alert ip any any -> any any (msg: "ABC xyz"; sid: 1000003;)

sudo snort -T -c /etc/snort/snort.conf

sudo snort -i ens33 -u snort -g snort -c /etc/snort/snort.conf -A console
