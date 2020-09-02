g++ -c -std=c++11 Triang.cpp -g -I . -o Triang.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o Triang.o
rm *.o