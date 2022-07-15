g++ -o address_binding address_binding.cpp -L /usr/lib/restbed -l restbed

LD_LIBRARY_PATH=/usr/lib/restbed ./address_binding &

curl -XGET 'http://127.0.0.1:1984/resource'

