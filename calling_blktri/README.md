Trying to call blktri (From NCAR's [FISHPACK](https://www2.cisl.ucar.edu/resources/legacy/fishpack) 
library), which is in fortran, from c++.

# test_blktri.y90: Calling blktri from fortran
We first try to see if we can calling correctly from fortran.

Compile and run:
```
gfortran -o test_f test_blktri.f90 comf.f blktri.f
./test_f
```
Gives both values of error as 0: success!

# test_blktri.cpp: Calling blktri from C++

Compile and run:
```
gfortran -c fishpack_wrapper.f90 comf.f blktri.f
g++ -c test_blktri.cpp
g++ fishpack_wrapper.o blktri.o comf.o test_blktri.o -o test_cpp -lgfortran
./test_cpp
```

First error is 4 :(. Values of y after solving differ from the fortran test.
