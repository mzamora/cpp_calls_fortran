#include <iostream>
#include <vector>
using namespace std;

extern "C"
{
    extern void c_blktri(int*, const int*, const int*, double*, double*, double*, const int*, const int*, double*, double*, double*, const int*, double*, int*, double*, const int*);
}

int main()
{
    const int n   = 64;
    const int m   = 64;	
    const int k_blktri=1676; //dimension of w_blktri
    std::vector<double> an(n,double(1.));
    std::vector<double> bn(n,double(-2.));
    std::vector<double> cn(n,double(1.));
    std::vector<double> am(m,double(1.));
    std::vector<double> bm(m,double(-2.));
    std::vector<double> cm(m,double(1.));
    int iflag; // to initialize/run
    int ierror = 0;
    int np=0; // periodicity
    int mp=0; // periodicity
    int i;
    int k;

    std::vector<double> y_blktri(n*m, double(0.)); //right hand size, then output
    std::vector<double> w_blktri(k_blktri, double(0.));//w_blktri(k_blktri);

    //blktri: initialize
    iflag = 0;
    c_blktri(&iflag,&np,&n,&an[0],&bn[0],&cn[0],&mp,&m,&am[0],&bm[0],&cm[0],&m,&y_blktri[0],&ierror,&w_blktri[0],&k_blktri);
    std::cout << "[test_blktri.cpp] Error:"<< ierror << "\n";

    //blktri: solve
    iflag = 1;
    c_blktri(&iflag,&np,&n,&an[0],&bn[0],&cn[0],&mp,&m,&am[0],&bm[0],&cm[0],&m,&y_blktri[0],&ierror,&w_blktri[0],&k_blktri);
    std::cout << "[test_blktri.cpp] Error:"<< ierror << "\n";

   return 0;
}

