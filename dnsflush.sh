# reset the DNS cache
if [ "`sw_vers -productVersion | awk -F '.' '{print $2}'`" -gt 9 ]; then
	sudo discoveryutil mdnsflushcache
	sudo discoveryutil udnsflushcaches
else
	dddscacheutil -flushcache
	sudo killall -HUP mDNSResponder
fi

# For Windows
# ipconfig /flushdns

# For Linux
# /etc/init.d/named restart
# /etc/init.d/nscd restart
