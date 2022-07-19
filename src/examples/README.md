Address binding
g++ -g -o address_binding address_binding.cpp -L /usr/lib/restbed -l restbed
./address_binding &
curl -XGET 'http://127.0.0.1:1984/resource'

Maltipath resources
g++ -g -o multipath_resources multipath_resources.cpp -L /usr/lib/restbed -l restbed
./multipath_resources &
curl -w'\n' 'http://localhost:1984/messages'
curl -w'\n' 'http://localhost:1984/queues/12/messages'

Multithreaded service
g++ -g -o multithreaded_service multithreaded_service.cpp -L /usr/lib/restbed -l restbed
./multithreaded_service &
curl -w'\n' -X GET 'http://localhost:1984/resource'

