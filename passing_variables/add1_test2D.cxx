#include <iostream>
#include <vector>
using namespace std;

extern "C"
{
   void add1(int*, int*, double*);
}

int main()
{
	//int *p1, *p2;
	int n1=4;
	int n2=2;

	double *pa;
	std::vector<double> A(n1*n2);
	//A={0.,1.,2.,3.,4.,5.,6.,7.};
	//for (int i=0; i<n1*n2; i++){
    //	A[i]=double(i);
	//}
	
	//p1=&n1;
	//p2=&n2;
	//pa=&A[0];

	for (int i=0; i<n1*n2; i++){
        cout << "[add1_test2D.cxx] A(" << i << ")=" << A[i] << endl;
	}

    add1(&n1,&n2,&A[0]);

    for (int i=0; i<n1*n2; i++){
        cout << "[add1_test2D.cxx] A(" << i << ")=" << A[i] << endl;
	}

   return 0;
}
