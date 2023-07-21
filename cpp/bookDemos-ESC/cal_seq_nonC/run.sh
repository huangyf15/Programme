g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -c -std=c++11 NumSeq.cpp -g -I . -o NumSeq.o
g++ -o main NumSeq.o main.o
rm *.o