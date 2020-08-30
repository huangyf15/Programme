g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o
rm *.o