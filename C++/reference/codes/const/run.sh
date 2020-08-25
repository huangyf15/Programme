g++ -c -std=c++11 sub.cpp -g -I . -o sub.o
g++ -c -std=c++11 ssub.cpp -g -I . -o ssub.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main ssub.o sub.o main.o
rm *.o