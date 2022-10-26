(* Load package *)

<<"ACHSI.m";

(* Load database *)

DLiSubsRe = Dispatch[Get["LiSubsRew1w6.m"]]; 
DLiSubsIm = Dispatch[Get["LiSubsImw1w6.m"]]; 

(* Up to weight 7
DLiSubsRe = Join[Get["LiSubsRew1w6.m"],Get["LiSubsRew7.m"]]//Dispatch;
DLiSubsIm = Join[Get["LiSubsImw1w6.m"],Get["LiSubsImw7.m"]]//Dispatch;
 *)


(* Convert nested harmonic sums to combination of Psi-functions and MZV's *)

SToPsi[S[-1,2I,-3]]

(* Extract Li({1},{1}) from multiple polylogarithm *)

Li1Extract[Li[1, 1, 2 I]]

(* Evaluation of nested harmonic sum *)

HS[2,-1,I, 2]

S[2,-1,I] /. S[a__] :> HS[a, 2]

(* Analytic continuation of Psi-function *)

PsiAC[S[2,-1,I],-3,1,0]

(* Analytic continuation of nested harmonic sum *)

HSAC[S[2, 2 I], -3, 1, 1]

(* Numerical evaluation for above analytic continuation *)

HSAC[S[2,2I],-3,1,1]/.LiNSubs/.S[a__]:>HS[a,Abs[-3]-1]//N[#,5]&

(* Load the anomalous dimension of twist-1 operators in ABJM model up to third order, computed by R.N. Lee and A.I. Onishchenko in JHEP 05 (2018) 179 arXiv:1712.00412 and JHEP 11 (2019) 018, arXiv:1905.03116 *)

gammaNNLOABJM=<<"gammaNNLOABJM.m";

(* Convert the result for anomalous dimension in ABJM model from H-sums to the usual nested harmonic sums *)

gammaNNLOABJMHS=gammaNNLOABJM/.H[a__]:>HH[a]//.HH[a___,b_/;Sign[b]==I, c___]:>(HH[a,Abs[b]II,c]+HH[a,-Abs[b]II, c])/2/.II->I/.HH[a__]:>S[a]//Expand//Collect[#,h]&;

(* Analytic continuation of anomalous dimension in ABJM model at the "BFKL" value *)

gammaLOABJMHSBFKL=Coefficient[gammaNNLOABJMHS,h^2] /. S[a__]:>(HSAC[S[a], -1*2, 2*2, 0]/.w->-w)+(HSAC[S[a], 0*2, 2*2, 0])//Expand//Collect[#,w]&;
gammaNLOABJMHSBFKL=Coefficient[gammaNNLOABJMHS,h^4] /. S[a__]:>(HSAC[S[a], -1*2, 2*2, 0]/.w->-w)+(HSAC[S[a], 0*2, 2*2, 0])//Expand//Collect[#,w]&;
gammaNNLOABJMHSBFKL=Coefficient[gammaNNLOABJMHS,h^6] /. S[a__]:>(HSAC[S[a], -1*2, 2*2, 0]/.w->-w)+(HSAC[S[a], 0*2, 2*2, 0])//Expand//Collect[#,w]&;

Coefficient[gammaLOABJMHSBFKL,1/w]*h^2/w+Coefficient[gammaNLOABJMHSBFKL,1/w^2]*h^4/w^2+Coefficient[gammaNNLOABJMHSBFKL,1/w^3]*h^6/w^3/.S[a__]:>HS[a,0]

(* Analytic continuation of anomalous dimension in ABJM model at the "slope" value N=0, analytically computed by N. Gromov and G. Sizov in the paper "Exact Slope and Interpolating Functions in N=6 Supersymmetric Chern-Simons Theory", Phys. Rev. Lett. 113 (2014), no. 12 121601, arXiv:1403.1894 *)

gammaNNLOABJMHSSlope=gammaNNLOABJMHS/.S[a__]:>(HSAC[S[a],0*2,0*2,1])/.S[a__]:>HS[a,0]//Expand//Collect[#,w]&
