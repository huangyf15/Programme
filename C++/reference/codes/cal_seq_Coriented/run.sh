g++ -c -std=c++11 NumSeq.cpp -g -I . -o NumSeq.o
g++ -c -std=c++11 Fibonacci.cpp -g -I . -o Fibonacci.o
g++ -c -std=c++11 Pell.cpp -g -I . -o Pell.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o NumSeq.o Fibonacci.o Pell.o
rm *.o