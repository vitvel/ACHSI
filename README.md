Analytic continuation of the nested harmonic sums with real negative and positive indices and purely imaginary negative and positive indices near negative and positive integer values

This is the extended version of database and MATHEMATICA-code used in the paper by Velizhanin V.N. "Analytic continuation of harmonic sums with imaginary indices near integer values", https://arxiv.org/abs/2210.14214

The ACHSI.m file contains all the functions required for analytic continuation. The list of functions is as follows:  
    HS - definition of nested harmonic sums  
    ZSToHS - convert Euler-Zagier sums to usual nested harmonic sums  
    SToPsi - convert nested harmonic sums to combination of Psi-functions and MZV's  
    Li1Extract - extract Li({1},{1}) from multiple polylogarithm  
    ZetaSubs - MZV's substitution  
    SDiffW - differentation of Z-sums, harmonic sums or MZV over w  
    PsiAC - analytic continuation of Psi-function  
    HSAC - analytic continuation of nested harmonic sum  
    LiNSubs - numerical values for MZV's basis

The ACHSI.m file contains examples of the above functions.

The files LiSubsRew1w6.m and LiSubsImw1w6.m contain relations between multiple polylogarithms with arguments -1, 1, -I, I up to weight 6. The basis of multiple polylogarithms is denoted as LiB[a1, a2, ..., aL]

The files LiSubsRew1w7.m and LiSubsImw1w7.m contain relations between multiple polylogarithms with arguments -1, 1, I for weight 7. The basis of multiple polylogarithms is denoted as LiB[a1, a2, ..., aL]

The gammaNNLOABJM.m file contains the result for the anomalous dimension of the twist-1 operator in the ABJM model up to the third order from the paper R.N. Lee and A.I. Onishchenko "ABJM quantum spectral curve at twist 1: algorithmic perturbative solution", JHEP 11 (2019) 018, https://arxiv.org/abs/1905.03116 (for first to order see also the paper R.N. Lee and A.I. Onishchenko  "ABJM quantum spectral curve and Mellin transform", JHEP 05 (2018) 179, https://arxiv.org/abs/1712.00412).
