#include <iostream>
using namespace std;


extern "C"
{
   void add1(int*, int*, double*);
}

int main()
{
	//double A[9]={0.,1.,2.,3.,4.,5.,6.,7.,8.};
	double A=1.;
	int n1=3;
	int n2=3;
	cout << "[add1_test.cxx:]" << A << endl;

    add1(&n1,&n2,&A);

    A=A+1;
    cout << "[add1_test.cxx:]" << A << endl;

   return 0;
}
