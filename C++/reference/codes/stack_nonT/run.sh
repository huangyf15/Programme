g++ -c -std=c++11 Stack.cpp -g -I . -o Stack.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main Stack.o main.o
rm *.o