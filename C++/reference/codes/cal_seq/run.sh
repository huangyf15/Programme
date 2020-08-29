g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -c -std=c++11 def_seq.cpp -g -I . -o def_seq.o
g++ -o main def_seq.o main.o
rm *.o