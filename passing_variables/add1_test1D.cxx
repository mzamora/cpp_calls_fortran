#include <iostream>
using namespace std;

extern "C"
{
   void add1(int*, int*, double*);
}

int main()
{
	int *p1, *p2;
	int n1=4;
	int n2=2;

	double *pa;
	double A[]={0.,1.,2.,3.,4.,5.,6.,7.};

	p1=&n1;
	p2=&n2;
	pa=&A[0];

	for (int i=0; i<n1*n2; i++){
        cout << "[add1_test1D.cxx] A(" << i << ")=" << A[i] << endl;
	}

    add1(p1,p2,pa);

    for (int i=0; i<n1*n2; i++){
    	A[i]=*(pa+i);
        cout << "[add1_test1D.cxx] A(" << i << ")=" << A[i] << endl;
	}

   return 0;
}
