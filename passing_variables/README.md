Three examples of passing variables to fortran

# add1_test
Creates a scalar in c++, passes it to fortran where 1 is added and returned to c++.

How to compile and run:
```
gfortran -c add1.f90
g++ -c add1_test.cxx
g++ add1.o add1_test.o -o test0D -lgfortran
./test0D
```

# add1_test1D
Creates a 1D vector in c++, passes it to fortran by using pointers. In fortran a 1 is added and returned 
to c++

How to compile and run:
```
gfortran -c add1_1D.f90
g++ -c add1_test1D.cxx
g++ add1_1D.o add1_test1D.o -o test1D -lgfortran
./test1D
```

# add1_test2D
Creates a 1D vector of size n1*n2 and passes it to fortran where it is read as a matrix of size (n1,n2). 
A 1 is added and the matrix returned. C++ reads a vector back, but the adding was done where we wanted it

How to compile and run:
```
gfortran -c add1_2D.f90
g++ -c add1_test2D.cxx
g++ add1_2D.o add1_test2D.o -o test2D -lgfortran
./test2D
```


