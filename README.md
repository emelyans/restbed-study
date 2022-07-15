# restbed-study

docker run -it --rm emelyans/restbed:latest

g++ -o address_binding address_binding.cpp -I /usr/src/restbed/distribution/include -L /usr/src/restbed/distribution/library -l restbed

LD_LIBRARY_PATH=/usr/src/restbed/distribution/library ./address_binding &

curl -XGET 'http://127.0.0.1:1984/resource'

