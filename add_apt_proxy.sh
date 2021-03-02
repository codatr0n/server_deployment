echo "Adding Apt Cacher Proxy"
echo "Acquire::http::Proxy \"http://10.10.10.100:3142\";" | tee /etc/apt/apt.conf.d/00aptproxy > /dev/null;
