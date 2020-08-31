g++ -c -std=c++11 LibMat.cpp -g -I . -o LibMat.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o LibMat.o
rm *.o