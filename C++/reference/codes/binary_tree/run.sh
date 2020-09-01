g++ -c -std=c++11 BinaryTree.cpp -g -I . -o BinaryTree.o
g++ -c -std=c++11 main.cpp -g -I . -o main.o
g++ -o main main.o BinaryTree.o
rm *.o