g++ -c -std=c++11 NumSeq.cpp -g -I . -o NumSeq.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o NumSeq.o
rm *.o