! May 2006: E. J. Silke, W. J. Pitz and C. K. Westbrook
! Addition of low and high temperature chemistry for cyclohexane
! chx_all_ver1h.mech - includes everything (name change from J. Orme naming scheme to comply with that of Silke et al.
! AND commenting out of the rxns in mch portion that are duplicates with those in chx portion of mech.)
! chx_all_verhR.mech - using Ranzi data from his 2006 Symp. paper for qooh = qo + oh
! 14jun06 chx_all_verhRa.mech - using Ranzi rate for qooh = qo + oh, ro2 elim with reduced A-factor
! and new rate for qooh = olefin + ho2
! 19jun06: chx_all_verk4.mech includes [1] changes made to hx5enal4j - sec allylic H abs rates. [2] rate reduction of 
! hx1en6q6j = chx1q3j - adjusted to match hex5enal formation reported by Lemaire. [3] 1,3epoxy - Ranzi Ea of 23.4kcal
! reduced to 20 kcal, to match 1,3epoxy reported by Lemaire. 
! [4] ro2 elim. rxn - A-factor of Ranzi/2.6 - match IDT of Lemaire.
! 22jun06: chx_all_verk5.mech --- corrections made to [1] pro13dial and sc3h5co (previously called bt2n4*o1j 
! but found to be a duplicate species) 
! [2] 1,2- and 1,4-epoxy - Ranzi Ea varied to match expt data of Lemaire.
! 26jun06: chx_all_verk6.mech --- [1] 1,2- and 1,4-epoxy - Ranzi Ea further varied to match expt data of Lemaire.
! 27jun06: chx_all_ver7.mech --- [1] c2h3chcho + cychexene = ac3h5cho + cyhx1n4j is drain of cyhx1n4j, 
! which is need for path producing cyhx13ene and then c6h6. Reduced both A-factor of this reaction to 1.05e-1 and 
! increased Ea to 20kcal 
! [2] chx_all_verk8.mech --- Commented out reaction in [1] to see effect (that is, on c6h6 and cyhx13ene amounts) 
! 3july06: chx_all_verl.mech --- Therm for both ac3h5cho and related radical c2h3chcho were fixed and updated in chx_ver1g.therm
! rate for rxn cychexene + ch2chcho = ac3h5cho returned BACK to original mch CVN value (that in use in verk6.mech)
! 5july06: chx_all_verl2.mech Low T range chem shown to to proceed via "3" RO2 species (chx1q3j) 
! Here EJS changed chx1*o3q = chx1*o3oj + oh is the loss of 2nd oh in the decomposition of the ketohydroperoxide. 
! The rate for this step was redefined using 1.5e+16 0. 42000. as recommended in ic8 paper
! 5july06: chx_all_verl3.mech - as in verk2, but rate now applied to chx1*o2q and chx1*o4q ketos also.
! These are less important thru-put channels
! 6july06: chx_all_verl4.mech For QOOH -- the rxn cychexene + ho2 - chx1q2j 
! was uncommented so that rate in use for this now defined at MCH rate of 8.0e+10 0.0 6000.
! 6july06: chx_all_verl5.mech --- rate used above in verl2 and l3 for loss of oh applied to similar rxns in the 
! alternative o2qooh channels that result in a loss of oh in a simialr manner - wrong!
! 7july06: chx_all_verl6.mech --- [1] undid change applied in l5. Incorrect - energy barriers are different for 
! the alt. o2qooh. [2] ro2 = cychexene + ho2 - a-factor returned to original Ranzi value (7.7e+12) - no longer divided by 2.6
! 7july06: chx_all_verl7.mech --- [1] changed a-factor in ro2 elim rxn back so that it was divided by 2.6 again. 
! [2] chxo2j = chx1q2j (5mem) let Ea = 33000. Ea = Ea(direct elimination) + 4 kcal
! (4 kcal from DeSain, Klippenstein, Miller, and Taatjes, JPCA, 2003.)  
! 7july06: chx_all_verl8.mech --- a-factor of ro2 elim divided by 2.0
! 10july05: chx_all_verl9.mech - fixing of 12Epoxy. Rate for 12epoxy returned to that recommened in Ranzi paper:
! ie. 2.9e-12 0.0 15400.                          
! 10july06: chx_all_verm1.mech - fixing of 12Epoxy. Ea reduced to 14kcal. ie. 2.9e-12 0.0 14000.
! 10july06: chx_all_verm2.mech - fixing of 12Epoxy. Ea further reduced to 12.5kcal. ie. 2.9e-12 0.0 12500.
! 11july06: chx_all_verm3.mech - fixing of 12Epoxy. Ea reduced again to 10kcal. ie. 2.9e-12 0.0 10000.
! 11july06: chx_all-verm4.mech - 12epoxy rate is not rate limiting (ro2=qooh 5 mem is) so changing the Ea has little effect.
! Here reduce Ea of ro2=qooh 5 mem from 33kcal to 31kcal AND put Ea for 12peoxy back to 15.4kcal (Ranzi) 
! 12july06: chx_all_verm5.mech - ro2=qooh 5 mem at 31kcal still AND now reduce Ea of chxyo12 formation from 15.4 to 13.4 kcal
! 13july06: chx_all_verm6.mech - A factor increase by factor of 2 for BOTH ro2=qooh (5 mem) and qooh = chxyo12 + oh
! 13july06: chx_all_verm7.mech - rate variation of chx + ho2. Use Walker chx + ho2 specific rate PCCP 2001
! 13july06: chx_all_verm8.mech - H abs by ho2 from aldehydic site - Eiteneer and Frenklach rate applied JPCA(1998)
! 3aug06: chx_all_verm9.mech - typo correction for formation of chxyo14 - Afactor should be 8.6e+12 (not 8.16e+12 as previously mistyped)
! and Degeneracy for o2qooh = various alternatives accounted for.
! 25sept06: chx_all_verm10.mech - chxo2j + ho2 = chxo2h + o2 rxn rate changed ! A-factor increased by factor of 3 in effort to boost this rxn, 
! increase formation of OH and increase IDT at low T. Rate used 5.25e+11 0. -1711
! 26sept06: chx_all_vern1.mech - chxo2j + ho2 = chxo2h + o2 ! A-factor reduced /3 to decrease rate const for this rxn
! Used 5.83e+10 0. -1711
! 27sept06: chx_all_vern2.mech - chxo2j + ho2 = chxo2h + o2 ! Rate adjusted to be that of Lightfoot et al. J Chem. Soc. 
! Faraday Trans. 1991. Mistake in mch calling it ic8 ref. Lightfoot rate is 1.75e+10 0. -3275 - this is to be used now 
! 5oct06: chx_all_vern3.mech - cyhx1n3j + o2 = cyhx13ene + ho2 ! rxn added using rate of Bozzelli and Lee.
! cyhx13ene + h = cyhx1n3j ! A-factor x 2, Ea reduced from 2.6->1.5 kcla. Allylic rad. and Ea should be less.
! cyhx13ene + h = cyhx1n4j ! A-factor x2 since d = 2; cyhx14ene + h = cyhx1n4j ! A-factor x4, since d = 4.
! 6oct06: chx_all_vern4.mech - cyhx1n3j + o2 = cyhx13ene + ho2 ! Apply rate of Baldwin and Walker from 1981 Symp paper
! on alkenes. 2.1e+9 0. 0.
! 9oct06: chx_all_vern5.mech - 'Fixing of c4h814'. Diradical excluded, and reactions where it was allowed has been 
! re-written using krev from RevAll calc. These include c7h1416 and c7h14af.
! 10oct06: chx_all_vern5.mech - Fixing of c7h1416, c7h14af, c7h14gl. Commneted out c2h4 + h = c2h5 from Wang section of
! mech - duplicate and incorrect.                                             
Elements                                            
c h o ar n                                          
end
Species
h              h2             o              o2             oh         
h2o            n2             co             hco            co2         
ch3            ch4            ho2            h2o2           ch2o        
ch3o           c2h6           c2h4           c2h5           ch2         
ch             c2h            c2h2           c2h3           ch3oh       
ch2oh          ch2co          hcco           c2h5oh         pc2h4oh     
sc2h4oh        ch3co          ch2cho         ch3cho         c3h4-a      
c3h4-p         c3h6           c4h6           nc3h7          ic3h7       
c3h8           ic4h7          ic4h8          c4h7           c4h8-2   
c4h8-1         sc4h9          pc4h9          tc4h9          ic4h9       
ic4h10         c4h10          ch3coch3       ch3coch2       c2h5cho     
c2h5co         
c2h5o       
ch3o2          c2h5o2         ch3o2h         c2h5o2h        c2h3o1-2    
ch3co2         c2h4o1-2       c2h4o2h        o2c2h4oh    
ch3co3         ch3co3h        c2h3co         c2h3cho        c3h5o       
c3h6ooh1-2     c3h6ooh1-3     c3h6ooh2-1     c3h6ooh1-2o2   c3h6ooh1-3o2
c3h6ooh2-1o2   nc3h7o         ic3h7o         nc3h7o2h       ic3h7o2h    
nc3h7o2        ic3h7o2        c3h6o1-3       ic4h8o         ic4h8oh     
io2c4h8oh      ic4h7o         c4h7o          c4h8oh-1       c4h8oh-2    
c4h8oh-1o2     c4h8oh-2o2     c4h8ooh1-2o2   c4h8ooh1-3o2   c4h8ooh1-4o2
c4h8ooh2-1o2   c4h8ooh2-3o2   c4h8ooh2-4o2   tc4h8ooh-io2   ic4h8ooh-io2
ic4h8ooh-to2   c4h8ooh1-2     c4h8ooh1-3     c4h8ooh1-4     c4h8ooh2-1  
c4h8ooh2-3     c4h8ooh2-4     ic4h8o2h-i     ic4h8o2h-t     tc4h8o2h-i  
c4h8o1-2       c4h8o1-3       c4h8o1-4       c4h8o2-3       cc4h8o      
pc4h9o         sc4h9o         ic4h9o         tc4h9o         pc4h9o2h    
sc4h9o2h       ic4h9o2h       tc4h9o2h       tc4h9o2        ic4h9o2     
sc4h9o2        pc4h9o2        ch3coch2o2     ch3coch2o2h    ch3coch2o 
c3h5-a         c3h5-s   
c3h5-t         c3h3           c3h2           c3h6o1-2       ho2cho  
o2cho          ocho           ch2(s)         c3ket12       
c3ket13        c3ket21        nc4ket12       nc4ket13       nc4ket14  
nc4ket21       nc4ket23       nc4ket24       ic4ketii       ic4ketit 
!C5 species
c5h9           c5h10-1        c5h10-2        ic5h12      
ac5h11         bc5h11         cc5h11         dc5h11         ac5h10      
bc5h10         cc5h10         ic5h9          nc5h12         c5h11-1  
c5h11-2        c5h11-3        neoc5h12       neoc5h11       
neoc5ketox     neoc5kejol     ac5h11o2       bc5h11o2       cc5h11o2    
dc5h11o2       ac5h11o2h      bc5h11o2h      cc5h11o2h      dc5h11o2h   
ac5h11o        bc5h11o        cc5h11o        dc5h11o        ac5h10ooh-a 
ac5h10ooh-b    ac5h10ooh-c    ac5h10ooh-d    bc5h10ooh-a    bc5h10ooh-c 
bc5h10ooh-d    cc5h10ooh-a    cc5h10ooh-b    cc5h10ooh-d    dc5h10ooh-a 
dc5h10ooh-b    dc5h10ooh-c    ac5h10ooh-ao2  ac5h10ooh-bo2  ac5h10ooh-co2
ac5h10ooh-do2  bc5h10ooh-ao2  bc5h10ooh-co2  bc5h10ooh-do2  cc5h10ooh-ao2
cc5h10ooh-bo2  cc5h10ooh-do2  dc5h10ooh-ao2  dc5h10ooh-bo2  dc5h10ooh-co2
a-ac5h10o      a-bc5h10o      a-cc5h10o      a-dc5h10o      b-cc5h10o  
b-dc5h10o      c-dc5h10o      c5h11o2-1      c5h11o2-2      c5h11o2-3 
c5h11o2h-1     c5h11o2h-2     c5h11o2h-3     c5h11o-1       c5h11o-2 
c5h11o-3       c5h10ooh1-2    c5h10ooh1-3    c5h10ooh1-4    c5h10ooh1-5
c5h10ooh2-1    c5h10ooh2-3    c5h10ooh2-4    c5h10ooh2-5    c5h10ooh3-2
c5h10ooh3-1    c5h10ooh1-2o2  c5h10ooh1-3o2  c5h10ooh1-4o2  c5h10ooh1-5o2
c5h10ooh2-1o2  c5h10ooh2-3o2  c5h10ooh2-4o2  c5h10ooh2-5o2  c5h10ooh3-1o2
c5h10ooh3-2o2  c5h10o1-2      c5h10o1-3      c5h10o1-4      c5h10o1-5  
c5h10o2-3      c5h10o2-4      neoc5h11o2     neoc5h11o2h    neoc5h11o 
neoc5h10ooh    neoc5h10ooh-o2 neo-c5h10o     
neoc5ket       nc5ket12       nc5ket13       nc5ket14       nc5ket15 
nc5ket21       nc5ket23       nc5ket24       nc5ket25       nc5ket31        
nc5ket32       ic5ketaa       ic5ketab       ic5ketac       ic5ketad
ic5ketca       ic5ketcb       ic5ketcd       ic5ketda       ic5ketdb
ic5ketdc       
!
ic4h7-i1       c3h6oh         hoc3h6o2       
ic4h7ooh       ic3h5cho       tc3h6ocho      tc3h6cho 
ic3h7cho       ic4h7oh        ic3h6co        ic4h6oh        ic3h5co 
ic3h7co        tc3h6o2cho     tc3h6o2hco     ic3h5o2hcho    tc3h6ohcho 
tc3h6oh        ic3h5oh        tc4h8cho       o2c4h8cho      o2hc4h8co 
c3h5oh         ch2cch2oh      nc3h7cho       nc3h7co  
ch2ch2coch3    c2h5coch2      c2h5coch3      ch2choohcoch3 
ch3choococh3   ch3chcoch3     c2h3coch3      ch3chco        ch2ch2cho   
c3h6cho-3      c3h6cho-2      c2h5chco       ic3h5coch3     ic3h5coch2 
ac3h4coch3     sc3h5coch2     ch3chocho      ch3chcho       sc3h5cho  
sc3h5co        ic3h6cho       c3h6cho-1      c2h5coc2h5     c2h5coc2h4p
c2h5coc2h4s    c2h5coc2h3     pc2h4coc2h3    sc2h4coc2h3    ic3h6chcho 
ic3h6chcoch3   ac3h5chcoch3   ic3h6chcoch2
nc3h7coch3     nc3h7coch2     c3h6coch3-1    c3h6coch3-2    c3h6coch3-3
ic3h7coch3     ic3h7coch2     ic3h6coch3     tc3h6coch3     nc3h7coc2h5
c3h6coc2h5-1   c3h6coc2h5-2   c3h6coc2h5-3   nc3h7coc2h4p   nc3h7coc2h4s
ic3h7coc2h5    ic3h6coc2h5    tc3h6coc2h5    ic3h7coc2h4p   ic3h7coc2h4s
ic3h7coc2h3    ic3h6coc2h3    tc3h6coc2h3    ic3h5coc2h5    ac3h4coc2h5
ic3h5coc2h4p   ic3h5coc2h4s   
nc4h9cho       nc4h9co        ac3h5cho  
hoch2o         hocho          
ac3h5co        c2h3chcho      c4h8cho-1      c4h8cho-2      c4h8cho-3
c4h8cho-4      neoc5h9q2      neoc5h9q2-n    ic4h6q2-ii     
ic6h14         ac6h13         bc6h13         cc6h13 
dc6h13         ec6h13         ac6h12         bc6h12         cc6h12
dc6h12         ic6h11         ac6h13o2       bc6h13o2       cc6h13o2  
dc6h13o2       ec6h13o2       ac6h13o2h      bc6h13o2h      cc6h13o2h
dc6h13o2h      ec6h13o2h      ac6h13o        bc6h13o        cc6h13o 
dc6h13o        ec6h13o        ac6h12ooh-a    ac6h12ooh-b    ac6h12ooh-c
ac6h12ooh-d    ac6h12ooh-e    bc6h12ooh-a    bc6h12ooh-c    bc6h12ooh-d
bc6h12ooh-e    cc6h12ooh-a    cc6h12ooh-b    cc6h12ooh-d    cc6h12ooh-e
dc6h12ooh-a    dc6h12ooh-b    dc6h12ooh-c    dc6h12ooh-e    ec6h12ooh-a
ec6h12ooh-b    ec6h12ooh-c    ec6h12ooh-d    a-ac6h12o      a-bc6h12o 
a-cc6h12o      a-dc6h12o      a-ec6h12o      b-cc6h12o      b-dc6h12o
b-ec6h12o      c-dc6h12o      c-ec6h12o      d-ec6h12o      ac6h12ooh-ao2
ac6h12ooh-bo2  ac6h12ooh-co2  ac6h12ooh-do2  ac6h12ooh-eo2  bc6h12ooh-ao2
bc6h12ooh-co2  bc6h12ooh-do2  bc6h12ooh-eo2  cc6h12ooh-ao2  cc6h12ooh-bo2
cc6h12ooh-do2  cc6h12ooh-eo2  dc6h12ooh-ao2  dc6h12ooh-bo2  dc6h12ooh-co2
dc6h12ooh-eo2  ec6h12ooh-ao2  ec6h12ooh-bo2  ec6h12ooh-co2  ec6h12ooh-do2
ic6ketaa       ic6ketab       ic6ketac       ic6ketad       ic6ketae   
ic6ketca       ic6ketcb       ic6ketcd       ic6ketce       ic6ketda  
ic6ketdb       ic6ketdc       ic6ketde       ic6ketea       ic6keteb 
ic6ketec       ic6keted       nc4h9cho-2     nc4h9co-2      c4h8cho1-2
c4h8cho2-2     c4h8cho3-2     c4h8cho4-2     ic4h9cho       ic4h9co   
ic3h6ch2cho    tc3h6ch2cho    ic3h7chcho     ic5h11cho      ic5h11co 
ac5h10cho      bc5h10cho      cc5h10cho      dc5h10cho      c4h7cho1-4 
c4h7co1-4      c4h6cho1-43    c4h6cho1-44    c4h7cho2-1     c4h7co2-1 
c4h6cho2-11    nc5h11cho-2    nc5h11co-2     c5h10cho1-2    c5h10cho2-2
c5h10cho3-2    c5h10cho4-2    c5h10cho5-2    ic4h9coch3     ic4h9coch2 
ic3h6ch2coch3  ic3h7chcoch3   tc3h6ch2coch3  neoc6h14       fc6h13    
gc6h13         hc6h13         neoc6h12       neoc6h11       fc6h13o2 
gc6h13o2       hc6h13o2       fc6h13o2h      gc6h13o2h      hc6h13o2h 
fc6h13o        gc6h13o        hc6h13o        fc6h12ooh-f    fc6h12ooh-g
fc6h12ooh-h    gc6h12ooh-f    gc6h12ooh-h    hc6h12ooh-f    hc6h12ooh-g
fc6h12ooh-fo2  fc6h12ooh-go2  fc6h12ooh-ho2  gc6h12ooh-fo2  gc6h12ooh-ho2
hc6h12ooh-fo2  hc6h12ooh-go2  f-fc6h12o      f-gc6h12o      f-hc6h12o  
g-hc6h12o      neoc6ketff     neoc6ketfg     neoc6ketfh     neoc6ketgf
neoc6ketgh     neoc6kethf     neoc6kethg     tc4h9cho       tc4h9co  
neoc5h11cho    neoc5h11co     tc4h9chcho     tc4h8ch2cho    ic4h7cho
ic4h7co        ac3h4ch2cho    ic3h5chcho     ic5h11cho-b    ic5h11co-b
ic5h10cho-ba   ic5h10cho-bc   ic5h10cho-bd   c4h7cho1-2     c4h7co1-2 
c4h6cho1-23    c4h6cho1-24    c4h7cho2-2     c4h7co2-2      c4h6cho2-21
c4h6cho2-24    ch2cchch3      tc4h9coch3     tc4h9coch2     tc4h8coch3 
ch2ccho        
ic6h13cho-b    ic6h13co-b     ac6h12cho-b
cc6h12cho-b    dc6h12cho-b    ec6h12cho-b    ic6h13cho-d    ic6h13co-d 
ac6h12cho-d    bc6h12cho-d    cc6h12cho-d    dc6h12cho-d    ec6h12cho-d
ic3h7coc3h7-i  ic3h7coc3h6-i  ic3h7coc3h6-t  tc4h9coc2h5    tc4h8coc2h5 
tc4h9coc2h4s   tc4h9coc2h4p   neoc5h11coch3  neoc5h10coch3  tc4h9chcoch3
neoc5h11coch2  neoc6h13cho    neoc6h13co     fc6h12cho      gc6h12cho  
hc6h12cho      ic4h7coch3     ic4h7coch2     ic3h5chcoch3   ac3h4ch2coch3
neoc6h11-h     cc6h11o-b      
nc6h14         c6h13-1        c6h13-2        c6h13-3      
c6h12-1        c6h12-2        c6h12-3        c6h11          c6h12o1-2   
c6h12o1-3      c6h12o1-4      c6h12o1-5      c6h12o2-3      c6h12o2-4   
c6h12o2-5      c6h12o3-4      c6h13o2h-1     c6h13o2h-2     c6h13o2h-3   
c6h13o2-1      c6h13o2-2      c6h13o2-3      c6h12ooh1-2    c6h12ooh1-3     
c6h12ooh1-4    c6h12ooh1-5    c6h12ooh2-1    c6h12ooh2-3    c6h12ooh2-4     
c6h12ooh2-5    c6h12ooh2-6    c6h12ooh3-1    c6h12ooh3-2    c6h12ooh3-4     
c6h12ooh3-5    c6h12ooh3-6    c6h12ooh1-2o2  c6h12ooh1-3o2  c6h12ooh1-4o2   
c6h12ooh1-5o2  c6h12ooh2-1o2  c6h12ooh2-3o2  c6h12ooh2-4o2  c6h12ooh2-5o2   
c6h12ooh2-6o2  c6h12ooh3-1o2  c6h12ooh3-2o2  c6h12ooh3-4o2  c6h12ooh3-5o2   
c6h12ooh3-6o2  nc6ket12       nc6ket13       nc6ket14       nc6ket15    
nc6ket21       nc6ket23       nc6ket24       nc6ket25       nc6ket26    
nc6ket31       nc6ket32       nc6ket34       nc6ket35       nc6ket36    
c6h13o-1       c6h13o-2       c6h13o-3       
nc5h11cho      nc5h11co    
c5h10cho-1     c5h10cho-2     c5h10cho-3     c5h10cho-4     c5h10cho-5   
nc4h9coch3     nc4h9coch2     c4h8coch3-1    c4h8coch3-2    c4h8coch3-3    
c4h8coch3-4    c4h7ooh1-4     c4h7o1-4       c5h9ooh1-4     c5h9o1-4       
c5h9ooh1-5     c5h9o1-5       c6h11ooh1-4    c6h11o1-4      c6h11ooh1-5    
c6h11o1-5      c4h71-4        
!Add c7 olefins from MCH back in:
c7h13 c7h14-1 c7h14-2
ar
!------------- Toluene species --------------------------
! species from c6h5+o2
 c6h5o2 yoc6jdo rodc6jdo o*cc*ccj*o bicpd c6jyoo
! from NJIT toluene/benzene mech
 c6h5ch3 c6h6 cy13pd c6h5oh 
 c6h5cho  phch2oh  
 cy13pd5j c6h5oj      
 c*cc#c cyc5h8   ch2cy24pd cpdjch3
 ind naph styr dicypd  cyc5h4ch3  cyc5h9  c6h5 bicpdj     
 c#ccj c*cc*cj  c*cc*ccj 
 linc6h7  c*cc*cc ch3cy24pd  cyc5h7_1  c*ccjc*c
 cpdc*c  c*c*cc     
 chdko chdjko cypdone ch3oco hcocj*o      
 cyc5h5oj cyc5h5oh  cyc5h4oh  o*cjc*cc*c  cc*ccjo  
 cj*c*o 
 cj*cc*o o*choj  hcohco  cpdooh
 c*occjc*o dhco2j c*ocjoh cpdjone
 c*cc*c*o  cj*cc*c*o  c*cccj*o   o*cc*cc*cj  
 c*occcjc*o  c*occ*cj  o*cjc*ccc*o c*occcj*o  
 c*occc*o   c*ocjc*o  c*occ*o   c*ccco2j   
 o*cc*cc*o  cyc4h5o21  o*cc*ccjc*o  c*oc*ccj 
 c5h5o1_1
!for toluene
 phch2ooj  c6h5ch2j  phch2oj  c6h5cjo  phch2ooh 
!Other soot precursor species:
 fulvene fulvenyl c*cc(c#c)*c
!
!----------------- MCH species -----------------------
c  h2cc  hccoh  c2o  cc3h4  c4h2  h2c4o  n-c4h3  i-c4h3 c4h4o
i-c4h5  c4h5-2  c4h6-2  c2h3choch2  c4h6o25  c4h6o23 x14c5h8
! remove unused species:
! x2c5h95  x1c5h95
ac5h9d  cc5h9a
! remove unused species:
! x1c5h94  
c6h2  c6h3  l-c6h4
c-c6h4  x135c6h8  x125c6h8 
x15c6h93  x15c6h10  cychexene
x3c6h1016  x2c6h1016  x13c6h10  x136c7h10  x135c7h10
gkmc7h10  gikc7h10  acec7h10  x16c7h113  x16c7h114  x15c7h113
x15c7h114  x15c7h117  aec7h11g  aec7h11c  aec7h11d  gkc7h11m
gkc7h11i  gkc7h11j  x16c7h12  x15c7h12  aec7h12  gkc7h12  metcychex
! lump methyl cyclcohexene species into mche:
!mch1ene  mch2ene  mch3ene  
acc7h12  x13c7h12  x24c7h12  cec7h12
ikc7h12  gmc7h12  gic7h12  mchr1  mchr2  mchr3  mchr4  cychexch2
mch  a1c2h  ic5h8  ic5h7  ac7h14  ec7h14  gc7h14   kc7h14           
!
ac7h13f  ec7h13a  gc7h13l  kc7h13g  ac7h13c  gc7h13i  kc7h13j  ec7h13d
c7h14gl !Diradical
c7h14af !Diradical
c7h1416 !Diradical
! c4h814  !Diradical ! excluded EJS 9oct06          
c5h10ad !Diradical          
c5h1014 !Diradical          
!--- Low T chemistry for mch ----
!Peroxy isomers
mch1oo  mch2oo  mch3oo  mch4oo  chxch2oo
! mch1qx etc is really mch1qxj where x means the radical site is on the ch2 group  
mch1qx  mch1qj2 mch1qj3 mch1qj4
mch2qx  mch2qj3 mch2qj1 mch2qj4 mch2qj5 mch2qj6
! mch3qj2 is a lumped species of mch3qj2 and mch3qj4
mch3qj2 mch3qj5 mch3qj1 mch3qj6
mch4qj3 mch4qj2 mch4qj1
chxj1ch2q  chxj2ch2q  ! chxq3ch2q chx3q1cho
! gamma scission of mchXqjY species:
c7ene-one c7ene-onej c7enej-one
! c7ene-one is a lumped species.  It has 7 carbons, one CC terminal double bond and on CO terminal double bond
! species to calculate gamma scission of mch2qj4:
! mchj2q4ene
!Lumped species
mche  mchyo23  mcho  mchyo24  mchyo25
! mchyo24 includes mchyo13, mchyo35
! mchyo14 (written as mchyo25 to avoid additional reactions)
! (mche is a lumped species representing the 3 isomers of methyl cyclohexene)
! (mchyo23 is a lumped cyclic ether  with 3-membered CCO ring on MCH)
!Alkoxy, Alkylhydroperoxy, and alcohols
mch1ooh mch2ooh mch3ooh mch4ooh chxch2ooh
mch1oj mch2oj mch3oj mch4oj chxch2oj
!
!chxyco-2 is a cyclic ether: 
! the o attaches to the ch2 group and the 2 position on the ring
chxdch2  chxyco-2  c6h11cho1
!Alkyl radical with carboxy
ccoccccc.  cc.ccccco
ic6h12cho5  ic6h12cho2  ic6h12cho3  ic6h12cho4
!
mchje mchde mchjde c*ccc*cc.c  cc.c*cccco
!species for 2nd o2 addition
mch2q3qj  mch2o3q  mch2o3oj  mch2o3o  mch2q1qj  mch2o1q  mch2o1oj  chx1o2o
mch2qxqj  mch2oxq  mch2oxoj  mch2q4qj mch2o4q  mch2o4oj
mch2o4o  mch2q5qj  mch2o5q  mch2o5oj  mch2o5o
mch2q6qj  mch2o6q  mch2o6oj
! species to get decomposition of mch2o6oj:
! c7h11j46*o
mch3q2qj  mch3o2q  mch3o2oj  mch3q5qj  mch3o5q  mch3o5oj  mch3o5o  
mch3q1qj  mch3o1q  mch3o1oj  chx1o3o
mch4q3qj  mch4o3q  mch4o3oj  mch3o4o  mch4q2qj  mch4o2q  mch4o2oj
mch4q1qj  mch4o1q  mch4o1oj  chx1o4o
mchxq1qj  chxcho1q  mchxq2qj  chxcho2q
! Add 7 membered ring?:
! chxj3ch2q chxq3ch2q 
mch3q6qj  mch3o6q  mch3o6o  mch3o6oj  chxcho2oj
!---- miscellenious species ----
!Lumped radicals for linear c6h11 and c7h13
! CVN added species
c4h7c2h3 c5h9c2h3 (ic5h7)2 
! delete unused species:
! ic5h6oh 
ic5h6oj
! c*cjc*c written as c*cc*cj to avoid extra species, so remove this species from list:
! c*cjc*c 
ebz
! -@-@-@ chx species:
! Low Teperature
chx chxrad chxo2h chxo2j chx1q2j 
chx1q3j chx1q4j cychexene hx1en3q6j 
bt1en3q4j c2h3ooh c2h2ooh 
hx1en1q6j bt1en1q4j chxyo12 chx1*o 
chx1*o2j hx1n3*o6j bt1n3*o4j 
hex5enal hx5enal1j hx5enal4j hx1en6q6j 
hx1en4q6j bt1en4q4j chxyo13 
chx1*o3j hxen4al6j hx1en5q6j 
chxyo14 chx1*o4j hx1n5al6j 
chx1q2qj chx1q3qj chx1q4qj 
chx1*o2q chx1*o3q chx1*o4q chx1*o2oj chx1*o3oj
chx1*o4oj hx12al6j
but12al4j hx15al6j hx16al1j hx13al6j 
but13al4j hx14al6j but14dial bt14al1j 
chx1q2q3j chx1q2q4j chx1q3q4j chx1q3q2j chx1q3q5j 
chx1q4q2j cyhx1en3q cyhx1n3oj 
hxen6al1j hx1n1q6al hx1noj6al 
hex15en3q hx15en3oj hx1n5q6al 
h1n5oj6al chocho chocjo choco2j 
cyhx1en4q cyhx1n4oj 
ac3h4cho1 ac3h5c*o4 hex15en1q 
hx15en1oj hx1n4q6al 
h1n4oj6al pro13dial pro13al1j hx1n3q6al 
h1n3oj6al 
! chx species:
! High Temperature
c6h12-16 c6h11-16 c6h11-13 chxoj 
hex1al6j cyhx1n3j cyhx1n4j hx2enal6j 
hx13en6j 
hx14en6j cyhx13ene cyhx13n5j cyhx14ene cyhx14n3j 
pent13n1j 
end

reactions                               cal/mole
  ch3+h(+m) = ch4(+m) 2.138e+15  -0.40  0.000E+00
!          rev / 1.054E+21 -1.40 1.079E+05 /
           low / 3.310E+30 -4.00 2108. /
     troe/0.0  1.E-15  1.E-15  40./
     h2/2/ h2o/5/ co/2/ co2/3/
  ch4+h  =  ch3+h2  1.727E+04  3.00  8.224E+03
           rev /  6.610E+02  3.00  7.744E+03 /
  ch4+oh  =  ch3+h2o  1.930E+05  2.40  2.106E+03
           rev /  4.820E+02  2.90  1.486E+04 /
  ch4+o  =  ch3+oh  2.130E+06  2.21  6.480E+03
           rev /  3.557E+04  2.21  3.920E+03 /
  c2h6+ch3  =  c2h5+ch4  1.510E-07  6.00  6.047E+03
           rev /  9.649E-10  6.56  1.022E+04 /
  hco+oh  =  co+h2o  1.020E+14  0.00  0.000E+00
           rev /  2.896E+15  0.00  1.052E+05 /
  co+oh  =  co2+h  1.400E+05  1.95 -1.347E+03
           rev /  1.568E+07  1.95  2.099E+04 /
  h+o2  =  o+oh  1.970E+14  0.00  1.654E+04
           rev /  1.555E+13  0.00  4.250E+02 /
  o+h2  =  h+oh  5.080E+04  2.67  6.292E+03
           rev /  2.231E+04  2.67  4.197E+03 /
  o+h2o  =  oh+oh  2.970E+06  2.02  1.340E+04
           rev /  3.013E+05  2.02 -3.850E+03 /
  oh+h2  =  h+h2o  2.160E+08  1.51  3.430E+03
           rev /  9.352E+08  1.51  1.858E+04 /
  hco+m  =  h+co+m  1.860E+17  -1.00  1.700E+04
           rev /  6.467E+13  0.00 -4.420E+02 /
  h2o2+oh  =  h2o+ho2  1.000E+12  0.00  0.000E+00
           rev /  1.685E+11  0.33  3.146E+04 /
    DUPLICATE
 c2h4+o = ch3+hco  1.020E+07   1.88  1.790E+02
           rev / 2.851E+08  1.05 3.177E+04 /
 h+c2h4(+m) = c2h5(+m) 1.081E+12   0.45  1.822E+03
!          rev / 3.587E+14 -0.34 3.957E+04 /
           low / 1.112E+34 -5.00 4.448E+03 /
  troe/1.0  1.000E-15  9.500E+01  2.000E+02/
  h2/2/ h2o/5/ co/2/ co2/3/
 ch3oh(+m) = ch3+oh(+m) 1.900E+16   0.00  9.173E+04
!          rev / 9.181E+10 1.00 7.450E+02 /
           low / 2.95E+44 -7.35 9.546E+04 /
  troe/0.414  279.  5459. 1.00E+15/
  h2/2/ h2o/16/ co/2/ co2/3/
  c2h6+h  =  c2h5+h2  5.540E+02  3.50  5.167E+03
           rev /  1.355E-01  4.06  8.857E+03 /
  ch3oh+ho2  =  ch2oh+h2o2  3.980E+13  0.00  1.940E+04
           rev /  3.130E+15  -0.90  1.075E+04 /
  c2h5+o2  =  c2h4+ho2  1.220E+30  -5.76  1.010E+04
           rev /  1.259E+30  -5.63  2.231E+04 /
  c2h6+oh  =  c2h5+h2o  5.125E+06  2.06  8.550E+02
           rev /  1.010E+07  2.06  2.298E+04 /
  c2h6+o  =  c2h5+oh  1.130E+14  0.00  7.850E+03
           rev /  2.080E+13  0.00  1.272E+04 /
  ch3+ho2  =  ch3o+oh  1.100E+13  0.00  0.000E+00
           rev /  4.780E+14  -0.35  2.455E+04 /
  co+ho2  =  co2+oh  3.010E+13  0.00  2.300E+04
           rev /  6.435E+15  -0.33  8.461E+04 /
 ch3+ch3(+m) = c2h6(+m) 9.214E+16  -1.17  6.358E+02
!          rev / 4.709E+21 -1.70 8.741E+04 /
           low / 1.135E+36 -5.246 1.705E+03 /
 troe/0.405 1120. 69.6 1.e+15/
  h2/2/ h2o/5/ co/2/ co2/3/
 h2o+m = h+oh+m 1.837E+27 -3.00  1.226E+05
               rev/ 2.250E+22 -2.00  0.000E+00 /
   h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
 h+o2(+m) = ho2(+m) 1.475E+12 0.60  0.000E+00
!              rev/ 5.053E+14 -0.07 4.996E+04 /
               low/ 3.500E+16 -0.41 -1.1160E+03 /
 troe/5.0000E-01  1.0000E-30  1.0000E+30 1.00E+15/
 h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
 co+o(+m) = co2(+m) 1.800E+10  0.00  2.384E+03
!              rev/ 1.670E+16 -1.00 1.301E+05 /
               low/ 1.350E+24 -2.788  4191. /
   h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
  co+o2  =  co2+o  1.068E-15  7.13  1.332E+04
           rev /  9.444E-15  7.13  1.954E+04 /
  hco+h  =  co+h2  7.340E+13  0.00  0.000E+00
           rev /  4.813E+14  0.00  9.000E+04 /
  hco+o  =  co+oh  3.020E+13  0.00  0.000E+00
           rev /  8.697E+13  0.00  8.790E+04 /
  ch2o+m  =  hco+h+m  6.283E+29  -3.57  9.320E+04
           rev /  2.660E+24  -2.57  4.270E+02 /
  ch2o+oh  =  hco+h2o  3.430E+09  1.18 -4.470E+02
           rev /  1.186E+09  1.18  2.938E+04 /
  ch2o+h  =  hco+h2  9.334E+08  1.50  2.976E+03
           rev /  7.453E+07  1.50  1.765E+04 /
  ch2o+o  =  hco+oh  4.160E+11  0.57  2.762E+03
           rev /  1.459E+10  0.57  1.534E+04 /
  ch3+oh  =  ch2o+h2  2.250E+13  0.00  4.300E+03
           rev /  6.756E+14  0.00  7.603E+04 /
  ch3+o  =  ch2o+h  8.000E+13  0.00  0.000E+00
           rev /  1.055E+15  0.00  6.963E+04 /
  ch3+o2  =  ch3o+o  1.995E+18  -1.57  2.921E+04
           rev /  3.585E+18  -1.59 -1.631E+03 /
  ch2o+ch3  =  hco+ch4  3.636E-06  5.42  9.980E+02
           rev /  7.584E-06  5.42  1.615E+04 /
  hco+ch3  =  ch4+co  1.210E+14  0.00  0.000E+00
           rev /  2.073E+16  0.00  9.048E+04 /
 ch3o(+m) = ch2o+h(+m)  5.450E+13   0.00  1.350E+04
!               rev / 3.812E+09 1.02 -7.489E+03 /
                low / 2.344E+25 -2.7  3.060E+04 /
 c2h4(+m) = c2h2+h2(+m)  1.800E+13   0.00  7.600E+04
!          rev / 1.877E+11 0.17 3.478E+04 /
           low / 1.500E+15 0.00 5.5443E+04 /
  ho2+o  =  oh+o2  3.250E+13  0.00  0.000E+00
           rev /  7.857E+14  -0.33  5.539E+04 /
  hco+ho2  =  ch2o+o2  2.974E+10  0.33 -3.861E+03
           rev /  2.050E+13  0.00  3.895E+04 /
  ch3o+o2  =  ch2o+ho2  5.500E+10  0.00  2.424E+03
           rev /  1.318E+09  0.35  3.139E+04 /
  ch3+ho2  =  ch4+o2  3.600E+12  0.00  0.000E+00
           rev /  5.177E+15  -0.33  5.796E+04 /
  hco+o2  =  co+ho2  7.580E+12  0.00  4.100E+02
           rev /  9.029E+11  0.33  3.293E+04 /
  ho2+h  =  oh+oh  7.080E+13  0.00  3.000E+02
           rev /  1.352E+14  -0.33  3.957E+04 /
  ho2+h  =  h2+o2  1.660E+13  0.00  8.200E+02
           rev /  9.138E+14  -0.33  5.830E+04 /

  ho2+oh  =  h2o+o2  2.890E+13  0.00 -5.000E+02
           rev /  6.888E+15  -0.33  7.214E+04 /
  h2o2+o2  =  ho2+ho2  5.942E+17  -0.66  5.315E+04
           rev /  4.200E+14  0.00  1.198E+04 /
    DUPLICATE
 oh+oh(+m) = h2o2(+m) 1.236E+14   -.37  0.000E+00
!          rev / 3.138E+19 -1.37 5.186E+04 /
           low / 3.041E+30 -4.63 2049. /
 troe /0.47 100. 2000. 1.0e+15/
 h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
 h2o2+h = h2o+oh 2.410E+13 0.00 3.970E+03
           rev / 7.750E+12 0.00 7.471E+04 /
 ch4+ho2 = ch3+h2o2 3.420E+11 0.00 1.929E+04
           rev / 3.365E+11 -0.33 2.502E+03 /
 ch2o+ho2 = hco+h2o2 5.820E-03 4.53 6.557E+03
           rev / 1.194E-02 4.20 4.921E+03 /
  oh+m = o+h+m  3.909E+22  -2.00  1.053E+05
        rev /  4.720E+18  -1.00  0.000E+00 /
h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
  o2+m  =  o+o+m  6.473E+20  -1.50  1.215E+05
           rev /  6.170E+15  -0.50  0.000E+00 /
h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
 h2+m = h+h+m 4.570E+19 -1.40  1.044E+05
               rev/ 2.423E+15 -0.40 -3.040E+03 /
h2/2.5/ h2o/12/ co/1.9/ co2/3.8/
 c2h3+h(+m) = c2h4(+m) 6.100E+12 0.27  2.800E+02
!               rev/ 1.692E+15 0.10 1.071E+05 /
              low / 9.800E+29 -3.86 3.320E+03 /
 troe /0.782 208. 2663. 6095./
 c2h5+c2h3 = c2h4+c2h4 3.000E+12 0.00  0.000E+00
               rev/ 4.820E+14 0.00  7.153E+04 /
 c2h2+h(+m) = c2h3(+m) 3.110E+11   0.58  2.589E+03
!               rev/ 2.028E+15 -0.42 4.446E+04 /
               low/ 2.254E+40 -7.269  6577. /
  troe/ 1.0 1.e-15 675. 1.e+15/
  h2/2/ h2o/5/ co/2/ co2/3/
  c2h4+h  =  c2h3+h2  8.420E-03  4.62  2.583E+03
           rev /  5.723E-01  3.79  3.233E+03 /
  c2h4+oh  =  c2h3+h2o  2.020E+13  0.00  5.955E+03
           rev /  1.015E+13  0.00  2.022E+04 /
  c2h3+o2  =  c2h2+ho2  5.190E-15  -1.26  3.310E+03
           rev /  2.727E-16  -0.93  1.140E+04 /
           DUPLICATE
  c2h2+m  =  c2h+h+m  4.200E+16  0.00  1.070E+05
           rev /  7.130E+07  2.08 -2.891E+04 /
  c2h2+o2  =  hcco+oh  2.000E+08  1.50  3.010E+04
           rev /  2.232E+05  1.50  2.540E+04 /
  ch2+o2  =  co+h2o  7.280E+19  -2.54  1.809E+03
           rev /  8.508E+20  -2.54  1.798E+05 /
  c2h2+oh  =  c2h+h2o  3.370E+07  2.00  1.400E+04
           rev /  4.671E+03  3.08  6.850E+02 /
  o+c2h2  =  c2h+oh  3.160E+15  -0.60  1.500E+04
           rev /  4.443E+10  0.48 -1.557E+04 /
  c2h2+o  =  ch2+co  6.120E+06  2.00  1.900E+03
           rev /  1.152E+06  2.00  5.257E+04 /
  c2h+o2  =  hco+co  2.410E+12  0.00  0.000E+00
           rev /  1.328E+16  -1.08  1.541E+05 /
  c2h+o  =  co+ch  1.810E+13  0.00  0.000E+00
           rev /  7.478E+16  -1.08  8.213E+04 /
  ch2+o2  =  hco+oh  1.290E+20  -3.30  2.840E+02
           rev /  5.310E+19  -3.30  7.317E+04 /
  ch2+o  =  co+h+h  5.000E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2+h  =  ch+h2  1.000E+18  -1.56  0.000E+00
           rev /  7.026E+17  -1.56  2.990E+03 /
  ch2+oh  =  ch+h2o  1.130E+07  2.00  3.000E+03
           rev /  3.437E+07  2.00  2.115E+04 /
  ch2+o2  =  co2+h+h  3.290E+21  -3.30  2.868E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch+o2  =  hco+o  3.300E+13  0.00  0.000E+00
           rev /  4.402E+13  0.00  7.199E+04 /
  ch3oh+oh  =  ch2oh+h2o  7.100E+06  1.80 -5.960E+02
           rev /  3.293E+01  3.46  2.272E+04 /
  ch3oh+h  =  ch3o+h2  3.600E+12  0.00  6.095E+03
           rev /  7.467E+12  -0.02  7.825E+03 /
  ch3oh+h  =  ch2oh+h2  1.440E+13  0.00  6.095E+03
           rev /  1.543E+07  1.66  1.425E+04 /
  ch3oh+ch3  =  ch2oh+ch4  3.190E+01  3.17  7.172E+03
           rev /  8.927E-04  4.83  1.581E+04 /
  ch3oh+o  =  ch2oh+oh  3.880E+05  2.50  3.080E+03
           rev /  4.960E+03  2.50  8.781E+03 /
  ch2oh+o2  =  ch2o+ho2  3.810E+06  2.00  1.641E+03
           rev /  1.768E+11  0.67  2.418E+04 /
 ch2oh(+m) = ch2o+h(+m) 2.800E+14  -0.73  3.282E+04
!          rev / 3.792E+16 -1.39 5.402E+03 /
           low / 6.010E+33 -5.39 3.620E+04 /
      troe/ 0.96 67.6 1855. 7543./
 c2h3+o2 = c2h2+ho2 2.120E-06 6.00 9.484E+03
           rev / 1.114E-07 6.33 1.757E+04 /
           DUPLICATE
  h2o2+o  =  oh+ho2  9.550E+06  2.00  3.970E+03
           rev /  2.541E+07  1.68  1.985E+04 /
  c2h2+o  =  hcco+h  1.430E+07  2.00  1.900E+03
           rev /  2.021E+05  2.00  1.331E+04 /
  c2h2+oh  =  ch2co+h  2.190E-04  4.50 -1.000E+03
           rev /  2.161E-03  4.50  1.967E+04 /
  ch2co+h  =  ch3+co  1.100E+13  0.00  3.400E+03
           rev /  2.400E+12  0.00  4.020E+04 /
  ch2co+o  =  ch2+co2  1.750E+12  0.00  1.350E+03
           rev /  3.739E+12  0.00  5.369E+04 /
  ch2+o2  =  ch2o+o  3.290E+21  -3.30  2.868E+03
           rev /  3.862E+22  -3.30  6.318E+04 /
 ch2co(+m) = ch2+co(+m) 3.000E+14 0.00 7.098E+04
!               rev / 6.909E+08 1.00 -4.360E+03 /
                low / 3.600E+15 0.00  5.927E+04 /
  ch2co+o  =  hcco+oh  1.000E+13  0.00  8.000E+03
           rev /  1.432E+10  0.00 -1.255E+03 /
  ch2co+oh  =  hcco+h2o  1.000E+13  0.00  2.000E+03
           rev /  1.412E+11  0.00  9.995E+03 /
  ch2co+h  =  hcco+h2  2.000E+14  0.00  8.000E+03
           rev /  6.522E+11  0.00  8.400E+02 /
  hcco+oh  =  hco+hco  1.000E+13  0.00  0.000E+00
           rev /  4.820E+13  0.00  4.036E+04 /
  hcco+h  =  ch2(s)+co  1.100E+14  0.00  0.000E+00
           rev /  6.660E+13  0.00  3.926E+04 /
  hcco+o  =  h+co+co  8.000E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h6+o2  =  c2h5+ho2  4.000E+13  0.00  5.090E+04
           rev /  3.000E+11  0.00  0.000E+00 /
  c2h6+ho2  =  c2h5+h2o2  1.700E+13  0.00  2.046E+04
           rev /  1.069E+11  0.24  7.842E+03 /
  ch2+o2  =  co2+h2  1.010E+21  -3.30  1.508E+03
           rev /  3.054E+23  -3.30  1.867E+05 /
  ch3+c2h3  =  ch4+c2h2  3.920E+11  0.00  0.000E+00
           rev /  2.962E+13  0.00  6.605E+04 /
  ch3+c2h5  =  ch4+c2h4  1.950E+13  -0.50  0.000E+00
           rev /  2.895E+16  -0.70  7.017E+04 /
  ch3oh+ch2o  =  ch3o+ch3o  3.835E+13  0.05  8.472E+04
           rev /  6.030E+13  0.00  0.000E+00 /
  ch2o+ch3o  =  ch3oh+hco  1.150E+11  0.00  1.280E+03
           rev /  3.020E+11  0.00  1.816E+04 /
  ch4+ch3o  =  ch3+ch3oh  1.570E+11  0.00  8.842E+03
           rev /  1.046E+09  0.00  5.000E+04 /
  c2h6+ch3o  =  c2h5+ch3oh  3.000E+11  0.00  7.000E+03
           rev /  1.714E+10  0.00  5.000E+04 /
  c2h3+h  =  c2h2+h2  2.000E+13  0.00  2.500E+03
           rev /  1.331E+13  0.00  6.808E+04 /
  ch3o+ch3oh  =  ch2oh+ch3oh  3.000E+11  0.00  4.074E+03
           rev /  1.549E+05  1.68  1.050E+04 /
  ch3oh+oh  =  ch3o+h2o  1.000E+06  2.10  4.967E+02
           rev /  8.981E+06  2.08  1.738E+04 /
  c2h5+h  =  ch3+ch3  3.610E+13  0.00  0.000E+00
           rev /  5.446E+16  -1.03  1.698E+04 /
  c2h3+o2  =  ch2o+hco  1.700E+29  -5.31  6.500E+03
           rev /  1.657E+29  -5.31  9.305E+04 /
  c2h6  =  c2h5+h  2.783E+21  -1.56  1.038E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  c2h5oh(+m) = ch2oh+ch3(+m)  5.710E+23  -1.68  9.441E+04
!           rev / 1.307E+17 -0.49 9.163E+03 /
            low / 3.110E+85 -18.84 1.1310E+05 /
  troe/ 0.5  550. 825. 6100./
  h2/2/ h2o/5/ co/2/ co2/3/
  c2h5oh(+m) = c2h5+oh(+m)  2.400E+23  -1.62  9.954E+04
!           rev / 3.097E+18 -1.06 5.610E+03 /
            low / 5.110E+85 -18.80 1.1877E+05 /
  troe/ 0.5  650. 800. 1.0E+15/
  h2/2/ h2o/5/ co/2/ co2/3/
  c2h5oh(+m) = c2h4+h2o(+m)  2.790E+13   0.09  6.614E+04
!           rev / 8.858E+10 0.45 5.706E+04 /
            low / 2.570E+83 -18.85 8.6453E+04 /
  troe/ 0.7  350. 800. 3800./
  h2o/5/
  c2h5oh(+m) = ch3cho+h2(+m) 7.240E+11   0.10  9.101E+04
!           rev / 2.342E+08 0.77 7.357E+04 /
            low / 4.460E+87 -19.42 1.1559E+05 /
  troe/ 0.9  900. 1100. 3500./
  h2o/5/
  c2h5oh+o2  =  pc2h4oh+ho2  2.000E+13  0.00  5.280E+04
           rev /  3.470E+08  0.32 -1.105E+03 /
  c2h5oh+o2  =  sc2h4oh+ho2  1.500E+13  0.00  5.015E+04
           rev /  1.870E+11  0.09  3.856E+03 /
  c2h5oh+oh  =  pc2h4oh+h2o  1.740E+11  0.27  6.000E+02
           rev /  7.196E+08  0.26  1.933E+04 /
  c2h5oh+oh  =  sc2h4oh+h2o  4.640E+11  0.15  0.000E+00
           rev /  1.378E+12  -0.08  2.635E+04 /
  c2h5oh+h  =  pc2h4oh+h2  1.230E+07  1.80  5.098E+03
           rev /  1.175E+04  1.79  8.677E+03 /
  c2h5oh+h  =  sc2h4oh+h2  2.580E+07  1.65  2.827E+03
           rev /  1.770E+07  1.42  1.402E+04 /
  c2h5oh+ho2  =  pc2h4oh+h2o2  1.230E+04  2.55  1.575E+04
           rev /  3.019E+02  2.21  3.021E+03 /
  c2h5oh+ho2  =  sc2h4oh+h2o2  8.200E+03  2.55  1.075E+04
           rev /  1.446E+05  1.99  5.632E+03 /
  c2h5oh+ho2  =  c2h5o+h2o2  2.500E+12  0.00  2.400E+04
           rev /  1.514E+14  -1.80  3.800E+04 /
  c2h5oh+o  =  pc2h4oh+oh  9.410E+07  1.70  5.459E+03
           rev /  3.947E+04  1.69  6.943E+03 /
  c2h5oh+o  =  sc2h4oh+oh  1.880E+07  1.85  1.824E+03
           rev /  5.665E+06  1.62  1.092E+04 /
  c2h5oh+ch3  =  pc2h4oh+ch4  1.330E+02  3.18  9.362E+03
           rev /  3.319E+00  3.17  1.342E+04 /
  c2h5oh+ch3  =  sc2h4oh+ch4  4.440E+02  2.90  7.690E+03
           rev /  7.958E+03  2.67  1.936E+04 /
  c2h5oh+c2h5  =  pc2h4oh+c2h6  5.000E+10  0.00  1.340E+04
           rev /  6.995E+10  0.00  2.699E+04 /
  c2h5oh+c2h5  =  sc2h4oh+c2h6  5.000E+10  0.00  1.040E+04
           rev /  6.995E+10  0.00  2.399E+00 /
  pc2h4oh  =  c2h4+oh  1.293E+12  -0.37  2.685E+04
           rev /  9.930E+11  0.00 -9.600E+02 /
  sc2h4oh+m  =  ch3cho+h+m  1.000E+14  0.00  2.500E+04
           rev /  4.714E+10  0.91 -3.630E+03 /
  c2h4+ch3  =  c2h3+ch4  6.620E+00  3.70  9.500E+03
           rev /  1.440E+00  4.02  5.472E+03 /
 ch3co(+m) = ch3+co(+m) 3.000E+12 0.00 1.672E+04
!          rev / 9.623E+11 -0.13 9.778E+03 /
           low / 1.200E+15  0.00 1.2518E+04 /
  ch3cho  =  ch3+hco  2.614E+15  0.15  8.055E+04
           rev /  2.000E+13  0.00  0.000E+00 /
  ch3cho+o2  =  ch3co+ho2  3.010E+13  0.00  3.915E+04
           rev /  8.552E+10  0.32 -1.940E+03 /
  ch3cho+oh  =  ch3co+h2o  2.000E+06  1.80  1.300E+03
           rev /  1.354E+06  1.79  3.285E+04 /
  ch3cho+h  =  ch3co+h2  1.340E+13  0.00  3.300E+03
           rev /  2.096E+12  -0.01  1.969E+04 /
  ch3cho+o  =  ch3co+oh  5.940E+12  0.00  1.868E+03
           rev /  4.080E+11  -0.01  1.617E+04 /
  ch3cho+ho2  =  ch3co+h2o2  3.010E+12  0.00  1.193E+04
           rev /  1.210E+13  -0.34  1.201E+04 /
  ch3cho+ch3  =  ch3co+ch4  2.608E+06  1.78  5.911E+03
           rev /  1.066E+07  1.77  2.279E+04 /
  c3h5-s  =  c2h2+ch3  9.598E+39  -8.17  4.203E+04
           rev /  1.610E+40  -8.58  2.033E+04 /
  c2h2+ch3  =  c3h4-p+h  1.211E+17  -1.20  1.668E+04
           rev /  1.000E+14  0.00  4.000E+03 /
  c3h5-a  =  c2h2+ch3  2.397E+48  -9.90  8.208E+04
           rev /  2.610E+46  -9.82  3.695E+04 /
  c3h6  =  c2h3+ch3  2.730E+62 -13.28  1.232E+05
           rev /  4.712E+59 -13.19  2.954E+04 /
  c2h2+ch3  =  c3h4-a+h  6.740E+19  -2.08  3.159E+04
           rev /  1.149E+16  -0.70  1.579E+04 /
  ic4h8+c3h5-t  =  ic4h7+c3h6  7.940E+11  0.00  2.050E+04
           rev /  5.592E+20  -1.27  8.017E+04 /
  ic4h8+c3h5-s  =  ic4h7+c3h6  7.940E+11  0.00  2.050E+04
           rev /  5.592E+20  -1.27  8.217E+04 /
  c3h6  =  c3h5-a+h  2.010E+61 -13.26  1.185E+05
           rev /  4.887E+56 -12.25  2.808E+04 /
  c3h6+o  =  ch2co+ch3+h  2.500E+07  1.76  7.600E+01
           rev /  1.000E+00  0.00  0.000E+00 /
  c3h6+o  =  c2h5+hco  1.580E+07  1.76 -1.216E+03
           rev /  1.402E+05  1.88  2.651E+04 /
  c3h6+o  =  ch3chco+h+h  2.500E+07  1.76  7.600E+01
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6  =  c3h5-s+h  7.710E+69 -16.09  1.400E+05
           rev /  1.217E+63 -14.60  2.616E+04 /
  c3h6+ho2  =  c3h5-a+h2o2  1.500E+11  0.00  1.419E+04
           rev /  5.867E+05  1.33  9.759E+03 /
  c3h6+ho2  =  c3h5-s+h2o2  7.500E+09  0.00  1.257E+04
           rev /  2.308E+04  1.27 -1.342E+04 /
  c3h6+ho2  =  c3h5-t+h2o2  3.000E+09  0.00  9.930E+03
           rev /  9.234E+03  1.27 -1.406E+04 /
  c3h6+oh  =  c3h5-a+h2o  3.120E+06  2.00 -2.980E+02
           rev /  6.194E+06  2.01  3.188E+04 /
  c3h6+oh  =  c3h5-s+h2o  2.110E+06  2.00  2.778E+03
           rev /  2.719E+04  2.49  1.153E+04 /
  c4h6  =  c2h3+c2h3  4.027E+19  -1.00  9.815E+04
           rev /  1.260E+13  0.00  0.000E+00 /
  c4h6+oh  =  c2h5+ch2co  1.000E+12  0.00  0.000E+00
           rev /  3.730E+12  0.00  3.002E+04 /
  c4h6+oh  =  ch2o+c3h5-a  1.000E+12  0.00  0.000E+00
           rev /  3.501E+06  0.00  7.106E+04 /
  c4h6+oh  =  c2h3+ch3cho  1.000E+12  0.00  0.000E+00
           rev /  5.437E+11  0.00  1.855E+04 /
  c4h6+o  =  c2h4+ch2co  1.000E+12  0.00  0.000E+00
           rev /  6.377E+11  0.00  9.434E+04 /
  c4h6+o  =  ch2o+c3h4-a  1.000E+12  0.00  0.000E+00
           rev /  1.075E+12  0.00  7.905E+04 /
  c2h4+o2  =  c2h3+ho2  4.000E+13  0.00  5.820E+04
           rev /  4.939E+13  -0.50  1.368E+03 /
  ch2o+m  =  co+h2+m  1.826E+32  -4.42  8.712E+04
           rev /  5.070E+27  -3.42  8.435E+04 /
  nc3h7  =  ch3+c2h4  2.284E+14  -0.55  2.840E+04
           rev /  4.100E+11  0.00  7.204E+03 /
  nc3h7  =  h+c3h6  2.667E+15  -0.64  3.682E+04
           rev /  1.000E+13  0.00  2.500E+03 /
  nc3h7+o2  =  c3h6+ho2  3.000E+11  0.00  3.000E+03
           rev /  2.000E+11  0.00  1.750E+04 /
  c2h4+ch3o  =  c2h3+ch3oh  1.200E+11  0.00  6.750E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  c3h6+oh  =  c3h5-t+h2o  1.110E+06  2.00  1.451E+03
           rev /  3.276E+03  2.69  1.231E+04 /
  c3h6+o  =  c3h5-a+oh  5.240E+11  0.70  5.884E+03
           rev /  1.055E+11  0.71  2.082E+04 /
  c3h6+o  =  c3h5-s+oh  1.200E+11  0.70  8.959E+03
           rev /  1.569E+08  1.19  4.600E+02 /
  c3h6+o  =  c3h5-t+oh  6.030E+10  0.70  7.632E+03
           rev /  1.805E+07  1.39  1.243E+03 /
  c3h6+h  =  c3h5-a+h2  1.730E+05  2.50  2.492E+03
           rev /  7.933E+04  2.51  1.952E+04 /
  c3h6+o2  =  c3h5-s+ho2  2.000E+12  0.00  6.290E+04
           rev /  1.081E+08  0.82 -9.840E+02 /
  c3h6+h  =  c2h4+ch3  4.830E+33  -5.81  1.850E+04
           rev /  2.313E+33  -5.90  3.162E+04 /
  ic3h7  =  h+c3h6  8.569E+18  -1.57  4.034E+04
           rev /  1.300E+13  0.00  1.560E+03 /
  ic3h7+h  =  c2h5+ch3  2.000E+13  0.00  0.000E+00
           rev /  4.822E+09  0.69  1.209E+04 /
  ic3h7+o2  =  c3h6+ho2  4.500E+11  0.00  5.020E+03
           rev /  2.000E+11  0.00  1.750E+04 /
  c3h8+m  =  ch3+c2h5+m  7.900E+22  -1.80  8.863E+04
           rev /  3.659E+14  -0.36  9.890E+02 /
  c3h8+o2  =  ic3h7+ho2  4.000E+13  0.00  4.750E+04
           rev /  2.080E+12  0.00  0.000E+00 /
  c3h8+o2  =  nc3h7+ho2  4.000E+13  0.00  4.750E+04
           rev /  2.080E+12  0.00  0.000E+00 /
  h+c3h8  =  h2+ic3h7  1.300E+06  2.40  4.471E+03
           rev /  4.709E+05  2.15  1.218E+04 /
  h+c3h8  =  h2+nc3h7  1.880E+05  2.75  6.280E+03
           rev /  2.756E+01  3.44  9.530E+03 /
  c3h8+o  =  ic3h7+oh  2.810E+13  0.00  5.200E+03
           rev /  1.870E+12  0.00  9.607E+03 /
  c3h8+o  =  nc3h7+oh  1.130E+14  0.00  7.850E+03
           rev /  7.530E+12  0.00  1.226E+04 /
  c3h8+oh  =  nc3h7+h2o  1.054E+10  0.97  1.586E+03
           rev /  6.931E+09  0.97  2.325E+04 /
  c3h8+oh  =  ic3h7+h2o  4.670E+07  1.61 -3.500E+01
           rev /  3.071E+07  1.61  2.163E+04 /
  c3h8+ho2  =  ic3h7+h2o2  5.600E+12  0.00  1.770E+04
           rev /  4.160E+11  0.00  7.426E+03 /
  c3h8+ho2  =  nc3h7+h2o2  1.680E+13  0.00  2.043E+04
           rev /  2.330E+12  0.00  9.826E+03 /
  ch3+c3h8  =  ch4+ic3h7  3.980E+11  0.00  9.500E+03
           rev /  1.585E+12  0.00  1.648E+04 /
  ch3+c3h8  =  ch4+nc3h7  1.290E+12  0.00  1.160E+04
           rev /  5.129E+12  0.00  1.858E+04 /
  ic3h7+c3h8  =  nc3h7+c3h8  3.000E+10  0.00  1.290E+04
           rev /  3.000E+10  0.00  1.290E+04 /
  c2h3+c3h8  =  c2h4+ic3h7  1.000E+11  0.00  1.040E+04
           rev /  1.310E+11  0.00  1.780E+04 /
  c2h3+c3h8  =  c2h4+nc3h7  1.000E+11  0.00  1.040E+04
           rev /  1.310E+11  0.00  1.780E+04 /
  c2h5+c3h8  =  c2h6+ic3h7  1.000E+11  0.00  1.040E+04
           rev /  3.630E+10  0.00  9.934E+03 /
  c2h5+c3h8  =  c2h6+nc3h7  1.000E+11  0.00  1.040E+04
           rev /  3.630E+10  0.00  9.934E+03 /
  c3h8+c3h5-a  =  ic3h7+c3h6  2.000E+11  0.00  1.610E+04
           rev /  3.980E+10  0.00  9.700E+03 /
  c3h8+c3h5-a  =  nc3h7+c3h6  7.940E+11  0.00  2.050E+04
           rev /  1.000E+11  0.00  9.800E+03 /
  c3h8+ch3o  =  nc3h7+ch3oh  3.000E+11  0.00  7.000E+03
           rev /  1.220E+10  0.00  9.182E+03 /
  c3h8+ch3o  =  ic3h7+ch3oh  3.000E+11  0.00  7.000E+03
           rev /  1.220E+10  0.00  9.182E+03 /
  ic4h7  =  c3h4-a+ch3  1.230E+47  -9.74  7.426E+04
           rev /  3.017E+41  -8.70  2.662E+04 /
  ic4h8  =  c3h5-t+ch3  1.920E+66 -14.22  1.281E+05
           rev /  2.089E+59 -13.23  2.953E+04 /
  ic4h8  =  ic4h7+h  3.070E+55 -11.49  1.143E+05
           rev /  3.300E+52 -11.10  2.446E+04 /
  bc5h10  =  ch3+c4h7  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  cc5h10  =  ch3+c4h7  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  ic4h8+o  =  ch2co+ch3+ch3  3.330E+07  1.76  7.600E+01
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8+h  =  ic4h7+h2  3.400E+05  2.50  2.492E+03
           rev /  6.891E+06  1.89  2.010E+04 /
  ic4h8+o  =  ic4h7+oh  1.206E+11  0.70  7.633E+03
           rev /  1.074E+12  0.09  2.315E+04 /
  ic4h8+oh  =  ic4h7+h2o  5.200E+06  2.00 -2.980E+02
           rev /  4.563E+08  1.39  3.247E+04 /
  ic4h8+o  =  ic3h7+hco  1.580E+07  1.76 -1.216E+03
           rev /  1.750E+09  0.49  2.758E+04 /
  ic4h8+ch3o2  =  ic4h7+ch3o2h  1.928E+04  2.60  1.391E+04
           rev /  2.091E+07  1.49  1.219E+04 /
  ic4h8+ch3  =  ic4h7+ch4  4.420E+00  3.50  5.675E+03
           rev /  2.340E+03  2.89  2.377E+04 /
  ic4h8+ho2  =  ic4h7+h2o2  1.928E+04  2.60  1.391E+04
           rev /  1.004E+07  1.66  1.521E+04 /
  c5h9  =  c3h5-a+c2h4  2.500E+13  0.00  4.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h9  =  c4h6+ch3  1.339E+15  -0.52  3.832E+04
           rev /  1.750E+11  0.00  7.600E+03 /
  c4h7  =  c4h6+h  1.200E+14  0.00  4.930E+04
           rev /  4.000E+13  0.00  1.300E+03 /
  c4h7  =  c2h4+c2h3  1.000E+11  0.00  3.700E+04
           rev /  5.000E+10  0.00  7.000E+03 /
  c4h7+c3h6  =  c4h8-2+c3h5-a  1.000E+11  0.00  1.590E+04
           rev /  1.000E+11  0.00  1.500E+04 /
  c4h8-1+c4h6  =  c4h7+c4h7  2.350E+12  0.00  4.672E+04
           rev /  1.600E+12  0.00  0.000E+00 /
  c4h8-2+c4h6  =  c4h7+c4h7  2.350E+12  0.00  4.672E+04
           rev /  1.600E+12  0.00  0.000E+00 /
  c4h7+ch3  =  c4h6+ch4  8.000E+12  0.00  0.000E+00
           rev /  7.050E+13  0.00  5.728E+04 /
  c3h5-a+c4h7  =  c3h6+c4h6  6.310E+12  0.00  0.000E+00
           rev /  1.000E+10  0.00  5.000E+04 /
  c4h7+o2  =  c4h6+ho2  1.000E+09  0.00  0.000E+00
           rev /  1.000E+11  0.00  1.700E+04 /
  h+c4h7  =  c4h6+h2  3.160E+13  0.00  0.000E+00
           rev /  1.066E+13  0.00  5.681E+04 /
  c2h5+c4h7  =  c4h6+c2h6  3.980E+12  0.00  0.000E+00
           rev /  3.211E+12  0.00  4.984E+04 /
  c2h5+c4h7  =  c2h4+c4h8-1  9.240E+06  1.50 -9.620E+02
           rev /  7.807E+02  2.91  5.096E+04 /
  c2h5+c4h7  =  c2h4+c4h8-2  5.000E+11  0.00  0.000E+00
           rev /  8.478E+11  0.00  5.633E+04 /
  c2h3+c4h7  =  c2h4+c4h6  3.980E+12  0.00  0.000E+00
           rev /  1.157E+13  0.00  5.771E+04 /
  c4h8-2  =  h+c4h7  4.107E+18  -1.00  9.735E+04
           rev /  5.000E+13  0.00  0.000E+00 /
  c4h8-2+ch3  =  c4h7+ch4  1.000E+11  0.00  8.200E+03
           rev /  6.000E+11  0.00  1.876E+04 /
  c4h8-2+h  =  c4h7+h2  5.000E+13  0.00  3.800E+03
           rev /  3.160E+13  0.00  2.230E+04 /
  c4h8-2+oh  =  c2h5+ch3cho  2.600E+13  0.00  0.000E+00
           rev /  2.430E+13  0.00  1.993E+04 /
  c4h8-2+o  =  ic3h7+hco  2.790E+06  2.12 -1.775E+03
           rev /  1.050E+05  2.12  2.404E+04 /
  c4h8-2+oh  =  c4h7+h2o  3.900E+13  0.00  2.217E+03
           rev /  4.772E+12  0.00  2.647E+04 /
  c4h8-2+o  =  c2h4+ch3cho  4.640E+05  2.12 -1.775E+03
           rev /  7.400E+04  2.12  8.248E+04 /
  c4h8-2+ho2  =  c4h7+h2o2  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+o2  =  c4h7+ho2  8.000E+13  0.00  3.540E+04
           rev /  3.000E+11  0.00  0.000E+00 /
  c4h8-1  =  c3h5-a+ch3  5.000E+15  0.00  7.100E+04
           rev /  5.000E+12  0.00  0.000E+00 /
  c4h8-1  =  c2h3+c2h5  1.000E+19  -1.00  9.677E+04
           rev /  9.000E+12  0.00  0.000E+00 /
  c4h8-1  =  h+c4h7  4.107E+18  -1.00  9.735E+04
           rev /  5.000E+13  0.00  0.000E+00 /
  c4h8-1+ch3  =  c4h7+ch4  1.000E+11  0.00  7.300E+03
           rev /  6.000E+11  0.00  1.786E+04 /
  c4h8-1+h  =  c4h7+h2  5.000E+13  0.00  3.900E+03
           rev /  4.000E+13  0.00  2.520E+04 /
  c4h8-1+oh  =  c4h7+h2o  2.250E+13  0.00  2.217E+03
           rev /  4.772E+12  0.00  2.647E+04 /
  c4h8-1+c3h5-a  =  c4h7+c3h6  7.900E+10  0.00  1.240E+04
           rev /  1.000E+11  0.00  1.750E+04 /
  c4h8-1+ho2  =  c4h7+h2o2  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+o2  =  c4h7+ho2  2.700E+13  0.00  3.320E+04
           rev /  3.000E+11  0.00  0.000E+00 /
  sc4h9  =  c3h6+ch3  7.367E+17  -1.40  3.023E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  sc4h9  =  c4h8-2+h  5.202E+20  -2.35  3.972E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  sc4h9  =  c4h8-1+h  3.586E+20  -2.10  4.097E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  sc4h9+o2  =  c4h8-1+ho2  4.500E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  sc4h9+o2  =  c4h8-2+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  pc4h9  =  c2h5+c2h4  7.497E+17  -1.41  2.958E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  pc4h9  =  c4h8-1+h  1.159E+17  -1.17  3.816E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  pc4h9+o2  =  c4h8-1+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  tc4h9  =  h+ic4h8  4.650E+46  -9.83  5.508E+04
           rev /  5.889E+44  -9.42  1.698E+04 /
  ic4h8+h  =  c3h6+ch3  5.680E+33  -5.72  2.000E+04
           rev /  1.710E+34  -6.42  3.316E+04 /
  tc4h9+o2  =  ic4h8+ho2  7.500E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ic4h9  =  c3h6+ch3  1.640E+37  -7.40  3.867E+04
           rev /  1.592E+34  -7.11  1.803E+04 /
  ic4h9  =  ic4h8+h  4.980E+32  -6.23  4.007E+04
           rev /  1.606E+29  -5.24  6.265E+03 /
  ic4h9+o2  =  ic4h8+ho2  1.500E-19  0.00  2.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ic4h10  =  ch3+ic3h7  3.640E+87 -20.20  1.304E+05
           rev /  1.910E+84 -20.49  4.537E+04 /
  ic4h10  =  tc4h9+h  2.510E+98 -23.81  1.453E+05
           rev /  5.242E+90 -22.24  4.644E+04 /
  ic4h10  =  ic4h9+h  9.850E+95 -23.11  1.476E+05
           rev /  8.077E+89 -22.12  4.441E+04 /
  ic4h10+h  =  tc4h9+h2  1.260E+14  0.00  7.300E+03
           rev /  1.000E+12  0.00  1.600E+04 /
  ic4h10+h  =  ic4h9+h2  1.000E+14  0.00  8.400E+03
           rev /  3.200E+12  0.00  1.570E+04 /
  ic4h10+ch3  =  tc4h9+ch4  1.000E+11  0.00  7.900E+03
           rev /  2.000E+11  0.00  2.100E+04 /
  ic4h10+ch3  =  ic4h9+ch4  8.200E+12  0.00  1.420E+04
           rev /  2.000E+11  0.00  1.500E+04 /
  ic4h10+oh  =  tc4h9+h2o  5.730E+10  0.51  6.300E+01
           rev /  1.170E+11  0.51  2.160E+04 /
  ic4h10+oh  =  ic4h9+h2o  2.290E+08  1.53  7.760E+02
           rev /  4.000E+08  1.53  2.227E+04 /
  ic4h10+c2h5  =  ic4h9+c2h6  1.510E+12  0.00  1.040E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  ic4h10+c2h5  =  tc4h9+c2h6  1.000E+11  0.00  7.900E+03
           rev /  3.000E+11  0.00  2.100E+04 /
  ic4h10+ho2  =  ic4h9+h2o2  2.550E+13  0.00  2.046E+04
           rev /  3.000E+12  0.00  7.400E+03 /
  ic4h10+ho2  =  tc4h9+h2o2  2.800E+12  0.00  1.600E+04
           rev /  3.000E+12  0.00  7.400E+03 /
  ic4h10+o  =  tc4h9+oh  1.100E+13  0.00  3.280E+03
           rev /  2.000E+12  0.00  9.600E+03 /
  ic4h10+o  =  ic4h9+oh  3.200E+13  0.00  5.760E+03
           rev /  2.000E+12  0.00  9.600E+03 /
  ic4h10+ch3o  =  ic4h9+ch3oh  4.800E+11  0.00  7.000E+03
           rev /  8.160E+13  0.00  5.642E+04 /
  ic4h10+ch3o  =  tc4h9+ch3oh  1.900E+10  0.00  2.800E+03
           rev /  1.000E+10  0.00  5.200E+03 /
  ic4h10+o2  =  ic4h9+ho2  1.800E+14  0.00  4.600E+04
           rev /  2.000E+12  0.00  2.000E+03 /
  ic4h10+o2  =  tc4h9+ho2  2.040E+13  0.00  4.135E+04
           rev /  2.000E+12  0.00  2.000E+03 /
  c4h10  =  c2h5+c2h5  3.458E+24  -2.30  8.775E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  c4h10  =  nc3h7+ch3  1.366E+21  -1.52  8.732E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  c4h10  =  pc4h9+h  4.559E+21  -1.69  1.037E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  c4h10  =  sc4h9+h  1.473E+18  -0.75  9.921E+04
           rev /  3.610E+13  0.00  0.000E+00 /
  c4h10+o2  =  pc4h9+ho2  2.500E+13  0.00  4.900E+04
           rev /  2.500E+12  0.00 -2.200E+03 /
  c4h10+o2  =  sc4h9+ho2  4.000E+13  0.00  4.760E+04
           rev /  4.070E+12  0.00 -3.622E+03 /
  c4h10+c3h5-a  =  pc4h9+c3h6  7.940E+11  0.00  2.050E+04
           rev /  1.000E+12  0.00  2.000E+04 /
  c4h10+c3h5-a  =  sc4h9+c3h6  3.160E+11  0.00  1.640E+04
           rev /  1.000E+12  0.00  2.000E+04 /
  c4h10+c2h5  =  pc4h9+c2h6  1.580E+11  0.00  1.230E+04
           rev /  3.560E+10  0.00  1.292E+04 /
  c4h10+c2h5  =  sc4h9+c2h6  1.000E+11  0.00  1.040E+04
           rev /  7.120E+10  0.00  9.917E+03 /
  c4h10+c2h3  =  pc4h9+c2h4  1.000E+12  0.00  1.800E+04
           rev /  2.570E+12  0.00  2.538E+04 /
  c4h10+c2h3  =  sc4h9+c2h4  8.000E+11  0.00  1.680E+04
           rev /  2.050E+12  0.00  2.418E+04 /
  c4h10+ch3  =  pc4h9+ch4  2.189E+11  0.00  1.140E+04
           rev /  5.555E+12  0.00  1.856E+04 /
  c4h10+ch3  =  sc4h9+ch4  2.189E+11  0.00  9.600E+03
           rev /  3.432E+12  0.00  1.646E+04 /
  c4h10+h  =  pc4h9+h2  1.880E+05  2.75  6.280E+03
           rev /  2.808E+01  3.44  1.000E+04 /
  c4h10+h  =  sc4h9+h2  2.600E+06  2.40  4.471E+03
           rev /  1.202E+06  2.15  1.270E+04 /
  c4h10+oh  =  pc4h9+h2o  1.054E+10  0.97  1.586E+03
           rev /  6.815E+06  1.66  2.046E+04 /
  c4h10+oh  =  sc4h9+h2o  9.340E+07  1.61 -3.500E+01
           rev /  1.869E+08  1.36  2.335E+04 /
  c4h10+o  =  pc4h9+oh  1.130E+14  0.00  7.850E+03
           rev /  1.480E+13  0.00  1.224E+04 /
  c4h10+o  =  sc4h9+oh  5.620E+13  0.00  5.200E+03
           rev /  7.350E+12  0.00  9.590E+03 /
  c4h10+ho2  =  pc4h9+h2o2  1.700E+13  0.00  2.046E+04
           rev /  4.580E+12  0.00  9.809E+03 /
  c4h10+ho2  =  sc4h9+h2o2  1.120E+13  0.00  1.770E+04
           rev /  1.630E+12  0.00  7.409E+03 /
  c4h10+ch3o  =  pc4h9+ch3oh  3.000E+11  0.00  7.000E+03
           rev /  1.220E+10  0.00  5.000E+04 /
  c4h10+ch3o  =  sc4h9+ch3oh  6.000E+11  0.00  7.000E+03
           rev /  2.441E+10  0.00  5.000E+04 /
  ch3coch3  =  ch3co+ch3  1.219E+23  -1.99  8.395E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  ch3coch3+oh  =  ch3coch2+h2o  1.054E+10  0.97  1.586E+03
           rev /  6.931E+09  0.97  2.325E+04 /
  ch3coch3+h  =  ch3coch2+h2  5.628E+07  2.00  7.700E+03
           rev /  9.000E+12  0.00  1.450E+05 /
  ch3coch3+o  =  ch3coch2+oh  1.130E+14  0.00  7.850E+03
           rev /  7.500E+12  0.00  1.230E+04 /
  ch3coch3+ch3  =  ch3coch2+ch4  3.960E+11  0.00  9.784E+03
           rev /  5.378E+08  0.86  1.754E+04 /
  ch3coch3+ch3o  =  ch3coch2+ch3oh  1.000E+11  0.00  7.000E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  ch3coch2  =  ch2co+ch3  1.000E+14  0.00  3.100E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  ch3coch3+o2  =  ch3coch2+ho2  1.200E+14  0.00  4.600E+04
           rev /  2.000E+12  0.00  2.000E+03 /
  ch3coch3+ho2  =  ch3coch2+h2o2  1.700E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  8.000E+03 /
  c2h5co  =  c2h5+co  1.834E+15  -0.73  1.291E+04
           rev /  1.510E+11  0.00  4.810E+03 /
  c2h5cho+h  =  c2h5co+h2  3.980E+13  0.00  4.200E+03
           rev /  1.778E+13  0.00  2.367E+04 /
  c2h5cho+o  =  c2h5co+oh  5.010E+12  0.00  1.790E+03
           rev /  1.000E+12  0.00  1.916E+04 /
  c2h5cho+oh  =  c2h5co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.705E+10  0.76  3.120E+04 /
  c2h5cho+ch3  =  c2h5co+ch4  2.608E+06  1.78  5.911E+03
           rev /  9.972E+06  1.78  2.278E+04 /
  c2h5cho+ho2  =  c2h5co+h2o2  1.000E+12  0.00  1.100E+04
           rev /  1.000E+12  0.00  1.400E+04 /
  c2h5cho+ch3o  =  c2h5co+ch3oh  1.000E+12  0.00  3.300E+03
           rev /  3.160E+11  0.00  1.800E+04 /
  c2h5cho+c2h5  =  c2h5co+c2h6  1.000E+12  0.00  8.000E+03
           rev /  1.585E+13  0.00  2.800E+04 /
  c2h5cho  =  c2h5+hco  9.850E+18  -0.73  8.171E+04
           rev /  1.810E+13  0.00  0.000E+00 /
  c2h5cho+o2  =  c2h5co+ho2  2.000E+13  0.50  4.220E+04
           rev /  1.909E+14  0.50  3.090E+03 /
  c2h5cho+nc3h7  =  c2h5co+c3h8  1.700E+12  0.00  8.440E+03
           rev /  1.900E+14  0.00  1.879E+04 /
  c2h5cho+ic3h7  =  c2h5co+c3h8  1.700E+12  0.00  8.440E+03
           rev /  1.900E+14  0.00  1.879E+04 /
  c2h5cho+c2h3  =  c2h5co+c2h4  1.700E+12  0.00  8.440E+03
           rev /  2.488E+14  0.00  2.619E+04 /
  c2h5cho+c3h5-a  =  c2h5co+c3h6  1.700E+12  0.00  8.440E+03
           rev /  1.000E+13  0.00  2.800E+04 /
  c5h10-1  =  c2h5+c3h5-a  9.173E+20  -1.63  7.399E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  c5h10-1+h  =  c5h9+h2  2.800E+13  0.00  4.000E+03
           rev /  1.000E+12  0.00  1.400E+04 /
  c5h10-1+o  =  c5h9+oh  2.540E+05  2.56 -1.130E+03
           rev /  7.000E+11  0.00  2.990E+04 /
  c5h10-1+o  =  pc4h9+hco  1.000E+11  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10-1+o  =  nc3h7+ch3co  1.000E+11  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10-1+oh  =  c5h9+h2o  5.120E+06  2.00 -2.980E+02
           rev /  2.060E+07  2.16  3.497E+04 /
  c5h10-1+oh  =  pc4h9+ch2o  1.000E+11  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10-1+oh  =  nc3h7+ch3cho  1.000E+11  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10-1+ch3  =  c5h9+ch4  1.000E+11  0.00  7.300E+03
           rev /  6.000E+11  0.00  1.790E+04 /
  h2o2+h  =  h2+ho2  4.820E+13  0.00  7.950E+03
           rev /  1.875E+12  0.33  2.426E+04 /
  hco+o  =  co2+h  3.000E+13  0.00  0.000E+00
           rev /  9.677E+15  0.00  1.102E+05 /
  ch3+m  =  ch2+h+m  1.968E+16  0.00  9.252E+04
           rev /  2.107E+11  1.00 -1.962E+04 /
  ch3+h  =  ch2+h2  9.000E+13  0.00  1.510E+04
           rev /  1.818E+13  0.00  1.040E+04 /
  ch3+oh  =  ch2+h2o  3.000E+06  2.00  2.500E+03
           rev /  2.623E+06  2.00  1.296E+04 /
  ch+ch4  =  c2h4+h  6.000E+13  0.00  0.000E+00
           rev /  3.573E+14  0.00  5.548E+04 /
 ch3oh(+m) = ch2oh+h(+m) 2.690E+16 -0.08 9.894E+04
!          rev / 1.528E+06 2.58 -3.420E+02 /
           low / 2.34E+40 -6.33  1.031E+05 /
          troe/ 0.773  693.  5333. 1.00E+15/
  ch3co+h  =  ch2co+h2  2.000E+13  0.00  1.000E-10
           rev /  7.270E+09  0.00  8.304E+04 /
  ch3co+o  =  ch2co+oh  2.000E+13  0.00  1.000E-10
           rev /  7.270E+09  0.00  8.304E+04 /
  ch3co+ch3  =  ch2co+ch4  5.000E+13  0.00  1.000E-10
           rev /  7.270E+09  0.00  8.304E+04 /
  c2h4+o  =  ch2cho+h  3.390E+06  1.88  1.790E+02
           rev /  9.481E+06  1.79  1.605E+04 /
  c2h5+o  =  ch3cho+h  5.000E+13  0.00  0.000E+00
           rev /  9.000E+13  0.00  7.268E+04 /
  c2h6+ch  =  c2h5+ch2  1.100E+14  0.00 -2.600E+02
           rev /  3.829E+10  0.56  4.400E+02 /
  ch2oh+ch2o  =  ch3oh+hco  1.292E-01  4.56  6.596E+03
           rev /  9.630E+03  2.90  1.311E+04 /
  c3h6+o2  =  c3h5-t+ho2  1.400E+12  0.00  6.070E+04
           rev /  1.734E+07  1.01 -1.074E+03 /
  ac5h10  =  ic4h7+ch3  7.127E+16  -0.65  7.354E+04
           rev /  2.550E+13  -0.32 -1.310E+02 /
  c2h3+c2h4  =  c4h6+h  5.000E+11  0.00  7.300E+03
           rev /  1.000E+13  0.00  4.700E+03 /
  ic5h12  =  ic3h7+c2h5  1.691E+19  -0.61  8.462E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic5h12  =  sc4h9+ch3  3.310E+15  0.24  8.339E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic5h12  =  ic4h9+ch3  7.174E+18  -0.86  8.577E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic5h12  =  ac5h11+h  1.469E+19  -0.99  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic5h12  =  bc5h11+h  6.411E+20  -1.53  9.884E+04
           rev /  3.610E+13  0.00  0.000E+00 /
  ic5h12  =  cc5h11+h  2.185E+20  -1.34  1.006E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic5h12  =  dc5h11+h  1.469E+19  -0.99  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic5h12+h  =  ac5h11+h2  1.207E+06  2.54  6.756E+03
           rev /  5.595E+04  2.54  1.104E+04 /
  ic5h12+h  =  bc5h11+h2  6.020E+05  2.40  2.583E+03
           rev /  6.393E+02  2.93  1.119E+04 /
  ic5h12+h  =  cc5h11+h2  1.300E+06  2.40  4.471E+03
           rev /  4.050E+03  2.74  1.127E+04 /
  ic5h12+h  =  dc5h11+h2  9.400E+04  2.75  6.280E+03
           rev /  4.357E+03  2.75  1.056E+04 /
  ic5h12+o  =  ac5h11+oh  2.697E+07  2.03  5.136E+03
           rev /  5.491E+05  2.03  7.321E+03 /
  ic5h12+o  =  bc5h11+oh  3.968E+05  2.40  1.150E+03
           rev /  1.851E+02  2.93  7.660E+03 /
  ic5h12+o  =  cc5h11+oh  5.946E+05  2.44  2.846E+03
           rev /  8.137E+02  2.78  7.546E+03 /
  ic5h12+o  =  dc5h11+oh  1.046E+06  2.42  4.766E+03
           rev /  2.130E+04  2.42  6.951E+03 /
  ic5h12+oh  =  ac5h11+h2o  1.054E+10  0.97  1.590E+03
           rev /  2.115E+09  0.96  2.103E+04 /
  ic5h12+oh  =  bc5h11+h2o  5.730E+10  0.51  6.300E+01
           rev /  2.635E+08  1.04  2.382E+04 /
  ic5h12+oh  =  cc5h11+h2o  4.680E+07  1.61 -3.500E+01
           rev /  6.313E+05  1.95  2.192E+04 /
  ic5h12+oh  =  dc5h11+h2o  5.240E+09  0.97  1.590E+03
           rev /  1.052E+09  0.96  2.103E+04 /
  ic5h12+ch3  =  ac5h11+ch4  9.067E-01  3.65  7.154E+03
           rev /  1.098E+00  3.65  1.191E+04 /
  ic5h12+ch3  =  bc5h11+ch4  6.010E-10  6.36  8.930E+02
           rev /  1.667E-11  6.89  9.978E+03 /
  ic5h12+ch3  =  cc5h11+ch4  8.400E+04  2.13  7.574E+03
           rev /  6.837E+03  2.47  1.485E+04 /
  ic5h12+ch3  =  dc5h11+ch4  4.520E-01  3.65  7.154E+03
           rev /  5.474E-01  3.65  1.191E+04 /
  ic5h12+ho2  =  ac5h11+h2o2  1.680E+13  0.00  2.044E+04
           rev /  2.002E+13  -0.33  8.415E+03 /
  ic5h12+ho2  =  bc5h11+h2o2  2.800E+12  0.00  1.601E+04
           rev /  7.643E+10  0.21  8.307E+03 /
  ic5h12+ho2  =  cc5h11+h2o2  5.600E+12  0.00  1.769E+04
           rev /  4.484E+11  0.01  8.177E+03 /
  ic5h12+ho2  =  dc5h11+h2o2  8.400E+12  0.00  2.044E+04
           rev /  1.001E+13  -0.33  8.415E+03 /
  ic5h12+ch3o  =  ac5h11+ch3oh  3.200E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  ic5h12+ch3o  =  bc5h11+ch3oh  1.900E+10  0.00  2.800E+03
           rev /  1.000E+10  0.00  5.200E+03 /
  ic5h12+ch3o  =  cc5h11+ch3oh  1.100E+11  0.00  5.000E+03
           rev /  8.910E+09  0.00  7.200E+03 /
  ic5h12+ch3o  =  dc5h11+ch3oh  1.580E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  ic5h12+o2  =  ac5h11+ho2  4.200E+13  0.00  5.281E+04
           rev /  3.537E+10  0.32 -3.970E+02 /
  ic5h12+o2  =  bc5h11+ho2  7.000E+12  0.00  4.801E+04
           rev /  1.350E+08  0.86 -8.720E+02 /
  ic5h12+o2  =  cc5h11+ho2  1.400E+13  0.00  5.016E+04
           rev /  7.924E+08  0.66 -5.320E+02 /
  ic5h12+o2  =  dc5h11+ho2  2.100E+13  0.00  5.281E+04
           rev /  1.768E+10  0.32 -3.970E+02 /
  ic5h12+c2h5  =  ac5h11+c2h6  1.000E+11  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  ic5h12+c2h5  =  bc5h11+c2h6  1.000E+11  0.00  7.900E+03
           rev /  3.000E+11  0.00  2.100E+04 /
  ic5h12+c2h5  =  cc5h11+c2h6  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  ic5h12+c2h5  =  dc5h11+c2h6  5.000E+10  0.00  1.340E+04
           rev /  3.240E+11  0.00  1.230E+04 /
  ic5h12+c2h3  =  ac5h11+c2h4  1.000E+12  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  ic5h12+c2h3  =  bc5h11+c2h4  2.000E+11  0.00  1.430E+04
           rev /  2.500E+12  0.00  2.300E+04 /
  ic5h12+c2h3  =  cc5h11+c2h4  3.980E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  ic5h12+c2h3  =  dc5h11+c2h4  5.000E+11  0.00  1.800E+04
           rev /  2.510E+12  0.00  2.540E+04 /
  ac5h11  =  c3h6+c2h5  1.028E+18  -1.19  3.144E+04
           rev /  1.500E+11  0.00  1.060E+04 /
  ac5h11  =  c4h8-1+ch3  1.094E+16  -0.86  2.980E+04
           rev /  1.500E+11  0.00  9.200E+03 /
  ac5h11  =  ac5h10+h  4.550E+16  -0.92  3.637E+04
           rev /  1.000E+13  0.00  3.200E+03 /
  ac5h11+o2  =  ac5h10+ho2  1.500E-19  0.00  2.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ac5h11  =  dc5h11  3.000E+11  0.00  2.110E+04
           rev /  3.000E+11  0.00  2.110E+04 /
  bc5h11  =  ic4h8+ch3  1.033E+14  -0.32  2.854E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  bc5h11  =  ac5h10+h  1.042E+15  -0.39  3.870E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  bc5h11  =  bc5h10+h  2.976E+15  -0.63  3.744E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  bc5h11+o2  =  ac5h10+ho2  9.000E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  bc5h11+o2  =  bc5h10+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  cc5h11  =  c4h8-2+ch3  1.067E+15  -0.77  2.936E+04
           rev /  1.500E+11  0.00  9.200E+03 /
  cc5h11  =  bc5h10+h  8.732E+15  -0.83  3.593E+04
           rev /  1.000E+13  0.00  3.200E+03 /
  cc5h11  =  cc5h10+h  1.478E+15  -0.56  4.000E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  cc5h11+o2  =  bc5h10+ho2  1.500E-19  0.00  2.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  cc5h11+o2  =  cc5h10+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  dc5h11  =  c2h4+ic3h7  1.138E+15  -0.42  2.701E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  dc5h11  =  cc5h10+h  2.199E+16  -0.90  3.749E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  dc5h11+o2  =  cc5h10+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ac5h10+oh  =  ic5h9+h2o  1.000E+12  0.00  1.230E+03
           rev /  5.000E+12  0.00  2.650E+04 /
  bc5h10+oh  =  ic5h9+h2o  1.000E+12  0.00  1.230E+03
           rev /  5.000E+12  0.00  2.650E+04 /
  cc5h10+oh  =  ic5h9+h2o  1.000E+12  0.00  1.230E+03
           rev /  5.000E+12  0.00  2.650E+04 /
  ac5h10+h  =  ic5h9+h2  1.000E+12  0.00  3.800E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  bc5h10+h  =  ic5h9+h2  1.000E+12  0.00  3.800E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  cc5h10+h  =  ic5h9+h2  1.000E+12  0.00  3.800E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  ac5h10+ch3  =  ic5h9+ch4  5.000E+11  0.00  7.300E+03
           rev /  6.000E+11  0.00  2.500E+04 /
  bc5h10+ch3  =  ic5h9+ch4  5.000E+11  0.00  7.300E+03
           rev /  6.000E+11  0.00  2.500E+04 /
  cc5h10+ch3  =  ic5h9+ch4  5.000E+11  0.00  7.300E+03
           rev /  6.000E+11  0.00  2.500E+04 /
  ac5h10+o  =  ic5h9+oh  3.700E+05  2.56 -1.130E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  bc5h10+o  =  ic5h9+oh  3.700E+05  2.56 -1.130E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  cc5h10+o  =  ic5h9+oh  3.700E+05  2.56 -1.130E+03
           rev /  1.000E+12  0.00  2.500E+04 /
  c5h10-2+oh  =  nc3h7+ch3cho  2.000E+10  0.00 -4.000E+03
           rev /  2.000E+13  0.00  2.000E+04 /
  c5h10-2+o  =  c3h6+ch3cho  1.000E+10  0.00  0.000E+00
           rev /  1.000E+12  0.00  8.100E+04 /
  ic5h9  =  c3h4-a+c2h5  1.983E+20  -1.63  5.924E+04
           rev /  2.000E+11  0.00  8.300E+03 /
  nc5h12  =  ch3+pc4h9  2.426E+21  -1.59  8.699E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  nc5h12  =  nc3h7+c2h5  9.895E+24  -2.45  8.817E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  nc5h12+h  =  c5h11-1+h2  1.880E+05  2.75  6.280E+03
           rev /  1.043E+01  3.55  9.790E+03 /
  nc5h12+h  =  c5h11-2+h2  2.600E+06  2.40  4.471E+03
           rev /  6.815E+05  2.22  1.258E+04 /
  nc5h12+h  =  c5h11-3+h2  1.300E+06  2.40  4.471E+03
           rev /  6.833E+05  2.22  1.258E+04 /
  nc5h12+oh  =  c5h11-1+h2o  1.054E+10  0.97  1.590E+03
           rev /  2.533E+06  1.77  2.026E+04 /
  nc5h12+oh  =  c5h11-2+h2o  9.340E+07  1.61 -3.500E+01
           rev /  1.060E+08  1.43  2.323E+04 /
  nc5h12+oh  =  c5h11-3+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.063E+08  1.43  2.323E+04 /
  nc5h12+o  =  c5h11-1+oh  2.092E+06  2.42  4.766E+03
           rev /  5.099E+01  3.23  6.181E+03 /
  nc5h12+o  =  c5h11-2+oh  1.189E+06  2.44  2.846E+03
           rev /  1.369E+05  2.26  8.862E+03 /
  nc5h12+ch3  =  c5h11-1+ch4  9.040E-01  3.65  7.154E+03
           rev /  1.311E-03  4.45  1.114E+04 /
  nc5h12+ch3  =  c5h11-2+ch4  1.680E+05  2.13  7.574E+03
           rev /  1.150E+06  1.96  1.617E+04 /
  nc5h12+ch3  =  c5h11-3+ch4  8.400E+04  2.13  7.574E+03
           rev /  1.153E+06  1.96  1.617E+04 /
  nc5h12+ho2  =  c5h11-1+h2o2  1.680E+13  0.00  2.044E+04
           rev /  2.396E+10  0.48  7.645E+03 /
  nc5h12+ho2  =  c5h11-2+h2o2  1.120E+13  0.00  1.769E+04
           rev /  7.545E+13  -0.50  9.493E+03 /
  nc5h12+ho2  =  c5h11-3+h2o2  5.600E+12  0.00  1.769E+04
           rev /  7.565E+13  -0.50  9.495E+03 /
  nc5h12+c2h5  =  c5h11-1+c2h6  1.000E+11  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  nc5h12+c2h5  =  c5h11-2+c2h6  1.000E+11  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  nc5h12+c2h5  =  c5h11-3+c2h6  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  nc5h12+c2h3  =  c5h11-1+c2h4  1.000E+12  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  nc5h12+c2h3  =  c5h11-2+c2h4  8.000E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  nc5h12+c2h3  =  c5h11-3+c2h4  4.000E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  nc5h12+c5h11-1  =  c5h11-2+nc5h12  1.000E+11  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  nc5h12+c5h11-1  =  c5h11-3+nc5h12  5.000E+10  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  nc5h12+c5h11-2  =  c5h11-3+nc5h12  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.040E+04 /
  nc5h12+o  =  c5h11-3+oh  5.946E+05  2.44  2.846E+03
           rev /  1.373E+05  2.26  8.864E+03 /
  nc5h12+ch3o  =  c5h11-1+ch3oh  3.000E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  nc5h12+ch3o  =  c5h11-2+ch3oh  2.200E+11  0.00  5.000E+03
           rev /  9.000E+09  0.00  7.200E+03 /
  nc5h12+ch3o  =  c5h11-3+ch3oh  1.100E+11  0.00  5.000E+03
           rev /  9.000E+09  0.00  7.200E+03 /
  nc5h12+o2  =  c5h11-1+ho2  4.200E+13  0.00  5.281E+04
           rev /  4.234E+07  1.13 -1.167E+03 /
  nc5h12+o2  =  c5h11-2+ho2  2.800E+13  0.00  5.016E+04
           rev /  1.333E+11  0.15  7.840E+02 /
  nc5h12+o2  =  c5h11-3+ho2  1.400E+13  0.00  5.016E+04
           rev /  1.337E+11  0.15  7.860E+02 /
  c5h11-1  =  c2h4+nc3h7  7.972E+17  -1.44  2.979E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  c5h11-1  =  h+c5h10-1  3.483E+15  -0.66  3.788E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  c5h11-1+o2  =  c5h10-1+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  c5h11-1  =  c5h11-2  3.875E+09  0.35  1.976E+04
           rev /  1.830E+13  -0.63  2.436E+04 /
  c5h11-2  =  c3h6+c2h5  3.026E+21  -2.26  3.096E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  c5h11-2  =  c5h10-1+h  1.645E+19  -1.64  4.078E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  c5h11-2  =  c5h10-2+h  4.729E+20  -2.24  3.963E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  c5h11-2+o2  =  c5h10-1+ho2  4.500E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  c5h11-2+o2  =  c5h10-2+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  c5h11-3  =  c4h8-1+ch3  6.462E+19  -1.93  3.073E+04
           rev /  3.300E+11  0.00  7.200E+03 /
  c5h11-3  =  c5h10-2+h  9.483E+20  -2.24  3.963E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  c5h11-3+o2  =  c5h10-2+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  c5h10-2  =  ch3+c4h7  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  c5h10-2+h  =  c5h9+h2  2.900E+13  0.00  4.000E+03
           rev /  1.000E+12  0.00  1.400E+04 /
  c5h10-2+o  =  c5h9+oh  2.430E+05  2.56 -1.130E+03
           rev /  7.000E+11  0.00  2.990E+04 /
  c5h10-2+oh  =  c5h9+h2o  4.300E+13  0.00  3.060E+03
           rev /  5.000E+12  0.00  2.650E+04 /
  c5h10-2+ch3  =  c5h9+ch4  1.000E+11  0.00  8.200E+03
           rev /  6.000E+11  0.00  1.880E+04 /
  neoc5h12  =  tc4h9+ch3  1.735E+22  -1.62  8.402E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  neoc5h12  =  neoc5h11+h  1.513E+19  -0.83  1.020E+05
           rev /  1.000E+14  0.00  0.000E+00 /
  neoc5h12+h  =  neoc5h11+h2  9.788E+05  2.77  8.147E+03
           rev /  1.220E+05  2.60  1.357E+04 /
  neoc5h12+o  =  neoc5h11+oh  1.140E+04  3.05  3.123E+03
           rev /  6.243E+02  2.88  6.447E+03 /
  neoc5h12+oh  =  neoc5h11+h2o  3.162E+07  1.80  2.981E+02
           rev /  1.707E+07  1.63  2.087E+04 /
  neoc5h12+ch3  =  neoc5h11+ch4  5.680E-14  8.06  4.150E+03
           rev /  1.850E-13  7.89  1.005E+04 /
  neoc5h12+ho2  =  neoc5h11+h2o2  3.360E+13  0.00  2.043E+04
           rev /  1.077E+14  -0.50  9.541E+03 /
  neoc5h12+ch3o  =  neoc5h11+ch3oh  6.400E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  neoc5h12+o2  =  neoc5h11+ho2  4.950E+13  0.00  4.900E+04
           rev /  2.500E+12  0.00  0.000E+00 /
  neoc5h12+c2h5  =  neoc5h11+c2h6  2.000E+11  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  neoc5h12+c2h3  =  neoc5h11+c2h4  2.000E+12  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  neoc5h11  =  ic4h8+ch3  3.056E+17  -1.20  3.229E+04
           rev /  1.350E+11  0.00  1.160E+04 /
  ac5h10+oh  =  sc4h9+ch2o  2.000E+10  0.00 -4.000E+03
           rev /  0.000E+00  0.00  2.000E+04 /
  bc5h10+oh  =  ic3h7+ch3cho  2.000E+10  0.00 -4.000E+03
           rev /  0.000E+00  0.00  2.000E+04 /
  cc5h10+oh  =  ic4h9+ch2o  2.000E+10  0.00 -4.000E+03
           rev /  0.000E+00  0.00  2.000E+04 /
  ac5h10+o  =  sc4h9+hco  2.000E+10  0.00 -1.050E+03
           rev /  0.000E+00  2.34  8.030E+04 /
  ac5h10+o  =  ic3h7+ch3co  2.000E+10  0.00 -1.050E+03
           rev /  0.000E+00  2.34  8.030E+04 /
  ac5h10+o  =  ic4h9+hco  2.000E+10  0.00 -1.050E+03
           rev /  0.000E+00  2.34  8.030E+04 /
  nc5h12  =  c5h11-1+h  1.227E+22  -1.80  1.039E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  nc5h12  =  c5h11-2+h  2.597E+18  -0.82  9.933E+04
           rev /  3.610E+13  0.00  0.000E+00 /
  nc5h12  =  c5h11-3+h  1.295E+18  -0.82  9.933E+04
           rev /  3.610E+13  0.00  0.000E+00 /
  ic5h12+ac5h11  =  bc5h11+ic5h12  2.500E+10  0.00  7.900E+03
           rev /  1.500E+11  0.00  1.230E+04 /
  ic5h12+ac5h11  =  cc5h11+ic5h12  5.000E+10  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic5h12+ac5h11  =  dc5h11+ic5h12  7.500E+10  0.00  1.230E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic5h12+bc5h11  =  cc5h11+ic5h12  5.000E+10  0.00  1.040E+04
           rev /  2.500E+10  0.00  7.900E+03 /
  ic5h12+bc5h11  =  dc5h11+ic5h12  7.500E+10  0.00  1.230E+04
           rev /  2.500E+10  0.00  7.900E+03 /
  ic5h12+cc5h11  =  dc5h11+ic5h12  7.500E+10  0.00  1.230E+04
           rev /  5.000E+10  0.00  1.040E+04 /
  c4h10+pc4h9  =  sc4h9+c4h10  1.000E+11  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic4h10+ic4h9  =  tc4h9+ic4h10  2.500E+10  0.00  7.900E+03
           rev /  2.250E+11  0.00  1.230E+04 /
  c2h5o+m  =  ch3+ch2o+m  1.350E+38  -6.96  2.380E+04
           rev /  6.442E+36  -6.99  1.685E+04 /
  c2h5oh+oh  =  c2h5o+h2o  7.460E+11  0.30  1.634E+03
           rev /  3.956E+13  -0.14  1.852E+04 /
  c2h5oh+h  =  c2h5o+h2  1.500E+07  1.60  3.038E+03
           rev /  1.837E+08  1.17  4.772E+03 /
  c2h5oh+o  =  c2h5o+oh  1.580E+07  2.00  4.448E+03
           rev /  8.500E+07  1.56  4.087E+03 /
  c2h5oh+ch3  =  c2h5o+ch4  1.340E+02  2.92  7.452E+03
           rev /  4.288E+04  2.48  9.666E+03 /
  sc2h4oh+o2  =  ch3cho+ho2  3.810E+06  2.00  1.641E+03
           rev /  6.153E+05  2.24  2.297E+04 /
  c2h5o+o2  =  ch3cho+ho2  4.280E+10  0.00  1.097E+03
           rev /  3.872E+08  0.44  3.188E+04 /
  h2o2+o2  =  ho2+ho2  1.839E+14  -0.66  3.955E+04
           rev /  1.300E+11  0.00 -1.629E+03 /
   DUPLICATE
  c2h3+o2  =  ch2cho+o  3.500E+14  -0.61  5.260E+03
           rev /  2.589E+12  0.12  6.459E+03 /
  c2h5o2  =  c2h5+o2  4.930E+50 -11.50  4.225E+04
           rev /  1.090E+48 -11.54  1.022E+04 /
  ch3o2+m  =  ch3+o2+m  4.343E+27  -3.42  3.047E+04
           rev /  5.440E+25  -3.30  0.000E+00 /
  ch3o2h  =  ch3o+oh  6.310E+14  0.00  4.230E+04
           rev /  1.166E+11  0.60 -1.771E+03 /
  c2h5o2h  =  c2h5o+oh  6.310E+14  0.00  4.230E+04
           rev /  8.314E+06  1.70 -3.207E+03 /
  c3h2+o2  =  hcco+co+h  5.000E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3o2+ch2o  =  ch3o2h+hco  1.990E+12  0.00  1.167E+04
           rev /  8.504E+12  -0.50  7.009E+03 /
  c2h5o2+ch2o  =  c2h5o2h+hco  1.990E+12  0.00  1.167E+04
           rev /  8.422E+12  -0.51  6.605E+03 /
  c2h4+ch3o2  =  c2h3+ch3o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  c2h4+c2h5o2  =  c2h3+c2h5o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  ch4+ch3o2  =  ch3+ch3o2h  1.810E+11  0.00  1.848E+04
           rev /  3.708E+11  -0.50 -1.327E+03 /
  ch4+c2h5o2  =  ch3+c2h5o2h  1.810E+11  0.00  1.848E+04
           rev /  3.673E+11  -0.51 -1.731E+03 /
  ch3oh+ch3o2  =  ch2oh+ch3o2h  1.810E+12  0.00  1.371E+04
           rev /  1.038E+08  1.16  2.542E+03 /
  ch3oh+c2h5o2  =  ch2oh+c2h5o2h  1.810E+12  0.00  1.371E+04
           rev /  1.028E+08  1.15  2.138E+03 /
  c2h5+ho2  =  c2h5o+oh  3.200E+13  0.00  0.000E+00
           rev /  3.075E+15  -0.32  2.749E+04 /
  ch3o2+ch3  =  ch3o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  2.971E+16  -0.93  2.831E+04 /
  ch3o2+c2h5  =  ch3o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  6.569E+16  -0.90  3.126E+04 /
!  ch3o2+ho2  =  ch3o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.156E+13  -0.83  3.488E+04 /
!  ch3o2+ho2  =  ch3o2h+o2  1.75E+11  0.00 -1.711E+03
  ch3o2+ho2  =  ch3o2h+o2   2.47E+11   0.0   -6568. !94BAU/CO
  h2o2+oh  =  h2o+ho2  5.800E+14  0.00  9.560E+03
           rev /  9.771E+13  0.33  4.102E+04 /
   DUPLICATE
!  c2h5o2+ho2  =  c2h5o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.106E+13  -0.83  3.448E+04 /
!  c2h5o2+ho2  =  c2h5o2h+o2  1.75E+11  0.00 -1.711E+03
  c2h5o2+ho2  =  c2h5o2h+o2   1.63E+11  0.0  -8314.  !97ATK/BAU
  c2h5o2+c2h5o2  =  c2h5o+c2h5o+o2      2.49E+12   -0.5072   1098.   !CVN
  c2h5o2+c2h5o2  =  c2h5oh+ch3cho+o2    2.12E+11   -0.7785   -959.   !CVN
 ch3o2+c2h5o2 = ch3o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
  ch3o2+ch3o2  =  ch2o+ch3oh+o2  3.110E+14  -1.61 -1.051E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3o2+ch3o2  =  o2+ch3o+ch3o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h6+ch3o2  =  c2h5+ch3o2h  1.700E+13  0.00  2.046E+04
           rev /  7.500E+11  0.00  1.280E+03 /
  c2h6+c2h5o2  =  c2h5+c2h5o2h  1.700E+13  0.00  2.046E+04
           rev /  7.500E+11  0.00  1.280E+03 /
  o2c2h4oh  =  pc2h4oh+o2  3.900E+16  -1.00  3.000E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  o2c2h4oh  =  oh+ch2o+ch2o  1.250E+10  0.00  1.890E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h5o2  =  c2h4o2h  5.640E+47 -11.44  3.732E+04
           rev /  6.990E+48 -12.22  2.585E+04 /
  c2h4o2h  =  c2h4o1-2+oh  4.250E+22  -4.18  2.235E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3co3  =  ch3co+o2  4.625E+19  -1.90  3.956E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  ch3co2+m  =  ch3+co2+m  4.400E+15  0.00  1.050E+04
           rev /  9.648E+12  0.20  2.104E+04 /
  ch3co3h  =  ch3co2+oh  5.010E+14  0.00  4.015E+04
           rev /  1.738E+08  1.57  1.305E+03 /
!  ch3co3+ho2  =  ch3co3h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  4.093E+12  -0.33  3.904E+04 /
  ch3co3+ho2  =  ch3co3h+o2  1.75E+11  0.00 -1.711E+03
  c2h5o+m  =  ch3cho+h+m  1.160E+35  -5.89  2.527E+04
           rev /  3.063E+30  -4.78  6.100E+03 /
  h2o2+ch3co3  =  ho2+ch3co3h  2.410E+12  0.00  9.936E+03
           rev /  3.984E+11  0.32  1.107E+04 /
  ch4+ch3co3  =  ch3+ch3co3h  1.810E+11  0.00  1.848E+04
           rev /  2.944E+10  0.00  2.831E+03 /
  c2h4+ch3co3  =  c2h3+ch3co3h  1.130E+13  0.00  3.043E+04
           rev /  3.264E+15  -0.83  1.591E+04 /
  c2h6+ch3co3  =  c2h5+ch3co3h  1.700E+13  0.00  2.046E+04
           rev /  1.767E+10  0.56  8.980E+03 /
  ch2o+ch3co3  =  hco+ch3co3h  1.990E+12  0.00  1.167E+04
           rev /  6.752E+11  0.00  1.117E+04 /
  c3h6+ch3co3  =  c3h5-a+ch3co3h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  ch3o2+ch3cho  =  ch3o2h+ch3co  3.010E+12  0.00  1.193E+04
           rev /  2.519E+13  -0.51  8.991E+03 /
  ch3cho+ch3co3  =  ch3co+ch3co3h  3.010E+12  0.00  1.193E+04
           rev /  2.000E+12  -0.02  1.315E+04 /
  c2h3co  =  c2h3+co  3.043E+14  -0.46  3.051E+04
           rev /  1.510E+11  0.00  4.810E+03 /
  c2h3cho+oh  =  c2h3co+h2o  9.240E+06  1.50 -9.620E+02
           rev /  2.147E+07  1.48  3.551E+04 /
  c2h3cho+h  =  c2h3co+h2  1.340E+13  0.00  3.300E+03
           rev /  7.191E+12  -0.02  2.462E+04 /
  c2h3cho+o  =  c2h3co+oh  5.940E+12  0.00  1.868E+03
           rev /  1.400E+12  -0.02  2.109E+04 /
  c2h3cho+ho2  =  c2h3co+h2o2  3.010E+12  0.00  1.193E+04
           rev /  4.152E+13  -0.35  1.694E+04 /
  c2h3cho+ch3  =  c2h3co+ch4  2.608E+06  1.78  5.911E+03
           rev /  3.656E+07  1.76  2.771E+04 /
  c2h3cho+ch3o2  =  c2h3co+ch3o2h  3.010E+12  0.00  1.193E+04
           rev /  8.645E+13  -0.53  1.392E+04 /
  c3h5o  =  c2h3cho+h  1.000E+14  0.00  2.910E+04
           rev /  7.714E+11  0.48  1.775E+04 /
  c3h5o  =  c2h3+ch2o  2.028E+12  0.09  2.356E+04
           rev /  1.500E+11  0.00  1.060E+04 /
  c3h5o+o2  =  c2h3cho+ho2  1.000E+12  0.00  6.000E+03
           rev /  1.288E+11  0.00  3.200E+04 /
  c3h5-a+ho2  =  c3h5o+oh  7.000E+12  0.00 -1.000E+03
           rev /  2.041E+13  -0.16  1.226E+04 /
  c3h5-a+ch3o2  =  c3h5o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.994E+15  -0.74  1.702E+04 /
  c3h6+ho2  =  c3h6o1-2+oh  1.290E+12  0.00  1.490E+04
           rev /  1.000E-10  0.00  0.000E+00 /
  c3h6+ch3o2  =  c3h5-a+ch3o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  c3h6o1-2  =  c2h4+ch2o  6.000E+14  0.00  6.000E+04
           rev /  2.970E+11  0.00  5.000E+04 /
  c3h6o1-2+oh  =  ch2o+c2h3+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-2+h  =  ch2o+c2h3+h2  2.630E+07  2.00  5.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-2+o  =  ch2o+c2h3+oh  8.430E+13  0.00  5.200E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-2+ho2  =  ch2o+c2h3+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-2+ch3o2  =  ch2o+c2h3+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-2+ch3  =  ch2o+c2h3+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h4o2h  =  c2h4+ho2  9.290E+30  -6.10  1.993E+04
           rev /  1.906E+27  -4.96  1.451E+04 /
  c2h4+ch3o2  =  c2h4o1-2+ch3o  2.820E+12  0.00  1.711E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h4+c2h5o2  =  c2h4o1-2+c2h5o  2.820E+12  0.00  1.711E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h4o1-2  =  ch3+hco  3.630E+13  0.00  5.720E+04
           rev /  4.818E+09  0.02  2.122E+03 /
  c2h4o1-2  =  ch3cho  7.407E+12  0.00  5.380E+04
           rev /  1.285E+11  0.16  7.927E+04 /
  c2h4o1-2+oh  =  c2h3o1-2+h2o  1.780E+13  0.00  3.610E+03
           rev /  1.195E+12  0.16  2.695E+04 /
  c2h4o1-2+h  =  c2h3o1-2+h2  8.000E+13  0.00  9.680E+03
           rev /  1.240E+12  0.16  1.786E+04 /
  c2h4o1-2+ho2  =  c2h3o1-2+h2o2  1.130E+13  0.00  3.043E+04
           rev /  4.502E+12  -0.17  2.230E+04 /
  c2h4o1-2+ch3o2  =  c2h3o1-2+ch3o2h  1.130E+13  0.00  3.043E+04
           rev /  9.376E+12  -0.34  1.928E+04 /
  c2h4o1-2+c2h5o2  =  c2h3o1-2+c2h5o2h  1.130E+13  0.00  3.043E+04
           rev /  9.286E+12  -0.34  1.888E+04 /
  c2h4o1-2+ch3  =  c2h3o1-2+ch4  1.070E+12  0.00  1.183E+04
           rev /  4.334E+11  0.16  2.049E+04 /
  c2h4o1-2+ch3o  =  c2h3o1-2+ch3oh  1.200E+11  0.00  6.750E+03
           rev /  8.969E+08  0.19  1.320E+04 /
  c3h6ooh1-2  =  c3h6o1-2+oh  1.250E+15  -1.19  1.758E+04
           rev /  4.965E+08  1.03  2.909E+04 /
  c3h6ooh1-3  =  c3h6o1-3+oh  4.310E+15  -1.31  1.824E+04

           rev /  1.192E+18  -1.52  3.377E+04 /
  c3h6ooh2-1  =  c3h6o1-2+oh  3.460E+16  -1.61  1.887E+04
           rev /  2.787E+17  -1.52  3.309E+04 /
  c3h6ooh1-2  =  c3h6+ho2  5.500E+14  -0.85  1.526E+04
           rev /  6.466E+10  0.20  8.279E+03 /
  c3h6ooh2-1  =  c3h6+ho2  2.440E+19  -2.14  1.823E+04
           rev /  5.818E+22  -3.23  1.396E+04 /
  c3h6ooh1-2o2  =  c3h6ooh1-2+o2  2.391E+25  -2.94  4.010E+04
           rev /  5.000E+12  0.00  0.000E+00 /
  c3h6ooh1-3o2  =  c3h6ooh1-3+o2  2.853E+20  -1.63  3.569E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c3h6ooh2-1o2  =  c3h6ooh2-1+o2  5.227E+22  -2.24  3.782E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c3h6ooh1-2o2  =  c3ket12+oh  2.000E+11  0.00  2.640E+04
           rev /  1.481E+05  1.14  4.889E+04 /
  c3h6ooh1-3o2  =  c3ket13+oh  2.500E+10  0.00  2.140E+04
           rev /  6.568E+03  1.31  4.471E+04 /
  c3h6ooh2-1o2  =  c3ket21+oh  1.000E+11  0.00  2.385E+04
           rev /  2.238E+03  1.65  4.972E+04 /
  c3h6ooh1-3  =  oh+ch2o+c2h4  1.160E+17  -1.10  3.257E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc3h7o  =  c2h5+ch2o  1.394E+16  -0.87  1.977E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  ic3h7o  =  ch3+ch3cho  3.845E+17  -1.25  2.049E+04
           rev /  1.500E+11  0.00  1.290E+04 /
  ic3h7o  =  ch3coch3+h  2.000E+14  0.00  2.150E+04
           rev /  7.888E+12  0.25  6.810E+03 /
  nc3h7o  =  c2h5cho+h  2.510E+14  0.00  2.340E+04
           rev /  4.149E+09  1.14  4.470E+03 /
  ic3h7o+o2  =  ch3coch3+ho2  9.090E+09  0.00  3.900E+02
           rev /  1.000E+11  0.00  3.200E+04 /
  nc3h7o2h  =  nc3h7o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.744E+08  1.72 -3.025E+03 /
  ic3h7o2h  =  ic3h7o+oh  9.450E+15  0.00  4.160E+04
           rev /  1.362E+08  1.69 -4.185E+03 /
  nc3h7o2+ch2o  =  nc3h7o2h+hco  5.600E+12  0.00  1.360E+04
           rev /  8.000E+11  0.00  1.000E+04 /
  nc3h7o2+ch3cho  =  nc3h7o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ic3h7o2+ch2o  =  ic3h7o2h+hco  5.600E+12  0.00  1.360E+04
           rev /  8.000E+11  0.00  1.000E+04 /
  ic3h7o2+ch3cho  =  ic3h7o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
!  nc3h7o2+ho2  =  nc3h7o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.104E+13  -0.83  3.447E+04 /
  nc3h7o2+ho2  =  nc3h7o2h+o2  1.75E+11  0.00 -1.711E+03
!  ic3h7o2+ho2  =  ic3h7o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.123E+13  -0.83  3.447E+04 /
  ic3h7o2+ho2  =  ic3h7o2h+o2  1.75E+11  0.00 -1.711E+03
  c2h4+nc3h7o2  =  c2h3+nc3h7o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  c2h4+ic3h7o2  =  c2h3+ic3h7o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  ch3oh+nc3h7o2  =  ch2oh+nc3h7o2h  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  ch3oh+ic3h7o2  =  ch2oh+ic3h7o2h  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  c2h3cho+nc3h7o2  =  c2h3co+nc3h7o2h  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  c2h3cho+ic3h7o2  =  c2h3co+ic3h7o2h  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ch4+nc3h7o2  =  ch3+nc3h7o2h  1.120E+13  0.00  2.464E+04
           rev /  7.430E+11  0.00  5.500E+03 /
  ch4+ic3h7o2  =  ch3+ic3h7o2h  1.120E+13  0.00  2.464E+04
           rev /  7.430E+11  0.00  5.500E+03 /
  ch3+oh  =  ch2(s)+h2o  2.650E+13  0.00  2.186E+03
           rev /  3.236E+10  0.89  1.211E+03 /
  ch3oh+o2  =  ch2oh+ho2  2.050E+13  0.00  4.490E+04
           rev /  3.989E+05  1.99 -4.424E+03 /
  nc3h7o2+ch3o2  =  nc3h7o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h7o2+ch3o2  =  ic3h7o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2+nc3h7o2  =  h+nc3h7o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  h2+ic3h7o2  =  h+ic3h7o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  nc3h7o2  =  c3h6ooh1-2  2.000E+11  0.00  2.685E+04
           rev /  1.905E+12  -0.17  1.765E+04 /
  nc3h7o2  =  c3h6ooh1-3  3.750E+10  0.00  2.440E+04
           rev /  5.312E+12  -0.56  1.118E+04 /
  ic3h7o2  =  c3h6ooh2-1  6.000E+11  0.00  2.940E+04
           rev /  3.741E+09  0.12  1.181E+04 /
  ic3h7o2+c2h6  =  ic3h7o2h+c2h5  1.700E+13  0.00  2.046E+04
           rev /  2.211E+11  0.06  4.410E+03 /
  nc3h7o2+c2h6  =  nc3h7o2h+c2h5  1.700E+13  0.00  2.046E+04
           rev /  2.203E+11  0.06  4.410E+03 /
  ic3h7o2+c2h5cho  =  ic3h7o2h+c2h5co  2.000E+11  0.00  9.500E+03
           rev /  5.000E+09  0.00  1.000E+04 /
  nc3h7o2+c2h5cho  =  nc3h7o2h+c2h5co  2.000E+11  0.00  9.500E+03
           rev /  5.000E+09  0.00  1.000E+04 /
  ic3h7o2+ch3co3  =  ic3h7o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  nc3h7o2+ch3co3  =  nc3h7o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h7o2+c2h5o2  =  ic3h7o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  nc3h7o2+c2h5o2  =  nc3h7o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h7o2+ic3h7o2  =  o2+ic3h7o+ic3h7o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  nc3h7o2+nc3h7o2  =  o2+nc3h7o+nc3h7o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h7o2+nc3h7o2  =  ic3h7o+nc3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h7o2+ch3  =  ic3h7o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  2.303E+12  0.16  2.619E+04 /
  ic3h7o2+c2h5  =  ic3h7o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  5.092E+12  0.18  2.913E+04 /
  ic3h7o2+ic3h7  =  ic3h7o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  8.312E+10  0.74  2.964E+04 /
  ic3h7o2+nc3h7  =  ic3h7o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.338E+13  0.07  2.962E+04 /

  ic3h7o2+pc4h9  =  ic3h7o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.306E+13  0.02  2.936E+04 /
  ic3h7o2+sc4h9  =  ic3h7o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  5.405E+10  0.69  2.932E+04 /
  ic3h7o2+ic4h9  =  ic3h7o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  9.558E+13  -0.21  2.932E+04 /
  ic3h7o2+tc4h9  =  ic3h7o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.671E+17  -1.12  3.213E+04 /
  ic3h7o2+c3h5-a  =  ic3h7o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.546E+11  0.34  1.490E+04 /
  ic3h7o2+c4h7  =  ic3h7o+c4h7o  7.000E+12  0.00 -1.000E+03
           rev /  7.631E+08  0.77  1.953E+04 /
  ic3h7o2+ic4h7  =  ic3h7o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.652E+11  0.33  1.469E+04 /
  nc3h7o2+ch3  =  nc3h7o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.851E+12  0.19  2.645E+04 /
  nc3h7o2+c2h5  =  nc3h7o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  4.093E+12  0.22  2.939E+04 /
  nc3h7o2+ic3h7  =  nc3h7o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  6.680E+10  0.77  2.990E+04 /
  nc3h7o2+nc3h7  =  nc3h7o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.075E+13  0.10  2.988E+04 /
  nc3h7o2+pc4h9  =  nc3h7o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  1.853E+13  0.05  2.962E+04 /
  nc3h7o2+sc4h9  =  nc3h7o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  4.344E+10  0.72  2.958E+04 /
  nc3h7o2+ic4h9  =  nc3h7o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  7.681E+13  -0.18  2.958E+04 /
  nc3h7o2+tc4h9  =  nc3h7o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.147E+17  -1.09  3.239E+04 /
  nc3h7o2+c3h5-a  =  nc3h7o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.242E+11  0.37  1.516E+04 /
  nc3h7o2+c4h7  =  nc3h7o+c4h7o  7.000E+12  0.00 -1.000E+03
           rev /  6.133E+08  0.80  1.979E+04 /
  nc3h7o2+ic4h7  =  nc3h7o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.328E+11  0.37  1.495E+04 /
  c3h6+c2h5o2  =  c3h5-a+c2h5o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  c3h6+nc3h7o2  =  c3h5-a+nc3h7o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  c3h6+ic3h7o2  =  c3h5-a+ic3h7o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  ic4h9o2+c3h6  =  ic4h9o2h+c3h5-a  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  tc4h9o2+c3h6  =  tc4h9o2h+c3h5-a  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  nc3h7o2  =  nc3h7+o2  3.364E+19  -1.32  3.576E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  ic3h7o2  =  ic3h7+o2  2.803E+17  -0.62  3.604E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  nc3h7+ho2  =  nc3h7o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.767E+15  -0.44  2.698E+04 /
  ic3h7+ho2  =  ic3h7o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.098E+13  0.23  2.700E+04 /
  ch3o2+nc3h7  =  ch3o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.725E+17  -1.02  3.174E+04 /
  ch3o2+ic3h7  =  ch3o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.072E+15  -0.35  3.176E+04 /
  ch3o2+c3h8  =  ch3o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ch3o2+c3h8  =  ch3o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c2h5o2+c3h8  =  c2h5o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c2h5o2+c3h8  =  c2h5o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  nc3h7o2+c3h8  =  nc3h7o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  nc3h7o2+c3h8  =  nc3h7o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic3h7o2+c3h8  =  ic3h7o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic3h7o2+c3h8  =  ic3h7o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  pc4h9o2+c3h8  =  pc4h9o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  pc4h9o2+c3h8  =  pc4h9o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  sc4h9o2+c3h8  =  sc4h9o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  sc4h9o2+c3h8  =  sc4h9o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c3h8+ch3co3  =  ic3h7+ch3co3h  2.000E+12  0.00  1.700E+04
           rev /  2.000E+10  0.00  1.000E+04 /
  c3h8+ch3co3  =  nc3h7+ch3co3h  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c3h6o1-3  =  c2h4+ch2o  6.000E+14  0.00  6.000E+04
           rev /  2.970E+11  0.00  3.108E+04 /
  c3h6o1-3+oh  =  ch2o+c2h3+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-3+o  =  ch2o+c2h3+oh  8.430E+13  0.00  5.200E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-3+h  =  ch2o+c2h3+h2  2.630E+07  2.00  5.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-3+ch3o2  =  ch2o+c2h3+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-3+ho2  =  ch2o+c2h3+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6o1-3+ch3  =  ch2o+c2h3+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+oh  =  ic3h6cho+h2o  1.250E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+h  =  ic3h6cho+h2  1.250E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+ho2  =  ic3h6cho+h2o2  2.500E+12  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+ch3o2  =  ic3h6cho+ch3o2h  2.500E+12  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+ch3  =  ic3h6cho+ch4  5.000E+10  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o+o  =  ic3h6cho+oh  1.250E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  io2c4h8oh  =  ic4h8oh+o2  1.917E+21  -2.35  3.579E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  io2c4h8oh  =  ch3coch3+ch2o+oh  1.250E+10  0.00  1.890E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h7+o  =  ic3h5cho+h  6.030E+13  0.00  0.000E+00
           rev /  5.009E+15  -0.31  6.649E+04 /
  ch3o2+ic4h7  =  ch3o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  2.131E+15  -0.75  1.681E+04 /
  ic4h7+ho2  =  ic4h7o+oh  7.000E+12  0.00 -1.000E+03
           rev /  2.182E+13  -0.17  1.205E+04 /
  ic4h8+ho2  =  ic4h8o+oh  1.290E+12  0.00  1.334E+04
           rev /  1.000E+12  0.00  7.500E+03 /
  ic4h8oh  =  ic4h8+oh  9.646E+13  -0.38  2.850E+04
           rev /  9.930E+11  0.00 -9.600E+02 /
  ic4h9o2+ic4h8  =  ic4h9o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  tc4h9o2+ic4h8  =  tc4h9o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  ic3h7o2+ic4h8  =  ic3h7o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  nc3h7o2+ic4h8  =  nc3h7o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  pc4h9o2+ic4h8  =  pc4h9o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  sc4h9o2+ic4h8  =  sc4h9o2h+ic4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h7o  =  ch3cho+c2h3  7.940E+14  0.00  1.900E+04
           rev /  1.000E+10  0.00  2.000E+04 /
  c4h7o  =  c2h3cho+ch3  7.940E+14  0.00  1.900E+04
           rev /  1.000E+10  0.00  2.000E+04 /
  c4h7+ho2  =  c4h7o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.008E+11  0.26  1.689E+04 /
  c4h7+ch3o2  =  c4h7o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  9.844E+12  -0.32  2.165E+04 /
  c4h7+c2h5o2  =  c4h7o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  6.954E+08  0.78  1.981E+04 /
  c4h7+pc4h9o2  =  c4h7o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  5.779E+08  0.81  1.978E+04 /
  c4h7+sc4h9o2  =  c4h7o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  6.763E+08  0.78  1.951E+04 /
  c4h8oh-1o2  =  c4h8oh-1+o2  1.829E+18  0.15  4.747E+04
           rev /  2.000E+12  0.00  0.000E+00 /
  c4h8oh-2o2  =  c4h8oh-2+o2  4.092E+19  -0.18  5.198E+04
           rev /  2.000E+12  0.00  0.000E+00 /
  c4h8oh-1o2  =  c2h5cho+ch2o+oh  1.000E+16  0.00  2.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8oh-2o2  =  oh+ch3cho+ch3cho  1.000E+16  0.00  2.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8-2+ch3co3  =  c4h7+ch3co3h  1.000E+11  0.00  8.000E+03
           rev /  2.000E+10  0.00  1.000E+04 /
  c4h8oh-2  =  c4h8-2+oh  1.500E+13  0.00  2.583E+04
           rev /  4.750E+12  0.00 -7.820E+02 /
  c4h8-2+ch3o2  =  c4h7+ch3o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+c2h5o2  =  c4h7+c2h5o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+nc3h7o2  =  c4h7+nc3h7o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+ic3h7o2  =  c4h7+ic3h7o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+pc4h9o2  =  c4h7+pc4h9o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+sc4h9o2  =  c4h7+sc4h9o2h  3.200E+12  0.00  1.490E+04
           rev /  1.585E+11  0.00  1.470E+04 /
  c4h8-2+ho2  =  c4h8o2-3+oh  5.620E+11  0.00  1.231E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8-2+ch3o2  =  c4h8o2-3+ch3o  5.620E+11  0.00  1.231E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+c4h8-2  =  ic4h9o2h+c4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  tc4h9o2+c4h8-2  =  tc4h9o2h+c4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+oh  =  nc3h7+ch2o  1.000E+12  0.00  0.000E+00
           rev /  1.620E+12  0.00  1.323E+04 /
  c4h8-1+o  =  c3h6+ch2o  7.230E+05  2.34 -1.050E+03
           rev /  2.000E+05  2.34  8.028E+04 /
  c4h8-1+o  =  ch3cho+c2h4  1.300E+13  0.00  8.500E+02
           rev /  2.070E+12  0.00  8.510E+04 /
  c4h8-1+o  =  ch3co+c2h5  1.300E+13  0.00  8.500E+02
           rev /  2.350E+12  0.00  3.815E+04 /
  c4h8-1+oh  =  ch3cho+c2h5  1.000E+12  0.00  0.000E+00
           rev /  9.330E+12  0.00  1.993E+04 /
  c4h8-1+oh  =  ch3co+c2h6  5.000E+11  0.00  0.000E+00
           rev /  9.830E+12  0.00  3.243E+04 /
  c4h8-1+o  =  c2h5cho+ch2  1.300E+13  0.00  8.500E+02
           rev /  5.710E+09  0.00  1.100E+04 /
  c4h8-1+o  =  c2h5co+ch3  1.300E+13  0.00  8.500E+02
           rev /  4.800E+11  0.00  3.255E+04 /
  c4h8-1+oh  =  c2h5cho+ch3  1.000E+12  0.00  0.000E+00
           rev /  4.950E+10  0.00  1.694E+04 /
  c4h8-1+oh  =  c2h5co+ch4  5.000E+11  0.00  0.000E+00
           rev /  2.200E+13  0.00  3.427E+04 /
  c4h8-1+ch3co3  =  c4h7+ch3co3h  1.000E+11  0.00  8.000E+03
           rev /  2.000E+10  0.00  1.000E+04 /
  c4h8oh-1 =  c4h8-1+oh  1.500E+13  0.00  2.583E+04
           rev /  4.750E+12  0.00 -7.820E+02 /
  c4h8-1+ch3o2  =  c4h7+ch3o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+c2h5o2  =  c4h7+c2h5o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+nc3h7o2  =  c4h7+nc3h7o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+ic3h7o2  =  c4h7+ic3h7o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+pc4h9o2  =  c4h7+pc4h9o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+sc4h9o2  =  c4h7+sc4h9o2h  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8-1+ho2  =  c4h8o1-2+oh  1.000E+12  0.00  1.434E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8-1+ch3o2  =  c4h8o1-2+ch3o  1.000E+12  0.00  1.434E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+c4h8-1  =  ic4h9o2h+c4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  tc4h9o2+c4h8-1  =  tc4h9o2h+c4h7  1.400E+12  0.00  1.490E+04
           rev /  3.160E+11  0.00  1.300E+04 /
  c4h8ooh1-2o2  =  c4h8ooh1-2+o2  2.586E+24  -2.71  3.986E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c4h8ooh1-3o2  =  c4h8ooh1-3+o2  5.601E+22  -2.23  3.796E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c4h8ooh1-4o2  =  c4h8ooh1-4+o2  2.569E+20  -1.61  3.568E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c4h8ooh2-1o2  =  c4h8ooh2-1+o2  2.821E+20  -1.62  3.570E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c4h8ooh2-3o2  =  c4h8ooh2-3+o2  4.516E+22  -2.22  3.788E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c4h8ooh2-4o2  =  c4h8ooh2-4+o2  2.821E+20  -1.62  3.570E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c4h8ooh1-2o2  =  nc4ket12+oh  2.000E+11  0.00  2.640E+04
           rev /  1.537E+05  1.14  4.890E+04 /
  c4h8ooh1-3o2  =  nc4ket13+oh  2.500E+10  0.00  2.140E+04
           rev /  6.893E+03  1.30  4.471E+04 /
  c4h8ooh1-4o2  =  nc4ket14+oh  3.125E+09  0.00  1.935E+04
           rev /  8.292E+02  1.31  4.266E+04 /
  c4h8ooh2-1o2  =  nc4ket21+oh  1.000E+11  0.00  2.385E+04
           rev /  1.742E+03  1.65  5.002E+04 /
  c4h8ooh2-3o2  =  nc4ket23+oh  1.000E+11  0.00  2.385E+04
           rev /  8.356E+03  1.54  4.910E+04 /
  c4h8ooh2-4o2  =  nc4ket24+oh  1.250E+10  0.00  1.785E+04
           rev /  4.907E+02  1.66  4.389E+04 /
  ic4h8ooh-io2  =  ic4h8o2h-i+o2  1.440E+20  -1.63  3.569E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  tc4h8ooh-io2  =  tc4h8o2h-i+o2  5.167E+22  -2.26  3.780E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  ic4h8ooh-to2  =  ic4h8o2h-t+o2  2.266E+27  -3.23  3.964E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  ic4h8ooh-io2  =  ic4ketii+oh  2.500E+10  0.00  2.140E+04
           rev /  4.771E+03  1.27  4.439E+04 /
  ic4h8ooh-to2  =  ic4ketit+oh  2.000E+11  0.00  2.640E+04
           rev /  4.589E+05  1.05  4.870E+04 /
  c4h8ooh1-2  =  c4h8-1+ho2  1.611E+17  -1.53  1.374E+04
           rev /  1.250E+11  0.00  7.800E+03 /
  c4h8ooh2-1  =  c4h8-1+ho2  8.853E+20  -2.62  1.790E+04
           rev /  1.250E+11  0.00  7.800E+03 /
  c4h8ooh2-3  =  c4h8-2+ho2  1.034E+20  -2.55  1.748E+04
           rev /  1.250E+11  0.00  7.800E+03 /
  c4h8ooh1-2  =  c4h8o1-2+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh1-3  =  c4h8o1-3+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh1-4  =  c4h8o1-4+oh  6.250E+09  0.00  6.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh2-1  =  c4h8o1-2+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh2-3  =  c4h8o2-3+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh2-4  =  c4h8o1-3+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h8o2h-i  =  ic4h8+ho2  7.158E+19  -2.12  2.066E+04
           rev /  3.970E+11  0.00  1.262E+04 /
  ic4h8o2h-t  =  ic4h8+ho2  1.018E+16  -1.15  1.882E+04
           rev /  3.970E+11  0.00  1.262E+04 /
  ic4h8o2h-i  =  cc4h8o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o2h-t  =  ic4h8o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h8o2h-i  =  ic4h8o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh1-3  =  oh+ch2o+c3h6  6.637E+13  -0.16  2.990E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8ooh2-4  =  oh+ch3cho+c2h4  1.945E+18  -1.63  2.679E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8o2h-i  =  oh+ch2o+c3h6  8.451E+15  -0.68  2.917E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+oh  =  ch2o+c3h5-a+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+h  =  ch2o+c3h5-a+h2  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+o  =  ch2o+c3h5-a+oh  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+ho2  =  ch2o+c3h5-a+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+ch3o2  =  ch2o+c3h5-a+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-2+ch3  =  ch2o+c3h5-a+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+oh  =  ch2o+c3h5-a+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+h  =  ch2o+c3h5-a+h2  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+o  =  ch2o+c3h5-a+oh  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+ho2  =  ch2o+c3h5-a+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+ch3o2  =  ch2o+c3h5-a+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-3+ch3  =  ch2o+c3h5-a+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+oh  =  ch2o+c3h5-a+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+h  =  ch2o+c3h5-a+h2  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+o  =  ch2o+c3h5-a+oh  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+ho2  =  ch2o+c3h5-a+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+ch3o2  =  ch2o+c3h5-a+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o1-4+ch3  =  ch2o+c3h5-a+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+oh  =  ch2o+c3h5-a+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+h  =  ch2o+c3h5-a+h2  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+o  =  ch2o+c3h5-a+oh  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+ho2  =  ch2o+c3h5-a+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+ch3o2  =  ch2o+c3h5-a+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c4h8o2-3+ch3  =  ch2o+c3h5-a+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+oh  =  ch2o+c3h5-a+h2o  5.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+h  =  ch2o+c3h5-a+h2  3.510E+07  2.00  5.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+o  =  ch2o+c3h5-a+oh  1.124E+14  0.00  5.200E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+ho2  =  ch2o+c3h5-a+h2o2  1.000E+13  0.00  1.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+ch3o2  =  ch2o+c3h5-a+ch3o2h  1.000E+13  0.00  1.900E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc4h8o+ch3  =  ch2o+c3h5-a+ch4  2.000E+11  0.00  1.000E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o  =  nc3h7+ch2o  5.806E+16  -0.99  2.026E+04
           rev /  1.500E+11  0.00  1.190E+04 /
  sc4h9o  =  ch3+c2h5cho  3.069E+17  -1.28  1.924E+04
           rev /  1.500E+11  0.00  1.190E+04 /
  sc4h9o  =  c2h5+ch3cho  1.278E+21  -2.15  2.040E+04
           rev /  1.500E+11  0.00  1.190E+04 /
  ic4h9o  =  ch2o+ic3h7  2.000E+14  0.00  1.750E+04
           rev /  2.157E+11  0.11  1.151E+04 /
  tc4h9o  =  ch3coch3+ch3  4.865E+14  -0.25  1.524E+04
           rev /  1.500E+11  0.00  1.190E+04 /
  tc4h9o+o2  =  ic4h8o+ho2  8.100E+11  0.00  4.700E+03
           rev /  1.000E+11  0.00  3.200E+04 /
  ic4h9o+o2  =  ic3h7cho+ho2  1.930E+11  0.00  1.660E+03
           rev /  1.883E+09  0.40  3.262E+04 /
  pc4h9o2h  =  pc4h9o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.449E+08  1.74 -3.055E+03 /
  sc4h9o2h  =  sc4h9o+oh  9.450E+15  0.00  4.160E+04
           rev /  1.205E+08  1.70 -4.215E+03 /
  tc4h9o2h  =  tc4h9o+oh  5.950E+15  0.00  4.254E+04
           rev /  2.954E+07  1.72 -2.185E+03 /
  ic4h9o2h  =  ic4h9o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.663E+08  1.72 -3.245E+03 /
  c2h4+tc4h9o2  =  c2h3+tc4h9o2h  7.000E+11  0.00  1.711E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  tc4h9o2+ch4  =  tc4h9o2h+ch3  1.130E+13  0.00  2.046E+04
           rev /  7.500E+08  0.00  1.280E+03 /
  h2+tc4h9o2  =  h+tc4h9o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  tc4h9o2+c2h6  =  tc4h9o2h+c2h5  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  tc4h9o2+c3h8  =  tc4h9o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  tc4h9o2+c3h8  =  tc4h9o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  tc4h9o2+ch3oh  =  tc4h9o2h+ch2oh  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  tc4h9o2+c2h5oh  =  tc4h9o2h+pc2h4oh  6.300E+12  0.00  1.936E+04
           rev /  3.061E+12  0.00  2.210E+04 /
  tc4h9o2+c2h5oh  =  tc4h9o2h+sc2h4oh  4.200E+12  0.00  1.500E+04
           rev /  2.040E+12  0.00  1.774E+04 /
  ic4h9o2+ch3cho  =  ic4h9o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  tc4h9o2+ch3cho  =  tc4h9o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ic4h9o2+c2h3cho  =  ic4h9o2h+c2h3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  tc4h9o2+c2h3cho  =  tc4h9o2h+c2h3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ic4h9o2+c2h5cho  =  ic4h9o2h+c2h5co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  tc4h9o2+c2h5cho  =  tc4h9o2h+c2h5co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
!  ic4h9o2+ho2  =  ic4h9o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.107E+13  -0.83  3.448E+04 /
  ic4h9o2+ho2  =  ic4h9o2h+o2  1.75E+11  0.00 -1.711E+03
!  tc4h9o2+ho2  =  tc4h9o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.116E+13  -0.83  3.448E+04 /
  tc4h9o2+ho2  =  tc4h9o2h+o2  1.75E+11  0.00 -1.711E+03
  ic4h9o2+h2o2  =  ic4h9o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  tc4h9o2+h2o2  =  tc4h9o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  ic4h9o2+ch2o  =  ic4h9o2h+hco  1.300E+11  0.00  9.000E+03
           rev /  2.500E+10  0.00  1.010E+04 /
  tc4h9o2+ch2o  =  tc4h9o2h+hco  1.300E+11  0.00  9.000E+03
           rev /  2.500E+10  0.00  1.010E+04 /
  ic4h9o2+ch3o2  =  ic4h9o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+ch3o2  =  tc4h9o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+c2h5o2  =  ic4h9o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+c2h5o2  =  tc4h9o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+ch3co3  =  ic4h9o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+ch3co3  =  tc4h9o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+ic4h9o2  =  o2+ic4h9o+ic4h9o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+tc4h9o2  =  ic4h9o+tc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+tc4h9o2  =  o2+tc4h9o+tc4h9o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+pc4h9o2  =  ic4h9o+pc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+pc4h9o2  =  tc4h9o+pc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+sc4h9o2  =  ic4h9o+sc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+sc4h9o2  =  tc4h9o+sc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+nc3h7o2  =  ic4h9o+nc3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+nc3h7o2  =  tc4h9o+nc3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+ic3h7o2  =  ic4h9o+ic3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+ic3h7o2  =  tc4h9o+ic3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+ho2  =  ic4h9o+oh+o2  1.400E-14  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc4h9o2+ho2  =  tc4h9o+oh+o2  1.400E-14  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h9o2+ch3  =  ic4h9o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.766E+12  0.19  2.624E+04 /
  ic4h9o2+c2h5  =  ic4h9o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  3.905E+12  0.22  2.918E+04 /
  ic4h9o2+ic3h7  =  ic4h9o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  6.374E+10  0.77  2.969E+04 /
  ic4h9o2+nc3h7  =  ic4h9o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.026E+13  0.11  2.967E+04 /
  ic4h9o2+pc4h9  =  ic4h9o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  1.768E+13  0.06  2.941E+04 /
  ic4h9o2+sc4h9  =  ic4h9o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  4.145E+10  0.73  2.937E+04 /
  ic4h9o2+ic4h9  =  ic4h9o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  7.329E+13  -0.17  2.937E+04 /
  ic4h9o2+tc4h9  =  ic4h9o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.049E+17  -1.08  3.218E+04 /
  ic4h9o2+c3h5-a  =  ic4h9o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.185E+11  0.38  1.495E+04 /
  ic4h9o2+c4h7  =  ic4h9o+c4h7o  7.000E+12  0.00 -1.000E+03
           rev /  5.852E+08  0.81  1.958E+04 /
  ic4h9o2+ic4h7  =  ic4h9o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.267E+11  0.37  1.474E+04 /
  tc4h9o2+ch3  =  tc4h9o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  7.922E+11  0.19  2.726E+04 /
  tc4h9o2+c2h5  =  tc4h9o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.752E+12  0.21  3.020E+04 /
  tc4h9o2+ic3h7  =  tc4h9o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  2.859E+10  0.77  3.071E+04 /
  tc4h9o2+nc3h7  =  tc4h9o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  4.601E+12  0.10  3.069E+04 /
  tc4h9o2+pc4h9  =  tc4h9o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  7.932E+12  0.05  3.043E+04 /
  tc4h9o2+sc4h9  =  tc4h9o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  1.859E+10  0.72  3.039E+04 /
  tc4h9o2+ic4h9  =  tc4h9o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  3.288E+13  -0.18  3.039E+04 /
  tc4h9o2+tc4h9  =  tc4h9o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  9.189E+16  -1.09  3.320E+04 /
  tc4h9o2+c3h5-a  =  tc4h9o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  5.317E+10  0.37  1.597E+04 /
  tc4h9o2+c4h7  =  tc4h9o+c4h7o  7.000E+12  0.00 -1.000E+03
           rev /  2.625E+08  0.80  2.060E+04 /
  tc4h9o2+ic4h7  =  tc4h9o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  5.683E+10  0.36  1.576E+04 /
  ic4h9o2  =  ic4h8o2h-i  7.500E+10  0.00  2.440E+04
           rev /  1.815E+11  -0.51  8.946E+03 /
  tc4h9o2  =  tc4h8o2h-i  9.000E+11  0.00  2.940E+04
           rev /  2.027E+09  0.12  1.184E+04 /
  ic4h9o2  =  ic4h8o2h-t  1.000E+11  0.00  2.410E+04
           rev /  5.085E+06  0.78  1.078E+04 /
  ic4h9o2+c2h4  =  ic4h9o2h+c2h3  2.000E+11  0.00  6.000E+03
           rev /  2.000E+10  0.00  8.000E+03 /
  ic4h9o2+ch4  =  ic4h9o2h+ch3  1.130E+13  0.00  2.046E+04
           rev /  7.500E+08  0.00  1.280E+03 /
  h2+ic4h9o2  =  h+ic4h9o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  ic4h9o2+c2h6  =  ic4h9o2h+c2h5  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h9o2+c3h8  =  ic4h9o2h+ic3h7  2.000E+12  0.00  1.700E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h9o2+c3h8  =  ic4h9o2h+nc3h7  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h9o2+ch3oh  =  ic4h9o2h+ch2oh  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  ic4h9o2+c2h5oh  =  ic4h9o2h+pc2h4oh  6.300E+12  0.00  1.936E+04
           rev /  3.061E+12  0.00  2.210E+04 /
  ic4h9o2+c2h5oh  =  ic4h9o2h+sc2h4oh  4.200E+12  0.00  1.500E+04
           rev /  2.040E+12  0.00  1.774E+04 /
  sc4h9o2+ch2o  =  sc4h9o2h+hco  5.600E+12  0.00  1.360E+04
           rev /  8.000E+11  0.00  1.000E+04 /
  sc4h9o2+ch3cho  =  sc4h9o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
!  sc4h9o2+ho2  =  sc4h9o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.131E+13  -0.83  3.448E+04 /
  sc4h9o2+ho2  =  sc4h9o2h+o2  1.75E+11  0.00 -1.711E+03
  c3h6+sc4h9o2  =  c3h5-a+sc4h9o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  c2h4+sc4h9o2  =  c2h3+sc4h9o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  ch3oh+sc4h9o2  =  ch2oh+sc4h9o2h  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  c2h3cho+sc4h9o2  =  c2h3co+sc4h9o2h  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ch4+sc4h9o2  =  ch3+sc4h9o2h  1.120E+13  0.00  2.464E+04
           rev /  7.430E+11  0.00  5.500E+03 /
  h2o2+sc4h9o2  =  ho2+sc4h9o2h  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  sc4h9o2+sc4h9o2  =  o2+sc4h9o+sc4h9o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  sc4h9o2+ic3h7o2  =  sc4h9o+ic3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  sc4h9o2+c2h5o2  =  sc4h9o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  sc4h9o2+ch3o2  =  sc4h9o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  sc4h9o2+ch3co3  =  sc4h9o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  sc4h9o2+ho2  =  sc4h9o+oh+o2  1.400E-14  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2+sc4h9o2  =  h+sc4h9o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  c2h6+sc4h9o2  =  c2h5+sc4h9o2h  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  sc4h9o2+c2h5cho  =  sc4h9o2h+c2h5co  2.000E+11  0.00  9.500E+03
           rev /  5.000E+09  0.00  1.000E+04 /
  sc4h9o2+ch3  =  sc4h9o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  2.041E+12  0.17  2.617E+04 /
  sc4h9o2+c2h5  =  sc4h9o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  4.513E+12  0.20  2.911E+04 /
  sc4h9o2+ic3h7  =  sc4h9o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  7.366E+10  0.75  2.962E+04 /
  sc4h9o2+nc3h7  =  sc4h9o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.185E+13  0.08  2.960E+04 /
  sc4h9o2+pc4h9  =  sc4h9o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.044E+13  0.04  2.934E+04 /
  sc4h9o2+sc4h9  =  sc4h9o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  4.790E+10  0.71  2.930E+04 /
  sc4h9o2+ic4h9  =  sc4h9o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  8.470E+13  -0.20  2.930E+04 /
  sc4h9o2+tc4h9  =  sc4h9o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.367E+17  -1.10  3.211E+04 /
  sc4h9o2+c3h5-a  =  sc4h9o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.370E+11  0.36  1.488E+04 /
  sc4h9o2+ic4h7  =  sc4h9o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.464E+11  0.35  1.467E+04 /
  sc4h9o2  =  c4h8ooh2-1  3.000E+11  0.00  2.940E+04
           rev /  7.442E+11  -0.51  1.394E+04 /
  sc4h9o2  =  c4h8ooh2-3  2.000E+11  0.00  2.685E+04
           rev /  3.994E+10  -0.20  1.393E+04 /
  sc4h9o2  =  c4h8ooh2-4  3.750E+10  0.00  2.440E+04
           rev /  9.302E+10  -0.51  8.944E+03 /
  pc4h9o2+ch2o  =  pc4h9o2h+hco  5.600E+12  0.00  1.360E+04
           rev /  8.000E+11  0.00  1.000E+04 /
  pc4h9o2+ch3cho  =  pc4h9o2h+ch3co  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
!  pc4h9o2+ho2  =  pc4h9o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.789E+13  -0.85  3.449E+04 /
  pc4h9o2+ho2  =  pc4h9o2h+o2  1.75E+11  0.00 -1.711E+03
  c3h6+pc4h9o2  =  c3h5-a+pc4h9o2h  3.240E+11  0.00  1.490E+04
           rev /  2.000E+10  0.00  1.500E+04 /
  c2h4+pc4h9o2  =  c2h3+pc4h9o2h  1.130E+13  0.00  3.043E+04
           rev /  3.000E+12  0.00  1.150E+04 /
  ch3oh+pc4h9o2  =  ch2oh+pc4h9o2h  6.300E+12  0.00  1.936E+04
           rev /  1.000E+09  0.00  1.000E+04 /
  c2h3cho+pc4h9o2  =  c2h3co+pc4h9o2h  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  ch4+pc4h9o2  =  ch3+pc4h9o2h  1.120E+13  0.00  2.464E+04
           rev /  7.430E+11  0.00  5.500E+03 /
  h2o2+pc4h9o2  =  ho2+pc4h9o2h  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  pc4h9o2+pc4h9o2  =  o2+pc4h9o+pc4h9o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+sc4h9o2  =  pc4h9o+sc4h9o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+nc3h7o2  =  pc4h9o+nc3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+ic3h7o2  =  pc4h9o+ic3h7o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+c2h5o2  =  pc4h9o+c2h5o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+ch3o2  =  pc4h9o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+ch3co3  =  pc4h9o+ch3co2+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  pc4h9o2+ho2  =  pc4h9o+oh+o2  1.400E-14  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2+pc4h9o2  =  h+pc4h9o2h  3.010E+13  0.00  2.603E+04
           rev /  4.800E+13  0.00  7.950E+03 /
  c2h6+pc4h9o2  =  c2h5+pc4h9o2h  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  pc4h9o2+c2h5cho  =  pc4h9o2h+c2h5co  2.000E+11  0.00  9.500E+03
           rev /  5.000E+09  0.00  1.000E+04 /
  pc4h9o2+ch3  =  pc4h9o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.744E+12  0.20  2.644E+04 /
  pc4h9o2+c2h5  =  pc4h9o+c2h5o  7.000E+12  0.00 -1.000E+03
           rev /  3.856E+12  0.22  2.938E+04 /
  pc4h9o2+ic3h7  =  pc4h9o+ic3h7o  7.000E+12  0.00 -1.000E+03
           rev /  6.294E+10  0.78  2.989E+04 /
  pc4h9o2+nc3h7  =  pc4h9o+nc3h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.013E+13  0.11  2.987E+04 /
  pc4h9o2+pc4h9  =  pc4h9o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  1.746E+13  0.06  2.961E+04 /
  pc4h9o2+sc4h9  =  pc4h9o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  4.093E+10  0.73  2.957E+04 /
  pc4h9o2+ic4h9  =  pc4h9o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  7.237E+13  -0.17  2.957E+04 /
  pc4h9o2+tc4h9  =  pc4h9o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.023E+17  -1.08  3.238E+04 /
  pc4h9o2+c3h5-a  =  pc4h9o+c3h5o  7.000E+12  0.00 -1.000E+03
           rev /  1.170E+11  0.38  1.515E+04 /
  pc4h9o2+ic4h7  =  pc4h9o+ic4h7o  7.000E+12  0.00 -1.000E+03
           rev /  1.251E+11  0.37  1.494E+04 /
  pc4h9o2  =  c4h8ooh1-2  2.000E+11  0.00  2.685E+04
           rev /  5.597E+08  0.34  1.197E+04 /
  pc4h9o2  =  c4h8ooh1-3  2.500E+10  0.00  2.085E+04
           rev /  3.231E+09  -0.14  7.871E+03 /
  pc4h9o2  =  c4h8ooh1-4  4.688E+09  0.00  2.235E+04
           rev /  1.269E+10  -0.52  6.900E+03 /
  ic4h10+ch3o2  =  ic4h9+ch3o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+c2h5o2  =  ic4h9+c2h5o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ch3co3  =  ic4h9+ch3co3h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+nc3h7o2  =  ic4h9+nc3h7o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ic3h7o2  =  ic4h9+ic3h7o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ic4h9o2  =  ic4h9+ic4h9o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+tc4h9o2  =  ic4h9+tc4h9o2h  2.550E+13  0.00  2.046E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+sc4h9o2  =  ic4h9+sc4h9o2h  2.250E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h10+sc4h9o2  =  tc4h9+sc4h9o2h  2.800E+12  0.00  1.600E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h10+pc4h9o2  =  ic4h9+pc4h9o2h  2.250E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h10+pc4h9o2  =  tc4h9+pc4h9o2h  2.800E+12  0.00  1.600E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h10+ch3o2  =  tc4h9+ch3o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+c2h5o2  =  tc4h9+c2h5o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ch3co3  =  tc4h9+ch3co3h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+nc3h7o2  =  tc4h9+nc3h7o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ic3h7o2  =  tc4h9+ic3h7o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+ic4h9o2  =  tc4h9+ic4h9o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ic4h10+tc4h9o2  =  tc4h9+tc4h9o2h  2.800E+12  0.00  1.600E+04
           rev /  1.000E+11  0.00  1.000E+04 /
  ch3o2+c4h10  =  ch3o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ch3o2+c4h10  =  ch3o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c2h5o2+c4h10  =  c2h5o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c2h5o2+c4h10  =  c2h5o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  nc3h7o2+c4h10  =  nc3h7o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  nc3h7o2+c4h10  =  nc3h7o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic3h7o2+c4h10  =  ic3h7o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic3h7o2+c4h10  =  ic3h7o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  pc4h9o2+c4h10  =  pc4h9o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  pc4h9o2+c4h10  =  pc4h9o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  sc4h9o2+c4h10  =  sc4h9o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  sc4h9o2+c4h10  =  sc4h9o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c4h10+ch3co3  =  pc4h9+ch3co3h  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c4h10+ch3co3  =  sc4h9+ch3co3h  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  c4h10+c2h5o  =  pc4h9+c2h5oh  3.000E+11  0.00  7.000E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  c4h10+c2h5o  =  sc4h9+c2h5oh  6.000E+11  0.00  7.000E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  ic4h9o2+c4h10  =  ic4h9o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  tc4h9o2+c4h10  =  tc4h9o2h+sc4h9  1.120E+13  0.00  1.770E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ic4h9o2+c4h10  =  ic4h9o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  tc4h9o2+c4h10  =  tc4h9o2h+pc4h9  1.700E+13  0.00  2.046E+04
           rev /  5.000E+11  0.00  6.500E+03 /
  ch3coch2o2  =  ch3coch2+o2  8.093E+15  -1.11  2.745E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  ch3coch3+ch3coch2o2  =  ch3coch2+ch3coch2o2h  1.000E+11  0.00  5.000E+03
           rev /  1.995E+10  0.00  1.000E+04 /
  ch2o+ch3coch2o2  =  hco+ch3coch2o2h  1.288E+11  0.00  9.000E+03
           rev /  2.512E+10  0.00  1.010E+04 /
  ho2+ch3coch2o2  =  ch3coch2o2h+o2  1.000E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3coch2o2h  =  ch3coch2o+oh  1.000E+16  0.00  4.300E+04
           rev /  2.038E+09  1.55 -4.375E+03 /
  ch3coch2o  =  ch3co+ch2o  8.711E+16  -1.18  1.376E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  c2h5cho+ch3o2  =  c2h5co+ch3o2h  3.010E+12  0.00  1.193E+04
           rev /  2.358E+13  -0.51  8.983E+03 /
  c2h5cho+c2h5o  =  c2h5co+c2h5oh  6.026E+11  0.00  3.300E+03
           rev /  3.020E+11  0.00  1.816E+04 /
  c2h5cho+c2h5o2  =  c2h5co+c2h5o2h  3.010E+12  0.00  1.193E+04
           rev /  2.335E+13  -0.51  8.579E+03 /
  c2h5cho+ch3co3  =  c2h5co+ch3co3h  3.010E+12  0.00  1.193E+04
           rev /  1.872E+12  -0.01  1.314E+04 /
  c2h5cho+pc4h9  =  c2h5co+c4h10  1.700E+12  0.00  8.440E+03
           rev /  9.695E+13  0.00  1.882E+04 /
  c2h5cho+sc4h9  =  c2h5co+c4h10  1.700E+12  0.00  8.440E+03
           rev /  9.695E+13  0.00  1.882E+04 /
  c2h5cho+c4h7  =  c2h5co+c4h8-1  1.700E+12  0.00  8.440E+03
           rev /  1.000E+13  0.00  2.800E+04 /
  c2h5cho+c4h7  =  c2h5co+c4h8-2  1.700E+12  0.00  8.440E+03
           rev /  1.000E+13  0.00  2.800E+04 /
  c2h5o2  =  c2h4+ho2  3.370E+55 -13.42  4.467E+04
           rev /  1.392E+49 -12.10  2.162E+04 /
  c2h4o2h  =  c2h5+o2  2.150E+37  -8.21  2.802E+04
           rev /  2.420E+35  -8.03  8.312E+03 /
  ac5h11o2+ic5h12  =  ac5h11o2h+ac5h11  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc5h11o2+ic5h12  =  bc5h11o2h+ac5h11  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc5h11o2+ic5h12  =  cc5h11o2h+ac5h11  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc5h11o2+ic5h12  =  dc5h11o2h+ac5h11  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac5h11o2+ic5h12  =  ac5h11o2h+bc5h11  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc5h11o2+ic5h12  =  bc5h11o2h+bc5h11  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc5h11o2+ic5h12  =  cc5h11o2h+bc5h11  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc5h11o2+ic5h12  =  dc5h11o2h+bc5h11  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac5h11o2+ic5h12  =  ac5h11o2h+cc5h11  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc5h11o2+ic5h12  =  bc5h11o2h+cc5h11  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc5h11o2+ic5h12  =  cc5h11o2h+cc5h11  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc5h11o2+ic5h12  =  dc5h11o2h+cc5h11  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac5h11o2+ic5h12  =  ac5h11o2h+dc5h11  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc5h11o2+ic5h12  =  bc5h11o2h+dc5h11  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc5h11o2+ic5h12  =  cc5h11o2h+dc5h11  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc5h11o2+ic5h12  =  dc5h11o2h+dc5h11  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ic5h12+ch3o2  =  ac5h11+ch3o2h  1.680E+13  0.00  2.044E+04
           rev /  4.168E+13  -0.51  5.395E+03 /
  ic5h12+ch3o2  =  bc5h11+ch3o2h  2.800E+12  0.00  1.601E+04
           rev /  1.591E+11  0.03  5.287E+03 /
  ic5h12+ch3o2  =  cc5h11+ch3o2h  5.600E+12  0.00  1.769E+04
           rev /  9.338E+11  -0.17  5.157E+03 /
  ic5h12+ch3o2  =  dc5h11+ch3o2h  8.400E+12  0.00  2.044E+04
           rev /  2.084E+13  -0.51  5.395E+03 /
  ac5h11o2  =  ac5h11+o2  7.047E+19  -1.62  3.641E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  ac5h11+ac5h11o2  =  ac5h11o+ac5h11o  7.000E+12  0.00 -1.000E+03
           rev /  3.640E+13  -0.17  3.053E+04 /
  ac5h11+bc5h11o2  =  ac5h11o+bc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  2.177E+13  -0.16  3.131E+04 /
  ac5h11+cc5h11o2  =  ac5h11o+cc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  3.997E+13  -0.18  3.025E+04 /
  ac5h11+dc5h11o2  =  ac5h11o+dc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  3.639E+13  -0.17  3.053E+04 /
  bc5h11o2  =  bc5h11+o2  2.323E+24  -2.50  3.819E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  bc5h11+ac5h11o2  =  bc5h11o+ac5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.150E+17  -1.04  3.309E+04 /
  bc5h11+bc5h11o2  =  bc5h11o+bc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  6.882E+16  -1.03  3.387E+04 /
  bc5h11+cc5h11o2  =  bc5h11o+cc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.263E+17  -1.05  3.281E+04 /
  bc5h11+dc5h11o2  =  bc5h11o+dc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.150E+17  -1.04  3.309E+04 /
  cc5h11o2  =  cc5h11+o2  5.979E+22  -2.25  3.869E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  cc5h11+ac5h11o2  =  cc5h11o+ac5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.016E+16  -0.81  3.253E+04 /
  cc5h11+bc5h11o2  =  cc5h11o+bc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  6.080E+15  -0.80  3.331E+04 /
  cc5h11+cc5h11o2  =  cc5h11o+cc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.116E+16  -0.82  3.225E+04 /
  cc5h11+dc5h11o2  =  cc5h11o+dc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  1.016E+16  -0.81  3.253E+04 /
  dc5h11o2  =  dc5h11+o2  2.809E+20  -1.62  3.641E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  dc5h11+ac5h11o2  =  dc5h11o+ac5h11o  7.000E+12  0.00 -1.000E+03
           rev /  7.252E+13  -0.17  3.053E+04 /
  dc5h11+bc5h11o2  =  dc5h11o+bc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  4.338E+13  -0.16  3.131E+04 /
  dc5h11+cc5h11o2  =  dc5h11o+cc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  7.963E+13  -0.18  3.025E+04 /
  dc5h11+dc5h11o2  =  dc5h11o+dc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  7.250E+13  -0.17  3.053E+04 /
  ac5h11o2  =  ac5h10ooh-a  3.750E+10  0.00  2.440E+04
           rev /  9.090E+10  -0.51  8.950E+03 /
  ac5h11o2  =  ac5h10ooh-b  1.000E+11  0.00  2.410E+04
           rev /  2.509E+06  0.78  1.078E+04 /
  ac5h11o2  =  ac5h10ooh-c  2.500E+10  0.00  2.085E+04
           rev /  2.888E+09  -0.12  7.860E+03 /
  ac5h11o2  =  ac5h10ooh-d  4.688E+09  0.00  2.235E+04
           rev /  1.136E+10  -0.51  6.900E+03 /
!  ac5h11o2+ho2  =  ac5h11o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.109E+13  -0.83  3.448E+04 /
  ac5h11o2+ho2  =  ac5h11o2h+o2  1.75E+11  0.00 -1.711E+03
  ac5h11o2+h2o2  =  ac5h11o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  ac5h11o2+ac5h11o2  =  o2+ac5h11o+ac5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h11o2+bc5h11o2  =  o2+ac5h11o+bc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h11o2+cc5h11o2  =  o2+ac5h11o+cc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h11o2+dc5h11o2  =  o2+ac5h11o+dc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h11o2+ch3o2  =  ac5h11o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h11o2  =  bc5h10ooh-a  6.000E+11  0.00  2.940E+04
           rev /  1.335E+12  -0.50  1.393E+04 /
  bc5h11o2  =  bc5h10ooh-c  2.000E+11  0.00  2.685E+04
           rev /  2.991E+10  -0.16  1.389E+04 /
  bc5h11o2  =  bc5h10ooh-d  3.750E+10  0.00  2.440E+04
           rev /  8.345E+10  -0.50  8.930E+03 /
!  bc5h11o2+ho2  =  bc5h11o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.019E+13  -0.83  3.447E+04 /
  bc5h11o2+ho2  =  bc5h11o2h+o2  1.75E+11  0.00 -1.711E+03
  bc5h11o2+h2o2  =  bc5h11o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  bc5h11o2+bc5h11o2  =  o2+bc5h11o+bc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h11o2+cc5h11o2  =  o2+bc5h11o+cc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h11o2+dc5h11o2  =  o2+bc5h11o+dc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h11o2+ch3o2  =  bc5h11o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h11o2  =  cc5h10ooh-a  7.500E+10  0.00  2.440E+04
           rev /  6.970E+12  -0.50  1.114E+04 /
  cc5h11o2  =  cc5h10ooh-b  1.000E+11  0.00  2.410E+04
           rev /  8.691E+11  -0.13  1.728E+04 /
  cc5h11o2  =  cc5h10ooh-d  3.000E+11  0.00  2.940E+04
           rev /  7.834E+11  -0.52  1.395E+04 /
!  cc5h11o2+ho2  =  cc5h11o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.803E+13  -0.85  3.449E+04 /
  cc5h11o2+ho2  =  cc5h11o2h+o2  1.75E+11  0.00 -1.711E+03
  cc5h11o2+h2o2  =  cc5h11o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  5.626E+12  -0.19  6.588E+03 /
  cc5h11o2+cc5h11o2  =  o2+cc5h11o+cc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h11o2+dc5h11o2  =  o2+cc5h11o+dc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h11o2+ch3o2  =  cc5h11o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h11o2  =  dc5h10ooh-a  9.376E+09  0.00  2.235E+04
           rev /  3.417E+10  -0.51  6.900E+03 /
  dc5h11o2  =  dc5h10ooh-b  1.250E+10  0.00  1.910E+04
           rev /  7.046E+08  0.02  7.970E+03 /
  dc5h11o2  =  dc5h10ooh-c  2.000E+11  0.00  2.685E+04
           rev /  2.309E+10  -0.12  1.386E+04 /
!  dc5h11o2+ho2  =  dc5h11o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.108E+13  -0.83  3.448E+04 /
  dc5h11o2+ho2  =  dc5h11o2h+o2  1.75E+11  0.00 -1.711E+03
  dc5h11o2+h2o2  =  dc5h11o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  dc5h11o2+dc5h11o2  =  o2+dc5h11o+dc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h11o2+ch3o2  =  dc5h11o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h11o2h  =  ac5h11o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.566E+08  1.73 -3.035E+03 /
  bc5h11o2h  =  bc5h11o+oh  5.950E+15  0.00  4.254E+04
           rev /  3.783E+07  1.74 -2.205E+03 /
  cc5h11o2h  =  cc5h11o+oh  9.450E+15  0.00  4.160E+04
           rev /  9.537E+07  1.74 -4.225E+03 /
  dc5h11o2h  =  dc5h11o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.566E+08  1.73 -3.035E+03 /
  ac5h11o  =  ch2o+sc4h9  3.976E+13  -0.16  1.780E+04
           rev /  6.250E+10  0.00  1.190E+04 /
  bc5h11o  =  c2h5+ch3coch3  9.831E+17  -1.16  1.616E+04
           rev /  8.500E+10  0.00  1.190E+04 /
  cc5h11o  =  ch3cho+ic3h7  5.480E+18  -1.43  1.878E+04
           rev /  7.500E+10  0.00  1.190E+04 /
  dc5h11o  =  ch2o+ic4h9  1.717E+17  -1.27  2.018E+04
           rev /  6.250E+10  0.00  1.190E+04 /
  ac5h10ooh-b  =  a-bc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-a  =  a-ac5h10o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-c  =  a-cc5h10o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-d  =  a-dc5h10o+oh  6.250E+09  0.00  6.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h10ooh-a  =  a-bc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h10ooh-c  =  b-cc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h10ooh-d  =  b-dc5h10o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h10ooh-b  =  b-cc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h10ooh-d  =  c-dc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h10ooh-a  =  a-cc5h10o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h10ooh-c  =  c-dc5h10o+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h10ooh-b  =  b-dc5h10o+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h10ooh-a  =  a-dc5h10o+oh  6.250E+09  0.00  6.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-b  =  ac5h10+ho2  1.039E+15  -1.09  1.410E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  bc5h10ooh-a  =  ac5h10+ho2  1.116E+22  -2.71  1.805E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  bc5h10ooh-c  =  bc5h10+ho2  2.140E+21  -2.61  1.760E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  cc5h10ooh-b  =  bc5h10+ho2  1.127E+20  -2.38  1.809E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  cc5h10ooh-d  =  cc5h10+ho2  8.935E+20  -2.65  1.818E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  dc5h10ooh-c  =  cc5h10+ho2  4.607E+18  -1.97  1.585E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  ac5h10ooh-c  =  oh+ch2o+c4h8-2  2.719E+14  -0.48  2.903E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-a  =  oh+ch2o+c4h8-1  4.065E+15  -0.65  2.939E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc5h10ooh-d  =  oh+ch3coch3+c2h4  1.182E+20  -2.06  2.421E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc5h10ooh-a  =  oh+ch3cho+c3h6  8.216E+19  -1.88  2.647E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc5h10ooh-b  =  oh+ch2o+ic4h8  7.478E+11  -0.67  3.078E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac5h10ooh-ao2  =  ac5h10ooh-a+o2  3.125E+20  -1.64  3.570E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  ac5h10ooh-bo2  =  ac5h10ooh-b+o2  4.734E+27  -3.24  3.964E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  ac5h10ooh-co2  =  ac5h10ooh-c+o2  1.374E+23  -2.26  3.799E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ac5h10ooh-do2  =  ac5h10ooh-d+o2  3.136E+20  -1.64  3.570E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  bc5h10ooh-ao2  =  bc5h10ooh-a+o2  7.068E+19  -1.62  3.569E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  bc5h10ooh-co2  =  bc5h10ooh-c+o2  4.417E+22  -2.20  3.793E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  bc5h10ooh-do2  =  bc5h10ooh-d+o2  2.816E+20  -1.62  3.569E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  cc5h10ooh-ao2  =  cc5h10ooh-a+o2  1.066E+20  -1.58  3.566E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  cc5h10ooh-bo2  =  cc5h10ooh-b+o2  1.568E+24  -2.43  3.744E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  cc5h10ooh-do2  =  cc5h10ooh-d+o2  2.132E+20  -1.58  3.566E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  dc5h10ooh-ao2  =  dc5h10ooh-a+o2  5.233E+19  -1.64  3.570E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  dc5h10ooh-bo2  =  dc5h10ooh-b+o2  2.107E+24  -2.48  3.745E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  dc5h10ooh-co2  =  dc5h10ooh-c+o2  6.900E+22  -2.26  3.799E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ac5h10ooh-ao2  =  ic5ketaa+oh  2.500E+10  0.00  2.140E+04
           rev /  5.212E+03  1.26  4.440E+04 /
  ac5h10ooh-bo2  =  ic5ketab+oh  2.000E+11  0.00  2.640E+04
           rev /  4.427E+05  1.06  4.870E+04 /
  ac5h10ooh-co2  =  ic5ketac+oh  2.500E+10  0.00  2.140E+04
           rev /  7.050E+03  1.21  4.442E+04 /
  ac5h10ooh-do2  =  ic5ketad+oh  3.125E+09  0.00  1.935E+04
           rev /  1.299E+03  1.26  4.235E+04 /
  cc5h10ooh-ao2  =  ic5ketca+oh  1.250E+10  0.00  1.785E+04
           rev /  3.266E+02  1.63  4.355E+04 /
  cc5h10ooh-bo2  =  ic5ketcb+oh  1.000E+11  0.00  2.385E+04
           rev /  3.604E+04  1.40  4.890E+04 /
  cc5h10ooh-do2  =  ic5ketcd+oh  1.000E+11  0.00  2.385E+04
           rev /  2.421E+03  1.62  4.969E+04 /
  dc5h10ooh-ao2  =  ic5ketda+oh  3.125E+09  0.00  1.935E+04
           rev /  7.684E+02  1.32  4.265E+04 /
  dc5h10ooh-bo2  =  ic5ketdb+oh  2.500E+10  0.00  2.140E+04
           rev /  6.524E+03  1.31  4.470E+04 /
  dc5h10ooh-co2  =  ic5ketdc+oh  2.000E+11  0.00  2.640E+04
           rev /  1.304E+05  1.16  4.887E+04 /
  a-ac5h10o+oh  =  ch2o+c4h7+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc5h10o+oh  =  ic3h5cho+ch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc5h10o+oh  =  c3h6+ch3co+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc5h10o+oh  =  c3h6+ch2cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc5h10o+oh  =  ic3h5coch3+h+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc5h10o+oh  =  ic4h8+hco+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc5h10o+oh  =  ch2co+ic3h7+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac5h10o+oh  =  c2h3cho+c2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc5h10o+oh  =  ch2o+c4h7+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc5h10o+oh  =  c3h5-t+ch3cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc5h10o+oh  =  ch3chcho+c2h4+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc5h10o+oh  =  ic3h5cho+ch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc5h10o+oh  =  ch3coch3+c2h3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc5h10o+oh  =  sc3h5cho+ch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac5h10o+ho2  =  ch2o+c4h7+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc5h10o+ho2  =  ic3h5cho+ch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc5h10o+ho2  =  c3h6+ch3co+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc5h10o+ho2  =  c3h6+ch2cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc5h10o+ho2  =  ic3h5coch3+h+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc5h10o+ho2  =  ic4h8+hco+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc5h10o+ho2  =  ch2co+ic3h7+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac5h10o+ho2  =  c2h3cho+c2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc5h10o+ho2  =  ch2o+c4h7+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc5h10o+ho2  =  c3h5-t+ch3cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc5h10o+ho2  =  ch3chcho+c2h4+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc5h10o+ho2  =  ic3h5cho+ch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc5h10o+ho2  =  ch3coch3+c2h3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc5h10o+ho2  =  sc3h5cho+ch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h4-a+ho2  =  c2h4+co+oh  1.000E+12  0.00  1.400E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  c3h4-a+ho2  =  c3h3+h2o2  3.000E+13  0.00  1.400E+04
           rev /  1.551E+16  -1.38  4.400E+04 /
  ch3cho+oh  =  ch3+hocho  3.000E+15  -1.08  0.000E+00
           rev /  5.350E+19  -1.68  1.198E+05 /
  ic4h8+c3h5-a  =  ic4h7+c3h6  7.940E+11  0.00  2.050E+04
           rev /  4.400E+20  -1.33  6.061E+04 /
  ic4h7o  =  c3h5-t+ch2o  1.013E+18  -1.45  3.084E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  c3h5-t+o2  =  c3h4-a+ho2  1.890E+30  -5.59  1.554E+04
           rev /  1.569E+31  -5.82  2.661E+04 /
  c5h11o2-1+nc5h12  =  c5h11o2h-1+c5h11-1  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-2+nc5h12  =  c5h11o2h-2+c5h11-1  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-3+nc5h12  =  c5h11o2h-3+c5h11-1  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-1+nc5h12  =  c5h11o2h-1+c5h11-2  8.064E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-2+nc5h12  =  c5h11o2h-2+c5h11-2  8.064E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-3+nc5h12  =  c5h11o2h-3+c5h11-2  8.064E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-1+nc5h12  =  c5h11o2h-1+c5h11-3  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-2+nc5h12  =  c5h11o2h-2+c5h11-3  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  c5h11o2-3+nc5h12  =  c5h11o2h-3+c5h11-3  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  nc5h12+ch3o2  =  c5h11-1+ch3o2h  1.680E+13  0.00  2.044E+04
           rev /  4.990E+10  0.30  4.625E+03 /
  nc5h12+ch3o2  =  c5h11-2+ch3o2h  1.120E+13  0.00  1.769E+04
           rev /  1.571E+14  -0.68  6.473E+03 /
  nc5h12+ch3o2  =  c5h11-3+ch3o2h  5.600E+12  0.00  1.769E+04
           rev /  1.575E+14  -0.68  6.475E+03 /
  c5h11o2-1  =  c5h11-1+o2  1.956E+20  -1.50  3.581E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c5h11-1+c5h11o2-1  =  c5h11o-1+c5h11o-1  7.000E+12  0.00 -1.000E+03
           rev /  3.866E+13  -0.01  2.989E+04 /
  c5h11-1+c5h11o2-2  =  c5h11o-1+c5h11o-2  7.000E+12  0.00 -1.000E+03
           rev /  3.440E+13  0.00  2.958E+04 /
  c5h11-1+c5h11o2-3  =  c5h11o-1+c5h11o-3  7.000E+12  0.00 -1.000E+03
           rev /  6.857E+13  0.00  2.958E+04 /
  c5h11o2-2  =  c5h11-2+o2  5.194E+17  -0.78  3.597E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h11-2+c5h11o2-1  =  c5h11o-2+c5h11o-1  7.000E+12  0.00 -1.000E+03
           rev /  5.474E+10  0.72  2.974E+04 /
  c5h11-2+c5h11o2-2  =  c5h11o-2+c5h11o-2  7.000E+12  0.00 -1.000E+03
           rev /  4.870E+10  0.73  2.943E+04 /
  c5h11-2+c5h11o2-3  =  c5h11o-2+c5h11o-3  7.000E+12  0.00 -1.000E+03
           rev /  9.707E+10  0.73  2.943E+04 /
  c5h11o2-3  =  c5h11-3+o2  2.590E+17  -0.78  3.597E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h11-3+c5h11o2-1  =  c5h11o-3+c5h11o-1  7.000E+12  0.00 -1.000E+03
           rev /  5.441E+10  0.72  2.974E+04 /
  c5h11-3+c5h11o2-2  =  c5h11o-3+c5h11o-2  7.000E+12  0.00 -1.000E+03
           rev /  4.840E+10  0.74  2.943E+04 /
  c5h11-3+c5h11o2-3  =  c5h11o-3+c5h11o-3  7.000E+12  0.00 -1.000E+03
           rev /  9.649E+10  0.74  2.943E+04 /
  c5h11o2-1  =  c5h10ooh1-2  2.000E+11  0.00  2.685E+04
           rev /  2.083E+10  -0.11  1.385E+04 /
  c5h11o2-1  =  c5h10ooh1-3  2.500E+10  0.00  2.085E+04
           rev /  2.604E+09  -0.11  7.850E+03 /
  c5h11o2-1  =  c5h10ooh1-4  3.125E+09  0.00  1.905E+04
           rev /  3.255E+08  -0.11  6.050E+03 /
  c5h11o2-1  =  c5h10ooh1-5  5.860E+08  0.00  2.555E+04
           rev /  1.379E+09  -0.50  1.009E+04 /
  c5h11o2-1+c5h11o2-2  =  o2+c5h11o-1+c5h11o-2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-1+c5h11o2-3  =  o2+c5h11o-1+c5h11o-3  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-1+ch3o2  =  o2+c5h11o-1+ch3o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-1+c5h11o2-1  =  o2+c5h11o-1+c5h11o-1  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2o2+c5h11o2-1  =  ho2+c5h11o2h-1  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
!  c5h11o2-1+ho2  =  c5h11o2h-1+o2  1.750E+10  0.00 -3.275E+03
!           rev /  4.978E+13  -0.83  3.448E+04 /
  c5h11o2-1+ho2  =  c5h11o2h-1+o2  1.75E+11  0.00 -1.711E+03
  c5h11o2-2  =  c5h10ooh2-1  3.000E+11  0.00  2.940E+04
           rev /  7.790E+11  -0.52  1.396E+04 /
  c5h11o2-2  =  c5h10ooh2-3  2.000E+11  0.00  2.685E+04
           rev /  2.698E+10  -0.14  1.390E+04 /
  c5h11o2-2  =  c5h10ooh2-4  2.500E+10  0.00  2.085E+04
           rev /  3.372E+09  -0.14  7.900E+03 /
  c5h11o2-2  =  c5h10ooh2-5  4.688E+09  0.00  2.235E+04
           rev /  1.217E+10  -0.52  6.910E+03 /
  c5h11o2-2+ch3o2  =  o2+c5h11o-2+ch3o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-2+c5h11o2-3  =  c5h11o-2+c5h11o-3+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-2+c5h11o2-2  =  o2+c5h11o-2+c5h11o-2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2o2+c5h11o2-2  =  ho2+c5h11o2h-2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
!  c5h11o2-2+ho2  =  c5h11o2h-2+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.820E+13  -0.85  3.450E+04 /
  c5h11o2-2+ho2  =  c5h11o2h-2+o2  1.75E+11  0.00 -1.711E+03
  c5h11o2-3  =  c5h10ooh3-1  7.500E+10  0.00  2.440E+04
           rev /  1.948E+11  -0.52  8.960E+03 /
  c5h11o2-3  =  c5h10ooh3-2  4.000E+11  0.00  2.685E+04
           rev /  5.396E+10  -0.14  1.390E+04 /
  c5h11o2-3+ch3o2  =  o2+c5h11o-3+ch3o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11o2-3+c5h11o2-3  =  o2+c5h11o-3+c5h11o-3  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  h2o2+c5h11o2-3  =  ho2+c5h11o2h-3  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
!  c5h11o2-3+ho2  =  c5h11o2h-3+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.820E+13  -0.85  3.450E+04 /
  c5h11o2-3+ho2  =  c5h11o2h-3+o2  1.75E+11  0.00 -1.711E+03
  c5h11o2h-1  =  c5h11o-1+oh  1.500E+16  0.00  4.250E+04
           rev /  1.406E+08  1.75 -3.055E+03 /
  c5h11o2h-2  =  c5h11o-2+oh  9.450E+15  0.00  4.160E+04
           rev /  6.741E+07  1.78 -4.285E+03 /
  c5h11o2h-3  =  c5h11o-3+oh  9.450E+15  0.00  4.160E+04
           rev /  1.344E+08  1.78 -4.285E+03 /
  c5h11o-1  =  ch2o+pc4h9  4.236E+16  -1.04  2.001E+04
           rev /  6.250E+10  0.00  1.190E+04 /
  c5h11o-2  =  ch3cho+nc3h7  1.661E+21  -2.26  2.088E+04
           rev /  7.500E+10  0.00  1.190E+04 /
  c5h11o-3  =  c2h5+c2h5cho  2.282E+21  -2.18  2.015E+04
           rev /  8.500E+10  0.00  1.190E+04 /
  c5h10ooh1-2  =  c5h10o1-2+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh1-3  =  c5h10o1-3+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh1-4  =  c5h10o1-4+oh  6.250E+09  0.00  6.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh1-5  =  c5h10o1-5+oh  7.810E+08  0.00  1.800E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh2-1  =  c5h10o1-2+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh2-3  =  c5h10o2-3+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh2-4  =  c5h10o2-4+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh2-5  =  c5h10o1-4+oh  6.250E+09  0.00  6.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh3-2  =  c5h10o2-3+oh  4.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh3-1  =  c5h10o1-3+oh  5.000E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh1-2  =  c5h10-1+ho2  5.729E+17  -1.59  1.590E+04
           rev /  1.250E+11  0.00  8.070E+03 /
  c5h10ooh2-1  =  c5h10-1+ho2  1.073E+20  -2.27  1.822E+04
           rev /  1.250E+11  0.00  8.070E+03 /
  c5h10ooh2-3  =  c5h10-2+ho2  1.603E+20  -2.49  1.786E+04
           rev /  1.250E+11  0.00  8.070E+03 /
  c5h10ooh3-2  =  c5h10-2+ho2  1.603E+20  -2.49  1.786E+04
           rev /  1.250E+11  0.00  8.070E+03 /
  c5h10ooh1-3  =  oh+ch2o+c4h8-1  8.283E+13  -0.17  3.009E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh2-4  =  oh+ch3cho+c3h6  8.312E+17  -1.40  2.717E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh3-1  =  oh+c2h5cho+c2h4  3.096E+18  -1.73  2.682E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10ooh1-2o2  =  c5h10ooh1-2+o2  8.039E+22  -2.30  3.797E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh1-3o2  =  c5h10ooh1-3+o2  8.039E+22  -2.30  3.797E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh1-4o2  =  c5h10ooh1-4+o2  8.039E+22  -2.30  3.797E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh1-5o2  =  c5h10ooh1-5+o2  2.777E+20  -1.62  3.569E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c5h10ooh2-1o2  =  c5h10ooh2-1+o2  2.572E+20  -1.62  3.565E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c5h10ooh2-3o2  =  c5h10ooh2-3+o2  7.251E+22  -2.29  3.791E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh2-4o2  =  c5h10ooh2-4+o2  7.251E+22  -2.29  3.791E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh2-5o2  =  c5h10ooh2-5+o2  2.572E+20  -1.62  3.565E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c5h10ooh3-1o2  =  c5h10ooh3-1+o2  2.572E+20  -1.62  3.565E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  c5h10ooh3-2o2  =  c5h10ooh3-2+o2  7.251E+22  -2.29  3.791E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  c5h10ooh1-2o2  =  nc5ket12+oh  2.000E+11  0.00  2.640E+04
           rev /  1.335E+05  1.17  4.891E+04 /
  c5h10ooh1-3o2  =  nc5ket13+oh  2.500E+10  0.00  2.140E+04
           rev /  5.328E+03  1.35  4.470E+04 /
  c5h10ooh1-4o2  =  nc5ket14+oh  3.125E+09  0.00  1.935E+04
           rev /  6.660E+02  1.35  4.265E+04 /
  c5h10ooh1-5o2  =  nc5ket15+oh  3.906E+08  0.00  2.255E+04
           rev /  9.661E+01  1.32  4.585E+04 /
  c5h10ooh2-1o2  =  nc5ket21+oh  1.000E+11  0.00  2.385E+04
           rev /  1.338E+03  1.70  5.001E+04 /
  c5h10ooh2-3o2  =  nc5ket23+oh  1.000E+11  0.00  2.385E+04
           rev /  6.469E+03  1.59  4.909E+04 /
  c5h10ooh2-4o2  =  nc5ket24+oh  1.250E+10  0.00  1.785E+04
           rev /  2.702E+02  1.76  4.388E+04 /
  c5h10ooh2-5o2  =  nc5ket25+oh  1.563E+09  0.00  1.605E+04
           rev /  4.668E+01  1.71  4.208E+04 /
  c5h10ooh3-1o2  =  nc5ket31+oh  1.250E+10  0.00  1.785E+04
           rev /  3.146E+02  1.70  4.418E+04 /
  c5h10ooh3-2o2  =  nc5ket32+oh  1.000E+11  0.00  2.385E+04
           rev /  4.749E+03  1.59  4.936E+04 /
  c5h10o1-2+oh  =  ch2co+nc3h7+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-3+oh  =  c2h4+c2h5co+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-4+oh  =  ch3coch2+c2h4+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-5+oh  =  ch2ch2cho+c2h4+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-3+oh  =  ch3chco+c2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-4+oh  =  ch3co+c3h6+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-2+oh  =  c2h3cho+c2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-3+oh  =  hco+c4h8-1+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-4+oh  =  ch2cho+c3h6+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-5+oh  =  ch2o+c4h7+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-3+oh  =  c2h3coch3+ch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-4+oh  =  ch3cho+c3h5-s+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-2+ho2  =  ch2co+nc3h7+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-3+ho2  =  c2h4+c2h5co+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-4+ho2  =  ch3coch2+c2h4+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-5+ho2  =  ch2ch2cho+c2h4+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-3+ho2  =  ch3chco+c2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-4+ho2  =  ch3co+c3h6+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-2+ho2  =  c2h3cho+c2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-3+ho2  =  hco+c4h8-1+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-4+ho2  =  ch2cho+c3h6+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o1-5+ho2  =  ch2o+c4h7+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-3+ho2  =  c2h3coch3+ch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h10o2-4+ho2  =  ch3cho+c3h5-s+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h11o2+neoc5h12  =  neoc5h11o2h+neoc5h11  2.419E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  neoc5h12+ch3o2  =  neoc5h11+ch3o2h  2.419E+13  0.00  2.043E+04
           rev /  3.600E+12  0.00  9.800E+03 /
  neoc5h11o2  =  neoc5h11+o2  5.279E+25  -3.90  3.585E+04
           rev /  1.990E+17  -2.10  0.000E+00 /
  neoc5h11+neoc5h11o2  =  neoc5h11o+neoc5h11o  7.000E+12  0.00 -1.000E+03
           rev /  2.420E+14  -0.31  2.993E+04 /
  neoc5h11o2  =  neoc5h10ooh  1.125E+11  0.00  2.440E+04
           rev /  9.144E+10  -0.51  8.950E+03 /
!  neoc5h11o2+ho2  =  neoc5h11o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.104E+13  -0.83  3.448E+04 /
  neoc5h11o2+ho2  =  neoc5h11o2h+o2  1.75E+11  0.00 -1.711E+03
  neoc5h11o2+h2o2  =  neoc5h11o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  neoc5h11o2+ch3o2  =  neoc5h11o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h11o2+neoc5h11o2  =  o2+neoc5h11o+neoc5h11o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h11o2h  =  neoc5h11o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.386E+08  1.75 -3.055E+03 /
  neoc5h11o  =  ch2o+tc4h9  1.349E+22  -2.34  1.899E+04
           rev /  2.000E+11  0.00  1.190E+04 /
  neoc5h10ooh  =  neo-c5h10o+oh  2.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h10ooh  =  oh+ch2o+ic4h8  3.011E+17  -1.17  2.995E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h10ooh-o2  =  neoc5h10ooh+o2  1.366E+25  -3.74  3.570E+04
           rev /  1.990E+17  -2.10  0.000E+00 /
  neoc5h10ooh-o2  =  neoc5h9q2-n  2.500E+10  0.00  2.140E+04
           rev /  4.436E+10  -0.51  1.096E+04 /
  neo-c5h10o+oh  =  tc4h8cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  neo-c5h10o+oh  =  ic4h7+ch2o+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  neo-c5h10o+ho2  =  tc4h8cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neo-c5h10o+ho2  =  ic4h7+ch2o+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6+o2  =  c3h5-a+ho2  4.000E+12  0.00  3.990E+04
           rev /  3.332E+10  0.34 -5.560E+02 /
  c3h6+ch3  =  c3h5-a+ch4  2.210E+00  3.50  5.675E+03
           rev /  2.647E+01  3.51  2.318E+04 /
  c3h6+ch3  =  c3h5-s+ch4  1.348E+00  3.50  1.285E+04
           rev /  1.048E-01  3.99  6.925E+03 /
  c3h6+ch3  =  c3h5-t+ch4  8.400E-01  3.50  1.166E+04
           rev /  1.496E-02  4.19  7.842E+03 /
  c3h6+c2h5  =  c3h5-a+c2h6  1.000E+11  0.00  9.800E+03
           rev /  5.369E+05  1.33  1.644E+04 /
  c3h5-t  =  c2h2+ch3  2.163E+10  -8.31  4.511E+04
           rev /  1.610E+10  -8.58  2.033E+04 /
  c3h5-a+ho2  =  c2h3+ch2o+oh  1.000E-18  0.00  0.000E+00
           rev /  1.000E-30  0.00  0.000E+00 /
  c3h5-a+h  =  c3h4-a+h2  1.810E+13  0.00  0.000E+00
           rev /  1.230E+13  0.12  4.723E+04 /
  c3h5-a+ch3  =  c3h4-a+ch4  1.000E+11  0.00  0.000E+00
           rev /  4.921E+12  0.05  4.778E+04 /
  c3h5-a+c2h5  =  c2h6+c3h4-a  4.000E+11  0.00  0.000E+00
           rev /  1.802E+12  0.05  4.033E+04 /
  c3h5-a+c2h5  =  c2h4+c3h6  4.000E+11  0.00  0.000E+00
           rev /  6.937E+16  -1.33  5.280E+04 /
  c3h5-a+c2h3  =  c2h4+c3h4-a  1.000E+12  0.00  0.000E+00
           rev /  1.624E+13  0.05  4.819E+04 /
  c3h4-a+c3h6  =  c3h5-a+c3h5-a  8.391E+17  -1.29  3.369E+04
           rev /  1.000E+12  0.00  0.000E+00 /
  c3h5-a+o2  =  c2h3cho+oh  2.470E+13  -0.44  2.302E+04
           rev /  1.903E+14  -0.80  7.488E+04 /
  c3h5-s+o2  =  ch3cho+hco  4.335E+12  0.00  0.000E+00
           rev /  1.611E+17  -1.27  9.653E+04 /
  c3h5-s+h  =  c3h4-a+h2  3.333E+12  0.00  0.000E+00
           rev /  7.977E+12  0.11  6.886E+04 /
  c3h5-s+ch3  =  c3h4-a+ch4  1.000E+11  0.00  0.000E+00
           rev /  6.253E+12  0.11  6.934E+04 /
  c3h5-t+o2  =  ch3coch2+o  3.810E+17  -1.36  5.580E+03
           rev /  2.000E+11  0.00  1.750E+04 /
  c3h5-t+h  =  c3h4-p+h2  3.333E+12  0.00  0.000E+00
           rev /  2.138E+16  -0.88  7.105E+04 /
  c3h5-t+ch3  =  c3h4-p+ch4  1.000E+11  0.00  0.000E+00
           rev /  1.676E+16  -0.88  7.153E+04 /
  c3h4-a+m  =  c3h3+h+m  1.143E+17  0.00  7.000E+04
           rev /  1.798E+15  -0.38  1.061E+04 /
  c3h4-a  =  c3h4-p  1.202E+15  0.00  9.240E+04
           rev /  3.222E+18  -0.99  9.659E+04 /
  c3h4-a+o2  =  c3h3+ho2  4.000E+13  0.00  3.916E+04
           rev /  1.175E+11  0.30  3.800E+01 /
  c3h4-a+ho2  =  ch2co+ch2+oh  4.000E+12  0.00  1.900E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  c3h3+h  =  c3h2+h2  5.000E+13  0.00  0.000E+00
           rev /  3.853E+10  0.38  4.600E+03 /
  c3h4-a+oh  =  c3h3+h2o  1.000E+07  2.00  1.000E+03
           rev /  7.003E+06  1.97  3.452E+04 /
  c3h4-a+o  =  c2h4+co  7.800E+12  0.00  1.600E+03
           rev /  8.280E+13  -0.21  1.248E+05 /
  c3h2+oh  =  c2h2+hco  5.000E+13  0.00  0.000E+00
           rev /  2.907E+20  -1.39  7.852E+04 /
  c3h5-a  =  c3h4-a+h  6.663E+15  -0.43  6.322E+04
           rev /  2.400E+11  0.69  3.007E+03 /
  c3h5-t  =  c3h4-a+h  3.508E+14  -0.44  4.089E+04
           rev /  8.500E+12  0.00  2.000E+03 /
  c3h4-a+h  =  c3h3+h2  2.000E+07  2.00  5.000E+03
           rev /  3.235E+06  1.97  2.336E+04 /
  c3h4-a+ch3  =  c3h3+ch4  3.670E-02  4.01  6.830E+03
           rev /  1.551E-01  3.98  2.567E+04 /
  c3h4-a+c3h5-a  =  c3h3+c3h6  2.000E+11  0.00  7.700E+03
           rev /  2.644E+19  -2.71  4.214E+04 /
  c3h4-a+c2h  =  c3h3+c2h2  1.000E+13  0.00  0.000E+00
           rev /  1.420E+16  -1.38  5.382E+04 /
  c3h4-p+m  =  c3h3+h+m  1.143E+17  0.00  7.000E+04
           rev /  6.708E+11  0.61  6.420E+03 /
  c3h4-p  =  c2h+ch3  4.200E+16  0.00  1.000E+05
           rev /  1.018E+12  0.61 -1.600E+03 /
  ic4h7-i1  =  c3h4-p+ch3  2.103E+12  0.08  2.995E+04
           rev /  1.000E+11  0.00  9.200E+03 /
  c3h4-p+o2  =  c3h3+ho2  2.000E+13  0.00  4.160E+04
           rev /  2.354E+11  0.14  7.800E+01 /
  c3h4-p+ho2  =  c2h4+co+oh  3.000E+12  0.00  1.900E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  c3h4-p+oh  =  c3h3+h2o  1.000E+07  2.00  1.000E+03
           rev /  2.805E+07  1.81  3.212E+04 /
  ic4h7+o2  =  ic3h5cho+oh  2.470E+13  -0.45  2.302E+04
           rev /  1.620E+14  -0.76  7.339E+04 /
  c3h4-p+o  =  c3h3+oh  7.650E+08  1.50  8.600E+03
           rev /  2.177E+08  1.31  2.247E+04 /
  c3h4-p+o  =  c2h3+hco  3.200E+12  0.00  2.010E+03
           rev /  2.548E+12  -0.39  3.235E+04 /
  ic4h7+o2  =  ch3coch2+ch2o  7.140E+15  -1.21  2.105E+04
           rev /  1.226E+15  -1.20  9.019E+04 /
  c3h4-p+o  =  hcco+ch3  9.600E+08  1.00  0.000E+00
           rev /  1.643E+10  -0.20  2.409E+04 /
  ic4h7+o2  =  c3h4-a+ch2o+oh  7.290E+29  -5.71  2.145E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h5-t  =  c3h4-p+h  1.075E+15  -0.60  3.849E+04
           rev /  6.500E+12  0.00  2.000E+03 /
  c3h5-s  =  c3h4-p+h  4.187E+15  -0.79  3.748E+04
           rev /  5.800E+12  0.00  3.100E+03 /
  c3h4-p+h  =  c3h3+h2  2.000E+07  2.00  5.000E+03
           rev /  1.296E+07  1.81  2.096E+04 /
  c3h4-p+ch3  =  c3h3+ch4  1.500E+00  3.50  5.600E+03
           rev /  2.539E+01  3.31  2.204E+04 /
  c3h4-p+c2h  =  c3h3+c2h2  1.000E+12  0.00  0.000E+00
           rev /  5.297E+11  -0.39  4.963E+04 /
  c3h4-p+c2h3  =  c3h3+c2h4  1.000E+12  0.00  7.700E+03
           rev /  9.541E+11  -0.39  5.245E+04 /
  c3h4-p+c3h5-a  =  c3h3+c3h6  1.000E+12  0.00  7.700E+03
           rev /  4.931E+16  -1.73  3.795E+04 /
  c3h3+o  =  ch2o+c2h  1.000E+13  0.00  0.000E+00
           rev /  5.446E+14  0.00  3.161E+04 /
  c3h3+oh  =  c3h2+h2o  1.000E+13  0.00  0.000E+00
           rev /  1.343E+15  0.00  1.568E+04 /
  c3h3+o2  =  ch2co+hco  3.010E+10  0.00  2.870E+03
           rev /  4.881E+11  0.00  5.947E+04 /
  c3h3+ch3  =  c2h5+c2h  4.564E+17  -1.10  4.873E+04
           rev /  1.810E+13  0.00  0.000E+00 /
  sc4h9o2  =  sc4h9+o2  2.056E+17  -0.68  3.574E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  sc4h9+ho2  =  sc4h9o+oh  7.000E+12  0.00 -1.000E+03
           rev /  7.138E+12  0.19  2.668E+04 /
  ch3o2+sc4h9  =  ch3o+sc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  6.972E+14  -0.39  3.144E+04 /
  pc4h9o2  =  pc4h9+o2  6.155E+19  -1.38  3.551E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  pc4h9+ho2  =  pc4h9o+oh  7.000E+12  0.00 -1.000E+03
           rev /  3.046E+15  -0.48  2.672E+04 /
  ch3o2+pc4h9  =  ch3o+pc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  2.975E+17  -1.06  3.148E+04 /
  tc4h9o2  =  tc4h9+o2  4.897E+24  -2.51  3.746E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  tc4h9+ho2  =  tc4h9o+oh  7.000E+12  0.00 -1.000E+03
           rev /  3.528E+19  -1.62  2.949E+04 /
  ch3o2+tc4h9  =  ch3o+tc4h9o  7.000E+12  0.00 -1.000E+03
           rev /  3.446E+21  -2.20  3.425E+04 /
  ic4h9o2  =  ic4h9+o2  1.260E+20  -1.61  3.567E+04
           rev /  2.260E+12  0.00  0.000E+00 /
  ic4h9+ho2  =  ic4h9o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.262E+16  -0.72  2.668E+04 /
  ch3o2+ic4h9  =  ch3o+ic4h9o  7.000E+12  0.00 -1.000E+03
           rev /  1.233E+18  -1.30  3.144E+04 /
  c2h3o1-2  =  ch3co  8.500E+14  0.00  1.400E+04
           rev /  1.488E+14  -0.01  4.768E+04 /
  c2h3o1-2  =  ch2cho  1.000E+14  0.00  1.400E+04
           rev /  1.615E+15  -0.41  4.246E+04 /
  ch2cho  =  ch2co+h  3.094E+15  -0.26  5.082E+04
           rev /  5.000E+13  0.00  1.230E+04 /
  ch2cho+o2  =  ch2o+co+oh  2.000E+13  0.00  4.200E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c3ket12  =  ch3cho+hco+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3ket13  =  ch2o+ch2cho+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c3ket21  =  ch2o+ch3co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket12  =  c2h5cho+hco+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket13  =  ch3cho+ch2cho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket14  =  ch2ch2cho+ch2o+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket21  =  ch2o+c2h5co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket23  =  ch3cho+ch3co+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc4ket24  =  ch2o+ch3coch2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4ketii  =  ch2o+c2h5co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4ketit  =  ch3coch3+hco+oh  9.500E+15  0.00  4.254E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket12  =  nc3h7cho+hco+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket13  =  c2h5cho+ch2cho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket14  =  ch3cho+ch2ch2cho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket15  =  ch2o+c3h6cho-1+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket21  =  ch2o+nc3h7co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket23  =  c2h5cho+ch3co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket24  =  ch3cho+ch3coch2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket25  =  ch2o+ch2ch2coch3+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket31  =  ch2o+c2h5coch2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5ket32  =  ch3cho+c2h5co+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketaa  =  ch2o+c3h6cho-3+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketab  =  c2h5coch3+hco+oh  9.500E+15  0.00  4.254E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketac  =  ch3cho+ch3chcho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketad  =  ch2o+ic3h6cho+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketca  =  ch2o+ch3chcoch3+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketcb  =  ch3coch3+ch3co+oh  9.500E+15  0.00  4.254E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketcd  =  ch2o+ic3h7co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketda  =  ch2o+c3h6cho-2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketdb  =  ch3coch3+ch2cho+oh  9.500E+15  0.00  4.254E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5ketdc  =  ic3h7cho+hco+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5ket  =  neoc5ketox+oh  1.500E+16  0.00  4.200E+04
           rev /  1.528E+08  1.73 -3.765E+03 /
  o2cho  =  hco+o2  7.766E+26  -3.96  4.423E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  c3h8+o2cho  =  nc3h7+ho2cho  5.520E+04  2.55  1.648E+04
           rev /  1.187E-08  5.54 -1.920E+03 /
  c3h8+o2cho  =  ic3h7+ho2cho  1.475E+04  2.60  1.391E+04
           rev /  7.838E-06  4.65 -3.000E+01 /
  ic4h8+o2cho  =  ic4h7+ho2cho  1.928E+04  2.60  1.391E+04
           rev /  6.514E-07  4.90 -3.468E+03 /
  ic4h10+o2cho  =  ic4h9+ho2cho  2.520E+13  0.00  2.044E+04
           rev /  1.006E+00  3.06  2.375E+03 /
  ic4h10+o2cho  =  tc4h9+ho2cho  2.800E+12  0.00  1.601E+04
           rev /  1.893E+01  2.72  4.678E+03 /
  c4h10+o2cho  =  pc4h9+ho2cho  1.680E+13  0.00  2.044E+04
           rev /  3.680E+00  2.99  2.505E+03 /
  c4h10+o2cho  =  sc4h9+ho2cho  1.120E+13  0.00  1.769E+04
           rev /  7.595E+03  2.06  4.266E+03 /
  nc5h12+o2cho  =  c5h11-1+ho2cho  1.680E+13  0.00  2.044E+04
           rev /  1.368E+00  3.11  2.295E+03 /
  nc5h12+o2cho  =  c5h11-2+ho2cho  1.120E+13  0.00  1.769E+04
           rev /  4.306E+03  2.13  4.147E+03 /
  nc5h12+o2cho  =  c5h11-3+ho2cho  5.600E+12  0.00  1.769E+04
           rev /  4.318E+03  2.13  4.149E+03 /
  ic5h12+o2cho  =  cc5h11+ho2cho  5.600E+12  0.00  1.769E+04
           rev /  4.350E+03  2.12  4.135E+03 /
  ic5h12+o2cho  =  dc5h11+ho2cho  8.400E+12  0.00  2.044E+04
           rev /  3.009E+00  3.01  2.459E+03 /
  neoc5h12+o2cho  =  neoc5h11+ho2cho  3.360E+13  0.00  2.044E+04
           rev /  1.024E+03  2.13  4.204E+03 /
  ch2o+o2cho  =  hco+ho2cho  1.990E+12  0.00  1.167E+04
           rev /  2.331E+02  2.30  4.687E+03 /
  ho2cho  =  ocho+oh  5.010E+14  0.00  4.015E+04
           rev /  2.322E+06  2.15  6.550E+02 /
  ocho+m  =  h+co2+m  2.443E+15  -0.50  2.650E+04
           rev /  7.500E+13  0.00  2.900E+04 /
  c3h5-a+o2  =  c3h4-a+ho2  2.180E+21  -2.85  3.076E+04
           rev /  2.690E+19  -2.40  2.050E+04 /
  c3h5-a+o2  =  ch2cho+ch2o  7.140E+15  -1.21  2.105E+04
           rev /  4.944E+16  -1.40  8.862E+04 /
  c3h5-a+o2  =  c2h2+ch2o+oh  9.720E+29  -5.71  2.145E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  hcco+o2  =  co2+hco  2.400E+11  0.00 -8.540E+02
           rev /  1.474E+14  0.00  1.336E+05 /
  c3h6+h  =  c3h5-s+h2  8.040E+05  2.50  1.228E+04
           rev /  2.393E+03  2.99  5.876E+03 /
  ch2co+oh  =  ch2oh+co  3.730E+12  0.00 -1.013E+03
           rev /  9.430E+06  1.66  2.749E+04 /
  ch3+o2  =  ch2o+oh  7.470E+11  0.00  1.425E+04
           rev /  7.778E+11  0.00  6.777E+04 /
  c2h4+h2  =  ch3+ch3  3.767E+12  0.83  8.471E+04
           rev /  1.000E+14  0.00  3.200E+04 /
  c3h5-t+o2  =  ch2o+ch3co  3.710E+25  -3.96  7.043E+03
           rev /  1.872E+27  -4.43  1.012E+05 /
  tc3h6cho+ho2  =  tc3h6ocho+oh  9.640E+12  0.00  0.000E+00
           rev /  2.018E+17  -1.20  2.101E+04 /
  tc3h6ocho  =  ch3coch3+hco  3.980E+13  0.00  9.700E+03
           rev /  2.173E+08  0.80  1.424E+04 /
  tc3h6cho  =  ic3h5cho+h  2.879E+16  -0.63  4.128E+04
           rev /  1.300E+13  0.00  1.200E+03 /
  tc3h6cho  =  ic3h6co+h  8.876E+16  -0.71  4.435E+04
           rev /  1.300E+13  0.00  4.800E+03 /
  tc3h6cho+h2  =  ic3h7cho+h  2.160E+05  2.38  1.899E+04
           rev /  1.319E+05  2.47  3.550E+03 /
  ic3h7cho  =  tc3h6cho+h  2.304E+18  -0.91  9.200E+04
           rev /  2.000E+14  0.00  0.000E+00 /
  neoc5h10ooh  =  ic4h7ooh+ch3  3.386E+18  -1.40  3.003E+04
           rev /  1.250E+11  0.00  1.010E+04 /
  ic4h7ooh  =  ic4h7o+oh  6.400E+15  0.00  4.555E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  ic4h7oh  =  ic4h7o+h  5.969E+16  -0.56  1.059E+05
           rev /  4.000E+13  0.00  0.000E+00 /
  ic4h8oh  =  ic4h7oh+h  3.709E+14  -0.36  4.079E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  ic4h7o+h2  =  ic4h7oh+h  9.050E+06  2.00  1.783E+04
           rev /  7.161E+05  2.44  1.631E+04 /
  ic4h7oh  =  ic4h7+oh  7.310E+16  -0.41  7.970E+04
           rev /  3.000E+13  0.00  0.000E+00 /
  ic4h7o+neoc5h12  =  ic4h7oh+neoc5h11  5.400E+11  0.00  4.000E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  ic4h7o+ch2o  =  ic4h7oh+hco  1.150E+11  0.00  1.280E+03
           rev /  3.020E+11  0.00  1.816E+04 /
  tc3h6cho+neoc5h12  =  ic3h7cho+neoc5h11  9.400E+02  3.30  1.984E+04
           rev /  7.159E+01  3.22  9.819E+03 /
  tc3h6cho+ch2o  =  ic3h7cho+hco  2.520E+08  1.90  1.819E+04
           rev /  1.229E+07  1.99  1.742E+04 /
  tc3h6cho+ic4h8  =  ic3h7cho+ic4h7  4.700E+02  3.30  1.984E+04
           rev /  6.613E+00  3.39  8.672E+03 /
  ic3h6co+oh  =  ic3h7+co2  1.730E+12  0.00 -1.010E+03
           rev /  2.577E+14  -0.43  5.548E+04 /
  tc3h6ohcho  =  tc3h6cho+oh  9.990E+20  -1.46  8.748E+04
           rev /  5.000E+13  0.00  0.000E+00 /
  tc3h6ohcho  =  tc3h6oh+hco  5.164E+23  -1.90  7.685E+04
           rev /  1.810E+13  0.00  0.000E+00 /
  tc3h6oh  =  ch3coch3+h  5.000E+13  0.00  2.186E+04
           rev /  1.000E+12  0.00  0.000E+00 /
  tc3h6oh  =  ic3h5oh+h  6.196E+15  -0.66  4.034E+04
           rev /  1.300E+13  0.00  1.560E+03 /
  ic3h5oh  =  c3h5-t+oh  7.369E+19  -0.94  1.091E+05
           rev /  5.000E+13  0.00  0.000E+00 /
  tc3h6o2cho  =  tc3h6cho+o2  2.787E+25  -4.07  2.845E+04
           rev /  1.990E+17  -2.10  0.000E+00 /
  tc3h6o2cho  =  ic3h5o2hcho  6.000E+11  0.00  2.988E+04
           rev /  1.390E+12  -0.52  1.480E+04 /
  tc3h6o2cho  =  tc3h6o2hco  1.000E+11  0.00  2.575E+04
           rev /  8.258E+11  -0.52  2.280E+04 /
  ic3h5o2hcho  =  ic3h5cho+ho2  8.944E+20  -2.44  1.503E+04
           rev /  2.230E+11  0.00  1.060E+04 /
  tc3h6o2hco  =  ch3coch3+co+oh  4.244E+18  -1.43  4.800E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  tc3h6oh+o2  =  ch3coch3+ho2  2.230E+13  0.00  0.000E+00
           rev /  6.529E+17  -1.19  2.561E+04 /
  ic3h6co+oh  =  tc3h6oh+co  2.000E+12  0.00 -1.010E+03
           rev /  1.009E+09  0.90  3.154E+04 /
  ic4h9o  =  ic3h7cho+h  4.000E+14  0.00  2.150E+04
           rev /  1.139E+10  1.08  2.500E+03 /
  ic3h7cho+ho2  =  ic3h7co+h2o2  3.000E+12  0.00  1.192E+04
           rev /  7.707E+12  -0.33  1.199E+04 /
  ic3h7cho+ho2  =  tc3h6cho+h2o2  8.000E+10  0.00  1.192E+04
           rev /  3.366E+12  -0.42  1.105E+04 /
  ic3h7cho+ch3  =  ic3h7co+ch4  3.980E+12  0.00  8.700E+03
           rev /  2.325E+13  -0.06  2.563E+04 /
  ic3h7cho+o  =  ic3h7co+oh  7.180E+12  0.00  1.389E+03
           rev /  7.052E+11  -0.06  1.574E+04 /
  ic3h7cho+o2  =  ic3h7co+ho2  4.000E+13  0.00  3.760E+04
           rev /  1.625E+11  0.27 -3.432E+03 /
  ic3h7cho+oh  =  ic3h7co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.164E+10  0.75  3.120E+04 /
  ic3h7cho+oh  =  tc3h6cho+h2o  1.684E+12  0.00 -7.810E+02
           rev /  1.194E+13  -0.09  2.981E+04 /
  ic3h7cho+h  =  ic3h7co+h2  2.600E+12  0.00  2.600E+03
           rev /  1.000E+00  0.00  0.000E+00 /
  ic3h7cho  =  ic3h7+hco  1.129E+17  -0.03  7.976E+04
           rev /  1.810E+13  0.00  0.000E+00 /
  ic3h7co  =  ic3h7+co  1.426E+13  -0.04  1.095E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic3h7cho+oh  =  ic3h6cho+h2o  3.120E+06  2.00 -2.980E+02
           rev /  6.388E+05  1.99  1.913E+04 /
  ic3h7cho+ho2  =  ic3h6cho+h2o2  2.740E+04  2.55  1.550E+04
           rev /  3.330E+04  2.21  3.468E+03 /
  ic3h7cho+ch3o2  =  ic3h6cho+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  2.377E+05  2.04  3.742E+03 /
  ac5h10  =  c3h5-t+c2h5  6.247E+22  -1.95  9.940E+04
           rev /  1.500E+12  0.00  0.000E+00 /
  tc3h6cho+o2  =  ic3h5cho+ho2  2.725E-19  0.00  7.240E+03
           rev /  1.390E+11  -0.20  1.731E+04 /
  tc3h6cho+o2  =  ch3coch3+co+oh  3.620E-20  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  tc3h6cho+ho2  =  ic3h7cho+o2  3.675E+12  0.00  1.310E+03
           rev /  1.236E+14  -0.24  4.335E+04 /
  tc3h6cho+ch3  =  ic3h5cho+ch4  3.010E+12  -0.32 -1.310E+02
           rev /  2.207E+15  -0.85  6.790E+04 /
  ic3h5cho+oh  =  ic3h5co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  4.400E+10  0.78  3.608E+04 /
  ic3h5cho+ho2  =  ic3h5co+h2o2  1.000E+12  0.00  1.192E+04
           rev /  9.709E+12  -0.31  1.688E+04 /
  ic3h5cho+ch3  =  ic3h5co+ch4  3.980E+12  0.00  8.700E+03
           rev /  3.928E+13  0.02  3.045E+04 /
  ic3h5cho+o  =  ic3h5co+oh  7.180E+12  0.00  1.389E+03
           rev /  1.191E+12  0.02  2.056E+04 /
  ic3h5cho+o2  =  ic3h5co+ho2  2.000E+13  0.00  4.070E+04
           rev /  1.372E+11  0.35  4.484E+03 /
  ic3h5cho+h  =  ic3h5co+h2  2.600E+12  0.00  2.600E+03
           rev /  9.822E+11  0.02  2.387E+04 /
  ic3h5co  =  c3h5-t+co  1.278E+20  -1.89  3.446E+04
           rev /  1.510E+11  0.00  4.809E+03 /
  ic4h7o+o2  =  ic3h5cho+ho2  3.000E+10  0.00  1.649E+03
           rev /  6.312E+10  -0.14  3.898E+04 /
  ic4h7o+ho2  =  ic3h5cho+h2o2  3.000E+11  0.00  0.000E+00
           rev /  8.930E+14  -0.80  7.850E+04 /
  ic4h7o+ch3  =  ic3h5cho+ch4  2.400E+13  0.00  0.000E+00
           rev /  7.261E+16  -0.47  9.529E+04 /
  ic4h7o+o  =  ic3h5cho+oh  6.000E+12  0.00  0.000E+00
           rev /  3.052E+14  -0.47  9.272E+04 /
  ic4h7o+oh  =  ic3h5cho+h2o  1.810E+13  0.00  0.000E+00
           rev /  9.076E+15  -0.47  1.100E+05 /
  ic4h7o+h  =  ic3h5cho+h2  1.990E+13  0.00  0.000E+00
           rev /  2.305E+15  -0.47  9.481E+04 /
  ic4h7o  =  ic4h6oh  1.391E+11  0.00  1.560E+04
           rev /  4.233E+11  -0.16  3.167E+04 /
  ic4h6oh+h2  =  ic4h7oh+h  2.160E+04  2.38  1.899E+04
           rev /  5.614E+02  2.98  1.399E+03 /
  ic4h6oh+ho2  =  ic4h7oh+o2  4.192E+13  -0.28  9.000E+00
           rev /  6.000E+13  0.00  3.990E+04 /
  ic4h6oh+neoc5h12  =  ic4h7oh+neoc5h11  9.400E+02  3.30  1.984E+04
           rev /  5.077E-01  3.74  7.668E+03 /
  ic4h6oh+ch2o  =  ic4h7oh+hco  6.300E+08  1.90  1.819E+04
           rev /  1.308E+06  2.50  1.527E+04 /
  ic4h6oh+ic4h8  =  ic4h7oh+ic4h7  4.700E+02  3.30  1.984E+04
           rev /  2.814E-01  3.90  6.521E+03 /
  ic4h7oh  =  ic4h6oh+h  4.902E+16  -0.40  8.985E+04
           rev /  1.000E+14  0.00  0.000E+00 /
  ic4h7oh+ho2  =  ic4h6oh+h2o2  7.922E+02  2.98  1.230E+04
           rev /  7.830E+05  2.05  1.358E+04 /
  ic4h9o+ho2  =  ic3h7cho+h2o2  1.000E+12  0.00  0.000E+00
           rev /  1.380E+13  -0.25  7.213E+04 /
  ic4h9o+oh  =  ic3h7cho+h2o  1.810E+13  0.00  0.000E+00
           rev /  4.209E+13  0.08  1.036E+05 /
  ic4h9o+ch3  =  ic3h7cho+ch4  2.400E+13  0.00  0.000E+00
           rev /  3.368E+14  0.08  8.892E+04 /
  ic4h9o+o  =  ic3h7cho+oh  6.000E+12  0.00  0.000E+00
           rev /  1.415E+12  0.08  8.635E+04 /
  ic4h9o+h  =  ic3h7cho+h2  1.990E+13  0.00  0.000E+00
           rev /  1.069E+13  0.08  8.844E+04 /
  ic4h8+o2  =  ic4h7+ho2  6.000E+12  0.00  3.990E+04
           rev /  2.209E+12  -0.28  3.000E+01 /
  ic4h8+o  =  ic3h6co+h+h  1.660E+07  1.76  7.600E+01
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h6oh  =  c3h4-a+ch2oh  1.723E+22  -2.71  5.498E+04
           rev /  1.000E+11  0.00  9.200E+03 /
  ic3h7+oh  =  c3h6+h2o  2.410E+13  0.00  0.000E+00
           rev /  2.985E+12  0.57  8.382E+04 /
  ic3h7+o  =  ch3coch3+h  4.818E+13  0.00  0.000E+00
           rev /  1.293E+16  -0.19  7.938E+04 /
  ic3h7+o  =  ch3cho+ch3  4.818E+13  0.00  0.000E+00
           rev /  1.279E+11  0.80  8.648E+04 /
  c3h6+h  =  c3h5-t+h2  4.050E+05  2.50  9.794E+03
           rev /  2.761E+02  3.19  5.500E+03 /
  c3h6  =  c3h5-t+h  5.620E+71 -16.58  1.393E+05
           rev /  2.032E+64 -14.89  2.755E+04 /
  ic4h8o  =  ic3h7cho  4.180E+13  0.00  5.272E+04
           rev /  1.392E+10  0.55  7.205E+04 /
  neo-c5h10o  =  ic4h8+ch2o  3.800E+15  0.00  6.070E+04
           rev /  3.152E+04  1.99  5.973E+04 /
  ic4h7o  =  ic3h5cho+h  5.000E+13  0.00  2.910E+04
           rev /  3.071E+11  0.53  1.647E+04 /
  tc4h8cho  =  ic3h5cho+ch3  1.000E+13  0.00  2.629E+04
           rev /  2.230E+11  0.00  1.060E+04 /
  tc4h8cho  =  ic4h8+hco  8.520E+12  0.00  2.009E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  o2c4h8cho  =  tc4h8cho+o2  1.519E+19  -1.44  3.451E+04
           rev /  2.000E+12  0.00  0.000E+00 /
  o2c4h8cho  =  o2hc4h8co  2.160E+11  0.00  1.536E+04
           rev /  1.173E+13  -0.68  1.488E+04 /
  o2hc4h8co  =  ic4h8o2h-t+co  3.299E+22  -2.72  1.176E+04
           rev /  1.500E+11  0.00  4.809E+03 /
  neo-c5h10o+h  =  tc4h8cho+h2  3.544E+07  2.00  5.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  neo-c5h10o+h  =  ic4h7+ch2o+h2  1.330E+06  2.54  6.756E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h7o+ic4h8  =  ic4h7oh+ic4h7  2.700E+11  0.00  4.000E+03
           rev /  1.000E+10  0.00  9.000E+03 /
  ic4h6oh+ho2  =  ch2cch2oh+ch2o+oh  1.446E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ic4h8+ch2cch2oh  =  ic4h7+c3h5oh  7.940E+11  0.00  2.050E+04
           rev /  2.750E+11  -0.05  2.847E+04 /
  neoc5h12+ch2cch2oh  =  neoc5h11+c3h5oh  1.590E+12  0.00  2.050E+04
           rev /  4.968E+11  -0.22  2.962E+04 /
  c3h5oh+ho2  =  ch2cch2oh+h2o2  1.761E+09  0.28  2.259E+04
           rev /  3.010E+09  0.00  2.583E+03 /
  c3h5oh+oh  =  ch2cch2oh+h2o  5.060E+12  0.00  5.960E+03
           rev /  1.457E+12  0.05  1.741E+04 /
  c3h5oh+h  =  ch2cch2oh+h2  3.900E+05  2.50  5.821E+03
           rev /  2.594E+04  2.55  2.121E+03 /
  c3h5oh+o2  =  ch2cch2oh+ho2  4.000E+13  0.00  6.069E+04
           rev /  4.833E+10  0.38 -4.920E+02 /
  c3h5oh+ch3  =  ch2cch2oh+ch4  2.400E+11  0.00  8.030E+03
           rev /  4.170E+11  0.05  4.810E+03 /
  ic4h7oh  =  ch2cch2oh+ch3  1.247E+20  -0.98  9.857E+04
           rev /  3.000E+13  0.00  0.000E+00 /
  c3h5oh  =  ch2cch2oh+h  2.835E+19  -1.05  1.111E+05
           rev /  1.000E+14  0.00  0.000E+00 /
  ch2cch2oh+o2  =  ch2oh+co+ch2o  4.335E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2cch2oh  =  c2h2+ch2oh  2.163E+40  -8.31  4.511E+04
           rev /  1.610E+40  -8.58  2.033E+04 /
  ch2cch2oh  =  c3h4-a+oh  6.697E+16  -1.11  4.258E+04
           rev /  8.500E+12  0.00  2.000E+03 /
  c2h4+ho2  =  c2h4o1-2+oh  2.230E+12  0.00  1.719E+04
           rev /  1.082E+14  -0.17  3.779E+04 /
  nc3h7cho+o2  =  nc3h7co+ho2  2.000E+13  0.50  4.220E+04
           rev /  1.000E+07  0.50  4.000E+03 /
  nc3h7cho+oh  =  nc3h7co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.852E+10  0.75  3.122E+04 /
  nc3h7cho+h  =  nc3h7co+h2  4.000E+13  0.00  4.200E+03
           rev /  1.800E+13  0.00  2.400E+04 /
  nc3h7cho+o  =  nc3h7co+oh  5.000E+12  0.00  1.790E+03
           rev /  1.000E+12  0.00  1.900E+04 /
  nc3h7cho+ho2  =  nc3h7co+h2o2  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  nc3h7cho+ch3  =  nc3h7co+ch4  1.700E+12  0.00  8.440E+03
           rev /  1.500E+13  0.00  2.800E+04 /
  nc3h7cho+ch3o  =  nc3h7co+ch3oh  1.150E+11  0.00  1.280E+03
           rev /  3.000E+11  0.00  1.800E+04 /
  nc3h7cho+ch3o2  =  nc3h7co+ch3o2h  1.000E+12  0.00  9.500E+03
           rev /  2.500E+10  0.00  1.000E+04 /
  nc3h7cho+oh  =  c3h6cho-1+h2o  5.270E+09  0.97  1.586E+03
           rev /  1.089E+09  0.96  2.102E+04 /
  nc3h7cho+oh  =  c3h6cho-2+h2o  4.670E+07  1.61 -3.500E+01
           rev /  8.057E+05  1.91  2.194E+04 /
  nc3h7cho+oh  =  c3h6cho-3+h2o  2.700E+09  1.00 -1.490E+02
           rev /  6.194E+10  0.75  2.874E+04 /
  nc3h7cho+ho2  =  c3h6cho-1+h2o2  9.030E-01  3.65  7.153E+03
           rev /  1.108E+00  3.31 -4.874E+03 /
  nc3h7cho+ho2  =  c3h6cho-2+h2o2  1.475E+04  2.60  1.391E+04
           rev /  1.511E+03  2.57  4.424E+03 /
  nc3h7cho+ho2  =  c3h6cho-3+h2o2  3.610E+03  2.55  1.053E+04
           rev /  4.916E+05  1.97  7.954E+03 /
  nc3h7cho+ch3o2  =  c3h6cho-1+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.040E+13  -0.51  6.628E+03 /
  nc3h7cho+ch3o2  =  c3h6cho-2+ch3o2h  9.630E+03  2.60  1.391E+04
           rev /  4.053E+03  2.40  3.704E+03 /
  nc3h7cho+ch3o2  =  c3h6cho-3+ch3o2h  9.630E+03  2.60  1.151E+04
           rev /  5.389E+06  1.84  8.212E+03 /
  nc3h7co  =  nc3h7+co  5.325E+15  -0.86  1.340E+04
           rev /  1.500E+11  0.00  4.800E+03 /
  c2h5coch3+oh  =  ch2ch2coch3+h2o  7.550E+09  0.97  1.586E+03
           rev /  1.527E+09  0.96  2.102E+04 /
  c2h5coch3+oh  =  ch3chcoch3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  1.586E+13  -0.23  2.862E+04 /
  c2h5coch3+oh  =  c2h5coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.628E+13  -0.70  2.767E+04 /
  c2h5coch3+ho2  =  ch2ch2coch3+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.857E+04  2.22  4.459E+03 /
  c2h5coch3+ho2  =  ch3chcoch3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  2.229E+13  -0.55  6.080E+03 /
  c2h5coch3+ho2  =  c2h5coch2+h2o2  2.380E+04  2.55  1.469E+04
           rev /  1.836E+07  1.52  9.702E+03 /
  c2h5coch3+o  =  ch2ch2coch3+oh  2.250E+13  0.00  7.700E+03
           rev /  4.616E+11  -0.01  9.882E+03 /
  c2h5coch3+o  =  ch3chcoch3+oh  3.070E+13  0.00  3.400E+03
           rev /  5.847E+13  -0.23  1.500E+04 /
  c2h5coch3+o  =  c2h5coch2+oh  5.000E+12  0.00  5.962E+03
           rev /  6.592E+13  -0.70  1.519E+04 /
  c2h5coch3+h  =  ch2ch2coch3+h2  9.160E+06  2.00  7.700E+03
           rev /  4.279E+05  1.99  1.198E+04 /
  c2h5coch3+h  =  ch3chcoch3+h2  4.460E+06  2.00  3.200E+03
           rev /  1.934E+07  1.77  1.689E+04 /
  c2h5coch3+h  =  c2h5coch2+h2  9.300E+12  0.00  6.357E+03
           rev /  2.792E+14  -0.70  1.768E+04 /
  c2h5coch3+o2  =  ch2ch2coch3+ho2  2.050E+13  0.00  5.131E+04
           rev /  1.740E+10  0.32 -1.895E+03 /
  c2h5coch3+o2  =  ch3chcoch3+ho2  1.550E+13  0.00  4.197E+04
           rev /  1.221E+12  0.10 -1.822E+03 /
  c2h5coch3+o2  =  c2h5coch2+ho2  2.050E+13  0.00  4.915E+04
           rev /  1.118E+13  -0.37  2.988E+03 /
  c2h5coch3+ch3  =  ch2ch2coch3+ch4  3.190E+01  3.17  7.172E+03
           rev /  3.893E+01  3.16  1.193E+04 /
  c2h5coch3+ch3  =  ch3chcoch3+ch4  1.740E+00  3.46  3.680E+03
           rev /  1.971E+02  3.23  1.785E+04 /
  c2h5coch3+ch3  =  c2h5coch2+ch4  1.620E+11  0.00  9.630E+03
           rev /  1.270E+14  -0.70  2.143E+04 /
  c2h5coch3+ch3o  =  ch2ch2coch3+ch3oh  2.170E+11  0.00  6.460E+03
           rev /  4.887E+09  0.02  9.007E+03 /
  c2h5coch3+ch3o  =  ch3chcoch3+ch3oh  1.450E+11  0.00  2.771E+03
           rev /  3.031E+11  -0.20  1.473E+04 /
  c2h5coch3+ch3o  =  c2h5coch2+ch3oh  2.170E+11  0.00  4.660E+03
           rev /  3.140E+12  -0.68  1.425E+04 /
  c2h5coch3+ch3o2  =  ch2ch2coch3+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  7.525E+12  -0.51  4.329E+03 /
  c2h5coch3+ch3o2  =  ch3chcoch3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  4.641E+14  -0.73  9.612E+03 /
  c2h5coch3+ch3o2  =  c2h5coch2+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  4.836E+15  -1.20  9.572E+03 /
  c2h5coch3+c2h3  =  ch2ch2coch3+c2h4  5.000E+11  0.00  1.040E+04
           rev /  3.436E+08  0.82  1.403E+04 /
  c2h5coch3+c2h3  =  ch3chcoch3+c2h4  3.000E+11  0.00  3.400E+03
           rev /  1.914E+10  0.60  1.644E+04 /
  c2h5coch3+c2h3  =  c2h5coch2+c2h4  6.150E+10  0.00  4.278E+03
           rev /  2.716E+10  0.13  1.495E+04 /
  c2h5coch3+c2h5  =  ch2ch2coch3+c2h6  5.000E+10  0.00  1.340E+04
           rev /  9.549E+12  -0.57  1.399E+04 /
  c2h5coch3+c2h5  =  ch3chcoch3+c2h6  3.000E+10  0.00  8.600E+03
           rev /  5.319E+14  -0.79  1.860E+04 /
  c2h5coch3+c2h5  =  c2h5coch2+c2h6  5.000E+10  0.00  1.160E+04
           rev /  6.136E+15  -1.26  1.923E+04 /
  ch3choococh3  =  ch3chcoch3+o2  1.372E+17  -1.69  2.846E+04
           rev /  1.000E+11  0.00  0.000E+00 /
  ch3choococh3  =  ch2choohcoch3  8.900E+12  0.00  2.970E+04
           rev /  4.703E+13  -0.52  1.696E+04 /
  ch2choohcoch3  =  c2h3coch3+ho2  2.026E+19  -2.35  1.413E+04
           rev /  7.000E+10  0.00  7.800E+03 /
  ic3h6co+h  =  ic3h7+co  4.400E+12  0.00  1.459E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ic3h6co+o  =  ch3coch3+co  3.200E+12  0.00 -4.370E+02
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3chco+oh  =  c2h5+co2  1.730E+12  0.00 -1.010E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3chco+oh  =  sc2h4oh+co  2.000E+12  0.00 -1.010E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3chco+h  =  c2h5+co  4.400E+12  0.00  1.459E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3chco+o  =  ch3cho+co  3.200E+12  0.00 -4.370E+02
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2ch2cho  =  c2h4+hco  3.127E+13  -0.52  2.459E+04
           rev /  1.500E+11  0.00  8.300E+03 /
  ch2ch2coch3  =  c2h4+ch3co  5.970E+12  0.00  2.073E+04
           rev /  2.110E+11  0.00  7.350E+03 /
  c2h5coch2  =  ch2co+c2h5  1.570E+13  0.00  3.000E+04
           rev /  2.110E+11  0.00  7.350E+03 /
  c2h5chco+oh  =  nc3h7+co2  3.730E+12  0.00 -1.010E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h5chco+h  =  nc3h7+co  4.400E+12  0.00  1.459E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  c2h5chco+o  =  c3h6+co2  3.200E+12  0.00 -4.370E+02
!rev /  0.000E+00  0.00  0.000E+00 /
  ch3chcho+ho2  =  c2h5cho+o2  7.350E+12  0.00  1.310E+03
           rev /  8.071E+13  -0.08  4.507E+04 /
  ch3chcho+ho2  =  ch3chocho+oh  9.640E+12  0.00  0.000E+00
           rev /  1.552E+16  -0.96  2.174E+04 /
  ch3chocho  =  ch3cho+hco  3.980E+13  0.00  9.700E+03
           rev /  4.335E+05  1.72  8.282E+03 /
  ch3chcho  =  c2h3cho+h  3.515E+15  -0.51  4.106E+04
           rev /  6.500E+12  0.00  2.900E+03 /
  ch3chcho  =  ch3chco+h  1.135E+16  -0.66  4.031E+04
           rev /  5.000E+12  0.00  1.200E+03 /
  ch3chcho+h2  =  c2h5cho+h  2.160E+05  2.38  1.899E+04
           rev /  4.309E+04  2.63  5.265E+03 /
  c2h5cho+ho2  =  ch3chcho+h2o2  8.000E+10  0.00  1.192E+04
           rev /  1.031E+13  -0.57  9.337E+03 /
  ch3chcho+o2  =  ch3chco+ho2  1.810E+11  0.00  1.840E+03
           rev /  2.731E+10  -0.01  1.269E+04 /
  ch3chcho+o2  =  c2h3cho+ho2  2.725E+11  0.00  7.240E+03
           rev /  1.726E+11  -0.16  1.904E+04 /
  ch3chcho+o2  =  ch3cho+co+oh  3.620E+10  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  sc3h5cho+ho2  =  sc3h5co+h2o2  1.000E+12  0.00  1.192E+04
           rev /  1.066E+13  -0.32  1.789E+04 /
  sc3h5cho+ch3  =  sc3h5co+ch4  3.980E+12  0.00  8.700E+03
           rev /  4.313E+13  0.01  3.146E+04 /
  sc3h5cho+o  =  sc3h5co+oh  7.180E+12  0.00  1.389E+03
           rev /  1.308E+12  0.01  2.157E+04 /
  sc3h5cho+o2  =  sc3h5co+ho2  4.000E+13  0.00  3.760E+04
           rev /  3.014E+11  0.34  2.394E+03 /
  sc3h5cho+h  =  sc3h5co+h2  2.600E+12  0.00  2.600E+03
           rev /  1.079E+12  0.01  2.488E+04 /
  sc3h5cho+oh  =  sc3h5co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  4.831E+10  0.77  3.709E+04 /
  sc3h5co  =  c3h5-s+co  8.600E+15  0.00  2.300E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  ic3h5coch3  =  ic3h5co+ch3  2.200E+17  -0.51  7.522E+04
           rev /  9.640E+12  0.00  0.000E+00 /
  ic3h5coch3  =  c3h5-t+ch3co  6.070E+24  -2.21  9.696E+04
           rev /  9.640E+12  0.00  0.000E+00 /
  ic3h5coch3+oh  =  ic3h5coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.436E+13  -0.70  2.766E+04 /
  ic3h5coch3+o  =  ic3h5coch2+oh  5.000E+12  0.00  5.962E+03
           rev /  6.401E+13  -0.70  1.518E+04 /
  ic3h5coch3+h  =  ic3h5coch2+h2  9.300E+12  0.00  6.357E+03
           rev /  2.711E+14  -0.70  1.767E+04 /
  ic3h5coch3+ch3  =  ic3h5coch2+ch4  1.620E+11  0.00  9.630E+03
           rev /  1.234E+14  -0.70  2.142E+04 /
  ic3h5coch3+ho2  =  ic3h5coch2+h2o2  8.500E+12  0.00  2.046E+04
           rev /  1.000E+11  0.00  8.000E+03 /
  ic3h5coch3+o2  =  ic3h5coch2+ho2  6.000E+13  0.00  4.600E+04
           rev /  2.000E+12  0.00  2.000E+03 /
  ic3h5coch2  =  c3h5-t+ch2co  1.000E+14  0.00  3.100E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  ic3h5coch3+oh  =  ac3h4coch3+h2o  3.120E+06  2.00 -2.980E+02
           rev /  2.679E+08  1.39  3.246E+04 /
  ic3h5coch3+o  =  ac3h4coch3+oh  6.030E+10  0.70  7.633E+03
           rev /  5.252E+11  0.09  2.314E+04 /
  ic3h5coch3+h  =  ac3h4coch3+h2  1.730E+05  2.50  2.492E+03
           rev /  3.431E+06  1.89  2.009E+04 /
  ic3h5coch3+ch3  =  ac3h4coch3+ch4  2.210E+00  3.50  5.675E+03
           rev /  1.145E+03  2.89  2.376E+04 /
  ic3h5coch3+ho2  =  ac3h4coch3+h2o2  9.640E+03  2.60  1.391E+04
           rev /  4.913E+06  1.66  1.520E+04 /
  ic3h5coch3+o2  =  ac3h4coch3+ho2  6.030E+13  0.00  4.759E+04
           rev /  2.172E+13  -0.28  7.712E+03 /
  ic3h5coch3+oh  =  sc3h5coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  1.753E+13  -0.57  2.859E+04 /
  ic3h5coch3+ho2  =  sc3h5coch2+h2o2  8.500E+12  0.00  2.046E+04
           rev /  1.734E+15  -0.90  1.639E+04 /
  ic3h5coch3+ch3o2  =  ac3h4coch3+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  3.087E+16  -1.28  1.907E+04 /
  ic3h5coch3+ch3o2  =  sc3h5coch2+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  2.523E+15  -1.07  1.459E+04 /
  sc3h5coch2  =  ch2co+c3h5-s  1.777E+19  -1.65  5.940E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  ac3h4coch3  =  c3h4-a+ch3co  1.400E+13  0.00  6.000E+04
           rev /  2.684E+00  2.93  1.230E+04 /
  ch3chcoch3  =  c2h3coch3+h  3.417E+16  -0.82  4.177E+04
           rev /  5.000E+12  0.00  1.200E+03 /
  ch3chcoch3  =  ch3chco+ch3  1.406E+15  -0.44  3.834E+04
           rev /  1.230E+11  0.00  7.800E+03 /
  c3h6cho-3  =  c2h5chco+h  8.431E+15  -0.60  4.040E+04
           rev /  5.000E+12  0.00  1.200E+03 /
  c3h6cho-3  =  c2h3cho+ch3  3.174E+14  -0.39  2.990E+04
           rev /  1.230E+11  0.00  7.800E+03 /
  c3h6cho-2  =  sc3h5cho+h  4.947E+12  -0.15  3.130E+04
           rev /  5.000E+12  0.00  2.900E+03 /
  c3h6cho-2  =  c3h6+hco  8.249E+12  -0.18  2.190E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  c3h6cho-1  =  c2h4+ch2cho  7.400E+11  0.00  2.197E+04
           rev /  2.110E+11  0.00  7.350E+03 /
  ic3h6cho  =  c3h6+hco  1.031E+15  -0.62  2.317E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  ic3h6cho  =  c2h3cho+ch3  2.425E+13  -0.27  2.247E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c2h5coc2h5+oh  =  c2h5coc2h4p+h2o  1.054E+10  0.97  1.586E+03
           rev /  1.194E+09  0.95  2.103E+04 /
  c2h5coc2h5+oh  =  c2h5coc2h4s+h2o  1.690E+12  0.00 -2.280E+02
           rev /  3.296E+13  -0.32  2.874E+04 /
  c2h5coc2h5+ho2  =  c2h5coc2h4p+h2o2  4.760E+04  2.55  1.649E+04
           rev /  3.201E+04  2.20  4.472E+03 /
  c2h5coc2h5+ho2  =  c2h5coc2h4s+h2o2  4.000E+11  0.00  8.698E+03
           rev /  4.631E+13  -0.65  6.200E+03 /
  c2h5coc2h5+o2  =  c2h5coc2h4p+ho2  4.100E+13  0.00  5.131E+04
           rev /  1.949E+10  0.31 -1.882E+03 /
  c2h5coc2h5+o2  =  c2h5coc2h4s+ho2  3.100E+13  0.00  4.197E+04
           rev /  2.537E+12  0.00 -1.702E+03 /
  c2h5coc2h5+h  =  c2h5coc2h4p+h2  1.832E+07  2.00  7.700E+03
           rev /  4.794E+05  1.98  1.199E+04 /
  c2h5coc2h5+h  =  c2h5coc2h4s+h2  8.960E+06  2.00  3.200E+03
           rev /  4.036E+07  1.68  1.701E+04 /
  c2h5coc2h5+c2h3  =  c2h5coc2h4p+c2h4  1.000E+12  0.00  1.040E+04
           rev /  3.850E+08  0.81  1.404E+04 /
  c2h5coc2h5+c2h3  =  c2h5coc2h4s+c2h4  6.000E+11  0.00  5.600E+03
           rev /  3.976E+10  0.50  1.876E+04 /
  c2h5coc2h5+c2h5  =  c2h5coc2h4p+c2h6  1.000E+11  0.00  1.340E+04
           rev /  1.070E+13  -0.58  1.400E+04 /
  c2h5coc2h5+c2h5  =  c2h5coc2h4s+c2h6  6.000E+10  0.00  8.600E+03
           rev /  1.105E+15  -0.89  1.872E+04 /
  c2h5coc2h5+ch3o  =  c2h5coc2h4p+ch3oh  4.340E+11  0.00  6.460E+03
           rev /  5.475E+09  0.00  9.020E+03 /
  c2h5coc2h5+ch3o  =  c2h5coc2h4s+ch3oh  2.900E+11  0.00  2.771E+03
           rev /  6.298E+11  -0.30  1.485E+04 /
  c2h5coc2h5+ch3o2  =  c2h5coc2h4p+ch3o2h  6.020E+12  0.00  1.938E+04
           rev /  1.664E+13  -0.52  6.642E+03 /
  c2h5coc2h5+ch3o2  =  c2h5coc2h4s+ch3o2h  4.000E+12  0.00  1.525E+04
           rev /  1.903E+15  -0.83  1.203E+04 /
  c2h5coc2h4s  =  c2h5coc2h3+h  8.704E+16  -0.82  4.213E+04
           rev /  1.300E+13  0.00  1.560E+03 /
  c2h5coc2h4p  =  c2h5co+c2h4  1.548E+17  -1.46  2.784E+04
           rev /  7.000E+10  0.00  9.600E+03 /
  c2h5coc2h3+oh  =  c2h5coch2+ch2o  1.000E+10  0.00  0.000E+00
           rev /  1.673E+11  -0.39  1.822E+04 /
  c2h5coc2h3+oh  =  pc2h4coc2h3+h2o  7.550E+09  0.97  1.586E+03
           rev /  1.285E+08  2.53  2.021E+04 /
  c2h5coc2h3+oh  =  sc2h4coc2h3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  1.350E+13  -0.20  2.860E+04 /
  c2h5coc2h3+ho2  =  c2h5co+ch2cho+oh  6.030E+09  0.00  7.949E+03
           rev /  1.000E+00  0.00  0.000E+00 /
  c2h5coc2h3+ho2  =  pc2h4coc2h3+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.405E+03  3.78  3.652E+03 /
  c2h5coc2h3+ho2  =  sc2h4coc2h3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  1.896E+13  -0.53  6.065E+03 /
  c2h5coc2h3+ch3o2  =  c2h5co+ch2cho+ch3o  3.970E+11  0.00  1.705E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  c2h5coc2h3+ch3o2  =  pc2h4coc2h3+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.250E+12  1.06  5.822E+03 /
  c2h5coc2h3+ch3o2  =  sc2h4coc2h3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  7.793E+14  -0.71  1.190E+04 /
  pc2h4coc2h3  =  c2h3co+c2h4  5.263E+14  0.38  2.146E+04
           rev /  8.000E+10  0.00  1.130E+04 /
  sc2h4coc2h3  =  ch3chco+c2h3  1.637E+16  -0.74  5.459E+04
           rev /  8.000E+10  0.00  1.260E+04 /
  ic3h6chcoch3+oh  =  ac3h5chcoch3+h2o  1.530E+08  1.53  8.775E+03
           rev /  1.339E+10  1.01  4.143E+04 /
  ic3h6chcoch3+oh  =  ic3h6chcoch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.120E+07  -0.46  2.807E+04 /
  ic3h6chcoch3+oh  =  ic3h7cho+ch3co  1.000E+11  0.00  0.000E+00
           rev /  3.844E+06  1.02  1.555E+04 /
  ic3h6chcoch3+ho2  =  ac3h5chcoch3+h2o2  2.740E+04  2.55  1.550E+04
           rev /  1.423E+07  1.71  1.669E+04 /
  ic3h6chcoch3+ho2  =  ic3h6chcoch2+h2o2  2.380E+04  2.55  1.469E+04
           rev /  1.695E+01  1.76  1.011E+04 /
  ic3h6chcoch3+ch3o2  =  ac3h5chcoch3+ch3o2h  5.000E+10  0.00  1.192E+04
           rev /  1.067E+14  -1.02  1.239E+04 /
  ic3h6chcoch3+ch3o2  =  ic3h6chcoch2+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  8.811E+09  -0.96  1.227E+04 /
  ac3h5chcoch3+ho2  =  ic3h5cho+ch3co+oh  1.000E+12  0.00  0.000E+00
           rev /  1.000E+00  0.00  0.000E+00 /
  ic3h6chcoch2  =  ic4h7+ch2co  1.401E+14  -1.64  5.075E+04
           rev /  8.000E+10  0.00  1.190E+04 /
  nc3h7coch3+oh  =  c3h6coch3-1+h2o  2.065E+07  1.73  7.530E+02
           rev /  3.604E+06  1.75  2.017E+04 /
  nc3h7coch3+oh  =  c3h6coch3-2+h2o  3.615E+07  1.64 -2.470E+02
           rev /  3.668E+05  2.01  2.166E+04 /
  nc3h7coch3+oh  =  c3h6coch3-3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  2.368E+13  -0.28  2.870E+04 /
  nc3h7coch3+oh  =  nc3h7coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  9.286E+13  -0.74  2.773E+04 /
  nc3h7coch3+ho2  =  c3h6coch3-1+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.465E+04  2.24  4.442E+03 /
  nc3h7coch3+ho2  =  c3h6coch3-2+h2o2  5.600E+12  0.00  1.770E+04
           rev /  3.373E+11  0.05  8.142E+03 /
  nc3h7coch3+ho2  =  c3h6coch3-3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  3.327E+13  -0.60  6.160E+03 /
  nc3h7coch3+ho2  =  nc3h7coch2+h2o2  2.380E+04  2.55  1.469E+04
           rev /  2.572E+07  1.48  9.762E+03 /
  nc3h7coch3+ch3o2  =  c3h6coch3-1+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.281E+13  -0.49  6.607E+03 /
  nc3h7coch3+ch3o2  =  c3h6coch3-2+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  4.926E+11  -0.13  6.774E+03 /
  nc3h7coch3+ch3o2  =  c3h6coch3-3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  1.367E+15  -0.78  1.199E+04 /
  nc3h7coch3+ch3o2  =  nc3h7coch2+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  1.337E+16  -1.25  1.193E+04 /
  c3h6coch3-1  =  c2h4+ch3coch2  2.904E+16  -1.21  2.700E+04
           rev /  1.000E+11  0.00  8.600E+03 /
  c3h6coch3-2  =  c3h6+ch3co  2.719E+16  -1.05  2.559E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c3h6coch3-3  =  c2h3coch3+ch3  9.615E+15  -0.75  3.239E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  nc3h7coch2  =  nc3h7+ch2co  1.226E+18  -1.40  4.345E+04
           rev /  1.000E+11  0.00  1.160E+04 /
  ic3h7coch3+oh  =  ic3h6coch3+h2o  1.530E+08  1.53  8.775E+03
           rev /  4.784E+07  1.46  2.827E+04 /
  ic3h7coch3+oh  =  tc3h6coch3+h2o  1.684E+12  0.00 -7.810E+02
           rev /  2.420E+13  -0.18  2.992E+04 /
  ic3h7coch3+oh  =  ic3h7coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  8.225E+13  -0.73  2.770E+04 /
  ic3h7coch3+ho2  =  ic3h6coch3+h2o2  2.740E+04  2.55  1.550E+04
           rev /  5.086E+04  2.16  3.532E+03 /
  ic3h7coch3+ho2  =  tc3h6coch3+h2o2  8.000E+10  0.00  1.192E+04
           rev /  6.824E+12  -0.51  1.116E+04 /
  ic3h7coch3+ho2  =  ic3h7coch2+h2o2  1.380E+04  2.55  1.550E+04
           rev /  1.321E+07  1.49  1.054E+04 /
  ic3h7coch3+ch3o2  =  ic3h6coch3+ch3o2h  2.000E+04  2.55  1.550E+04
           rev /  1.526E+05  1.98  2.812E+03 /
  ic3h7coch3+ch3o2  =  tc3h6coch3+ch3o2h  3.610E+03  2.55  8.032E+03
           rev /  1.265E+06  1.86  6.554E+03 /
  ic3h7coch3+ch3o2  =  ic3h7coch2+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  1.184E+16  -1.23  1.190E+04 /
  tc3h6coch3+o2  =  ch3coch3+ch2co+oh  3.620E+10  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  tc3h6coch3+o2  =  ic3h5coch3+ho2  2.725E+11  0.00  7.240E+03
           rev /  6.631E+09  0.17  1.482E+04 /
  tc3h6coch3  =  ic3h5coch3+h  1.830E+17  -0.84  4.394E+04
           rev /  1.300E+13  0.00  1.560E+03 /
  tc3h6coch3  =  ic3h6co+ch3  2.440E+15  -0.42  4.150E+04
           rev /  1.230E+11  0.00  1.060E+04 /
  ic3h7coch2  =  ic3h7+ch2co  2.880E+15  -0.54  3.994E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  ic3h6coch3  =  c3h6+ch3co  5.490E+18  -1.58  2.796E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  nc3h7coc2h5+oh  =  c3h6coc2h5-1+h2o  2.065E+07  1.73  7.530E+02
           rev /  5.173E+06  1.70  2.022E+04 /
  nc3h7coc2h5+oh  =  c3h6coc2h5-2+h2o  3.615E+07  1.64 -2.470E+02
           rev /  7.233E+05  1.92  2.176E+04 /
  nc3h7coc2h5+oh  =  c3h6coc2h5-3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  3.313E+13  -0.32  2.874E+04 /
  nc3h7coc2h5+oh  =  nc3h7coc2h4p+h2o  5.100E+11  0.00  1.192E+03
           rev /  1.278E+11  -0.03  2.066E+04 /
  nc3h7coc2h5+oh  =  nc3h7coc2h4s+h2o  8.450E+11  0.00 -2.280E+02
           rev /  3.313E+13  -0.32  2.874E+04 /
  nc3h7coc2h5+ho2  =  c3h6coc2h5-1+h2o2  2.380E+04  2.55  1.649E+04
           rev /  3.539E+04  2.19  4.492E+03 /
  nc3h7coc2h5+ho2  =  c3h6coc2h5-2+h2o2  5.600E+12  0.00  1.770E+04
           rev /  6.652E+11  -0.05  8.242E+03 /
  nc3h7coc2h5+ho2  =  c3h6coc2h5-3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  4.654E+13  -0.65  6.200E+03 /
  nc3h7coc2h5+ho2  =  nc3h7coc2h4p+h2o2  2.380E+04  2.55  1.469E+04
           rev /  3.539E+04  2.19  2.692E+03 /
  nc3h7coc2h5+ho2  =  nc3h7coc2h4s+h2o2  2.000E+11  0.00  8.698E+03
           rev /  4.654E+13  -0.65  6.200E+03 /
  nc3h7coc2h5+ch3o2  =  c3h6coc2h5-1+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.839E+13  -0.54  6.657E+03 /
  nc3h7coc2h5+ch3o2  =  c3h6coc2h5-2+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  9.713E+11  -0.22  6.874E+03 /
  nc3h7coc2h5+ch3o2  =  c3h6coc2h5-3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  1.913E+15  -0.83  1.203E+04 /
  nc3h7coc2h5+ch3o2  =  nc3h7coc2h4p+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  1.839E+13  -0.54  4.862E+03 /
  nc3h7coc2h5+ch3o2  =  nc3h7coc2h4s+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  1.913E+15  -0.83  1.203E+04 /
  c3h6coc2h5-1  =  c2h4+c2h5coch2  2.218E+15  -0.84  2.359E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  c3h6coc2h5-2  =  c3h6+c2h5co  4.051E+16  -1.11  2.615E+04
           rev /  1.000E+11  0.00  8.300E+03 /
  c3h6coc2h5-3  =  c2h5coc2h3+ch3  2.915E+15  -0.68  3.230E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  nc3h7coc2h4p  =  nc3h7co+c2h4  5.398E+17  -1.45  2.604E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  nc3h7coc2h4s  =  ch3chco+nc3h7  1.973E+19  -1.49  4.286E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic3h7coc2h5+oh  =  ic3h6coc2h5+h2o  1.530E+08  1.53  8.775E+03
           rev /  3.119E+07  1.52  2.821E+04 /
  ic3h7coc2h5+oh  =  tc3h6coc2h5+h2o  1.684E+12  0.00 -7.810E+02
           rev /  2.480E+13  -0.19  2.992E+04 /
  ic3h7coc2h5+oh  =  ic3h7coc2h4p+h2o  5.100E+11  0.00  1.192E+03
           rev /  1.040E+11  -0.01  2.063E+04 /
  ic3h7coc2h5+oh  =  ic3h7coc2h4s+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.064E+09  1.36  2.884E+04 /
  ic3h7coc2h5+ho2  =  ic3h6coc2h5+h2o2  2.740E+04  2.55  1.550E+04
           rev /  3.315E+04  2.22  3.472E+03 /
  ic3h7coc2h5+ho2  =  tc3h6coc2h5+h2o2  8.000E+10  0.00  1.192E+04
           rev /  6.993E+12  -0.51  1.116E+04 /
  ic3h7coc2h5+ho2  =  ic3h7coc2h4p+h2o2  1.380E+04  2.55  1.550E+04
           rev /  1.670E+04  2.22  3.472E+03 /
  ic3h7coc2h5+ho2  =  ic3h7coc2h4s+h2o2  1.475E+04  2.60  1.391E+04
           rev /  1.994E+06  2.02  1.132E+04 /
  ic3h7coc2h5+ch3o2  =  ic3h6coc2h5+ch3o2h  2.000E+04  2.55  1.550E+04
           rev /  9.945E+04  2.04  2.752E+03 /
  ic3h7coc2h5+ch3o2  =  tc3h6coc2h5+ch3o2h  3.610E+03  2.55  8.032E+03
           rev /  1.297E+06  1.86  6.554E+03 /
  ic3h7coc2h5+ch3o2  =  ic3h7coc2h4p+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  2.998E+13  -0.51  6.627E+03 /
  ic3h7coc2h5+ch3o2  =  ic3h7coc2h4s+ch3o2h  1.770E+12  0.00  1.705E+04
           rev /  9.834E+14  -0.76  1.374E+04 /
  ic3h6coc2h5  =  c3h6+c2h5co  7.391E+18  -1.59  2.568E+04
           rev /  1.000E+11  0.00  8.300E+03 /
  tc3h6coc2h5  =  ic3h5coc2h5+h  4.683E+17  -0.85  4.389E+04
           rev /  3.100E+13  0.00  1.500E+03 /
  ic3h7coc2h4p  =  ic3h7co+c2h4  1.188E+18  -1.51  2.611E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  ic3h7coc2h4s  =  ch3chco+ic3h7  8.306E+16  -0.68  4.041E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic3h7coc2h3+oh  =  ic3h6coc2h3+h2o  1.530E+08  1.53  8.775E+03
           rev /  3.039E+07  1.53  2.821E+04 /
  ic3h7coc2h3+oh  =  tc3h6coc2h3+h2o  1.684E+12  0.00 -7.810E+02
           rev /  1.073E+10  0.49  2.321E+04 /
  ic3h7coc2h3+oh  =  ch3cho+ic3h7co  1.530E+08  1.53  8.775E+03
           rev /  1.013E+03  2.76  2.841E+04 /
  ic3h7coc2h3+ho2  =  ic3h6coc2h3+h2o2  2.740E+04  2.55  1.550E+04
           rev /  3.231E+04  2.22  3.467E+03 /
  ic3h7coc2h3+ho2  =  tc3h6coc2h3+h2o2  8.000E+10  0.00  1.192E+04
           rev /  3.027E+09  0.16  4.451E+03 /
  ic3h7coc2h3+ho2  =  ch2cho+ic3h7co+oh  6.030E+09  0.00  7.949E+03
           rev /  1.000E+00  0.00  0.000E+00 /
  ic3h7coc2h3+ch3o2  =  ic3h6coc2h3+ch3o2h  2.000E+04  2.55  1.550E+04
           rev /  9.691E+04  2.04  2.747E+03 /
  ic3h7coc2h3+ch3o2  =  tc3h6coc2h3+ch3o2h  3.610E+03  2.55  8.032E+03
           rev /  5.612E+02  2.53 -1.568E+02 /
  ic3h7coc2h3+ch3o2  =  ch2cho+ic3h7co+ch3o  3.970E+11  0.00  1.705E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  ic3h6coc2h3  =  c3h6+c2h3co  1.119E+17  -1.24  2.060E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  tc3h6coc2h3  =  ic3h6co+c2h3  1.460E+13  -0.06  4.725E+04
           rev /  8.000E+10  0.00  1.160E+04 /
  ic3h5coc2h5+oh  =  ac3h4coc2h5+h2o  3.120E+06  2.00 -2.980E+02
           rev /  3.534E+08  1.45  3.240E+04 /
  ic3h5coc2h5+oh  =  ic3h5coc2h4p+h2o  5.100E+11  0.00  1.192E+03
           rev /  1.028E+11  0.00  2.062E+04 /
  ic3h5coc2h5+oh  =  ic3h5coc2h4s+h2o  4.670E+07  1.61 -3.500E+01
           rev /  8.211E+08  1.39  2.881E+04 /
  ic3h5coc2h5+oh  =  ch3coch3+c2h5co  1.000E+12  0.00  0.000E+00
           rev /  6.042E+10  0.15  2.655E+04 /
  ic3h5coc2h5+ho2  =  ac3h4coc2h5+h2o2  9.640E+03  2.60  1.391E+04
           rev /  6.482E+06  1.72  1.514E+04 /
  ic3h5coc2h5+ho2  =  ic3h5coc2h4p+h2o2  1.380E+04  2.55  1.550E+04
           rev /  1.652E+04  2.22  3.467E+03 /
  ic3h5coc2h5+ho2  =  ic3h5coc2h4s+h2o2  1.475E+04  2.60  1.391E+04
           rev /  1.539E+06  2.06  1.129E+04 /
  ic3h5coc2h5+ch3o2  =  ac3h4coc2h5+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  5.499E+15  -1.05  1.756E+04 /
  ic3h5coc2h5+ch3o2  =  ic3h5coc2h4p+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  2.966E+13  -0.51  6.622E+03 /
  ic3h5coc2h5+ch3o2  =  ic3h5coc2h4s+ch3o2h  1.770E+12  0.00  1.705E+04
           rev /  7.591E+14  -0.72  1.371E+04 /
  ac3h4coc2h5  =  c3h4-a+c2h5co  8.689E+23  -2.93  5.730E+04
           rev /  8.000E+10  0.00  9.600E+03 /
  ic3h5coc2h4p  =  c2h4+ic3h5co  2.874E+16  -1.24  1.883E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  ic3h5coc2h4s  =  ch3chco+c3h5-t  1.418E+21  -1.91  5.564E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  nc4h9cho+o2  =  nc4h9co+ho2  2.000E+13  0.50  4.220E+04
           rev /  1.000E+07  0.00  4.000E+04 /
  nc4h9cho+oh  =  nc4h9co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  2.143E+10  0.73  3.124E+04 /
  nc4h9cho+h  =  nc4h9co+h2  4.000E+13  0.00  4.200E+03
           rev /  1.800E+13  0.00  2.400E+04 /
  nc4h9cho+o  =  nc4h9co+oh  5.000E+12  0.00  1.790E+03
           rev /  1.000E+12  0.00  1.900E+04 /
  nc4h9cho+ho2  =  nc4h9co+h2o2  2.800E+12  0.00  1.360E+04
           rev /  1.000E+12  0.00  1.000E+04 /
  nc4h9cho+ch3  =  nc4h9co+ch4  1.700E+12  0.00  8.440E+03
           rev /  1.500E+13  0.00  2.800E+04 /
  nc4h9cho+ch3o  =  nc4h9co+ch3oh  1.150E+11  0.00  1.280E+03
           rev /  3.000E+11  0.00  1.800E+04 /
  nc4h9cho+ch3o2  =  nc4h9co+ch3o2h  1.000E+12  0.00  9.500E+03
           rev /  2.500E+10  0.00  1.000E+04 /
  nc4h9cho+oh  =  c4h8cho-1+h2o  5.270E+09  0.97  1.586E+03
           rev /  1.233E+09  0.95  2.104E+04 /
  nc4h9cho+oh  =  c4h8cho-2+h2o  4.670E+07  1.61 -3.500E+01
           rev /  6.837E+05  1.93  2.192E+04 /
  nc4h9cho+oh  =  c4h8cho-3+h2o  4.670E+07  1.61 -3.500E+01
           rev /  6.837E+05  1.93  2.192E+04 /
  nc4h9cho+oh  =  c4h8cho-4+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.202E+09  1.34  2.887E+04 /
  nc4h9cho+ho2  =  c4h8cho-1+h2o2  2.760E+04  2.55  1.648E+04
           rev /  3.833E+04  2.20  4.471E+03 /
  nc4h9cho+ho2  =  c4h8cho-2+h2o2  1.475E+04  2.60  1.391E+04
           rev /  1.282E+03  2.60  4.399E+03 /
  nc4h9cho+ho2  =  c4h8cho-3+h2o2  1.475E+04  2.60  1.391E+04
           rev /  1.282E+03  2.60  4.399E+03 /
  nc4h9cho+ho2  =  c4h8cho-4+h2o2  2.950E+04  2.60  1.391E+04
           rev /  4.506E+06  2.00  1.135E+04 /
  nc4h9cho+ch3o2  =  c4h8cho-1+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.442E+13  -0.53  6.646E+03 /
  nc4h9cho+ch3o2  =  c4h8cho-2+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  7.106E+11  -0.18  6.821E+03 /
  nc4h9cho+ch3o2  =  c4h8cho-3+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  7.106E+11  -0.18  6.821E+03 /
  nc4h9cho+ch3o2  =  c4h8cho-4+ch3o2h  3.980E+12  0.00  1.705E+04
           rev /  2.498E+15  -0.77  1.377E+04 /
  c4h8cho-1  =  c2h4+ch2ch2cho  5.984E+18  -1.60  3.043E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  c4h8cho-2  =  c3h6+ch2cho  2.984E+14  -0.76  2.332E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c4h8cho-3  =  c4h8-1+hco  4.797E+14  -0.72  2.435E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c4h8cho-3  =  ac3h5cho+ch3  3.643E+13  -0.36  3.033E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c4h8cho-4  =  c2h3cho+c2h5  1.863E+18  -1.30  3.083E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  nc4h9co  =  pc4h9+co  1.000E+11  0.00  9.600E+03
           rev /  1.000E+11  0.00  0.000E+00 /
  ac3h5cho  =  c3h5-a+hco  1.813E+19  -1.08  6.848E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  ac3h5cho+oh  =  ac3h5co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.741E+10  0.76  3.120E+04 /
  ac3h5cho+oh  =  c2h3chcho+h2o  3.120E+06  2.00 -2.980E+02
           rev /  1.246E+08  1.79  3.493E+04 /
  ac3h5cho+ho2  =  ac3h5co+h2o2  3.000E+12  0.00  1.192E+04
           rev /  1.152E+13  -0.33  1.199E+04 /
  ac3h5cho+ho2  =  c2h3chcho+h2o2  9.630E+03  2.60  1.391E+04
           rev /  2.283E+06  2.06  1.767E+04 /
  ac3h5cho+ch3o2  =  ac3h5co+ch3o2h  1.000E+12  0.00  1.192E+04
           rev /  1.579E+13  -0.51  1.127E+04 /
  ac3h5cho+ch3o2  =  c2h3chcho+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  1.939E+15  -0.72  2.009E+04 /
  ac3h5co  =  c3h5-a+co  6.199E+15  -1.09 -3.300E+02
           rev /  1.500E+11  0.00  4.810E+03 /
  c2h3chcho+ho2  =  c2h3cho+hco+oh  8.910E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c3h6oh  =  c3h6+oh  9.365E+12  0.01  2.712E+04
           rev /  9.930E+11  0.00 -9.600E+02 /
  hoc3h6o2  =  c3h6oh+o2  2.873E+19  -1.90  3.429E+04
           rev /  1.200E+11  0.00 -1.100E+03 /
  hoc3h6o2  =  ch3cho+ch2o+oh  1.250E+10  0.00  1.890E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5ketox  =  tc3h6cho+ch2o  8.573E+17  -1.59  1.109E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  neoc5ketox  =  neoc5kejol  2.000E+11  0.00  7.600E+03
           rev /  2.541E+09  0.43  2.248E+04 /
  neoc5kejol  =  ic4h8oh+co  2.273E+21  -2.34  1.102E+04
           rev /  1.250E+11  0.00  4.800E+03 /
  neoc5h10ooh-o2  =  neoc5h9q2  7.500E+10  0.00  2.440E+04
           rev /  1.757E+11  -0.50  8.940E+03 /
  neoc5h9q2  =  ic4h7ooh+ch2o+oh  3.417E+14  0.37  3.092E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc5h9q2  =  ic4h6q2-ii+ch3  2.193E+16  -0.71  3.265E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  neoc5h9q2-n  =  neoc5ket+oh  9.000E+14  0.00  1.500E+03
           rev /  1.668E+09  1.58  3.188E+04 /
  ic4h6q2-ii  =  c3h4-a+ch2o+ho2+oh  1.000E+16  0.00  4.300E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c5h11-1+ho2  =  c5h11o-1+oh  7.000E+12  0.00 -1.000E+03
           rev /  8.079E+15  -0.58  2.701E+04 /
  c5h11-2+ho2  =  c5h11o-2+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.144E+13  0.15  2.686E+04 /
  c5h11-3+ho2  =  c5h11o-3+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.137E+13  0.15  2.685E+04 /
  ac5h11+ho2  =  ac5h11o+oh  7.000E+12  0.00 -1.000E+03
           rev /  6.653E+15  -0.73  2.763E+04 /
  bc5h11+ho2  =  bc5h11o+oh  7.000E+12  0.00 -1.000E+03
           rev /  2.103E+19  -1.59  3.018E+04 /
  cc5h11+ho2  =  cc5h11o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.858E+18  -1.36  2.962E+04 /
  dc5h11+ho2  =  dc5h11o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.326E+16  -0.73  2.763E+04 /
  neoc5h11+ho2  =  neoc5h11o+oh  7.000E+12  0.00 -1.000E+03
           rev /  5.004E+16  -0.88  2.705E+04 /
  c5h11-1+ch3o2  =  c5h11o-1+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  7.891E+17  -1.16  3.177E+04 /
  c5h11-2+ch3o2  =  c5h11o-2+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.117E+15  -0.43  3.162E+04 /
  c5h11-3+ch3o2  =  c5h11o-3+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.110E+15  -0.43  3.162E+04 /
  ac5h11+ch3o2  =  ac5h11o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  6.498E+17  -1.30  3.239E+04 /
  bc5h11+ch3o2  =  bc5h11o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  2.054E+21  -2.17  3.495E+04 /
  cc5h11+ch3o2  =  cc5h11o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.815E+20  -1.94  3.439E+04 /
  dc5h11+ch3o2  =  dc5h11o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.295E+18  -1.30  3.239E+04 /
  neoc5h11+ch3o2  =  neoc5h11o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  4.888E+18  -1.46  3.181E+04 /
  hoch2o  =  ch2o+oh  1.643E+14  -0.10  2.189E+04
           rev /  2.600E+12  0.00 -6.140E+02 /
  hoch2o  =  hocho+h  1.000E+14  0.00  1.490E+04
           rev /  3.077E+11  0.64  7.944E+03 /
  hocho+m  =  co+h2o+m  2.300E+13  0.00  5.000E+04
           rev /  1.422E+10  0.46  4.684E+04 /
  hocho+m  =  co2+h2+m  1.500E+16  0.00  5.700E+04
           rev /  2.399E+14  0.46  6.102E+04 /
  hocho  =  hco+oh  4.593E+18  -0.46  1.083E+05
           rev /  1.000E+14  0.00  0.000E+00 /
  ch2o+ocho  =  hco+hocho  5.600E+12  0.00  1.360E+04
           rev /  8.584E+11  0.04  2.675E+04 /
  ocho+ho2  =  hocho+o2  3.500E+10  0.00 -3.275E+03
           rev /  3.699E+12  -0.29  5.269E+04 /
  ocho+h2o2  =  hocho+ho2  2.400E+12  0.00  1.000E+04
           rev /  1.793E+11  0.36  2.479E+04 /
  hocho+oh  =  h2o+co2+h  2.620E+06  2.06  9.160E+02
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+oh  =  h2o+co+oh  1.850E+07  1.51 -9.620E+02
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+h  =  h2+co2+h  4.240E+06  2.10  4.868E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+h  =  h2+co+oh  6.030E+13  -0.35  2.988E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+ch3  =  ch4+co+oh  3.900E-07  5.80  2.200E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+ho2  =  h2o2+co+oh  1.000E+12  0.00  1.192E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  hocho+o  =  co+oh+oh  1.770E+18  -1.90  2.975E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2(s)+m  =  ch2+m  1.000E+13  0.00  0.000E+00
           rev /  7.161E+15  -0.89  1.143E+04 /
  ch2(s)+ch4  =  ch3+ch3  4.000E+13  0.00  0.000E+00
           rev /  5.429E+15  -0.89  1.565E+04 /
  ch2(s)+c2h6  =  ch3+c2h5  1.200E+14  0.00  0.000E+00
           rev /  1.041E+14  -0.33  1.982E+04 /
  ch2(s)+o2  =  co+oh+h  7.000E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2(s)+h2  =  ch3+h  7.000E+13  0.00  0.000E+00
           rev /  2.482E+17  -0.89  1.613E+04 /
  ch2(s)+h  =  ch+h2  3.000E+13  0.00  0.000E+00
           rev /  1.509E+16  -0.89  1.442E+04 /
  ch2(s)+o  =  co+h+h  3.000E+13  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2(s)+oh  =  ch2o+h  3.000E+13  0.00  0.000E+00
           rev /  3.194E+18  -0.89  8.786E+04 /
  ch2(s)+co2  =  ch2o+co  3.000E+12  0.00  0.000E+00
           rev /  2.852E+15  -0.89  6.552E+04 /
  ch2(s)+ch3  =  c2h4+h  2.000E+13  0.00  0.000E+00
           rev /  2.671E+15  -0.06  6.884E+04 /
  ch2(s)+ch2co  =  c2h4+co  1.600E+14  0.00  0.000E+00
           rev /  4.596E+15  -0.06  1.056E+05 /
  ic6h14  =  ic4h9+c2h5  4.681E+22  -1.76  8.741E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic6h14  =  ic3h7+nc3h7  4.358E+19  -0.73  8.583E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic6h14  =  dc5h11+ch3  7.038E+18  -0.86  8.722E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic6h14  =  c5h11-2+ch3  5.257E+15  0.21  8.430E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  ic6h14  =  ac6h13+h  1.475E+19  -1.00  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic6h14  =  bc6h13+h  7.996E+20  -1.56  9.866E+04
           rev /  3.610E+13  0.00  0.000E+00 /
  ic6h14  =  cc6h13+h  2.184E+20  -1.34  1.006E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic6h14  =  dc6h13+h  2.184E+20  -1.34  1.006E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic6h14  =  ec6h13+h  1.475E+19  -1.00  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  ic6h14+h  =  ac6h13+h2  1.880E+05  2.75  6.280E+03
           rev /  8.678E+03  2.75  1.056E+04 /
  ic6h14+h  =  bc6h13+h2  6.020E+05  2.40  2.583E+03
           rev /  5.125E+02  2.96  1.136E+04 /
  ic6h14+h  =  cc6h13+h2  1.300E+06  2.40  4.471E+03
           rev /  4.052E+03  2.74  1.127E+04 /
  ic6h14+h  =  dc6h13+h2  1.300E+06  2.40  4.471E+03
           rev /  4.052E+03  2.74  1.127E+04 /
  ic6h14+h  =  ec6h13+h2  9.400E+04  2.75  6.280E+03
           rev /  4.339E+03  2.75  1.056E+04 /
  ic6h14+o  =  ac6h13+oh  2.697E+07  2.03  5.136E+03
           rev /  5.468E+05  2.03  7.321E+03 /
  ic6h14+o  =  bc6h13+oh  3.968E+05  2.40  1.150E+03
           rev /  1.484E+02  2.96  7.837E+03 /
  ic6h14+o  =  cc6h13+oh  5.946E+05  2.44  2.846E+03
           rev /  8.139E+02  2.78  7.546E+03 /
  ic6h14+o  =  dc6h13+oh  5.946E+05  2.44  2.846E+03
           rev /  8.139E+02  2.78  7.546E+03 /
  ic6h14+o  =  ec6h13+oh  1.046E+06  2.42  4.766E+03
           rev /  2.121E+04  2.42  6.951E+03 /
  ic6h14+oh  =  ac6h13+h2o  1.054E+10  0.97  1.590E+03
           rev /  2.107E+09  0.97  2.103E+04 /
  ic6h14+oh  =  bc6h13+h2o  5.733E+10  0.51  6.300E+01
           rev /  2.113E+08  1.07  2.400E+04 /
  ic6h14+oh  =  cc6h13+h2o  4.670E+07  1.61 -3.500E+01
           rev /  6.302E+05  1.95  2.192E+04 /
  ic6h14+oh  =  dc6h13+h2o  4.670E+07  1.61 -3.500E+01
           rev /  6.302E+05  1.95  2.192E+04 /
  ic6h14+oh  =  ec6h13+h2o  5.270E+09  0.97  1.590E+03
           rev /  1.053E+09  0.97  2.103E+04 /
  ic6h14+ch3  =  ac6h13+ch4  9.067E-01  3.65  7.154E+03
           rev /  1.093E+00  3.65  1.191E+04 /
  ic6h14+ch3  =  bc6h13+ch4  6.010E-10  6.36  8.930E+02
           rev /  1.337E-11  6.92  1.015E+04 /
  ic6h14+ch3  =  cc6h13+ch4  8.400E+04  2.13  7.574E+03
           rev /  6.839E+03  2.47  1.485E+04 /
  ic6h14+ch3  =  dc6h13+ch4  8.400E+04  2.13  7.574E+03
           rev /  6.839E+03  2.47  1.485E+04 /
  ic6h14+ch3  =  ec6h13+ch4  4.520E-01  3.65  7.154E+03
           rev /  5.451E-01  3.65  1.191E+04 /
  ic6h14+ho2  =  ac6h13+h2o2  1.680E+13  0.00  2.044E+04
           rev /  4.600E+12  0.00  9.810E+03 /
  ic6h14+ho2  =  bc6h13+h2o2  2.800E+12  0.00  1.601E+04
           rev /  3.000E+12  0.00  7.400E+03 /
  ic6h14+ho2  =  cc6h13+h2o2  5.600E+12  0.00  1.769E+04
           rev /  2.690E+12  0.00  7.410E+03 /
  ic6h14+ho2  =  dc6h13+h2o2  5.600E+12  0.00  1.769E+04
           rev /  2.690E+12  0.00  7.410E+03 /
  ic6h14+ho2  =  ec6h13+h2o2  8.400E+12  0.00  2.044E+04
           rev /  9.966E+12  -0.33  8.415E+03 /
  ic6h14+ch3o  =  ac6h13+ch3oh  3.200E+11  0.00  7.000E+03
           rev /  7.122E+09  0.02  9.550E+03 /
  ic6h14+ch3o  =  bc6h13+ch3oh  1.900E+10  0.00  2.800E+03
           rev /  7.799E+06  0.59  9.852E+03 /
  ic6h14+ch3o  =  cc6h13+ch3oh  1.100E+11  0.00  5.000E+03
           rev /  1.653E+08  0.36  1.007E+04 /
  ic6h14+ch3o  =  dc6h13+ch3oh  1.100E+11  0.00  5.000E+03
           rev /  1.653E+08  0.36  1.007E+04 /
  ic6h14+ch3o  =  ec6h13+ch3oh  1.580E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  ic6h14+o2  =  ac6h13+ho2  4.200E+13  0.00  5.281E+04
           rev /  3.522E+10  0.32 -3.970E+02 /
  ic6h14+o2  =  bc6h13+ho2  7.000E+12  0.00  4.801E+04
           rev /  1.083E+08  0.89 -6.951E+02 /
  ic6h14+o2  =  cc6h13+ho2  1.400E+13  0.00  5.016E+04
           rev /  7.927E+08  0.66 -5.320E+02 /
  ic6h14+o2  =  dc6h13+ho2  1.400E+13  0.00  5.016E+04
           rev /  7.927E+08  0.66 -5.320E+02 /
  ic6h14+o2  =  ec6h13+ho2  2.100E+13  0.00  5.281E+04
           rev /  1.761E+10  0.32 -3.970E+02 /
  ic6h14+c2h5  =  ac6h13+c2h6  1.000E+11  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  ic6h14+c2h5  =  bc6h13+c2h6  1.000E+11  0.00  7.900E+03
           rev /  3.000E+11  0.00  2.100E+04 /
  ic6h14+c2h5  =  cc6h13+c2h6  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  ic6h14+c2h5  =  dc6h13+c2h6  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  ic6h14+c2h5  =  ec6h13+c2h6  5.000E+10  0.00  1.340E+04
           rev /  3.240E+11  0.00  1.230E+04 /
  ic6h14+c2h3  =  ac6h13+c2h4  1.000E+12  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  ic6h14+c2h3  =  bc6h13+c2h4  2.000E+11  0.00  1.430E+04
           rev /  2.400E+12  0.00  2.300E+04 /
  ic6h14+c2h3  =  cc6h13+c2h4  3.980E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  ic6h14+c2h3  =  dc6h13+c2h4  3.980E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  ic6h14+c2h3  =  ec6h13+c2h4  5.000E+11  0.00  1.800E+04
           rev /  2.510E+12  0.00  2.540E+04 /
  ic6h14+ch3o2  =  ac6h13+ch3o2h  1.680E+13  0.00  2.044E+04
           rev /  4.150E+13  -0.51  5.395E+03 /
  ic6h14+ch3o2  =  bc6h13+ch3o2h  2.800E+12  0.00  1.601E+04
           rev /  1.276E+11  0.06  5.464E+03 /
  ic6h14+ch3o2  =  cc6h13+ch3o2h  5.600E+12  0.00  1.769E+04
           rev /  9.341E+11  -0.17  5.157E+03 /
  ic6h14+ch3o2  =  dc6h13+ch3o2h  5.600E+12  0.00  1.769E+04
           rev /  9.341E+11  -0.17  5.157E+03 /
  ic6h14+ch3o2  =  ec6h13+ch3o2h  8.400E+12  0.00  2.044E+04
           rev /  2.075E+13  -0.51  5.395E+03 /
  ic6h14+ac6h13  =  bc6h13+ic6h14  2.500E+10  0.00  7.900E+03
           rev /  1.500E+11  0.00  1.230E+04 /
  ic6h14+ac6h13  =  cc6h13+ic6h14  5.000E+10  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic6h14+ac6h13  =  dc6h13+ic6h14  5.000E+10  0.00  1.040E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic6h14+ac6h13  =  ec6h13+ic6h14  7.500E+10  0.00  1.230E+04
           rev /  1.500E+11  0.00  1.230E+04 /
  ic6h14+bc6h13  =  cc6h13+ic6h14  5.000E+10  0.00  1.040E+04
           rev /  2.500E+10  0.00  7.900E+03 /
  ic6h14+bc6h13  =  dc6h13+ic6h14  5.000E+10  0.00  1.040E+04
           rev /  2.500E+10  0.00  7.900E+03 /
  ic6h14+bc6h13  =  ec6h13+ic6h14  7.500E+10  0.00  1.230E+04
           rev /  2.500E+10  0.00  7.900E+03 /
  ic6h14+cc6h13  =  dc6h13+ic6h14  5.000E+10  0.00  1.040E+04
           rev /  5.000E+10  0.00  1.040E+04 /
  ic6h14+cc6h13  =  ec6h13+ic6h14  7.500E+10  0.00  1.230E+04
           rev /  5.000E+10  0.00  1.040E+04 /
  ic6h14+dc6h13  =  ec6h13+ic6h14  7.500E+10  0.00  1.230E+04
           rev /  5.000E+10  0.00  1.040E+04 /
  ac6h13o2+ic6h14  =  ac6h13o2h+ac6h13  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc6h13o2+ic6h14  =  bc6h13o2h+ac6h13  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc6h13o2+ic6h14  =  cc6h13o2h+ac6h13  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc6h13o2+ic6h14  =  dc6h13o2h+ac6h13  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ec6h13o2+ic6h14  =  ec6h13o2h+ac6h13  1.210E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac6h13o2+ic6h14  =  ac6h13o2h+bc6h13  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc6h13o2+ic6h14  =  bc6h13o2h+bc6h13  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc6h13o2+ic6h14  =  cc6h13o2h+bc6h13  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc6h13o2+ic6h14  =  dc6h13o2h+bc6h13  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ec6h13o2+ic6h14  =  ec6h13o2h+bc6h13  2.016E+12  0.00  1.600E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac6h13o2+ic6h14  =  ac6h13o2h+cc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc6h13o2+ic6h14  =  bc6h13o2h+cc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc6h13o2+ic6h14  =  cc6h13o2h+cc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc6h13o2+ic6h14  =  dc6h13o2h+cc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ec6h13o2+ic6h14  =  ec6h13o2h+cc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac6h13o2+ic6h14  =  ac6h13o2h+dc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc6h13o2+ic6h14  =  bc6h13o2h+dc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc6h13o2+ic6h14  =  cc6h13o2h+dc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc6h13o2+ic6h14  =  dc6h13o2h+dc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ec6h13o2+ic6h14  =  ec6h13o2h+dc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac6h13o2+ic6h14  =  ac6h13o2h+ec6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  bc6h13o2+ic6h14  =  bc6h13o2h+ec6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  cc6h13o2+ic6h14  =  cc6h13o2h+ec6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  dc6h13o2+ic6h14  =  dc6h13o2h+ec6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ec6h13o2+ic6h14  =  ec6h13o2h+ec6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  ac6h13  =  nc3h7+c3h6  2.637E+18  -1.31  3.125E+04
           rev /  1.500E+11  0.00  9.200E+03 /
  ac6h13  =  c5h10-1+ch3  7.937E+14  -0.44  3.052E+04
           rev /  1.500E+11  0.00  9.200E+03 /
  ac6h13  =  ac6h12+h  4.616E+16  -0.93  3.710E+04
           rev /  1.000E+13  0.00  3.200E+03 /
  bc6h13  =  ic4h8+c2h5  2.457E+17  -1.19  3.035E+04
           rev /  1.500E+11  0.00  7.200E+03 /
  bc6h13  =  ac6h12+h  8.513E+14  -0.36  3.960E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  bc6h13  =  bc6h12+h  1.743E+15  -0.53  3.843E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  cc6h13  =  c5h10-2+ch3  1.541E+15  -0.70  3.018E+04
           rev /  1.500E+11  0.00  9.200E+03 /
  cc6h13  =  bc6h12+h  6.381E+15  -0.76  3.675E+04
           rev /  1.000E+13  0.00  3.200E+03 /
  ic6h11+ho2  =  cc6h11o-b+oh  1.000E+13  0.00  0.000E+00
           rev /  2.674E+15  -1.00  1.707E+04 /
  dc6h13  =  ic3h7+c3h6  7.204E+13  -0.03  2.790E+04
           rev /  1.500E+11  0.00  7.800E+03 /
  dc6h13  =  cc6h12+h  2.982E+15  -0.73  3.787E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  dc6h13  =  dc6h12+h  1.398E+15  -0.55  3.877E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  ec6h13  =  ic4h9+c2h4  1.616E+18  -1.56  2.980E+04
           rev /  1.700E+11  0.00  7.200E+03 /
  ec6h13  =  dc6h12+h  2.071E+16  -0.89  3.795E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  ac6h13+o2  =  ac6h12+ho2  1.500E-19  0.00  2.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  bc6h13+o2  =  ac6h12+ho2  9.000E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  bc6h13+o2  =  bc6h12+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  cc6h13+o2  =  bc6h12+ho2  1.500E-19  0.00  2.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  cc6h13+o2  =  cc6h12+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  dc6h13+o2  =  cc6h12+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  dc6h13+o2  =  dc6h12+ho2  4.500E-19  0.00  5.020E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ec6h13+o2  =  dc6h12+ho2  3.000E-19  0.00  3.000E+03
           rev /  2.000E-19  0.00  1.750E+04 /
  ac6h13  =  dc6h13  2.000E+11  0.00  1.810E+04
           rev /  6.000E+11  0.00  2.110E+04 /
  ac6h13  =  ec6h13  3.000E+11  0.00  1.410E+04
           rev /  6.000E+11  0.00  1.410E+04 /
  bc6h13  =  ec6h13  3.000E+11  0.00  2.110E+04
           rev /  1.000E+11  0.00  1.610E+04 /
  ac6h12+oh  =  ic6h11+h2o  3.000E+13  0.00  1.230E+03
           rev /  9.392E+14  0.08  4.009E+04 /
  bc6h12+oh  =  ic6h11+h2o  3.000E+13  0.00  1.230E+03
           rev /  1.923E+15  -0.09  3.722E+04 /
  cc6h12+oh  =  ic6h11+h2o  3.000E+13  0.00  1.230E+03
           rev /  8.986E+14  -0.06  3.864E+04 /
  dc6h12+oh  =  ic6h11+h2o  3.000E+13  0.00  1.230E+03
           rev /  4.214E+14  0.11  4.124E+04 /
  ac6h12+h  =  ic6h11+h2  3.700E+13  0.00  3.900E+03
           rev /  2.675E+14  0.08  2.760E+04 /
  bc6h12+h  =  ic6h11+h2  3.700E+13  0.00  3.900E+03
           rev /  5.478E+14  -0.09  2.473E+04 /
  cc6h12+h  =  ic6h11+h2  3.700E+13  0.00  3.900E+03
           rev /  2.560E+14  -0.06  2.615E+04 /
  dc6h12+h  =  ic6h11+h2  3.700E+13  0.00  3.900E+03
           rev /  1.200E+14  0.11  2.875E+04 /
  ac6h12+ch3  =  ic6h11+ch4  1.000E+12  0.00  7.300E+03
           rev /  1.889E+14  0.08  3.148E+04 /
  bc6h12+ch3  =  ic6h11+ch4  1.000E+12  0.00  7.300E+03
           rev /  3.868E+14  -0.09  2.861E+04 /
  cc6h12+ch3  =  ic6h11+ch4  1.000E+12  0.00  7.300E+03
           rev /  1.807E+14  -0.06  3.003E+04 /
  dc6h12+ch3  =  ic6h11+ch4  1.000E+12  0.00  7.300E+03
           rev /  8.476E+13  0.11  3.263E+04 /
  ac6h12+o  =  ic6h11+oh  2.204E+11  -0.08  8.295E+03
           rev /  7.000E+11  0.00  2.990E+04 /
  bc6h12+o  =  ic6h11+oh  1.076E+11  0.09  1.117E+04
           rev /  7.000E+11  0.00  2.990E+04 /
  cc6h12+o  =  ic6h11+oh  2.304E+11  0.06  9.745E+03
           rev /  7.000E+11  0.00  2.990E+04 /
  dc6h12+o  =  ic6h11+oh  4.912E+11  -0.11  7.145E+03
           rev /  7.000E+11  0.00  2.990E+04 /
  ic6h11  =  c3h6+c3h5-a  2.500E+13  0.00  4.500E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12+oh  =  c5h11-2+ch2o  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12+oh  =  ch3coch3+nc3h7  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12+oh  =  c2h5cho+ic3h7  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12+oh  =  ic4h9+ch3cho  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12+oh  =  dc5h11+ch2o  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12+o  =  c5h11-2+hco  1.000E+11  0.00 -1.050E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12+o  =  ic4h9+ch3co  1.000E+11  0.00 -1.050E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12+o  =  dc5h11+hco  1.000E+11  0.00 -1.050E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12  =  ic4h7+c2h5  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  bc6h12  =  ch3+ic5h9  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  cc6h12  =  ch3+c5h9  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  dc6h12  =  ic3h7+c3h5-a  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  ac6h13o2  =  ac6h13+o2  1.607E+20  -1.64  3.571E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  bc6h13o2  =  bc6h13+o2  3.300E+24  -2.55  3.730E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  cc6h13o2  =  cc6h13+o2  7.401E+22  -2.28  3.799E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  dc6h13o2  =  dc6h13+o2  7.401E+22  -2.28  3.799E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ec6h13o2  =  ec6h13+o2  3.202E+20  -1.64  3.571E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  ac6h13+ac6h13o2  =  ac6h13o+ac6h13o  7.000E+12  0.00 -1.000E+03
           rev /  3.808E+13  -0.18  2.979E+04 /
  ac6h13+bc6h13o2  =  ac6h13o+bc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  2.297E+13  -0.17  3.059E+04 /
  ac6h13+cc6h13o2  =  ac6h13o+cc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  3.582E+13  -0.17  2.950E+04 /
  ac6h13+dc6h13o2  =  ac6h13o+dc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  3.582E+13  -0.17  2.950E+04 /
  ac6h13+ec6h13o2  =  ac6h13o+ec6h13o  7.000E+12  0.00 -1.000E+03
           rev /  3.809E+13  -0.18  2.979E+04 /
  bc6h13+ac6h13o2  =  bc6h13o+ac6h13o  7.000E+12  0.00 -1.000E+03
           rev /  1.512E+17  -1.08  3.218E+04 /
  bc6h13+bc6h13o2  =  bc6h13o+bc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.122E+16  -1.07  3.298E+04 /
  bc6h13+cc6h13o2  =  bc6h13o+cc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  1.422E+17  -1.07  3.189E+04 /
  bc6h13+dc6h13o2  =  bc6h13o+dc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  1.422E+17  -1.07  3.189E+04 /
  bc6h13+ec6h13o2  =  bc6h13o+ec6h13o  7.000E+12  0.00 -1.000E+03
           rev /  1.512E+17  -1.08  3.218E+04 /
  cc6h13+ac6h13o2  =  cc6h13o+ac6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.888E+15  -0.81  3.178E+04 /
  cc6h13+bc6h13o2  =  cc6h13o+bc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  5.965E+15  -0.80  3.258E+04 /
  cc6h13+cc6h13o2  =  cc6h13o+cc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.301E+15  -0.80  3.149E+04 /
  cc6h13+dc6h13o2  =  cc6h13o+dc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.301E+15  -0.80  3.149E+04 /
  cc6h13+ec6h13o2  =  cc6h13o+ec6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.889E+15  -0.81  3.178E+04 /
  dc6h13+ac6h13o2  =  dc6h13o+ac6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.888E+15  -0.81  3.178E+04 /
  dc6h13+bc6h13o2  =  dc6h13o+bc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  5.965E+15  -0.80  3.258E+04 /
  dc6h13+cc6h13o2  =  dc6h13o+cc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.301E+15  -0.80  3.149E+04 /
  dc6h13+dc6h13o2  =  dc6h13o+dc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.301E+15  -0.80  3.149E+04 /
  dc6h13+ec6h13o2  =  dc6h13o+ec6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.889E+15  -0.81  3.178E+04 /
  ec6h13+ac6h13o2  =  ec6h13o+ac6h13o  7.000E+12  0.00 -1.000E+03
           rev /  7.589E+13  -0.18  2.979E+04 /
  ec6h13+bc6h13o2  =  ec6h13o+bc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  4.578E+13  -0.17  3.059E+04 /
  ec6h13+cc6h13o2  =  ec6h13o+cc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  7.138E+13  -0.17  2.950E+04 /
  ec6h13+dc6h13o2  =  ec6h13o+dc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  7.138E+13  -0.17  2.950E+04 /
  ec6h13+ec6h13o2  =  ec6h13o+ec6h13o  7.000E+12  0.00 -1.000E+03
           rev /  7.590E+13  -0.18  2.979E+04 /
  ac6h13o2  =  ac6h12ooh-a  3.750E+10  0.00  2.440E+04
           rev /  2.188E+11  -0.57  9.010E+03 /
  ac6h13o2  =  ac6h12ooh-b  1.000E+11  0.00  2.410E+04
           rev /  3.328E+09  0.01  1.301E+04 /
  ac6h13o2  =  ac6h12ooh-c  2.500E+10  0.00  2.085E+04
           rev /  4.227E+09  -0.17  7.910E+03 /
  ac6h13o2  =  ac6h12ooh-d  3.125E+09  0.00  1.905E+04
           rev /  5.283E+08  -0.17  6.110E+03 /
  ac6h13o2  =  ac6h12ooh-e  5.860E+08  0.00  2.555E+04
           rev /  3.419E+09  -0.57  1.016E+04 /
  bc6h13o2  =  bc6h12ooh-a  6.000E+11  0.00  2.940E+04
           rev /  1.337E+12  -0.50  1.393E+04 /
  bc6h13o2  =  bc6h12ooh-c  2.000E+11  0.00  2.685E+04
           rev /  1.912E+10  -0.15  1.389E+04 /
  bc6h13o2  =  bc6h12ooh-d  2.500E+10  0.00  2.085E+04
           rev /  2.390E+09  -0.15  7.890E+03 /
  bc6h13o2  =  bc6h12ooh-e  4.688E+09  0.00  2.235E+04
           rev /  1.045E+10  -0.50  6.880E+03 /
  cc6h13o2  =  cc6h12ooh-a  7.500E+10  0.00  2.440E+04
           rev /  3.455E+11  -0.59  9.040E+03 /
  cc6h13o2  =  cc6h12ooh-b  1.000E+11  0.00  2.410E+04
           rev /  1.064E+10  -0.06  1.305E+04 /
  cc6h13o2  =  cc6h12ooh-d  2.000E+11  0.00  2.685E+04
           rev /  2.829E+10  -0.14  1.390E+04 /
  cc6h13o2  =  cc6h12ooh-e  3.750E+10  0.00  2.440E+04
           rev /  2.597E+11  -0.59  9.040E+03 /
  dc6h13o2  =  dc6h12ooh-a  9.376E+09  0.00  2.235E+04
           rev /  4.319E+10  -0.59  6.990E+03 /
  dc6h13o2  =  dc6h12ooh-b  1.250E+10  0.00  1.910E+04
           rev /  1.330E+09  -0.06  8.050E+03 /
  dc6h13o2  =  dc6h12ooh-c  2.000E+11  0.00  2.685E+04
           rev /  2.829E+10  -0.14  1.390E+04 /
  dc6h13o2  =  dc6h12ooh-e  3.000E+11  0.00  2.940E+04
           rev /  2.077E+12  -0.59  1.404E+04 /
  ec6h13o2  =  ec6h12ooh-a  1.172E+09  0.00  2.555E+04
           rev /  4.549E+09  -0.57  1.016E+04 /
  ec6h13o2  =  ec6h12ooh-b  1.563E+09  0.00  1.705E+04
           rev /  3.121E+08  0.01  5.960E+03 /
  ec6h13o2  =  ec6h12ooh-c  2.500E+10  0.00  2.085E+04
           rev /  1.266E+10  -0.17  7.910E+03 /
  ec6h13o2  =  ec6h12ooh-d  2.000E+11  0.00  2.685E+04
           rev /  1.013E+11  -0.17  1.391E+04 /
!  ac6h13o2+ho2  =  ac6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.094E+13  -0.83  3.447E+04 /
  ac6h13o2+ho2  =  ac6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  bc6h13o2+ho2  =  bc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  4.656E+13  -0.82  3.446E+04 /
  bc6h13o2+ho2  =  bc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  cc6h13o2+ho2  =  cc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.882E+13  -0.85  3.450E+04 /
  cc6h13o2+ho2  =  cc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  dc6h13o2+ho2  =  dc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.882E+13  -0.85  3.450E+04 /
  dc6h13o2+ho2  =  dc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  ec6h13o2+ho2  =  ec6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.094E+13  -0.83  3.447E+04 /
  ec6h13o2+ho2  =  ec6h13o2h+o2  1.75E+11  0.00 -1.711E+03
  ac6h13o2+h2o2  =  ac6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  bc6h13o2+h2o2  =  bc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  cc6h13o2+h2o2  =  cc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  dc6h13o2+h2o2  =  dc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  ec6h13o2+h2o2  =  ec6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  ac6h13o2+ch3o2  =  ac6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h13o2+ch3o2  =  bc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h13o2+ch3o2  =  cc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h13o2+ch3o2  =  dc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h13o2+ch3o2  =  ec6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2+ac6h13o2  =  o2+ac6h13o+ac6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2+bc6h13o2  =  o2+ac6h13o+bc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2+cc6h13o2  =  o2+ac6h13o+cc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2+dc6h13o2  =  o2+ac6h13o+dc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2+ec6h13o2  =  o2+ac6h13o+ec6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h13o2+bc6h13o2  =  o2+bc6h13o+bc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h13o2+cc6h13o2  =  o2+bc6h13o+cc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h13o2+dc6h13o2  =  o2+bc6h13o+dc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h13o2+ec6h13o2  =  o2+bc6h13o+ec6h13o  1.400E+16  -1.61  1.860E+03

!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h13o2+cc6h13o2  =  o2+cc6h13o+cc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h13o2+dc6h13o2  =  o2+cc6h13o+dc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h13o2+ec6h13o2  =  o2+cc6h13o+ec6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h13o2+dc6h13o2  =  o2+dc6h13o+dc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h13o2+ec6h13o2  =  o2+dc6h13o+ec6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h13o2+ec6h13o2  =  o2+ec6h13o+ec6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h13o2h  =  ac6h13o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.504E+08  1.74 -3.045E+03 /
  bc6h13o2h  =  bc6h13o+oh  7.500E+15  0.00  4.154E+04
           rev /  4.965E+07  1.73 -3.195E+03 /
  cc6h13o2h  =  cc6h13o+oh  9.450E+15  0.00  4.160E+04
           rev /  7.721E+07  1.76 -4.265E+03 /
  dc6h13o2h  =  dc6h13o+oh  9.450E+15  0.00  4.160E+04
           rev /  7.721E+07  1.76 -4.265E+03 /
  ec6h13o2h  =  ec6h13o+oh  1.500E+16  0.00  4.250E+04
           rev /  1.505E+08  1.74 -3.045E+03 /
  ac6h13o  =  ch2o+c5h11-2  1.099E+14  -0.21  1.799E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  bc6h13o  =  nc3h7+ch3coch3  3.278E+18  -1.28  1.666E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  cc6h13o  =  c2h5cho+ic3h7  1.163E+19  -1.46  1.853E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  dc6h13o  =  ch3cho+ic4h9  2.055E+22  -2.58  2.084E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  ec6h13o  =  ch2o+dc5h11  2.932E+17  -1.28  2.091E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  ac6h12ooh-b  =  a-bc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-a  =  a-ac6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-c  =  a-cc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-d  =  a-dc6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-e  =  a-ec6h12o+oh  1.172E+09  0.00  1.800E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12ooh-a  =  a-bc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12ooh-c  =  b-cc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12ooh-d  =  b-dc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12ooh-e  =  b-ec6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-b  =  b-cc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-d  =  c-dc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-a  =  a-cc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-e  =  c-ec6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12ooh-c  =  c-dc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12ooh-e  =  d-ec6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12ooh-b  =  b-dc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12ooh-a  =  a-dc6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h12ooh-d  =  d-ec6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h12ooh-c  =  c-ec6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h12ooh-b  =  b-ec6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ec6h12ooh-a  =  a-ec6h12o+oh  1.172E+09  0.00  1.800E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-b  =  ac6h12+ho2  4.694E+18  -1.89  2.061E+04
           rev /  2.944E+11  0.00  1.205E+04 /
  bc6h12ooh-a  =  ac6h12+ho2  3.815E+22  -2.73  2.232E+04
           rev /  2.944E+11  0.00  1.205E+04 /
  bc6h12ooh-c  =  bc6h12+ho2  1.974E+21  -2.56  2.000E+04
           rev /  1.734E+11  0.00  1.009E+04 /
  cc6h12ooh-b  =  bc6h12+ho2  3.372E+20  -2.43  2.061E+04
           rev /  1.734E+11  0.00  1.009E+04 /
  cc6h12ooh-d  =  cc6h12+ho2  3.171E+20  -2.48  2.159E+04
           rev /  2.624E+11  0.00  1.154E+04 /
  dc6h12ooh-c  =  cc6h12+ho2  3.171E+20  -2.48  2.159E+04
           rev /  2.624E+11  0.00  1.154E+04 /
  dc6h12ooh-e  =  dc6h12+ho2  1.265E+22  -2.75  2.369E+04
           rev /  4.560E+11  0.00  1.346E+04 /
  ec6h12ooh-d  =  dc6h12+ho2  9.890E+19  -2.03  2.132E+04
           rev /  4.560E+11  0.00  1.346E+04 /
  ac6h12ooh-a  =  oh+ch2o+c5h10-1  4.295E+15  -0.58  2.939E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-c  =  oh+ch2o+c5h10-2  5.329E+14  -0.45  2.922E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-d  =  ho2+c3h6+c3h6  3.236E+17  -1.41  2.748E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  bc6h12ooh-d  =  oh+ch3coch3+c3h6  4.444E+19  -1.88  2.685E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-a  =  oh+c2h5cho+c3h6  1.014E+20  -1.93  2.880E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  cc6h12ooh-e  =  oh+ic3h7cho+c2h4  1.522E+18  -1.52  2.756E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  dc6h12ooh-b  =  oh+ch3cho+ic4h8  2.623E+16  -0.78  2.716E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ac6h12ooh-ao2  =  ac6h12ooh-a+o2  2.635E+20  -1.58  3.564E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  ac6h12ooh-bo2  =  ac6h12ooh-b+o2  7.484E+24  -2.47  3.741E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  ac6h12ooh-co2  =  ac6h12ooh-c+o2  5.214E+22  -2.23  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ac6h12ooh-do2  =  ac6h12ooh-d+o2  5.214E+22  -2.23  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ac6h12ooh-eo2  =  ac6h12ooh-e+o2  1.322E+20  -1.58  3.564E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  bc6h12ooh-ao2  =  bc6h12ooh-a+o2  2.951E+20  -1.63  3.570E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  bc6h12ooh-co2  =  bc6h12ooh-c+o2  1.122E+23  -2.29  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  bc6h12ooh-do2  =  bc6h12ooh-d+o2  1.122E+23  -2.29  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  bc6h12ooh-eo2  =  bc6h12ooh-e+o2  2.951E+20  -1.63  3.570E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  cc6h12ooh-ao2  =  cc6h12ooh-a+o2  6.156E+19  -1.51  3.557E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  cc6h12ooh-do2  =  cc6h12ooh-d+o2  4.598E+22  -2.21  3.791E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  cc6h12ooh-eo2  =  cc6h12ooh-e+o2  8.160E+19  -1.51  3.557E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  cc6h12ooh-bo2  =  cc6h12ooh-b+o2  1.229E+24  -2.42  3.733E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  dc6h12ooh-ao2  =  dc6h12ooh-a+o2  6.156E+19  -1.51  3.557E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  dc6h12ooh-co2  =  dc6h12ooh-c+o2  4.598E+22  -2.21  3.791E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  dc6h12ooh-eo2  =  dc6h12ooh-e+o2  8.160E+19  -1.51  3.557E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  dc6h12ooh-bo2  =  dc6h12ooh-b+o2  1.229E+24  -2.42  3.733E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  ec6h12ooh-ao2  =  ec6h12ooh-a+o2  9.977E+19  -1.58  3.564E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  ec6h12ooh-co2  =  ec6h12ooh-c+o2  1.741E+22  -2.23  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ec6h12ooh-do2  =  ec6h12ooh-d+o2  1.741E+22  -2.23  3.794E+04
           rev /  7.540E+12  0.00  0.000E+00 /
  ec6h12ooh-bo2  =  ec6h12ooh-b+o2  6.261E+23  -2.47  3.741E+04
           rev /  1.410E+13  0.00  0.000E+00 /
  ac6h12ooh-ao2  =  ic6ketaa+oh  2.500E+10  0.00  2.140E+04
           rev /  5.103E+03  1.26  4.440E+04 /
  ac6h12ooh-bo2  =  ic6ketab+oh  2.000E+11  0.00  2.640E+04
           rev /  2.086E+05  1.07  4.869E+04 /
  ac6h12ooh-co2  =  ic6ketac+oh  2.500E+10  0.00  2.140E+04
           rev /  1.524E+04  1.20  4.444E+04 /
  ac6h12ooh-do2  =  ic6ketad+oh  3.125E+09  0.00  1.935E+04
           rev /  1.904E+03  1.20  4.239E+04 /
  ac6h12ooh-eo2  =  ic6ketae+oh  3.906E+08  0.00  2.255E+04
           rev /  1.589E+02  1.26  4.555E+04 /
  cc6h12ooh-ao2  =  ic6ketca+oh  1.250E+10  0.00  1.785E+04
           rev /  5.158E+02  1.63  4.385E+04 /
  cc6h12ooh-bo2  =  ic6ketcb+oh  1.000E+11  0.00  2.385E+04
           rev /  1.635E+04  1.48  4.916E+04 /
  cc6h12ooh-do2  =  ic6ketcd+oh  1.000E+11  0.00  2.385E+04
           rev /  1.227E+04  1.46  4.906E+04 /
  cc6h12ooh-eo2  =  ic6ketce+oh  1.250E+10  0.00  1.785E+04
           rev /  5.158E+02  1.63  4.385E+04 /
  dc6h12ooh-ao2  =  ic6ketda+oh  1.563E+09  0.00  1.605E+04
           rev /  5.110E+01  1.68  4.207E+04 /
  dc6h12ooh-bo2  =  ic6ketdb+oh  1.250E+10  0.00  1.785E+04
           rev /  2.967E+02  1.74  4.388E+04 /
  dc6h12ooh-co2  =  ic6ketdc+oh  1.000E+11  0.00  2.385E+04
           rev /  7.983E+03  1.54  4.905E+04 /
  dc6h12ooh-eo2  =  ic6ketde+oh  1.000E+11  0.00  2.385E+04
           rev /  1.499E+03  1.67  5.000E+04 /
  ec6h12ooh-ao2  =  ic6ketea+oh  3.906E+08  0.00  2.255E+04
           rev /  9.445E+01  1.32  4.584E+04 /
  ec6h12ooh-bo2  =  ic6keteb+oh  3.125E+09  0.00  1.935E+04
           rev /  7.783E+02  1.32  4.265E+04 /
  ec6h12ooh-co2  =  ic6ketec+oh  2.500E+10  0.00  2.140E+04
           rev /  5.727E+03  1.33  4.469E+04 /
  ec6h12ooh-do2  =  ic6keted+oh  2.000E+11  0.00  2.640E+04
           rev /  1.483E+02  0.63  4.846E+04 /
  ic6ketaa  =  ch2o+c4h8cho-4+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketab  =  nc3h7coch3+hco+oh  9.500E+15  0.00  4.154E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketac  =  c2h5cho+ch3chcho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketad  =  ch3cho+ic3h6cho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketae  =  ch2o+c4h8cho4-2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketca  =  ch2o+c2h5coc2h4s+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketcb  =  ch3coch3+c2h5co+oh  9.500E+15  0.00  4.154E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketcd  =  ch3cho+ic3h7co+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketce  =  ch2o+ic3h7coch2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketda  =  ch2o+c3h6coch3-2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketdb  =  ch3coch3+ch3coch2+oh  9.500E+15  0.00  4.154E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketdc  =  ic3h7cho+ch3co+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketde  =  ch2o+ic4h9co+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketea  =  ch2o+c4h8cho-2+oh  1.500E+16  0.00  4.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6keteb  =  ch3coch3+ch2ch2cho+oh  9.500E+15  0.00  4.154E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6ketec  =  ic3h7cho+ch2cho+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6keted  =  ic4h9cho+hco+oh  1.050E+16  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac6h12o+oh  =  c5h10cho1-2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc6h12o+oh  =  c5h10cho2-2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc6h12o+oh  =  c5h10cho3-2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc6h12o+oh  =  c5h10cho4-2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ec6h12o+oh  =  c5h10cho5-2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc6h12o+oh  =  ic3h5cho+c2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc6h12o+oh  =  ic4h7+ch3cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-ec6h12o+oh  =  ic5h9+ch2o+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc6h12o+oh  =  ic3h7coc2h4s+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-ec6h12o+oh  =  cc5h10cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  d-ec6h12o+oh  =  dc5h10cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac6h12o+oh  =  c5h9+ch2o+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc6h12o+oh  =  c5h9+ch2o+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc6h12o+oh  =  ic3h6coc2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc6h12o+oh  =  ic3h6ch2coch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ec6h12o+oh  =  ac5h10cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc6h12o+oh  =  tc3h6coc2h5+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc6h12o+oh  =  tc3h6ch2coch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  b-ec6h12o+oh  =  bc5h10cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc6h12o+oh  =  ic3h7chcoch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  c-ec6h12o+oh  =  ic3h7coc2h4p+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  d-ec6h12o+oh  =  ic4h9coch2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac6h12o+ho2  =  c5h10cho1-2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc6h12o+ho2  =  c5h10cho2-2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc6h12o+ho2  =  c5h10cho3-2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc6h12o+ho2  =  c5h10cho4-2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ec6h12o+ho2  =  c5h10cho5-2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc6h12o+ho2  =  ic3h5cho+c2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc6h12o+ho2  =  ic4h7+ch3cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-ec6h12o+ho2  =  ic5h9+ch2o+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc6h12o+ho2  =  ic3h7coc2h4s+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-ec6h12o+ho2  =  cc5h10cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  d-ec6h12o+ho2  =  dc5h10cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ac6h12o+ho2  =  c5h9+ch2o+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-bc6h12o+ho2  =  c5h9+ch2o+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-cc6h12o+ho2  =  ic3h6coc2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-dc6h12o+ho2  =  ic3h6ch2coch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  a-ec6h12o+ho2  =  ac5h10cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-cc6h12o+ho2  =  tc3h6coc2h5+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-dc6h12o+ho2  =  tc3h6ch2coch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  b-ec6h12o+ho2  =  bc5h10cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-dc6h12o+ho2  =  ic3h7chcoch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  c-ec6h12o+ho2  =  ic3h7coc2h4p+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  d-ec6h12o+ho2  =  ic4h9coch2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  ic6h14+o2cho  =  ac6h13+ho2cho  1.680E+13  0.00  2.044E+04
           rev /  1.138E+03  2.30  3.065E+03 /
  ic6h14+o2cho  =  bc6h13+ho2cho  2.800E+12  0.00  1.601E+04
           rev /  3.497E+00  2.87  3.145E+03 /
  ic6h14+o2cho  =  cc6h13+ho2cho  5.600E+12  0.00  1.769E+04
           rev /  2.560E+01  2.64  2.831E+03 /
  ic6h14+o2cho  =  dc6h13+ho2cho  5.600E+12  0.00  1.769E+04
           rev /  2.560E+01  2.64  2.831E+03 /
  ic6h14+o2cho  =  ec6h13+ho2cho  8.400E+12  0.00  2.044E+04
           rev /  5.688E+02  2.30  3.065E+03 /
  nc4h9cho-2+oh  =  nc4h9co-2+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.193E+12  0.00  3.093E+04 /
  nc4h9cho-2+oh  =  c4h8cho1-2+h2o  3.120E+06  2.00 -2.980E+02
           rev /  6.470E+05  1.99  1.914E+04 /
  nc4h9cho-2+oh  =  c4h8cho2-2+h2o  1.684E+12  0.00 -7.810E+02
           rev /  1.214E+13  -0.18  2.993E+04 /
  nc4h9cho-2+oh  =  c4h8cho3-2+h2o  2.900E+09  1.00  2.580E+02
           rev /  2.871E+07  1.38  2.215E+04 /
  nc4h9cho-2+oh  =  c4h8cho4-2+h2o  3.160E+07  1.80  9.340E+02
           rev /  6.553E+06  1.79  2.037E+04 /
  nc4h9cho-2+ho2  =  nc4h9co-2+h2o2  1.000E+12  0.00  1.192E+04
           rev /  3.863E+12  -0.33  1.200E+04 /
  nc4h9cho-2+ho2  =  c4h8cho1-2+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.930E+04  2.21  4.471E+03 /
  nc4h9cho-2+ho2  =  c4h8cho2-2+h2o2  8.000E+10  0.00  1.192E+04
           rev /  3.424E+12  -0.51  1.117E+04 /
  nc4h9cho-2+ho2  =  c4h8cho3-2+h2o2  9.640E+03  2.60  1.391E+04
           rev /  5.665E+02  2.65  4.342E+03 /
  nc4h9cho-2+ho2  =  c4h8cho4-2+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.930E+04  2.21  4.471E+03 /
  nc4h9cho-2+ch3o2  =  nc4h9co-2+ch3o2h  1.000E+12  0.00  1.192E+04
           rev /  1.588E+13  -0.51  1.128E+04 /
  nc4h9cho-2+ch3o2  =  c4h8cho1-2+ch3o2h  2.380E+04  2.55  1.649E+04
           rev /  1.204E+05  2.04  3.751E+03 /
  nc4h9cho-2+ch3o2  =  c4h8cho2-2+ch3o2h  8.000E+10  0.00  1.192E+04
           rev /  1.407E+13  -0.69  1.045E+04 /
  nc4h9cho-2+ch3o2  =  c4h8cho3-2+ch3o2h  9.640E+03  2.60  1.391E+04
           rev /  2.328E+03  2.47  3.622E+03 /
  nc4h9cho-2+ch3o2  =  c4h8cho4-2+ch3o2h  2.380E+04  2.55  1.649E+04
           rev /  1.204E+05  2.04  3.751E+03 /
  nc4h9co-2  =  sc4h9+co  1.527E+13  -0.09  1.065E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  c4h8cho1-2  =  c2h3cho+c2h5  8.937E+16  -1.18  2.620E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c4h8cho1-2  =  c4h8-1+hco  4.045E+16  -1.20  2.667E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c4h8cho2-2  =  ic3h5cho+ch3  2.027E+14  -0.45  3.455E+04
           rev /  1.230E+11  0.00  1.060E+04 /
  c4h8cho3-2  =  c4h8-2+hco  2.801E+15  -1.06  2.157E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  c4h8cho4-2  =  ch3chcho+c2h4  4.387E+16  -1.47  2.649E+04
           rev /  8.000E+10  0.00  1.130E+04 /
  ic4h9cho+oh  =  ic4h9co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.623E+10  0.76  3.119E+04 /
  ic4h9cho+oh  =  tc3h6ch2cho+h2o  2.700E+09  1.00 -1.490E+02
           rev /  1.043E+07  1.56  2.379E+04 /
  ic4h9cho+oh  =  ic3h6ch2cho+h2o  3.160E+07  1.80  9.340E+02
           rev /  5.174E+06  1.82  2.033E+04 /
  ic4h9cho+oh  =  ic3h7chcho+h2o  2.900E+09  1.00  2.580E+02
           rev /  7.228E+10  0.74  2.915E+04 /
  ic4h9cho+ho2  =  ic4h9co+h2o2  3.000E+12  0.00  1.192E+04
           rev /  1.075E+13  -0.32  1.199E+04 /
  ic4h9cho+ho2  =  tc3h6ch2cho+h2o2  3.610E+03  2.55  1.053E+04
           rev /  8.276E+01  2.78  3.004E+03 /
  ic4h9cho+ho2  =  ic3h6ch2cho+h2o2  4.760E+04  2.55  1.649E+04
           rev /  4.627E+04  2.24  4.430E+03 /
  ic4h9cho+ho2  =  ic3h7chcho+h2o2  9.640E+03  2.60  1.151E+04
           rev /  1.426E+06  2.01  8.942E+03 /
  ic4h9cho+ch3o2  =  ic4h9co+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  4.121E+13  -0.50  1.294E+04 /
  ic4h9cho+ch3o2  =  tc3h6ch2cho+ch3o2h  3.610E+03  2.55  1.053E+04
           rev /  3.401E+02  2.60  2.284E+03 /
  ic4h9cho+ch3o2  =  ic3h6ch2cho+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  1.901E+05  2.07  3.710E+03 /
  ic4h9cho+ch3o2  =  ic3h7chcho+ch3o2h  9.640E+03  2.60  1.151E+04
           rev /  5.861E+06  1.83  8.222E+03 /
  ic4h9co  =  ic4h9+co  4.416E+16  -1.00  1.335E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic4h9co  =  ic3h7+ch2co  6.784E+12  0.17  3.634E+04
           rev /  1.000E+11  0.00  9.200E+03 /
  tc3h6ch2cho  =  ic4h8+hco  1.393E+14  -0.55  2.324E+04
           rev /  1.000E+11  0.00  6.000E+03 /
  ic3h6ch2cho  =  c3h6+ch2cho  1.569E+16  -1.12  2.587E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  ic3h6ch2cho  =  ac3h5cho+ch3  1.915E+15  -0.72  3.287E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  ic3h7chcho  =  sc3h5cho+ch3  4.405E+15  -0.64  3.215E+04
           rev /  1.230E+11  0.00  1.060E+04 /
  ic5h11cho+oh  =  ic5h11co+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.167E+12  0.00  3.092E+04 /
  ic5h11cho+oh  =  ac5h10cho+h2o  1.530E+08  1.53  8.775E+03
           rev /  3.031E+07  1.53  2.820E+04 /
  ic5h11cho+oh  =  bc5h10cho+h2o  1.684E+12  0.00 -7.810E+02
           rev /  5.634E+09  0.58  2.313E+04 /
  ic5h11cho+oh  =  cc5h10cho+h2o  3.615E+07  1.64 -2.470E+02
           rev /  4.277E+05  1.99  2.167E+04 /
  ic5h11cho+oh  =  dc5h10cho+h2o  2.900E+09  1.00  2.580E+02
           rev /  7.660E+10  0.73  2.916E+04 /
  ic5h11cho+ho2  =  ic5h11co+h2o2  3.000E+12  0.00  1.192E+04
           rev /  1.145E+13  -0.33  1.200E+04 /
  ic5h11cho+ho2  =  ac5h10cho+h2o2  4.760E+04  2.55  1.649E+04
           rev /  5.598E+04  2.22  4.456E+03 /
  ic5h11cho+ho2  =  bc5h10cho+h2o2  8.000E+10  0.00  1.192E+04
           rev /  1.589E+09  0.25  4.372E+03 /
  ic5h11cho+ho2  =  cc5h10cho+h2o2  5.600E+12  0.00  1.770E+04
           rev /  3.933E+11  0.02  8.152E+03 /
  ic5h11cho+ho2  =  dc5h10cho+h2o2  9.640E+03  2.60  1.151E+04
           rev /  1.511E+06  2.00  8.952E+03 /
  ic5h11cho+ch3o2  =  ic5h11co+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  4.392E+13  -0.51  1.295E+04 /
  ic5h11cho+ch3o2  =  ac5h10cho+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  2.301E+05  2.04  3.736E+03 /
  ic5h11cho+ch3o2  =  bc5h10cho+ch3o2h  3.610E+03  2.55  1.053E+04
           rev /  2.946E+02  2.62  2.264E+03 /
  ic5h11cho+ch3o2  =  cc5h10cho+ch3o2h  9.640E+03  2.60  1.391E+04
           rev /  2.782E+03  2.45  3.642E+03 /
  ic5h11cho+ch3o2  =  dc5h10cho+ch3o2h  9.640E+03  2.60  1.151E+04
           rev /  6.211E+06  1.82  8.232E+03 /
  ic5h11co  =  dc5h11+co  3.415E+16  -1.03  1.353E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic5h11co  =  ic4h9+ch2co  3.027E+16  -0.88  3.849E+04
           rev /  1.000E+11  0.00  9.200E+03 /
  ac5h10cho  =  c3h6+ch2ch2cho  2.046E+19  -1.59  3.156E+04
           rev /  8.000E+10  0.00  9.600E+03 /
  bc5h10cho  =  ic4h8+ch2cho  5.410E+15  -1.13  2.748E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  cc5h10cho  =  cc5h10+hco  3.081E+14  -0.66  2.633E+04
           rev /  1.000E+11  0.00  9.600E+03 /
  cc5h10cho  =  c4h7cho2-1+ch3  3.343E+14  -0.56  3.252E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  dc5h10cho  =  ic3h7+c2h3cho  1.215E+16  -0.54  3.326E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  c4h7cho1-4+oh  =  c4h7co1-4+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.398E+12  -0.02  3.094E+04 /
  c4h7cho1-4+oh  =  c4h6cho1-43+h2o  2.080E+06  2.00 -2.980E+02
           rev /  1.187E+08  1.74  3.498E+04 /
  c4h7cho1-4+oh  =  c4h6cho1-44+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.502E+09  1.31  2.890E+04 /
  c4h7cho1-4+oh  =  ch3cho+ch2ch2cho  1.000E+11  0.00  0.000E+00
           rev /  5.344E+06  0.97  1.926E+04 /
  c4h7cho1-4+ho2  =  c4h7co1-4+h2o2  1.000E+12  0.00  1.192E+04
           rev /  4.225E+12  -0.35  1.201E+04 /
  c4h7cho1-4+ho2  =  c4h6cho1-43+h2o2  9.640E+03  2.60  1.391E+04
           rev /  3.265E+06  2.01  1.773E+04 /
  c4h7cho1-4+ho2  =  c4h6cho1-44+h2o2  1.475E+04  2.60  1.391E+04
           rev /  2.815E+06  1.97  1.138E+04 /
  c4h7cho1-4+ch3o2  =  c4h7co1-4+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  4.861E+13  -0.52  1.297E+04 /
  c4h7cho1-4+ch3o2  =  c4h6cho1-43+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  2.770E+15  -0.77  2.015E+04 /
  c4h7cho1-4+ch3o2  =  c4h6cho1-44+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  1.561E+15  -0.80  1.380E+04 /
  c4h7co1-4  =  c4h7+co  2.787E+09  0.46 -1.600E+02
           rev /  1.500E+11  0.00  4.810E+03 /
  c4h6cho1-43  =  c4h6+hco  4.834E+15  -0.79  3.354E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c4h6cho1-44  =  c2h3cho+c2h3  2.118E+14  -0.39  3.716E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  c4h7cho2-1+oh  =  c4h7co2-1+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.191E+12  -0.01  3.093E+04 /
  c4h7cho2-1+oh  =  c4h6cho2-11+h2o  2.080E+06  2.00 -2.980E+02
           rev /  7.592E+07  1.80  3.491E+04 /
  c4h7cho2-1+oh  =  c4h6cho1-43+h2o  3.120E+06  2.00 -2.980E+02
           rev /  1.540E+08  1.67  3.310E+04 /
  c4h7cho2-1+oh  =  c2h5cho+ch2cho  1.000E+11  0.00  0.000E+00
           rev /  3.065E+09  0.49  2.428E+04 /
  c4h7cho2-1+ho2  =  c4h7co2-1+h2o2  1.000E+12  0.00  1.192E+04
           rev /  3.859E+12  -0.33  1.200E+04 /
  c4h7cho2-1+ho2  =  c4h6cho1-43+h2o2  9.640E+03  2.60  1.391E+04
           rev /  2.824E+06  1.94  1.585E+04 /
  c4h7cho2-1+ho2  =  c4h6cho2-11+h2o2  1.475E+04  2.60  1.391E+04
           rev /  3.196E+06  2.07  1.766E+04 /
  c4h7cho2-1+ch3o2  =  c4h7co2-1+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  4.440E+13  -0.51  1.296E+04 /
  c4h7cho2-1+ch3o2  =  c4h6cho1-43+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  2.396E+15  -0.84  1.827E+04 /
  c4h7cho2-1+ch3o2  =  c4h6cho2-11+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  1.772E+15  -0.71  2.008E+04 /
  c4h7co2-1  =  c4h7+co  2.943E+09  0.54  1.710E+03
           rev /  1.500E+11  0.00  4.810E+03 /
  c4h6cho2-11+ho2  =  sc3h5cho+hco+oh  8.910E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  nc5h11cho-2+oh  =  nc5h11co-2+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.192E+12  -0.01  3.093E+04 /
  nc5h11cho-2+oh  =  c5h10cho1-2+h2o  6.240E+06  2.00 -2.980E+02
           rev /  1.363E+06  1.98  1.915E+04 /
  nc5h11cho-2+oh  =  c5h10cho2-2+h2o  1.684E+12  0.00 -7.810E+02
           rev /  1.205E+13  -0.18  2.992E+04 /
  nc5h11cho-2+oh  =  c5h10cho3-2+h2o  9.340E+07  1.61 -3.500E+01
           rev /  9.440E+05  1.98  2.186E+04 /
  nc5h11cho-2+oh  =  c5h10cho4-2+h2o  9.340E+07  1.61 -3.500E+01
           rev /  9.440E+05  1.98  2.186E+04 /
  nc5h11cho-2+oh  =  c5h10cho5-2+h2o  6.240E+06  2.00 -2.980E+02
           rev /  1.363E+06  1.98  1.915E+04 /
  nc5h11cho-2+ho2  =  nc5h11co-2+h2o2  1.000E+12  0.00  1.192E+04
           rev /  3.861E+12  -0.33  1.200E+04 /
  nc5h11cho-2+ho2  =  c5h10cho1-2+h2o2  5.520E+04  2.55  1.648E+04
           rev /  7.159E+04  2.21  4.462E+03 /
  nc5h11cho-2+ho2  =  c5h10cho2-2+h2o2  1.000E+10  0.00  1.192E+04
           rev /  4.248E+11  -0.51  1.116E+04 /
  nc5h11cho-2+ho2  =  c5h10cho3-2+h2o2  2.950E+04  2.60  1.391E+04
           rev /  1.770E+03  2.65  4.342E+03 /
  nc5h11cho-2+ho2  =  c5h10cho4-2+h2o2  2.950E+04  2.60  1.391E+04
           rev /  1.770E+03  2.65  4.342E+03 /
  nc5h11cho-2+ho2  =  c5h10cho5-2+h2o2  5.520E+04  2.55  1.648E+04
           rev /  7.159E+04  2.21  4.462E+03 /
  nc5h11cho-2+ch3o2  =  nc5h11co-2+ch3o2h  1.000E+12  0.00  1.192E+04
           rev /  1.587E+13  -0.51  1.128E+04 /
  nc5h11cho-2+ch3o2  =  c5h10cho1-2+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.214E+13  -0.52  6.637E+03 /
  nc5h11cho-2+ch3o2  =  c5h10cho2-2+ch3o2h  1.000E+10  0.00  1.191E+04
           rev /  1.746E+12  -0.68  1.043E+04 /
  nc5h11cho-2+ch3o2  =  c5h10cho3-2+ch3o2h  3.980E+12  0.00  1.705E+04
           rev /  9.812E+11  -0.13  6.764E+03 /
  nc5h11cho-2+ch3o2  =  c5h10cho4-2+ch3o2h  3.980E+12  0.00  1.705E+04
           rev /  9.812E+11  -0.13  6.764E+03 /
  nc5h11cho-2+ch3o2  =  c5h10cho5-2+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.214E+13  -0.52  6.637E+03 /
  nc5h11co-2  =  nc3h7+ch3chco  3.372E+18  -1.46  3.975E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c5h10cho1-2  =  c5h10-1+hco  3.451E+15  -0.80  2.668E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c5h10cho2-2  =  ic3h5cho+c2h5  1.186E+18  -1.36  3.317E+04
           rev /  1.000E+11  0.00  8.300E+03 /
  c5h10cho3-2  =  c5h10-2+hco  4.590E+15  -1.01  2.627E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c5h10cho4-2  =  c3h6+ch3chcho  6.154E+15  -1.06  2.301E+04
           rev /  1.000E+11  0.00  8.300E+03 /
  c5h10cho5-2  =  c2h4+ic3h6cho  1.549E+18  -1.60  3.043E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  ic4h9coch3+oh  =  ic4h9coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.765E+13  -0.70  2.767E+04 /
  ic4h9coch3+oh  =  ic3h6ch2coch3+h2o  1.510E+10  0.97  1.586E+03
           rev /  2.780E+09  0.98  2.100E+04 /
  ic4h9coch3+oh  =  ic3h7chcoch3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  1.703E+13  -0.24  2.864E+04 /
  ic4h9coch3+oh  =  tc3h6ch2coch3+h2o  5.730E+10  0.51  6.300E+01
           rev /  1.778E+08  1.10  2.397E+04 /
  ic4h9coch3+ho2  =  ic4h9coch2+h2o2  2.380E+04  2.55  1.469E+04
           rev /  1.874E+07  1.52  9.702E+03 /
  ic4h9coch3+ho2  =  ic3h6ch2coch3+h2o2  4.760E+04  2.55  1.649E+04
           rev /  5.202E+04  2.23  4.442E+03 /
  ic4h9coch3+ho2  =  ic3h7chcoch3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  2.393E+13  -0.56  6.100E+03 /
  ic4h9coch3+ho2  =  tc3h6ch2coch3+h2o2  2.800E+12  0.00  1.600E+04
           rev /  5.157E+10  0.26  8.442E+03 /
  ic4h9coch3+ch3o2  =  ic4h9coch2+ch3o2h  3.010E+12  0.00  1.758E+04
           rev /  9.740E+15  -1.21  1.187E+04 /
  ic4h9coch3+ch3o2  =  ic3h6ch2coch3+ch3o2h  6.020E+12  0.00  1.938E+04
           rev /  2.703E+13  -0.50  6.612E+03 /
  ic4h9coch3+ch3o2  =  ic3h7chcoch3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  9.832E+14  -0.74  1.193E+04 /
  ic4h9coch3+ch3o2  =  tc3h6ch2coch3+ch3o2h  3.610E+03  2.55  1.053E+04
           rev /  2.732E+02  2.63  2.254E+03 /
  ic4h9coch2  =  ic4h9+ch2co  8.291E+18  -1.52  4.436E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  ic3h6ch2coch3  =  c3h6+ch3coch2  3.606E+17  -1.22  3.035E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  ic3h7chcoch3  =  ic3h5coch3+ch3  2.901E+16  -0.89  3.451E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  tc3h6ch2coch3  =  ic4h8+ch3co  6.148E+17  -1.45  3.178E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  ac6h13+ho2  =  ac6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  7.268E+15  -0.74  2.691E+04 /
  bc6h13+ho2  =  bc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  2.886E+19  -1.64  2.930E+04 /
  cc6h13+ho2  =  cc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.887E+18  -1.37  2.889E+04 /
  dc6h13+ho2  =  dc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.887E+18  -1.37  2.889E+04 /
  ec6h13+ho2  =  ec6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.448E+16  -0.74  2.691E+04 /
  ac6h13+ch3o2  =  ac6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  7.098E+17  -1.32  3.167E+04 /
  bc6h13+ch3o2  =  bc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  2.818E+21  -2.22  3.406E+04 /
  cc6h13+ch3o2  =  cc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.843E+20  -1.94  3.366E+04 /
  dc6h13+ch3o2  =  dc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.843E+20  -1.94  3.366E+04 /
  ec6h13+ch3o2  =  ec6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.414E+18  -1.32  3.167E+04 /
  neoc6h14  =  bc5h11+ch3  1.551E+23  -1.86  8.597E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  neoc6h14  =  tc4h9+c2h5  9.277E+26  -2.81  8.619E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  neoc6h14  =  neoc5h11+ch3  2.145E+19  -0.99  8.662E+04
           rev /  4.000E+12  0.00 -5.960E+02 /
  neoc6h14  =  fc6h13+h  4.449E+19  -1.00  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  neoc6h14  =  gc6h13+h  2.452E+20  -1.35  1.007E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  neoc6h14  =  hc6h13+h  1.485E+19  -1.00  1.032E+05
           rev /  3.610E+13  0.00  0.000E+00 /
  neoc6h14+h  =  fc6h13+h2  9.788E+05  2.77  8.147E+03
           rev /  1.498E+04  2.77  1.242E+04 /
  neoc6h14+h  =  gc6h13+h2  1.300E+06  2.40  4.471E+03
           rev /  3.609E+03  2.75  1.124E+04 /
  neoc6h14+h  =  hc6h13+h2  9.400E+04  2.75  6.280E+03
           rev /  4.308E+03  2.75  1.055E+04 /
  neoc6h14+o  =  fc6h13+oh  4.046E+07  2.03  5.136E+03
           rev /  2.719E+05  2.03  7.313E+03 /
  neoc6h14+o  =  gc6h13+oh  5.946E+05  2.44  2.846E+03
           rev /  7.250E+02  2.79  7.524E+03 /
  neoc6h14+o  =  hc6h13+oh  1.046E+06  2.42  4.766E+03
           rev /  2.106E+04  2.42  6.943E+03 /
  neoc6h14+oh  =  fc6h13+h2o  2.372E+07  1.80  2.981E+02
           rev /  1.572E+06  1.80  1.973E+04 /
  neoc6h14+oh  =  gc6h13+h2o  4.700E+07  1.61 -3.500E+01
           rev /  5.649E+05  1.96  2.189E+04 /
  neoc6h14+oh  =  hc6h13+h2o  5.270E+09  0.97  1.586E+03
           rev /  1.046E+09  0.97  2.101E+04 /
  neoc6h14+ch3  =  fc6h13+ch4  1.356E+00  3.65  7.154E+03
           rev /  5.421E-01  3.65  1.191E+04 /
  neoc6h14+ch3  =  gc6h13+ch4  8.400E+04  2.13  7.574E+03
           rev /  6.092E+03  2.48  1.483E+04 /
  neoc6h14+ch3  =  hc6h13+ch4  4.520E-01  3.65  7.154E+03
           rev /  5.412E-01  3.65  1.191E+04 /
  neoc6h14+ho2  =  fc6h13+h2o2  2.520E+13  0.00  2.044E+04
           rev /  9.912E+12  -0.33  8.407E+03 /
  neoc6h14+ho2  =  gc6h13+h2o2  5.600E+12  0.00  1.769E+04
           rev /  3.996E+11  0.02  8.155E+03 /
  neoc6h14+ho2  =  hc6h13+h2o2  8.400E+12  0.00  2.044E+04
           rev /  9.895E+12  -0.33  8.407E+03 /
  neoc6h14+ch3o  =  fc6h13+ch3oh  4.800E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  neoc6h14+ch3o  =  gc6h13+ch3oh  1.090E+11  0.00  5.000E+03
           rev /  8.900E+09  0.00  7.200E+03 /
  neoc6h14+ch3o  =  hc6h13+ch3oh  1.600E+11  0.00  7.000E+03
           rev /  1.200E+10  0.00  9.200E+03 /
  neoc6h14+o2  =  fc6h13+ho2  6.300E+13  0.00  5.281E+04
           rev /  1.751E+10  0.33 -4.050E+02 /
  neoc6h14+o2  =  gc6h13+ho2  1.400E+13  0.00  5.016E+04
           rev /  7.061E+08  0.68 -5.540E+02 /
  neoc6h14+o2  =  hc6h13+ho2  2.100E+13  0.00  5.281E+04
           rev /  1.748E+10  0.33 -4.050E+02 /
  neoc6h14+c2h5  =  fc6h13+c2h6  1.500E+11  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  neoc6h14+c2h5  =  gc6h13+c2h6  5.000E+10  0.00  1.040E+04
           rev /  1.000E+11  0.00  1.290E+04 /
  neoc6h14+c2h5  =  hc6h13+c2h6  5.000E+10  0.00  1.340E+04
           rev /  3.200E+11  0.00  1.230E+04 /
  neoc6h14+c2h3  =  fc6h13+c2h4  1.500E+12  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  neoc6h14+c2h3  =  gc6h13+c2h4  4.000E+11  0.00  1.680E+04
           rev /  2.000E+12  0.00  2.420E+04 /
  neoc6h14+c2h3  =  hc6h13+c2h4  5.000E+11  0.00  1.800E+04
           rev /  2.600E+12  0.00  2.540E+04 /
  neoc6h14+ch3o2  =  fc6h13+ch3o2h  2.520E+13  0.00  2.044E+04
           rev /  2.064E+13  -0.51  5.387E+03 /
  neoc6h14+ch3o2  =  gc6h13+ch3o2h  5.600E+12  0.00  1.769E+04
           rev /  8.320E+11  -0.15  5.135E+03 /
  neoc6h14+ch3o2  =  hc6h13+ch3o2h  8.400E+12  0.00  2.044E+04
           rev /  2.060E+13  -0.51  5.387E+03 /
  neoc6h14+fc6h13  =  gc6h13+neoc6h14  5.000E+10  0.00  1.040E+04
           rev /  2.250E+11  0.00  1.230E+04 /
  neoc6h14+fc6h13  =  hc6h13+neoc6h14  7.500E+10  0.00  1.230E+04
           rev /  2.250E+11  0.00  1.230E+04 /
  neoc6h14+gc6h13  =  hc6h13+neoc6h14  7.500E+10  0.00  1.230E+04
           rev /  5.000E+10  0.00  1.040E+04 /
  fc6h13o2+neoc6h14  =  fc6h13o2h+fc6h13  1.814E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  gc6h13o2+neoc6h14  =  gc6h13o2h+fc6h13  1.814E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  hc6h13o2+neoc6h14  =  hc6h13o2h+fc6h13  1.814E+13  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  fc6h13o2+neoc6h14  =  fc6h13o2h+gc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  gc6h13o2+neoc6h14  =  gc6h13o2h+gc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  hc6h13o2+neoc6h14  =  hc6h13o2h+gc6h13  4.032E+12  0.00  1.770E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  fc6h13o2+neoc6h14  =  fc6h13o2h+hc6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  gc6h13o2+neoc6h14  =  gc6h13o2h+hc6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  hc6h13o2+neoc6h14  =  hc6h13o2h+hc6h13  6.048E+12  0.00  2.043E+04
           rev /  1.440E+10  0.00  1.500E+04 /
  fc6h13  =  ic4h8+c2h5  1.486E+21  -2.22  3.231E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  gc6h13  =  bc5h10+ch3  1.699E+17  -1.14  3.103E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  gc6h13  =  neoc6h12+h  1.374E+15  -0.55  3.977E+04
           rev /  1.000E+13  0.00  1.200E+03 /
  hc6h13  =  c2h4+tc4h9  3.180E+22  -2.61  2.967E+04
           rev /  1.700E+11  0.00  8.300E+03 /
  hc6h13  =  neoc6h12+h  2.268E+16  -0.90  3.897E+04
           rev /  1.000E+13  0.00  2.900E+03 /
  gc6h13+o2  =  neoc6h12+ho2  4.500E-29  0.00  5.020E+03
           rev /  2.000E-29  0.00  1.750E+04 /
  hc6h13+o2  =  neoc6h12+ho2  3.000E-29  0.00  3.000E+03
           rev /  2.000E-29  0.00  1.750E+04 /
  fc6h13  =  hc6h13  3.000E+11  0.00  2.110E+04
           rev /  9.000E+11  0.00  2.110E+04 /
  neoc6h12+oh  =  neoc6h11+h2o  3.000E+13  0.00  1.230E+03
           rev /  8.663E+12  0.05  1.269E+04 /
  neoc6h12+h  =  neoc6h11+h2  3.700E+13  0.00  3.900E+03
           rev /  2.468E+12  0.05  2.000E+02 /
  neoc6h12+ch3  =  neoc6h11+ch4  1.000E+12  0.00  7.300E+03
           rev /  1.742E+12  0.05  4.080E+03 /
  neoc6h12+o  =  neoc6h11+oh  2.390E+13  -0.05  3.570E+04
           rev /  7.000E+11  0.00  2.990E+04 /
  neoc6h12+oh  =  neoc5h11+ch2o  1.000E+11  0.00 -4.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6h12+o  =  neoc5h11+hco  1.000E+11  0.00 -1.050E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6h11  =  ic4h8+c2h3  4.792E+17  -1.23  2.964E+04
           rev /  7.500E+10  0.00  1.060E+04 /
  neoc6h12  =  ch3+ic5h9  1.000E+16  0.00  7.100E+04
           rev /  1.000E+13  0.00  0.000E+00 /
  fc6h13o2  =  fc6h13+o2  1.232E+20  -1.69  3.576E+04
           rev /  1.240E+12  0.00  0.000E+00 /
  gc6h13o2  =  gc6h13+o2  1.850E+23  -2.36  3.808E+04
           rev /  5.240E+12  0.00  0.000E+00 /
  hc6h13o2  =  hc6h13+o2  4.491E+20  -1.69  3.576E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  fc6h13+fc6h13o2  =  fc6h13o+fc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  8.494E+13  -0.19  2.982E+04 /
  fc6h13+gc6h13o2  =  fc6h13o+gc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  2.588E+13  -0.13  2.945E+04 /
  fc6h13+hc6h13o2  =  fc6h13o+hc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  2.836E+13  -0.19  2.982E+04 /
  gc6h13+fc6h13o2  =  gc6h13o+fc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.193E+15  -0.80  3.177E+04 /
  gc6h13+gc6h13o2  =  gc6h13o+gc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  2.801E+15  -0.73  3.140E+04 /
  gc6h13+hc6h13o2  =  gc6h13o+hc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  3.070E+15  -0.80  3.177E+04 /
  hc6h13+fc6h13o2  =  hc6h13o+fc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  2.836E+13  -0.19  2.982E+04 /
  hc6h13+gc6h13o2  =  hc6h13o+gc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  8.642E+12  -0.13  2.945E+04 /
  hc6h13+hc6h13o2  =  hc6h13o+hc6h13o  7.000E+12  0.00 -1.000E+03
           rev /  9.470E+12  -0.19  2.982E+04 /
  fc6h13o2  =  fc6h12ooh-f  7.500E+10  0.00  2.440E+04
           rev /  2.771E+11  -0.56  9.010E+03 /
  fc6h13o2  =  fc6h12ooh-g  2.500E+10  0.00  2.085E+04
           rev /  2.940E+09  -0.12  7.870E+03 /
  fc6h13o2  =  fc6h12ooh-h  4.688E+09  0.00  2.235E+04
           rev /  1.732E+10  -0.56  6.960E+03 /
  gc6h13o2  =  gc6h12ooh-f  1.125E+11  0.00  2.440E+04
           rev /  1.824E+11  -0.60  9.040E+03 /
  gc6h13o2  =  gc6h12ooh-h  3.000E+11  0.00  2.940E+04
           rev /  1.457E+12  -0.60  1.404E+04 /
  hc6h13o2  =  hc6h12ooh-f  1.406E+10  0.00  2.235E+04
           rev /  1.143E+10  -0.51  6.900E+03 /
  hc6h13o2  =  hc6h12ooh-g  2.000E+11  0.00  2.685E+04
           rev /  1.938E+10  -0.10  1.383E+04 /
!  fc6h13o2+ho2  =  fc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.039E+13  -0.83  3.448E+04 /
  fc6h13o2+ho2  =  fc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  gc6h13o2+ho2  =  gc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.980E+13  -0.85  3.450E+04 /
  gc6h13o2+ho2  =  gc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
!  hc6h13o2+ho2  =  hc6h13o2h+o2  1.750E+10  0.00 -3.275E+03
!           rev /  5.039E+13  -0.83  3.448E+04 /
  hc6h13o2+ho2  =  hc6h13o2h+o2  1.75E+11  0.00 -1.711E+03
  fc6h13o2+h2o2  =  fc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  gc6h13o2+h2o2  =  gc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  hc6h13o2+h2o2  =  hc6h13o2h+ho2  2.400E+12  0.00  1.000E+04
           rev /  2.400E+12  0.00  1.000E+04 /
  fc6h13o2+ch3o2  =  fc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h13o2+ch3o2  =  gc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  hc6h13o2+ch3o2  =  hc6h13o+ch3o+o2  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h13o2+fc6h13o2  =  o2+fc6h13o+fc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h13o2+gc6h13o2  =  o2+fc6h13o+gc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h13o2+hc6h13o2  =  o2+fc6h13o+hc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h13o2+gc6h13o2  =  o2+gc6h13o+gc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h13o2+hc6h13o2  =  o2+gc6h13o+hc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  hc6h13o2+hc6h13o2  =  o2+hc6h13o+hc6h13o  1.400E+16  -1.61  1.860E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h13o2h  =  fc6h13o+oh  1.260E+16  0.00  4.250E+04
           rev /  1.141E+08  1.75 -3.065E+03 /
  gc6h13o2h  =  gc6h13o+oh  9.450E+15  0.00  4.160E+04
           rev /  2.198E+07  1.84 -4.355E+03 /
  hc6h13o2h  =  hc6h13o+oh  1.260E+16  0.00  4.250E+04
           rev /  3.811E+07  1.75 -3.065E+03 /
  fc6h13o  =  ch2o+bc5h11  2.683E+21  -2.31  1.969E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  gc6h13o  =  ch3cho+tc4h9  3.775E+26  -3.61  1.960E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  hc6h13o  =  ch2o+neoc5h11  3.711E+17  -1.43  2.033E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  gc6h12ooh-h  =  neoc6h12+ho2  3.136E+22  -2.83  2.479E+04
           rev /  4.560E+11  0.00  1.346E+04 /
  hc6h12ooh-g  =  neoc6h12+ho2  2.907E+19  -2.02  2.231E+04
           rev /  4.560E+11  0.00  1.346E+04 /
  fc6h12ooh-f  =  f-fc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-g  =  f-gc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-h  =  f-hc6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h12ooh-h  =  g-hc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h12ooh-f  =  f-gc6h12o+oh  7.500E+10  0.00  1.525E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  hc6h12ooh-g  =  g-hc6h12o+oh  6.000E+11  0.00  2.200E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  hc6h12ooh-f  =  f-hc6h12o+oh  9.375E+09  0.00  7.000E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-f  =  oh+ch2o+ac5h10  4.948E+17  -1.15  2.843E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-g  =  oh+ch2o+bc5h10  6.788E+16  -0.99  2.807E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  gc6h12ooh-f  =  oh+ch3cho+ic4h8  4.754E+21  -2.37  2.781E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-h  =  ic4h8+c2h4+ho2  1.405E+22  -3.12  2.585E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h12ooh-fo2  =  fc6h12ooh-f+o2  5.741E+19  -1.58  3.565E+04
           rev /  1.240E+12  0.00  0.000E+00 /
  fc6h12ooh-go2  =  fc6h12ooh-g+o2  5.752E+22  -2.29  3.801E+04
           rev /  5.240E+12  0.00  0.000E+00 /
  fc6h12ooh-ho2  =  fc6h12ooh-h+o2  2.093E+20  -1.58  3.565E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  gc6h12ooh-fo2  =  gc6h12ooh-f+o2  1.533E+19  -1.50  3.557E+04
           rev /  1.240E+12  0.00  0.000E+00 /
  gc6h12ooh-ho2  =  gc6h12ooh-h+o2  5.584E+19  -1.50  3.557E+04
           rev /  4.520E+12  0.00  0.000E+00 /
  hc6h12ooh-fo2  =  hc6h12ooh-f+o2  8.708E+19  -1.64  3.571E+04
           rev /  1.240E+12  0.00  0.000E+00 /
  hc6h12ooh-go2  =  hc6h12ooh-g+o2  6.982E+22  -2.31  3.805E+04
           rev /  5.240E+12  0.00  0.000E+00 /
  fc6h12ooh-fo2  =  neoc6ketff+oh  2.500E+10  0.00  2.140E+04
           rev /  5.004E+03  1.26  4.370E+04 /
  fc6h12ooh-go2  =  neoc6ketfg+oh  2.500E+10  0.00  2.140E+04
           rev /  1.571E+04  1.20  4.376E+04 /
  fc6h12ooh-ho2  =  neoc6ketfh+oh  3.125E+09  0.00  1.935E+04
           rev /  1.247E+03  1.26  4.165E+04 /
  gc6h12ooh-fo2  =  neoc6ketgf+oh  1.250E+10  0.00  1.785E+04
           rev /  6.462E+02  1.63  4.287E+04 /
  gc6h12ooh-ho2  =  neoc6ketgh+oh  1.000E+11  0.00  2.385E+04
           rev /  2.255E+03  1.63  4.898E+04 /
  hc6h12ooh-fo2  =  neoc6kethf+oh  3.125E+09  0.00  1.935E+04
           rev /  7.799E+02  1.32  4.264E+04 /
  hc6h12ooh-go2  =  neoc6kethg+oh  2.000E+11  0.00  2.640E+04
           rev /  1.325E+05  1.16  4.887E+04 /
  f-fc6h12o+oh  =  ic5h10cho-ba+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-gc6h12o+oh  =  ic5h10cho-bc+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-hc6h12o+oh  =  tc4h8ch2cho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  g-hc6h12o+oh  =  tc4h9chcho+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-fc6h12o+oh  =  ic5h9+ch2o+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-gc6h12o+oh  =  tc4h8coch3+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-hc6h12o+oh  =  ic5h10cho-bd+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  g-hc6h12o+oh  =  tc4h9coch2+h2o  2.500E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  f-fc6h12o+ho2  =  ic5h10cho-ba+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  f-gc6h12o+ho2  =  ic5h10cho-bc+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  f-hc6h12o+ho2  =  tc4h8ch2cho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  g-hc6h12o+ho2  =  tc4h9chcho+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  f-fc6h12o+ho2  =  ic5h9+ch2o+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  f-gc6h12o+ho2  =  tc4h8coch3+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  f-hc6h12o+ho2  =  ic5h10cho-bd+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  g-hc6h12o+ho2  =  tc4h9coch2+h2o2  5.000E+12  0.00  1.770E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6ketff  =  ch2o+c4h8cho2-2+oh  1.500E+16  0.00  4.250E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6ketfg  =  ch3cho+tc3h6cho+oh  9.450E+15  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6ketfh  =  ch2o+tc4h8cho+oh  1.500E+16  0.00  4.250E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6ketgf  =  ch2o+tc3h6coch3+oh  1.500E+16  0.00  4.250E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6ketgh  =  ch2o+tc4h9co+oh  1.500E+16  0.00  4.250E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6kethf  =  ch2o+tc3h6ch2cho+oh  1.500E+16  0.00  4.250E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6kethg  =  tc4h9cho+hco+oh  9.450E+15  0.00  4.160E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  neoc6h14+o2cho  =  fc6h13+ho2cho  2.520E+13  0.00  2.044E+04
           rev /  5.657E+02  2.30  3.057E+03 /
  neoc6h14+o2cho  =  gc6h13+ho2cho  5.600E+12  0.00  1.769E+04
           rev /  2.280E+01  2.65  2.809E+03 /
  neoc6h14+o2cho  =  hc6h13+ho2cho  8.400E+12  0.00  2.044E+04
           rev /  5.647E+02  2.30  3.057E+03 /
  tc4h9cho+ho2  =  tc4h9co+h2o2  1.000E+12  0.00  1.192E+04
           rev /  3.852E+12  -0.33  1.200E+04 /
  tc4h9cho+ch3  =  tc4h9co+ch4  3.980E+12  0.00  8.700E+03
           rev /  1.558E+13  0.00  2.557E+04 /
  tc4h9cho+o  =  tc4h9co+oh  7.180E+12  0.00  1.389E+03
           rev /  4.726E+11  0.00  1.568E+04 /
  tc4h9cho+o2  =  tc4h9co+ho2  4.000E+13  0.00  3.760E+04
           rev /  1.089E+11  0.32 -3.492E+03 /
  tc4h9cho+oh  =  tc4h9co+h2o  2.690E+10  0.76 -3.400E+02
           rev /  1.746E+10  0.76  3.121E+04 /
  tc4h9co  =  tc4h9+co  2.055E+21  -2.30  1.118E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  tc4h9cho+oh  =  tc4h8cho+h2o  2.290E+08  1.53  7.750E+02
           rev /  7.775E+06  1.52  2.021E+04 /
  tc4h9cho+h  =  tc4h8cho+h2  1.810E+06  2.54  6.756E+03
           rev /  1.419E+04  2.53  1.104E+04 /
  tc4h9cho+ho2  =  tc4h8cho+h2o2  3.010E+04  2.55  1.550E+04
           rev /  6.067E+03  2.22  3.472E+03 /
  tc4h9cho+ch3  =  tc4h8cho+ch4  1.360E+00  3.65  7.154E+03
           rev /  2.786E-01  3.64  1.191E+04 /
  tc4h9cho+ch3o  =  tc4h8cho+ch3oh  4.820E+11  0.00  7.313E+03
           rev /  1.822E+09  0.02  9.863E+03 /
  tc4h9cho+ch3o2  =  tc4h8cho+ch3o2h  3.010E+04  2.55  1.550E+04
           rev /  2.493E+04  2.04  2.752E+03 /
  neoc5h11cho+oh  =  neoc5h11co+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.076E+12  0.00  3.092E+04 /
  neoc5h11cho+oh  =  tc4h9chcho+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.249E+09  1.34  2.887E+04 /
  neoc5h11cho+oh  =  tc4h8ch2cho+h2o  1.290E+10  1.05  1.810E+03
           rev /  2.470E+09  1.05  2.124E+04 /
  neoc5h11cho+ho2  =  neoc5h11co+h2o2  2.800E+12  0.00  1.360E+04
           rev /  1.024E+13  -0.33  1.367E+04 /
  neoc5h11cho+ho2  =  tc4h9chcho+h2o2  8.000E+10  0.00  1.192E+04
           rev /  1.270E+13  -0.60  9.362E+03 /
  neoc5h11cho+ho2  =  tc4h8ch2cho+h2o2  1.680E+13  0.00  1.940E+04
           rev /  1.909E+13  -0.33  7.362E+03 /
  neoc5h11cho+ch3o2  =  neoc5h11co+ch3o2h  1.000E+12  0.00  9.500E+03
           rev /  1.503E+13  -0.50  8.852E+03 /
  neoc5h11cho+ch3o2  =  tc4h9chcho+ch3o2h  8.000E+10  0.00  1.192E+04
           rev /  5.220E+13  -0.78  8.642E+03 /
  neoc5h11cho+ch3o2  =  tc4h8ch2cho+ch3o2h  1.680E+13  0.00  1.940E+04
           rev /  7.846E+13  -0.50  6.642E+03 /
  neoc5h11co  =  neoc5h11+co  2.433E+17  -1.27  1.344E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  neoc5h11co  =  tc4h9+ch2co  3.657E+16  -1.03  3.487E+04
           rev /  1.000E+11  0.00  9.200E+03 /
  tc4h9chcho  =  ic3h6chcho+ch3  2.285E+17  -1.08  3.177E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  tc4h8ch2cho  =  ic4h8+ch2cho  6.610E+19  -2.20  2.809E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  tc4h8ch2cho  =  ic4h7cho+ch3  1.673E+17  -1.17  3.451E+04
           rev /  1.000E+11  0.00  1.260E+04 /
  ic4h7cho+oh  =  ic4h7co+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.186E+12  -0.01  3.093E+04 /
  ic4h7cho+oh  =  ac3h4ch2cho+h2o  3.120E+06  2.00 -2.980E+02
           rev /  3.621E+08  1.44  3.240E+04 /
  ic4h7cho+oh  =  ic3h5chcho+h2o  4.240E+06  2.00 -2.980E+02
           rev /  1.591E+08  1.79  3.491E+04 /
  ic4h7cho+ho2  =  ic4h7co+h2o2  3.000E+12  0.00  1.192E+04
           rev /  1.155E+13  -0.33  1.200E+04 /
  ic4h7cho+ho2  =  ac3h4ch2cho+h2o2  9.640E+03  2.60  1.391E+04
           rev /  6.642E+06  1.72  1.514E+04 /
  ic4h7cho+ho2  =  ic3h5chcho+h2o2  9.640E+03  2.60  1.251E+04
           rev /  2.148E+06  2.07  1.626E+04 /
  ic4h7cho+ch3o2  =  ic4h7co+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  2.245E+13  -0.51  1.066E+04 /
  ic4h7cho+ch3o2  =  ac3h4ch2cho+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  5.634E+15  -1.06  1.756E+04 /
  ic4h7cho+ch3o2  =  ic3h5chcho+ch3o2h  1.990E+12  0.00  1.595E+04
           rev /  1.822E+15  -0.71  1.898E+04 /
  ic4h7co  =  ic4h7+co  1.109E+17  -1.30  1.223E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic4h7co  =  c3h5-t+ch2co  1.814E+16  -0.96  4.726E+04
           rev /  1.000E+11  0.00  8.600E+03 /
  ac3h4ch2cho  =  c3h4-a+ch2cho  4.132E+20  -2.36  5.247E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic3h5chcho+ho2  =  ic3h5cho+hco+oh  8.910E+12  0.00  0.000E+00
!rev /  0.000E+00  0.00  0.000E+00 /
  ic5h11cho-b+oh  =  ic5h11co-b+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.185E+12  0.00  3.093E+04 /
  ic5h11cho-b+oh  =  ic5h10cho-ba+h2o  1.530E+08  1.53  8.775E+03
           rev /  2.691E+07  1.54  2.819E+04 /
  ic5h11cho-b+oh  =  ic5h10cho-bc+h2o  4.670E+07  1.61 -3.500E+01
           rev /  3.872E+05  2.01  2.184E+04 /
  ic5h11cho-b+oh  =  ic5h10cho-bd+h2o  5.270E+09  0.97  1.586E+03
           rev /  9.268E+08  0.98  2.100E+04 /
  ic5h11cho-b+ho2  =  ic5h11co-b+h2o2  1.000E+12  0.00  1.192E+04
           rev /  3.849E+12  -0.33  1.200E+04 /
  ic5h11cho-b+ho2  =  ic5h10cho-ba+h2o2  5.520E+04  2.55  1.648E+04
           rev /  5.763E+04  2.24  4.432E+03 /
  ic5h11cho-b+ho2  =  ic5h10cho-bc+h2o2  2.475E+04  2.60  1.391E+04
           rev /  1.218E+03  2.67  4.322E+03 /
  ic5h11cho-b+ho2  =  ic5h10cho-bd+h2o2  2.760E+04  2.55  1.648E+04
           rev /  2.881E+04  2.24  4.432E+03 /
  ic5h11cho-b+ch3o2  =  ic5h11co-b+ch3o2h  1.000E+12  0.00  1.192E+04
           rev /  1.582E+13  -0.51  1.128E+04 /
  ic5h11cho-b+ch3o2  =  ic5h10cho-ba+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  2.042E+05  2.06  3.726E+03 /
  ic5h11cho-b+ch3o2  =  ic5h10cho-bc+ch3o2h  1.770E+12  0.00  1.705E+04
           rev /  3.580E+11  -0.10  6.744E+03 /
  ic5h11cho-b+ch3o2  =  ic5h10cho-bd+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  2.587E+13  -0.49  6.607E+03 /
  ic5h11co-b  =  bc5h11+co  1.038E+18  -1.36  9.078E+03
           rev /  1.500E+11  0.00  4.810E+03 /
  ic5h11co-b  =  ic3h6co+c2h5  1.764E+20  -1.78  3.822E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic5h10cho-ba  =  ac5h10+hco  5.476E+18  -1.64  2.560E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic5h10cho-ba  =  ic3h5cho+c2h5  1.552E+19  -1.68  2.662E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic5h10cho-ba  =  c4h7cho1-2+ch3  1.953E+15  -0.74  2.581E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic5h10cho-bc  =  bc5h10+hco  7.371E+17  -1.50  2.570E+04
           rev /  1.000E+11  0.00  1.120E+04 /
  ic5h10cho-bc  =  c4h7cho2-2+ch3  1.133E+16  0.36  2.130E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic5h10cho-bd  =  tc3h6cho+c2h4  5.814E+18  -1.85  2.489E+04
           rev /  2.500E+11  0.00  1.120E+04 /
  c4h7cho1-2+oh  =  c4h7co1-2+h2o  3.370E+12  0.00 -6.160E+02
           rev /  5.828E+12  0.01  3.681E+04 /
  c4h7cho1-2+oh  =  c4h6cho1-23+h2o  3.615E+07  1.64 -2.470E+02
           rev /  1.511E+09  1.42  3.498E+04 /
  c4h7cho1-2+oh  =  c4h6cho1-24+h2o  2.065E+07  1.73  7.530E+02
           rev /  4.305E+06  1.72  2.019E+04 /
  c4h7cho1-2+ho2  =  c4h7co1-2+h2o2  1.000E+12  0.00  1.192E+04
           rev /  1.027E+13  -0.31  1.788E+04 /
  c4h7cho1-2+ho2  =  c4h6cho1-23+h2o2  5.600E+12  0.00  1.770E+04
           rev /  1.389E+15  -0.55  2.146E+04 /
  c4h7cho1-2+ho2  =  c4h6cho1-24+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.946E+04  2.21  4.462E+03 /
  c4h7cho1-2+ch3o2  =  c4h7co1-2+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  1.181E+14  -0.49  1.884E+04 /
  c4h7cho1-2+ch3o2  =  c4h6cho1-23+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  2.029E+15  -0.72  2.009E+04 /
  c4h7cho1-2+ch3o2  =  c4h6cho1-24+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.531E+13  -0.51  6.627E+03 /
  c4h7co1-2  =  c4h7+co  1.151E+13  -0.22  1.398E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  c4h6cho1-23  =  ch2cchch3+hco  8.677E+15  -0.45  5.504E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  c4h6cho1-24  =  c2h4+ch2ccho  6.403E+18  -1.70  4.109E+04
           rev /  2.500E+11  0.00  8.600E+03 /
  c4h7cho2-2+oh  =  c4h7co2-2+h2o  3.370E+12  0.00 -6.160E+02
           rev /  5.586E+12  0.02  3.680E+04 /
  c4h7cho2-2+oh  =  c4h6cho2-21+h2o  8.420E+11  0.00 -7.810E+02
           rev /  1.779E+14  -0.64  3.198E+04 /
  c4h7cho2-2+oh  =  c4h6cho2-24+h2o  8.420E+11  0.00 -7.810E+02
           rev /  1.779E+14  -0.64  3.198E+04 /
  c4h7cho2-2+oh  =  ch3cho+ch3chcho  1.000E+11  0.00  0.000E+00
           rev /  8.906E+07  2.14  1.348E+04 /
  c4h7cho2-2+ho2  =  c4h7co2-2+h2o2  1.000E+12  0.00  1.192E+04
           rev /  9.840E+12  -0.31  1.788E+04 /
  c4h7cho2-2+ho2  =  c4h6cho2-21+h2o2  1.000E+04  2.55  1.550E+04
           rev /  1.254E+07  1.58  1.680E+04 /
  c4h7cho2-2+ho2  =  c4h6cho2-24+h2o2  1.000E+04  2.55  1.550E+04
           rev /  1.254E+07  1.58  1.680E+04 /
  c4h7cho2-2+ho2  =  ch3cho+c2h3cho+oh  6.030E+09  0.00  7.949E+03
           rev /  1.000E+00  0.00  0.000E+00 /
  c4h7cho2-2+ch3o2  =  c4h7co2-2+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  1.132E+14  -0.48  1.884E+04 /
  c4h7cho2-2+ch3o2  =  c4h6cho2-21+ch3o2h  2.380E+04  2.55  1.649E+04
           rev /  1.226E+08  1.40  1.707E+04 /
  c4h7cho2-2+ch3o2  =  c4h6cho2-24+ch3o2h  2.380E+04  2.55  1.649E+04
           rev /  1.226E+08  1.40  1.707E+04 /
  c4h7cho2-2+ch3o2  =  ch3cho+ch3chco+ch3o  3.970E+11  0.00  1.705E+04
           rev /  1.000E+00  0.00  0.000E+00 /
  c4h7co2-2  =  c4h7+co  8.971E+10  -0.92  2.095E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  c4h6cho2-21  =  ch2cchch3+hco  4.000E+14  0.00  1.330E+04
           rev /  3.480E+10  0.59  1.382E+04 /
  c4h6cho2-24  =  ch2cchch3+hco  2.852E+14  -1.58  6.054E+04
           rev /  8.000E+10  0.00  1.160E+04 /
  tc4h9coch3+oh  =  tc4h9coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.148E+13  -0.69  2.766E+04 /
  tc4h9coch3+oh  =  tc4h8coch3+h2o  2.290E+08  1.53  7.750E+02
           rev /  4.685E+07  1.52  2.021E+04 /
  tc4h9coch3+ho2  =  tc4h9coch2+h2o2  2.380E+04  2.55  1.550E+04
           rev /  1.703E+07  1.53  1.050E+04 /
  tc4h9coch3+ho2  =  tc4h8coch3+h2o2  3.010E+04  2.55  1.550E+04
           rev /  3.655E+04  2.22  3.472E+03 /
  tc4h9coch3+ch3o2  =  tc4h9coch2+ch3o2h  3.010E+13  0.00  1.758E+04
           rev /  8.851E+16  -1.19  1.186E+04 /
  tc4h9coch3+ch3o2  =  tc4h8coch3+ch3o2h  3.010E+04  2.55  1.550E+04
           rev /  1.502E+05  2.04  2.752E+03 /
  tc4h9coch2  =  tc4h9+ch2co  1.519E+19  -1.74  3.677E+04
           rev /  8.000E+10  0.00  9.600E+03 /
  tc4h8coch3  =  ic4h8+ch3co  1.384E+22  -2.63  2.745E+04
           rev /  8.000E+10  0.00  1.060E+04 /
  ch2ccho+oh  =  ch3co+hco  1.000E+12  0.00  0.000E+00
           rev /  1.255E+10  0.50  3.931E+04 /
  ch2ccho+ho2  =  ch2co+hco+oh  6.030E+09  0.00  7.949E+03
!rev /  0.000E+00  0.00  0.000E+00 /
  ch2ccho+ch3o2  =  ch2co+hco+ch3o  3.970E+11  0.00  1.705E+04
!rev /  0.000E+00  0.00  0.000E+00 /
  fc6h13+ho2  =  fc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.814E+16  -0.77  2.695E+04 /
  gc6h13+ho2  =  gc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  1.964E+18  -1.37  2.889E+04 /
  hc6h13+ho2  =  hc6h13o+oh  7.000E+12  0.00 -1.000E+03
           rev /  6.058E+15  -0.77  2.695E+04 /
  fc6h13+ch3o2  =  fc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.772E+18  -1.35  3.171E+04 /
  gc6h13+ch3o2  =  gc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  1.918E+20  -1.95  3.366E+04 /
  hc6h13+ch3o2  =  hc6h13o+ch3o  7.000E+12  0.00 -1.000E+03
           rev /  5.917E+17  -1.35  3.171E+04 /
  ic6h13cho-b+oh  =  ic6h13co-b+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.572E+12  -0.03  3.095E+04 /
  ic6h13cho-b+oh  =  ac6h12cho-b+h2o  1.530E+08  1.53  8.775E+03
           rev /  3.174E+07  1.52  2.821E+04 /
  ic6h13cho-b+oh  =  cc6h12cho-b+h2o  4.670E+07  1.61 -3.500E+01
           rev /  4.905E+05  1.98  2.186E+04 /
  ic6h13cho-b+oh  =  dc6h12cho-b+h2o  4.670E+07  1.61 -3.500E+01
           rev /  4.905E+05  1.98  2.186E+04 /
  ic6h13cho-b+oh  =  ec6h12cho-b+h2o  5.270E+09  0.97  1.586E+03
           rev /  1.093E+09  0.96  2.102E+04 /
  ic6h13cho-b+ho2  =  ic6h13co-b+h2o2  1.000E+12  0.00  1.192E+04
           rev /  4.531E+12  -0.36  1.202E+04 /
  ic6h13cho-b+ho2  =  ac6h12cho-b+h2o2  5.520E+04  2.55  1.648E+04
           rev /  6.797E+04  2.21  4.452E+03 /
  ic6h13cho-b+ho2  =  cc6h12cho-b+h2o2  2.475E+04  2.60  1.391E+04
           rev /  1.543E+03  2.64  4.342E+03 /
  ic6h13cho-b+ho2  =  dc6h12cho-b+h2o2  2.475E+04  2.60  1.391E+04
           rev /  1.543E+03  2.64  4.342E+03 /
  ic6h13cho-b+ho2  =  ec6h12cho-b+h2o2  2.760E+04  2.55  1.648E+04
           rev /  3.398E+04  2.21  4.452E+03 /
  ic6h13cho-b+ch3o2  =  ic6h13co-b+ch3o2h  1.000E+12  0.00  1.192E+04
           rev /  1.862E+13  -0.53  1.130E+04 /
  ic6h13cho-b+ch3o2  =  ac6h12cho-b+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  2.408E+05  2.04  3.746E+03 /
  ic6h13cho-b+ch3o2  =  cc6h12cho-b+ch3o2h  1.770E+12  0.00  1.705E+04
           rev /  4.535E+11  -0.14  6.764E+03 /
  ic6h13cho-b+ch3o2  =  dc6h12cho-b+ch3o2h  1.770E+12  0.00  1.705E+04
           rev /  4.535E+11  -0.14  6.764E+03 /
  ic6h13cho-b+ch3o2  =  ec6h12cho-b+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.051E+13  -0.51  6.627E+03 /
  ic6h13co-b  =  bc6h13+co  1.164E+21  -2.32  1.100E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic6h13co-b  =  ic3h6co+nc3h7  5.078E+20  -1.91  3.872E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ac6h12cho-b  =  ac6h12+hco  9.365E+18  -1.66  1.983E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ac6h12cho-b  =  ic3h5cho+nc3h7  4.476E+19  -1.81  2.712E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  cc6h12cho-b  =  bc6h12+hco  6.473E+17  -1.46  2.521E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  dc6h12cho-b  =  c3h6+tc3h6cho  2.730E+17  -1.45  2.102E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  ec6h12cho-b  =  c2h4+tc4h8cho  5.062E+18  -1.57  3.041E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  ic6h13cho-d+oh  =  ic6h13co-d+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.179E+12  0.00  3.092E+04 /
  ic6h13cho-d+oh  =  ac6h12cho-d+h2o  1.530E+08  1.53  8.775E+03
           rev /  3.141E+07  1.52  2.821E+04 /
  ic6h13cho-d+oh  =  bc6h12cho-d+h2o  1.684E+12  0.00 -7.810E+02
           rev /  5.982E+09  0.57  2.314E+04 /
  ic6h13cho-d+oh  =  cc6h12cho-d+h2o  3.615E+07  1.64 -2.470E+02
           rev /  2.545E+05  2.06  2.159E+04 /
  ic6h13cho-d+oh  =  dc6h12cho-d+h2o  1.684E+12  0.00 -7.810E+02
           rev /  1.091E+13  -0.17  2.991E+04 /
  ic6h13cho-d+oh  =  ec6h12cho-d+h2o  5.270E+09  0.97  1.586E+03
           rev /  1.082E+09  0.96  2.102E+04 /
  ic6h13cho-d+ho2  =  ic6h13co-d+h2o2  3.000E+12  0.00  1.192E+04
           rev /  1.152E+13  -0.33  1.200E+04 /
  ic6h13cho-d+ho2  =  ac6h12cho-d+h2o2  4.760E+04  2.55  1.649E+04
           rev /  5.801E+04  2.21  4.466E+03 /
  ic6h13cho-d+ho2  =  bc6h12cho-d+h2o2  8.000E+10  0.00  1.192E+04
           rev /  1.687E+09  0.24  4.382E+03 /
  ic6h13cho-d+ho2  =  cc6h12cho-d+h2o2  5.600E+12  0.00  1.770E+04
           rev /  2.340E+11  0.09  8.072E+03 /
  ic6h13cho-d+ho2  =  dc6h12cho-d+h2o2  8.000E+10  0.00  1.192E+04
           rev /  3.075E+12  -0.50  1.115E+04 /
  ic6h13cho-d+ho2  =  ec6h12cho-d+h2o2  2.760E+04  2.55  1.648E+04
           rev /  3.363E+04  2.21  4.452E+03 /
  ic6h13cho-d+ch3o2  =  ic6h13co-d+ch3o2h  2.800E+12  0.00  1.360E+04
           rev /  4.417E+13  -0.51  1.295E+04 /
  ic6h13cho-d+ch3o2  =  ac6h12cho-d+ch3o2h  4.760E+04  2.55  1.649E+04
           rev /  2.384E+05  2.04  3.746E+03 /
  ic6h13cho-d+ch3o2  =  bc6h12cho-d+ch3o2h  3.610E+03  2.55  1.053E+04
           rev /  3.128E+02  2.62  2.274E+03 /
  ic6h13cho-d+ch3o2  =  cc6h12cho-d+ch3o2h  9.640E+03  2.60  1.391E+04
           rev /  1.655E+03  2.52  3.562E+03 /
  ic6h13cho-d+ch3o2  =  dc6h12cho-d+ch3o2h  3.610E+03  2.55  1.003E+04
           rev /  5.703E+05  1.88  8.544E+03 /
  ic6h13cho-d+ch3o2  =  ec6h12cho-d+ch3o2h  6.030E+12  0.00  1.938E+04
           rev /  3.020E+13  -0.51  6.627E+03 /
  ic6h13co-d  =  dc6h13+co  3.730E+18  -1.63  1.284E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  ic6h13co-d  =  ch3chco+ic4h9  3.828E+19  -1.64  3.974E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ac6h12cho-d  =  c3h6+ic3h6cho  8.430E+18  -1.63  3.260E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  bc6h12cho-d  =  ic4h8+ch3chcho  1.969E+17  -1.50  2.396E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  cc6h12cho-d  =  cc6h12+hco  2.806E+15  -0.94  2.646E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  dc6h12cho-d  =  ic3h5cho+ic3h7  7.829E+15  -0.60  3.151E+04
           rev /  1.000E+11  0.00  8.300E+03 /
  ec6h12cho-d  =  dc6h12+hco  3.838E+16  -1.19  2.666E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic3h7coc3h7-i+oh  =  ic3h7coc3h6-i+h2o  3.060E+08  1.53  8.775E+03
           rev /  3.078E+07  1.53  2.821E+04 /
  ic3h7coc3h7-i+oh  =  ic3h7coc3h6-t+h2o  3.368E+12  0.00 -7.810E+02
           rev /  1.156E+13  -0.08  2.983E+04 /
  ic3h7coc3h7-i+ho2  =  ic3h7coc3h6-i+h2o2  5.480E+04  2.55  1.550E+04
           rev /  3.272E+04  2.22  3.472E+03 /
  ic3h7coc3h7-i+ho2  =  ic3h7coc3h6-t+h2o2  1.600E+11  0.00  1.192E+04
           rev /  3.260E+12  -0.41  1.107E+04 /
  ic3h7coc3h7-i+ch3o2  =  ic3h7coc3h6-i+ch3o2h  4.000E+04  2.55  1.550E+04
           rev /  9.814E+04  2.04  2.752E+03 /
  ic3h7coc3h7-i+ch3o2  =  ic3h7coc3h6-t+ch3o2h  7.220E+03  2.55  8.032E+03
           rev /  6.045E+05  1.97  6.464E+03 /
  ic3h7coc3h6-i  =  c3h6+ic3h7co  1.859E+19  -1.67  2.805E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic3h7coc3h6-t  =  ic3h6co+ic3h7  1.217E+17  -0.63  4.205E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  tc4h9coc2h5+oh  =  tc4h8coc2h5+h2o  2.290E+08  1.53  7.750E+02
           rev /  4.716E+07  1.52  2.021E+04 /
  tc4h9coc2h5+oh  =  tc4h9coc2h4p+h2o  5.720E+09  0.97  1.586E+03
           rev /  1.178E+09  0.96  2.102E+04 /
  tc4h9coc2h5+oh  =  tc4h9coc2h4s+h2o  8.950E+11  0.00 -2.280E+02
           rev /  1.587E+13  -0.22  2.862E+04 /
  tc4h9coc2h5+ho2  =  tc4h8coc2h5+h2o2  3.010E+04  2.55  1.550E+04
           rev /  3.679E+04  2.21  3.472E+03 /
  tc4h9coc2h5+ho2  =  tc4h9coc2h4p+h2o2  2.380E+04  2.55  1.649E+04
           rev /  2.909E+04  2.21  4.462E+03 /
  tc4h9coc2h5+ho2  =  tc4h9coc2h4s+h2o2  2.000E+11  0.00  8.698E+03
           rev /  2.106E+13  -0.55  6.080E+03 /
  tc4h9coc2h5+ch3o2  =  tc4h8coc2h5+ch3o2h  3.010E+04  2.55  1.550E+04
           rev /  1.512E+05  2.04  2.752E+03 /
  tc4h9coc2h5+ch3o2  =  tc4h9coc2h4p+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.512E+13  -0.51  6.632E+03 /
  tc4h9coc2h5+ch3o2  =  tc4h9coc2h4s+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  8.653E+14  -0.72  1.191E+04 /
  tc4h8coc2h5  =  ic4h8+c2h5co  2.900E+22  -2.70  2.753E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  tc4h8coc2h5  =  ic3h5coc2h5+ch3  2.726E+16  -1.08  2.811E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  tc4h9coc2h4p  =  c2h4+tc4h9co  2.701E+17  -1.51  2.611E+04
           rev /  2.500E+11  0.00  7.800E+03 /
  tc4h9coc2h4s  =  ch3chco+tc4h9  4.600E+20  -1.89  3.825E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  neoc5h11coch3+oh  =  neoc5h11coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  1.077E+11  -0.01  2.063E+04 /
  neoc5h11coch3+oh  =  neoc5h10coch3+h2o  2.290E+08  1.53  7.750E+02
           rev /  4.838E+07  1.52  2.021E+04 /
  neoc5h11coch3+oh  =  tc4h9chcoch3+h2o  8.950E+11  0.00 -2.280E+02
           rev /  1.823E+13  -0.24  2.864E+04 /
  neoc5h11coch3+ho2  =  tc4h9chcoch3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  2.419E+13  -0.56  6.100E+03 /
  neoc5h11coch3+ho2  =  neoc5h11coch2+h2o2  2.380E+04  2.55  1.550E+04
           rev /  2.985E+04  2.21  3.472E+03 /
  neoc5h11coch3+ho2  =  neoc5h10coch3+h2o2  3.010E+04  2.55  1.550E+04
           rev /  3.775E+04  2.21  3.472E+03 /
  neoc5h11coch3+ch3o2  =  neoc5h11coch2+ch3o2h  3.010E+13  0.00  1.758E+04
           rev /  1.551E+14  -0.51  4.832E+03 /
  neoc5h11coch3+ch3o2  =  neoc5h10coch3+ch3o2h  3.010E+04  2.55  1.550E+04
           rev /  1.551E+05  2.04  2.752E+03 /
  neoc5h11coch3+ch3o2  =  tc4h9chcoch3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  9.939E+14  -0.74  1.193E+04 /
  neoc5h11coch2  =  ch2co+neoc5h11  7.583E+16  -1.10  3.671E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  neoc5h10coch3  =  ic4h8+ch3coch2  1.270E+21  -2.31  2.858E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  neoc5h10coch3  =  ic4h7coch3+ch3  2.331E+17  -1.22  3.256E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  tc4h9chcoch3  =  ic3h6chcoch3+ch3  1.896E+18  -1.33  3.413E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  neoc6h13cho+oh  =  neoc6h13co+h2o  3.370E+12  0.00 -6.160E+02
           rev /  2.399E+12  -0.02  3.094E+04 /
  neoc6h13cho+oh  =  gc6h12cho+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.200E+06  1.85  2.199E+04 /
  neoc6h13cho+oh  =  hc6h12cho+h2o  4.670E+07  1.61 -3.500E+01
           rev /  1.174E+09  1.34  2.887E+04 /
  neoc6h13cho+oh  =  fc6h12cho+h2o  1.290E+10  1.05  1.810E+03
           rev /  2.531E+09  1.05  2.125E+04 /
  neoc6h13cho+ho2  =  neoc6h13co+h2o2  2.800E+12  0.00  1.360E+04
           rev /  1.183E+13  -0.35  1.369E+04 /
  neoc6h13cho+ho2  =  gc6h12cho+h2o2  1.475E+04  2.60  1.391E+04
           rev /  2.250E+03  2.52  4.472E+03 /
  neoc6h13cho+ho2  =  hc6h12cho+h2o2  8.000E+10  0.00  1.192E+04
           rev /  1.194E+13  -0.59  9.362E+03 /
  neoc6h13cho+ho2  =  fc6h12cho+h2o2  1.680E+13  0.00  1.940E+04
           rev /  1.956E+13  -0.33  7.372E+03 /
  neoc6h13cho+ch3o2  =  neoc6h13co+ch3o2h  1.000E+12  0.00  9.500E+03
           rev /  1.737E+13  -0.52  8.872E+03 /
  neoc6h13cho+ch3o2  =  gc6h12cho+ch3o2h  1.990E+12  0.00  1.705E+04
           rev /  1.247E+12  -0.26  6.894E+03 /
  neoc6h13cho+ch3o2  =  hc6h12cho+ch3o2h  8.000E+10  0.00  1.192E+04
           rev /  4.905E+13  -0.77  8.642E+03 /
  neoc6h13cho+ch3o2  =  fc6h12cho+ch3o2h  1.680E+13  0.00  1.940E+04
           rev /  8.039E+13  -0.51  6.652E+03 /
  neoc6h13co  =  hc6h13+co  1.820E+16  -1.19  1.337E+04
           rev /  1.500E+11  0.00  4.810E+03 /
  neoc6h13co  =  neoc5h11+ch2co  2.040E+17  -1.18  3.720E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  gc6h12cho  =  neoc6h12+hco  3.453E+14  -0.83  2.546E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  hc6h12cho  =  c2h3cho+tc4h9  6.884E+19  -1.76  2.769E+04
           rev /  1.000E+11  0.00  7.800E+03 /
  fc6h12cho  =  ic4h8+ch2ch2cho  8.235E+22  -2.67  3.277E+04
           rev /  1.000E+11  0.00  1.060E+04 /
  ic4h7coch3+oh  =  ic4h7coch2+h2o  5.100E+11  0.00  1.192E+03
           rev /  6.009E+13  -0.69  2.766E+04 /
  ic4h7coch3+oh  =  ic3h5chcoch3+h2o  8.450E+11  0.00 -2.280E+02
           rev /  1.445E+13  -0.21  2.862E+04 /
  ic4h7coch3+oh  =  ac3h4ch2coch3+h2o  3.120E+06  2.00 -2.980E+02
           rev /  5.431E+08  1.39  3.246E+04 /
  ic4h7coch3+ho2  =  ic4h7coch2+h2o2  2.380E+04  2.55  1.469E+04
           rev /  1.665E+07  1.53  9.691E+03 /
  ic4h7coch3+ho2  =  ic3h5chcoch3+h2o2  2.000E+11  0.00  8.698E+03
           rev /  2.030E+13  -0.54  6.080E+03 /
  ic4h7coch3+ho2  =  ac3h4ch2coch3+h2o2  9.640E+03  2.60  1.391E+04
           rev /  9.961E+06  1.66  1.521E+04 /
  ic4h7coch3+ch3o2  =  ic4h7coch2+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  8.652E+15  -1.19  1.366E+04 /
  ic4h7coch3+ch3o2  =  ic3h5chcoch3+ch3o2h  2.000E+12  0.00  1.525E+04
           rev /  8.342E+14  -0.72  1.191E+04 /
  ic4h7coch3+ch3o2  =  ac3h4ch2coch3+ch3o2h  3.010E+12  0.00  1.938E+04
           rev /  1.278E+16  -1.11  1.995E+04 /
  ic4h7coch2  =  ic4h7+ch2co  1.161E+19  -1.76  3.918E+04
           rev /  8.000E+10  0.00  8.600E+03 /
  ic3h5chcoch3  =  c4h6+ch3co  4.284E+19  -1.82  3.675E+04
           rev /  8.000E+10  0.00  1.300E+04 /
  ac3h4ch2coch3  =  c3h4-a+ch3coch2  6.837E+21  -2.47  5.397E+04
           rev /  8.000E+10  0.00  9.600E+03 /
  neoc6h11-h  =  c2h2+tc4h9  1.017E+17  -0.99  2.615E+04
           rev /  2.000E+11  0.00  7.800E+03 /
  ic4h6oh+h2o  =  ic4h7oh+oh  5.195E+08  1.40  3.245E+04
           rev /  3.120E+06  2.00 -2.980E+02 /
  ic4h6oh+ch4  =  ic4h7oh+ch3  2.220E+03  2.90  2.375E+04
           rev /  2.210E+00  3.50  5.675E+03 /
  ic4h6oh+c3h6  =  ic4h7oh+c3h5-a  4.823E+04  2.54  1.923E+04
           rev /  5.750E+02  3.15  1.867E+04 /
  ic4h6oh+ch3cho  =  ic4h7oh+ch3co  1.303E+09  1.41  1.744E+04
           rev /  5.300E+06  2.00  1.624E+04 /
  c3h5-a+ch2o  =  c3h6+hco  6.300E+08  1.90  1.819E+04
           rev /  1.097E+08  1.89  1.584E+04 /
  cc6h13o  =  c2h5+ic3h7cho  8.628E+20  -2.15  2.148E+04
           rev /  8.500E+10  0.00  1.290E+04 /
  cc6h11o-b  =  ch3coch3+c3h5-s  7.180E+17  -1.20  2.837E+04
           rev /  1.000E+11  0.00  1.190E+04 /
  nc6h14  =  c5h11-1+ch3  6.032E+18  -0.67  8.655E+04
    rev /  4.000E+12  0.00 -5.960E+02 /
  nc6h14  =  nc3h7+nc3h7  2.616E+22  -1.56  8.794E+04
    rev /  4.000E+12  0.00 -5.960E+02 /
  nc6h14  =  pc4h9+c2h5  1.624E+22  -1.49  8.719E+04
    rev /  4.000E+12  0.00 -5.960E+02 /
  nc6h14  =  c6h13-1+h  2.947E+19  -1.00  1.032E+05
    rev /  3.610E+13  0.00  0.000E+00 /
  nc6h14  =  c6h13-2+h  4.538E+20  -1.34  1.007E+05
    rev /  3.610E+13  0.00  0.000E+00 /
  nc6h14  =  c6h13-3+h  4.538E+20  -1.34  1.007E+05
    rev /  3.610E+13  0.00  0.000E+00 /
  nc6h14+h  =  c6h13-1+h2  1.880E+05  2.75  6.280E+03
    rev /  4.342E+03  2.75  1.056E+04 /
  nc6h14+h  =  c6h13-2+h2  2.600E+06  2.40  4.471E+03
    rev /  3.900E+03  2.74  1.126E+04 /
  nc6h14+h  =  c6h13-3+h2  2.600E+06  2.40  4.471E+03
    rev /  3.900E+03  2.74  1.126E+04 /
  nc6h14+o  =  c6h13-1+oh  2.092E+06  2.42  4.766E+03
    rev /  2.122E+04  2.42  6.946E+03 /
  nc6h14+o  =  c6h13-2+oh  1.189E+06  2.44  2.846E+03
    rev /  7.834E+02  2.78  7.538E+03 /
  nc6h14+o  =  c6h13-3+oh  1.189E+06  2.44  2.846E+03
    rev /  7.834E+02  2.78  7.538E+03 /
  nc6h14+oh  =  c6h13-1+h2o  1.050E+10  0.97  1.590E+03
    rev /  1.050E+09  0.97  2.102E+04 /
  nc6h14+oh  =  c6h13-2+h2o  9.360E+07  1.61 -3.500E+01
    rev /  6.079E+05  1.95  2.191E+04 /
  nc6h14+oh  =  c6h13-3+h2o  9.360E+07  1.61 -3.500E+01
    rev /  6.079E+05  1.95  2.191E+04 /
  nc6h14+ch3  =  c6h13-1+ch4  9.040E-01  3.65  7.154E+03
    rev /  5.455E-01  3.65  1.191E+04 /
  nc6h14+ch3  =  c6h13-3+ch4  1.680E+05  2.13  7.574E+03
    rev /  6.584E+03  2.47  1.484E+04 /
  nc6h14+ch3  =  c6h13-2+ch4  1.680E+05  2.13  7.574E+03
    rev /  6.584E+03  2.47  1.484E+04 /
  nc6h14+ho2  =  c6h13-1+h2o2  1.680E+13  0.00  2.044E+04
    rev /  9.973E+12  -0.33  8.410E+03 /
  nc6h14+ho2  =  c6h13-2+h2o2  1.120E+13  0.00  1.769E+04
    rev /  4.318E+11  0.01  8.169E+03 /
  nc6h14+ho2  =  c6h13-3+h2o2  1.120E+13  0.00  1.769E+04
    rev /  4.318E+11  0.01  8.169E+03 /
  nc6h14+ch3o  =  c6h13-1+ch3oh  3.160E+11  0.00  7.000E+03
    rev /  1.200E+10  0.00  9.200E+03 /
  nc6h14+ch3o  =  c6h13-2+ch3oh  2.190E+11  0.00  5.000E+03
    rev /  8.910E+09  0.00  7.200E+03 /
  nc6h14+ch3o  =  c6h13-3+ch3oh  2.190E+11  0.00  5.000E+03
    rev /  8.910E+09  0.00  7.200E+03 /
  nc6h14+o2  =  c6h13-1+ho2  4.200E+13  0.00  5.280E+04
    rev /  1.762E+10  0.32 -4.020E+02 /
  nc6h14+o2  =  c6h13-2+ho2  2.800E+13  0.00  5.016E+04
    rev /  7.630E+08  0.67 -5.400E+02 /
  nc6h14+o2  =  c6h13-3+ho2  2.800E+13  0.00  5.016E+04
    rev /  7.630E+08  0.67 -5.400E+02 /
  nc6h14+c2h5  =  c6h13-1+c2h6  1.000E+11  0.00  1.340E+04
    rev /  3.240E+11  0.00  1.230E+04 /
  nc6h14+c2h5  =  c6h13-2+c2h6  1.000E+11  0.00  1.040E+04
    rev /  1.000E+11  0.00  1.290E+04 /
  nc6h14+c2h5  =  c6h13-3+c2h6  1.000E+11  0.00  1.040E+04
    rev /  1.000E+11  0.00  1.290E+04 /
  nc6h14+c2h3  =  c6h13-1+c2h4  1.000E+12  0.00  1.800E+04
    rev /  2.570E+12  0.00  2.540E+04 /
  nc6h14+c2h3  =  c6h13-2+c2h4  8.000E+11  0.00  1.680E+04
    rev /  2.000E+12  0.00  2.420E+04 /
  nc6h14+c2h3  =  c6h13-3+c2h4  8.000E+11  0.00  1.680E+04
    rev /  2.000E+12  0.00  2.420E+04 /
  nc6h14+ch3o2  =  c6h13-1+ch3o2h  1.680E+13  0.00  2.044E+04
    rev /  2.077E+13  -0.51  5.390E+03 /
  nc6h14+ch3o2  =  c6h13-2+ch3o2h  1.120E+13  0.00  1.769E+04
    rev /  8.992E+11  -0.16  5.149E+03 /
  nc6h14+ch3o2  =  c6h13-3+ch3o2h  1.120E+13  0.00  1.769E+04
    rev /  8.992E+11  -0.16  5.149E+03 /
  c6h13o2-1+nc6h14  =  c6h13o2h-1+c6h13-1  1.210E+13  0.00  2.043E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-2+nc6h14  =  c6h13o2h-2+c6h13-1  1.210E+13  0.00  2.043E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-3+nc6h14  =  c6h13o2h-3+c6h13-1  1.210E+13  0.00  2.043E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-1+nc6h14  =  c6h13o2h-1+c6h13-2  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-2+nc6h14  =  c6h13o2h-2+c6h13-2  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-3+nc6h14  =  c6h13o2h-3+c6h13-2  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-1+nc6h14  =  c6h13o2h-1+c6h13-3  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-2+nc6h14  =  c6h13o2h-2+c6h13-3  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  c6h13o2-3+nc6h14  =  c6h13o2h-3+c6h13-3  8.064E+12  0.00  1.770E+04
    rev /  1.440E+10  0.00  1.500E+04 /
  nc6h14+c6h13-1  =  nc6h14+c6h13-2  1.000E+11  0.00  1.040E+04
    rev /  1.500E+11  0.00  1.230E+04 /
  nc6h14+c6h13-1  =  nc6h14+c6h13-3  1.000E+11  0.00  1.040E+04
    rev /  1.500E+11  0.00  1.230E+04 /
  nc6h14+c6h13-2  =  nc6h14+c6h13-3  1.000E+11  0.00  1.040E+04
    rev /  1.000E+11  0.00  1.040E+04 /
  c6h13-1+o2  =  c6h12-1+ho2  3.000E-19  0.00  3.000E+03
    rev /  2.000E-19  0.00  1.750E+04 /
  c6h13-2+o2  =  c6h12-1+ho2  4.500E-19  0.00  5.020E+03
    rev /  2.000E-19  0.00  1.750E+04 /
  c6h13-2+o2  =  c6h12-2+ho2  3.000E-19  0.00  3.000E+03
    rev /  2.000E-19  0.00  1.750E+04 /
  c6h13-3+o2  =  c6h12-2+ho2  3.000E-19  0.00  3.000E+03
    rev /  2.000E-19  0.00  1.750E+04 /
  c6h13-3+o2  =  c6h12-3+ho2  3.000E-19  0.00  3.000E+03
    rev /  2.000E-19  0.00  1.750E+04 /
  c6h13-1  =  c2h4+pc4h9  5.446E+17  -1.29  2.958E+04
    rev /  3.300E+11  0.00  7.200E+03 /
  c6h13-1  =  c6h12-1+h  2.091E+16  -0.89  3.794E+04
    rev /  1.000E+13  0.00  2.900E+03 /
  c6h13-2  =  c3h6+nc3h7  2.082E+16  -0.86  2.940E+04
    rev /  1.500E+11  0.00  7.200E+03 /
  c6h13-2  =  c6h12-1+h  1.358E+15  -0.55  3.876E+04
    rev /  1.000E+13  0.00  1.200E+03 /
  c6h13-2  =  c6h12-2+h  2.762E+15  -0.72  3.759E+04
    rev /  1.000E+13  0.00  2.900E+03 /
  c6h13-3  =  c4h8-1+c2h5  5.612E+17  -1.31  2.960E+04
    rev /  1.500E+11  0.00  7.200E+03 /
  c6h13-3  =  c5h10-1+ch3  6.266E+12  0.01  2.868E+04
    rev /  1.500E+11  0.00  7.200E+03 /
  c6h13-3  =  c6h12-2+h  2.762E+15  -0.72  3.759E+04
    rev /  1.000E+13  0.00  2.900E+03 /
  c6h13-3  =  c6h12-3+h  1.013E+15  -0.66  3.768E+04
    rev /  1.000E+13  0.00  2.900E+03 /
  c6h13-1  =  c6h13-2  5.478E+08  1.62  3.876E+04
    rev /  3.558E+07  1.97  4.127E+04 /
  c6h13-1  =  c6h13-3  1.495E+09  0.97  3.376E+04
    rev /  9.709E+07  1.31  3.627E+04 /
  c6h12-1+oh  =  c6h11+h2o  3.000E+13  0.00  1.230E+03
    rev /  9.764E+14  -0.13  3.926E+04 /
  c6h12-2+oh  =  c6h11+h2o  3.000E+13  0.00  1.230E+03
    rev /  1.986E+15  -0.31  3.638E+04 /
  c6h12-3+oh  =  c6h11+h2o  3.000E+13  0.00  1.230E+03
    rev /  7.281E+14  -0.24  3.648E+04 /
  c6h12-1+h  =  c6h11+h2  3.700E+13  0.00  3.900E+03
    rev /  2.781E+14  -0.13  2.677E+04 /
  c6h12-2+h  =  c6h11+h2  3.700E+13  0.00  3.900E+03
    rev /  5.657E+14  -0.31  2.390E+04 /
  c6h12-3+h  =  c6h11+h2  3.700E+13  0.00  3.900E+03
    rev /  2.074E+14  -0.24  2.399E+04 /
  c6h12-1+ch3  =  c6h11+ch4  1.000E+12  0.00  7.300E+03
    rev /  1.964E+14  -0.13  3.065E+04 /
  c6h12-2+ch3  =  c6h11+ch4  1.000E+12  0.00  7.300E+03
    rev /  3.994E+14  -0.31  2.778E+04 /
  c6h12-3+ch3  =  c6h11+ch4  1.000E+12  0.00  7.300E+03
    rev /  1.464E+14  -0.24  2.787E+04 /
  c6h12-1+o  =  c6h11+oh  2.120E+11  0.13  9.125E+03
    rev /  7.000E+11  0.00  2.990E+04 /
  c6h12-2+o  =  c6h11+oh  1.042E+11  0.31  1.200E+04
    rev /  7.000E+11  0.00  2.990E+04 /
  c6h12-3+o  =  c6h11+oh  2.843E+11  0.24  1.190E+04
    rev /  7.000E+11  0.00  2.990E+04 /
  c6h12-1+oh  =  c5h11-1+ch2o  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12-2+oh  =  pc4h9+ch3cho  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12-3+oh  =  pc4h9+ch3cho  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12-1+o  =  c5h11-1+hco  1.000E+11  0.00 -1.050E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12-2+o  =  pc4h9+ch3co  1.000E+11  0.00 -1.050E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h11  =  c3h6+c3h5-a  2.500E+13  0.00  4.500E+04
    rev /  1.000E+10  0.00  1.700E+04 /
!Removed c6h11  =  c4h8-1+c2h3  2.500E-17  0.00  4.500E+04
!    rev /  1.500E-20  0.00  7.400E+03 /
!use MCH:  
c6h11  =  c4h7+c2h4  2.500E-17  0.00  4.500E+04
!    rev /  1.500E-20  0.00  7.400E+03 /
  c6h12-1  =  nc3h7+c3h5-a  1.000E+16  0.00  7.100E+04
    rev /  1.000E+13  0.00  0.000E+00 /
  c6h12-2  =  c2h5+c4h7  1.000E+16  0.00  7.100E+04
    rev /  1.000E+13  0.00  0.000E+00 /
  c6h12-3  =  ch3+c5h9  1.000E+16  0.00  7.100E+04
    rev /  1.000E+13  0.00  0.000E+00 /
  c6h13o2-1  =  c6h13-1+o2  5.150E+20  -1.71  3.578E+04
    rev /  4.520E+12  0.00  0.000E+00 /
  c6h13o2-2  =  c6h13-2+o2  2.180E+23  -2.33  3.804E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h13o2-3  =  c6h13-3+o2  2.180E+23  -2.33  3.804E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h13-1+c6h13o2-1  =  c6h13o-1+c6h13o-1  7.000E+12  0.00 -1.000E+03
    rev /  9.781E+13  -0.21  2.984E+04 /
  c6h13-1+c6h13o2-2  =  c6h13o-1+c6h13o-2  7.000E+12  0.00 -1.000E+03
    rev /  3.628E+13  -0.17  2.950E+04 /
  c6h13-1+c6h13o2-3  =  c6h13o-1+c6h13o-3  7.000E+12  0.00 -1.000E+03
    rev /  3.628E+13  -0.17  2.950E+04 /
  c6h13-2+c6h13o2-1  =  c6h13o-2+c6h13o-1  7.000E+12  0.00 -1.000E+03
    rev /  9.205E+15  -0.80  3.176E+04 /
  c6h13-2+c6h13o2-2  =  c6h13o-2+c6h13o-2  7.000E+12  0.00 -1.000E+03
    rev /  3.414E+15  -0.76  3.142E+04 /
  c6h13-2+c6h13o2-3  =  c6h13o-2+c6h13o-3  7.000E+12  0.00 -1.000E+03
    rev /  3.414E+15  -0.76  3.142E+04 /
  c6h13-3+c6h13o2-1  =  c6h13o-3+c6h13o-1  7.000E+12  0.00 -1.000E+03
    rev /  9.205E+15  -0.80  3.176E+04 /
  c6h13-3+c6h13o2-2  =  c6h13o-3+c6h13o-2  7.000E+12  0.00 -1.000E+03
    rev /  3.414E+15  -0.76  3.142E+04 /
  c6h13-3+c6h13o2-3  =  c6h13o-3+c6h13o-3  7.000E+12  0.00 -1.000E+03
    rev /  3.414E+15  -0.76  3.142E+04 /
  c6h13o2-1  =  c6h12ooh1-2  2.000E+11  0.00  2.685E+04
    rev /  2.402E+10  -0.12  1.386E+04 /
  c6h13o2-1  =  c6h12ooh1-3  2.500E+10  0.00  2.085E+04
    rev /  3.003E+09  -0.12  7.860E+03 /
  c6h13o2-1  =  c6h12ooh1-4  3.125E+09  0.00  1.905E+04
    rev /  3.754E+08  -0.12  6.060E+03 /
  c6h13o2-1  =  c6h12ooh1-5  3.906E+08  0.00  2.205E+04
    rev /  4.692E+07  -0.12  9.060E+03 /
  c6h13o2-2  =  c6h12ooh2-1  3.000E+11  0.00  2.940E+04
    rev /  7.948E+11  -0.52  1.395E+04 /
  c6h13o2-2  =  c6h12ooh2-3  2.000E+11  0.00  2.685E+04
    rev /  2.578E+10  -0.13  1.388E+04 /
  c6h13o2-2  =  c6h12ooh2-4  2.500E+10  0.00  2.085E+04
    rev /  3.223E+09  -0.13  7.880E+03 /
  c6h13o2-2  =  c6h12ooh2-5  3.125E+09  0.00  1.905E+04
    rev /  4.028E+08  -0.13  6.080E+03 /
  c6h13o2-2  =  c6h12ooh2-6  5.860E+08  0.00  2.555E+04
    rev /  1.553E+09  -0.52  1.010E+04 /
  c6h13o2-3  =  c6h12ooh3-1  3.750E+10  0.00  2.440E+04
    rev /  9.935E+10  -0.52  8.950E+03 /
  c6h13o2-3  =  c6h12ooh3-2  2.000E+11  0.00  2.685E+04
    rev /  2.578E+10  -0.13  1.388E+04 /
  c6h13o2-3  =  c6h12ooh3-4  2.000E+11  0.00  2.685E+04
    rev /  2.578E+10  -0.13  1.388E+04 /
  c6h13o2-3  =  c6h12ooh3-5  2.500E+10  0.00  2.085E+04
    rev /  3.223E+09  -0.13  7.880E+03 /
  c6h13o2-3  =  c6h12ooh3-6  4.688E+09  0.00  2.235E+04
    rev /  1.242E+10  -0.52  6.900E+03 /
!  c6h13o2-1+ho2  =  c6h13o2h-1+o2  1.750E+10  0.00 -3.275E+03
!    rev /  4.701E+13  -0.82  3.446E+04 /
  c6h13o2-1+ho2  =  c6h13o2h-1+o2  1.750E+11   0.00 -1.711E+03
!  c6h13o2-2+ho2  =  c6h13o2h-2+o2  1.750E+10  0.00 -3.275E+03
!    rev /  5.909E+13  -0.85  3.450E+04 /
  c6h13o2-2+ho2  =  c6h13o2h-2+o2  1.750E+11   0.00 -1.711E+03
!  c6h13o2-3+ho2  =  c6h13o2h-3+o2  1.750E+10  0.00 -3.275E+03
!    rev /  5.909E+13  -0.85  3.450E+04 /
  c6h13o2-3+ho2  =  c6h13o2h-3+o2  1.750E+11   0.00 -1.711E+03
  c6h13o2-1+h2o2  =  c6h13o2h-1+ho2  2.400E+12  0.00  1.000E+04
    rev /  2.400E+12  0.00  1.000E+04 /
  c6h13o2-2+h2o2  =  c6h13o2h-2+ho2  2.400E+12  0.00  1.000E+04
    rev /  2.400E+12  0.00  1.000E+04 /
  c6h13o2-3+h2o2  =  c6h13o2h-3+ho2  2.400E+12  0.00  1.000E+04
    rev /  2.400E+12  0.00  1.000E+04 /
  c6h13o2-1+ch3o2  =  c6h13o-1+ch3o+o2  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-2+ch3o2  =  c6h13o-2+ch3o+o2  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-3+ch3o2  =  c6h13o-3+ch3o+o2  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-1+c6h13o2-1  =  o2+c6h13o-1+c6h13o-1  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-1+c6h13o2-2  =  o2+c6h13o-1+c6h13o-2  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-1+c6h13o2-3  =  o2+c6h13o-1+c6h13o-3  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-2+c6h13o2-2  =  o2+c6h13o-2+c6h13o-2  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-2+c6h13o2-3  =  o2+c6h13o-2+c6h13o-3  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2-3+c6h13o2-3  =  o2+c6h13o-3+c6h13o-3  1.400E+16  -1.61  1.860E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h13o2h-1  =  c6h13o-1+oh  1.500E+16  0.00  4.250E+04
    rev /  1.460E+08  1.74 -3.045E+03 /
  c6h13o2h-2  =  c6h13o-2+oh  1.250E+16  0.00  4.160E+04
    rev /  3.589E+07  1.81 -4.325E+03 /
  c6h13o2h-3  =  c6h13o-3+oh  1.250E+16  0.00  4.160E+04
    rev /  3.589E+07  1.81 -4.325E+03 /
  c6h13o-1  =  c5h11-1+ch2o  1.810E+17  -1.14  2.030E+04
    rev /  1.000E+11  0.00  1.190E+04 /
  c6h13o-2  =  pc4h9+ch3cho  3.568E+21  -2.30  2.061E+04
    rev /  1.000E+11  0.00  1.190E+04 /
  c6h13o-3  =  c2h5cho+nc3h7  3.495E+21  -2.29  2.063E+04
    rev /  1.000E+11  0.00  1.190E+04 /
  c6h12ooh1-2  =  c6h12o1-2+oh  6.000E+11  0.00  2.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh1-3  =  c6h12o1-3+oh  7.500E+10  0.00  1.525E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh1-4  =  c6h12o1-4+oh  9.375E+09  0.00  7.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh1-5  =  c6h12o1-5+oh  1.172E+09  0.00  1.800E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-1  =  c6h12o1-2+oh  6.000E+11  0.00  2.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-3  =  c6h12o2-3+oh  6.000E+11  0.00  2.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-4  =  c6h12o2-4+oh  7.500E+10  0.00  1.525E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-5  =  c6h12o2-5+oh  9.375E+09  0.00  7.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-6  =  c6h12o1-5+oh  1.172E+09  0.00  1.800E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-2  =  c6h12o2-3+oh  6.000E+11  0.00  2.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-4  =  c6h12o3-4+oh  6.000E+11  0.00  2.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-1  =  c6h12o1-3+oh  7.500E+10  0.00  1.525E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-5  =  c6h12o2-4+oh  7.500E+10  0.00  1.525E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-6  =  c6h12o1-4+oh  9.375E+09  0.00  7.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh1-2  =  c6h12-1+ho2  1.353E+19  -2.05  2.057E+04
    rev /  1.620E+11  0.00  1.269E+04 /
  c6h12ooh2-1  =  c6h12-1+ho2  4.918E+21  -2.73  2.288E+04
    rev /  1.620E+11  0.00  1.269E+04 /
  c6h12ooh2-3  =  c6h12-2+ho2  4.867E+20  -2.51  2.249E+04
    rev /  1.620E+11  0.00  1.269E+04 /
  c6h12ooh3-2  =  c6h12-2+ho2  4.867E+20  -2.51  2.249E+04
    rev /  1.620E+11  0.00  1.269E+04 /
  c6h12ooh3-4  =  c6h12-3+ho2  3.564E+20  -2.45  2.258E+04
    rev /  3.236E+11  0.00  1.269E+04 /
  c6h12ooh1-3  =  oh+ch2o+c5h10-1  7.703E+13  -0.16  3.009E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh2-4  =  oh+ch3cho+c4h8-1  2.933E+18  -1.70  2.408E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-5  =  oh+c2h5cho+c3h6  1.171E+17  -1.31  2.888E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh3-1  =  oh+ch3cho+c2h4+c2h4  7.326E+18  -1.74  2.742E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12ooh1-2o2  =  c6h12ooh1-2+o2  8.868E+22  -2.31  3.798E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh1-3o2  =  c6h12ooh1-3+o2  8.868E+22  -2.31  3.798E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh1-4o2  =  c6h12ooh1-4+o2  8.868E+22  -2.31  3.798E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh1-5o2  =  c6h12ooh1-5+o2  8.868E+22  -2.31  3.798E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh2-1o2  =  c6h12ooh2-1+o2  1.463E+20  -1.64  3.567E+04
    rev /  4.520E+12  0.00  0.000E+00 /
  c6h12ooh2-3o2  =  c6h12ooh2-3+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh2-4o2  =  c6h12ooh2-4+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh2-5o2  =  c6h12ooh2-5+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh2-6o2  =  c6h12ooh2-6+o2  1.463E+20  -1.64  3.567E+04
    rev /  4.520E+12  0.00  0.000E+00 /
  c6h12ooh3-1o2  =  c6h12ooh3-1+o2  1.463E+20  -1.64  3.567E+04
    rev /  4.520E+12  0.00  0.000E+00 /
  c6h12ooh3-2o2  =  c6h12ooh3-2+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh3-4o2  =  c6h12ooh3-4+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh3-5o2  =  c6h12ooh3-5+o2  4.792E+22  -2.33  3.796E+04
    rev /  7.540E+12  0.00  0.000E+00 /
  c6h12ooh3-6o2  =  c6h12ooh3-6+o2  1.463E+20  -1.64  3.567E+04
    rev /  4.520E+12  0.00  0.000E+00 /
  c6h12ooh1-2o2  =  nc6ket12+oh  2.000E+11  0.00  2.640E+04
    rev /  1.253E-11  5.95  3.966E+04 /
  c6h12ooh1-3o2  =  nc6ket13+oh  2.500E+10  0.00  2.140E+04
    rev /  4.240E+03  1.38  4.467E+04 /
  c6h12ooh1-4o2  =  nc6ket14+oh  3.125E+09  0.00  1.935E+04
    rev /  5.300E+02  1.38  4.262E+04 /
  c6h12ooh1-5o2  =  nc6ket15+oh  3.906E+08  0.00  2.255E+04
    rev /  6.625E+01  1.38  4.582E+04 /
  c6h12ooh2-1o2  =  nc6ket21+oh  1.000E+11  0.00  2.385E+04
    rev /  1.083E+03  1.73  5.000E+04 /
  c6h12ooh2-3o2  =  nc6ket23+oh  1.000E+11  0.00  2.385E+04
    rev /  5.552E+03  1.61  4.906E+04 /
  c6h12ooh2-4o2  =  nc6ket24+oh  1.250E+10  0.00  1.785E+04
    rev /  2.219E+02  1.79  4.384E+04 /
  c6h12ooh2-5o2  =  nc6ket25+oh  1.563E+09  0.00  1.605E+04
    rev /  2.774E+01  1.79  4.204E+04 /
  c6h12ooh2-6o2  =  nc6ket26+oh  3.906E+08  0.00  2.255E+04
    rev /  9.315E+00  1.74  4.855E+04 /
  c6h12ooh3-1o2  =  nc6ket31+oh  1.250E+10  0.00  1.785E+04
    rev /  2.550E+02  1.72  4.416E+04 /
  c6h12ooh3-2o2  =  nc6ket32+oh  1.000E+11  0.00  2.385E+04
    rev /  3.548E+03  1.63  4.932E+04 /
  c6h12ooh3-4o2  =  nc6ket34+oh  1.000E+11  0.00  2.385E+04
    rev /  3.548E+03  1.63  4.932E+04 /
  c6h12ooh3-5o2  =  nc6ket35+oh  1.250E+10  0.00  1.785E+04
    rev /  1.683E+02  1.79  4.412E+04 /
  c6h12ooh3-6o2  =  nc6ket36+oh  1.563E+09  0.00  1.605E+04
    rev /  3.189E+01  1.72  4.236E+04 /
  nc6ket12  =  nc4h9cho+hco+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket13  =  nc3h7cho+ch2cho+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket14  =  c2h5cho+ch2ch2cho+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket15  =  ch3cho+c3h6cho-1+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket21  =  ch2o+nc4h9co+oh  1.500E+16  0.00  4.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket23  =  nc3h7cho+ch3co+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket24  =  c2h5cho+ch3coch2+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket25  =  ch3cho+ch2ch2coch3+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket26  =  ch2o+c3h6coch3-1+oh  1.500E+16  0.00  4.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket31  =  ch2o+nc3h7coch2+oh  1.500E+16  0.00  4.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket32  =  ch3cho+nc3h7co+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket34  =  c2h5cho+c2h5co+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket35  =  ch3cho+c2h5coch2+oh  1.050E+16  0.00  4.160E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6ket36  =  ch2o+c2h5coc2h4p+oh  1.500E+16  0.00  4.200E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-2+oh  =  c2h3cho+nc3h7+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-3+oh  =  c5h10-1+hco+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-4+oh  =  c4h8-1+ch2cho+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-5+oh  =  c3h6+ch2ch2cho+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-3+oh  =  c2h3coch3+c2h5+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-4+oh  =  c4h8-1+ch3co+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-5+oh  =  c3h6+ch3coch2+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o3-4+oh  =  c2h5coc2h3+ch3+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-2+oh  =  ch2co+pc4h9+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-3+oh  =  c2h4+nc3h7co+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-4+oh  =  c2h4+c2h5coch2+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-5+oh  =  c2h4+ch2ch2coch3+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-3+oh  =  ch3chco+nc3h7+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-4+oh  =  c3h6+c2h5co+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-5+oh  =  ch3cho+c4h7+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o3-4+oh  =  c2h5cho+c3h5-s+h2o  2.500E+12  0.00  0.000E+00
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-2+ho2  =  c2h3cho+nc3h7+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-3+ho2  =  c5h10-1+hco+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-4+ho2  =  c4h8-1+ch2cho+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-5+ho2  =  c3h6+ch2ch2cho+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-3+ho2  =  c2h3coch3+c2h5+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-4+ho2  =  c4h8-1+ch3co+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-5+ho2  =  c3h6+ch3coch2+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o3-4+ho2  =  c2h5coc2h3+ch3+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-2+ho2  =  ch2co+pc4h9+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-3+ho2  =  c2h4+nc3h7co+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-4+ho2  =  c2h4+c2h5coch2+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o1-5+ho2  =  c2h4+ch2ch2coch3+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-3+ho2  =  ch3chco+nc3h7+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-4+ho2  =  c3h6+c2h5co+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o2-5+ho2  =  ch3cho+c4h7+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  c6h12o3-4+ho2  =  c2h5cho+c3h5-s+h2o2  5.000E+12  0.00  1.770E+04
    rev /  0.000E+00  0.00  0.000E+00 /
  nc6h14+o2cho  =  c6h13-1+ho2cho  1.680E+13  0.00  2.044E+04
    rev /  5.692E+02  2.30  3.060E+03 /
  nc6h14+o2cho  =  c6h13-2+ho2cho  1.120E+13  0.00  1.769E+04
    rev /  2.464E+01  2.64  2.823E+03 /
  nc6h14+o2cho  =  c6h13-3+ho2cho  1.120E+13  0.00  1.769E+04
    rev /  2.464E+01  2.64  2.823E+03 /
  c6h13-1+ho2  =  c6h13o-1+oh  7.000E+12  0.00 -1.000E+03
    rev /  2.085E+16  -0.79  2.697E+04 /
  c6h13-2+ho2  =  c6h13o-2+oh  7.000E+12  0.00 -1.000E+03
    rev /  1.962E+18  -1.37  2.889E+04 /
  c6h13-3+ho2  =  c6h13o-3+oh  7.000E+12  0.00 -1.000E+03
    rev /  1.962E+18  -1.37  2.889E+04 /
  c6h13-1+ch3o2  =  c6h13o-1+ch3o  7.000E+12  0.00 -1.000E+03
    rev /  2.036E+18  -1.36  3.174E+04 /
  c6h13-2+ch3o2  =  c6h13o-2+ch3o  7.000E+12  0.00 -1.000E+03
    rev /  1.916E+20  -1.95  3.366E+04 /
  c6h13-3+ch3o2  =  c6h13o-3+ch3o  7.000E+12  0.00 -1.000E+03
    rev /  1.916E+20  -1.95  3.366E+04 /
  nc5h11cho+o2  =  nc5h11co+ho2  2.000E+13  0.50  4.220E+04
    rev /  1.000E+07  0.00  4.000E+04 /
  nc5h11cho+oh  =  nc5h11co+h2o  2.690E+10  0.76 -3.400E+02
    rev /  1.740E+10  0.76  3.120E+04 /
  nc5h11cho+h  =  nc5h11co+h2  4.000E+13  0.00  4.200E+03
    rev /  1.800E+13  0.00  2.400E+04 /
  nc5h11cho+o  =  nc5h11co+oh  5.000E+12  0.00  1.790E+03
    rev /  1.000E+12  0.00  1.900E+04 /
  nc5h11cho+ho2  =  nc5h11co+h2o2  2.800E+12  0.00  1.360E+04
    rev /  1.000E+12  0.00  1.000E+04 /
  nc5h11cho+ch3  =  nc5h11co+ch4  1.700E+12  0.00  8.440E+03
    rev /  1.500E+13  0.00  2.800E+04 /
  nc5h11cho+ch3o  =  nc5h11co+ch3oh  1.150E+11  0.00  1.280E+03
    rev /  3.000E+11  0.00  1.800E+04 /
  nc5h11cho+ch3o2  =  nc5h11co+ch3o2h  1.000E+12  0.00  9.500E+03
    rev /  2.500E+10  0.00  1.000E+04 /
  nc5h11cho+oh  =  c5h10cho-1+h2o  5.270E+09  0.97  1.586E+03
    rev /  1.071E+09  0.96  2.101E+04 /
  nc5h11cho+oh  =  c5h10cho-2+h2o  4.670E+07  1.61 -3.500E+01
    rev /  1.752E+06  1.85  2.388E+04 /
  nc5h11cho+oh  =  c5h10cho-3+h2o  4.670E+07  1.61 -3.500E+01
    rev /  1.752E+06  1.85  2.388E+04 /
  nc5h11cho+oh  =  c5h10cho-4+h2o  4.670E+07  1.61 -3.500E+01
    rev /  1.752E+06  1.85  2.388E+04 /
  nc5h11cho+oh  =  c5h10cho-5+h2o  4.670E+07  1.61 -3.500E+01
    rev /  3.317E+09  1.25  3.084E+04 /
  nc5h11co  =  c5h11-1+co  1.000E+11  0.00  9.600E+03
    rev /  1.000E+11  0.00  0.000E+00 /
  nc5h11cho+ho2  =  c5h10cho-1+h2o2  2.760E+04  2.55  1.648E+04
    rev /  3.330E+04  2.22  4.442E+03 /
  nc5h11cho+ho2  =  c5h10cho-2+h2o2  1.475E+04  2.60  1.391E+04
    rev /  3.285E+03  2.51  6.362E+03 /
  nc5h11cho+ho2  =  c5h10cho-3+h2o2  1.475E+04  2.60  1.391E+04
    rev /  3.285E+03  2.51  6.362E+03 /
  nc5h11cho+ho2  =  c5h10cho-4+h2o2  1.475E+04  2.60  1.391E+04
    rev /  3.285E+03  2.51  6.362E+03 /
  nc5h11cho+ho2  =  c5h10cho-5+h2o2  2.950E+04  2.60  1.391E+04
    rev /  1.244E+07  1.91  1.332E+04 /
  nc5h11cho+ch3o2  =  c5h10cho-1+ch3o2h  6.030E+12  0.00  1.938E+04
    rev /  2.990E+13  -0.51  6.617E+03 /
  nc5h11cho+ch3o2  =  c5h10cho-2+ch3o2h  1.990E+12  0.00  1.705E+04
    rev /  1.821E+12  -0.26  8.784E+03 /
  nc5h11cho+ch3o2  =  c5h10cho-3+ch3o2h  1.990E+12  0.00  1.705E+04
    rev /  1.821E+12  -0.26  8.784E+03 /
  nc5h11cho+ch3o2  =  c5h10cho-4+ch3o2h  1.990E+12  0.00  1.705E+04
    rev /  1.821E+12  -0.26  8.784E+03 /
  nc5h11cho+ch3o2  =  c5h10cho-5+ch3o2h  3.980E+12  0.00  1.705E+04
    rev /  6.897E+15  -0.86  1.574E+04 /
  c5h10cho-1  =  c2h4+c3h6cho-1  2.680E+18  -1.58  3.041E+04
    rev /  2.500E+11  0.00  7.800E+03 /
  c5h10cho-2  =  c3h6+ch2ch2cho  9.380E+17  -1.31  3.197E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  c5h10cho-3  =  c4h8-1+ch2cho  6.270E+16  -1.43  2.599E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  c5h10cho-3  =  c4h7cho1-4+ch3  2.373E+14  -0.56  3.132E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  c5h10cho-4  =  ac3h5cho+c2h5  7.188E+17  -1.37  3.323E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  c5h10cho-4  =  c5h10-1+hco  1.057E+14  -0.41  2.633E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  c5h10cho-5  =  c2h3cho+nc3h7  1.564E+19  -1.53  3.331E+04
    rev /  1.000E+11  0.00  7.800E+03 /
  nc4h9coch3+oh  =  c4h8coch3-1+h2o  2.065E+07  1.73  7.530E+02
    rev /  4.278E+06  1.72  2.019E+04 /
  nc4h9coch3+oh  =  c4h8coch3-2+h2o  3.615E+07  1.64 -2.470E+02
    rev /  3.070E+05  2.04  2.163E+04 /
  nc4h9coch3+oh  =  c4h8coch3-3+h2o  3.615E+07  1.64 -2.470E+02
    rev /  3.070E+05  2.04  2.163E+04 /
  nc4h9coch3+oh  =  c4h8coch3-4+h2o  8.450E+11  0.00 -2.280E+02
    rev /  1.633E+13  -0.23  2.864E+04 /
  nc4h9coch3+oh  =  nc4h9coch2+h2o  5.100E+11  0.00  1.192E+03
    rev /  6.786E+13  -0.70  2.768E+04 /
  nc4h9coch3+ho2  =  c4h8coch3-1+h2o2  2.380E+04  2.55  1.649E+04
    rev /  2.927E+04  2.21  4.462E+03 /
  nc4h9coch3+ho2  =  c4h8coch3-2+h2o2  5.600E+12  0.00  1.770E+04
    rev /  2.823E+11  0.07  8.112E+03 /
  nc4h9coch3+ho2  =  c4h8coch3-3+h2o2  5.600E+12  0.00  1.770E+04
    rev /  2.823E+11  0.07  8.112E+03 /
  nc4h9coch3+ho2  =  c4h8coch3-4+h2o2  2.000E+11  0.00  8.698E+03
    rev /  2.294E+13  -0.56  6.100E+03 /
  nc4h9coch3+ho2  =  nc4h9coch2+h2o2  2.380E+04  2.55  1.469E+04
    rev /  1.880E+07  1.52  9.712E+03 /
  nc4h9coch3+ch3o2  =  c4h8coch3-1+ch3o2h  3.010E+12  0.00  1.938E+04
    rev /  1.521E+13  -0.51  6.627E+03 /
  nc4h9coch3+ch3o2  =  c4h8coch3-2+ch3o2h  1.990E+12  0.00  1.705E+04
    rev /  4.123E+11  -0.11  6.744E+03 /
  nc4h9coch3+ch3o2  =  c4h8coch3-3+ch3o2h  1.990E+12  0.00  1.705E+04
    rev /  4.123E+11  -0.11  6.744E+03 /
  nc4h9coch3+ch3o2  =  c4h8coch3-4+ch3o2h  2.000E+12  0.00  1.525E+04
    rev /  9.429E+14  -0.73  1.193E+04 /
  nc4h9coch3+ch3o2  =  nc4h9coch2+ch3o2h  3.010E+12  0.00  1.758E+04
    rev /  9.770E+15  -1.21  1.188E+04 /
  c4h8coch3-1  =  ch2ch2coch3+c2h4  1.133E+18  -1.59  3.091E+04
    rev /  1.000E+11  0.00  8.300E+03 /
  c4h8coch3-2  =  c3h6+ch3coch2  3.175E+15  -0.79  2.622E+04
    rev /  1.000E+11  0.00  8.300E+03 /
  c4h8coch3-3  =  c4h8-1+ch3co  1.714E+18  -1.61  2.825E+04
    rev /  1.000E+11  0.00  9.800E+03 /
  c4h8coch3-4  =  c2h3coch3+c2h5  4.691E+19  -1.61  3.375E+04
    rev /  1.000E+11  0.00  8.300E+03 /
  nc4h9coch2  =  pc4h9+ch2co  1.554E+18  -1.41  4.314E+04
    rev /  1.000E+11  0.00  1.160E+04 /
  c4h7ooh1-4  =  c4h7o1-4+oh  2.021E+20  -1.53  4.704E+04
    rev /  2.000E+13  0.00  0.000E+00 /
  c5h9ooh1-4  =  c5h9o1-4+oh  1.178E+20  -1.38  4.605E+04
    rev /  2.000E+13  0.00  0.000E+00 /
  c5h9ooh1-5  =  c5h9o1-5+oh  1.594E+20  -1.50  4.699E+04
    rev /  2.000E+13  0.00  0.000E+00 /
  c6h11ooh1-4  =  c6h11o1-4+oh  1.234E+20  -1.39  4.605E+04
    rev /  2.000E+13  0.00  0.000E+00 /
  c6h11ooh1-5  =  c6h11o1-5+oh  1.234E+20  -1.39  4.605E+04
    rev /  2.000E+13  0.00  0.000E+00 /
  c4h7o1-4  =  ch2o+c3h5-a  2.412E+16  -1.14  7.550E+03
    rev /  1.000E+11  0.00  1.190E+04 /
  c5h9o1-4  =  ch3cho+c3h5-a  7.715E+20  -2.43  5.890E+03
    rev /  5.000E+10  0.00  9.600E+03 /
  c5h9o1-4  =  ac3h5cho+ch3  1.112E+17  -1.21  1.796E+04
    rev /  1.000E+11  0.00  9.600E+03 /
  c5h9o1-5  =  ch2o+c4h71-4  4.310E+17  -1.33  1.794E+04
    rev /  1.000E+11  0.00  9.600E+03 /
  c6h11o1-4  =  ac3h5cho+c2h5  7.268E+20  -2.10  1.887E+04
    rev /  1.000E+11  0.00  9.600E+03 /
  c6h11o1-4  =  c2h5cho+c3h5-a  1.211E+21  -2.46  5.641E+03
    rev /  5.000E+10  0.00  9.600E+03 /
  c6h11o1-5  =  c4h7cho1-4+ch3  2.399E+17  -1.30  1.696E+04
    rev /  1.000E+11  0.00  9.600E+03 /
  c6h11o1-5  =  ch3cho+c4h71-4  1.999E+22  -2.58  1.853E+04
    rev /  1.000E+11  0.00  9.600E+03 /
  c4h71-4  =  c2h4+c2h3  8.766E+12  -0.22  3.629E+04
    rev /  2.000E+11  0.00  7.800E+03 /
! add c7 olefin rxns back in.  It is formed from MCH
  c7h14-1+oh  =  c7h13+h2o  3.000E+13  0.00  1.230E+03
    rev /  7.917E+14  -0.46  3.648E+04 /
  c7h14-2+oh  =  c7h13+h2o  3.000E+13  0.00  1.230E+03
    rev /  1.604E+15  -0.63  3.360E+04 /
  c7h14-1+h  =  c7h13+h2  3.700E+13  0.00  3.900E+03
    rev /  2.255E+14  -0.46  2.399E+04 /
  c7h14-2+h  =  c7h13+h2  3.700E+13  0.00  3.900E+03
    rev /  4.569E+14  -0.63  2.112E+04 /
  c7h14-1+ch3  =  c7h13+ch4  1.000E+12  0.00  7.300E+03
    rev /  1.592E+14  -0.46  2.787E+04 /
  c7h14-2+ch3  =  c7h13+ch4  1.000E+12  0.00  7.300E+03
    rev /  3.226E+14  -0.63  2.500E+04 /
  c7h14-1+o  =  c7h13+oh  2.615E+11  0.46  1.190E+04
    rev /  7.000E+11  0.00  2.990E+04 /
  c7h14-2+o  =  c7h13+oh  1.291E+11  0.63  1.478E+04
    rev /  7.000E+11  0.00  2.990E+04 /
  c7h14-1+oh  =  ch2o+c6h13-1  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-1+oh  =  ch3cho+c5h11-1  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-2+oh  =  ch3cho+c5h11-1  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-2+oh  =  c2h5cho+pc4h9  1.000E+11  0.00 -4.000E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-1+o  =  ch2cho+c5h11-1  1.000E+11  0.00 -1.050E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-2+o  =  ch3cho+c5h10-1  1.000E+11  0.00 -1.050E+03
    rev /  0.000E+00  0.00  0.000E+00 /
  c7h14-1  =  pc4h9+c3h5-a  1.000E+16  0.00  7.100E+04
    rev /  1.000E+13  0.00  0.000E+00 /
  c7h14-2  =  c4h7+nc3h7  1.000E+16  0.00  7.100E+04
    rev /  1.000E+13  0.00  0.000E+00 /
  c7h13  =  c3h5-a+c4h8-1  2.500E+13  0.00  4.500E+04
    rev /  1.000E+13  0.00  9.600E+03 /
  c7h13  =  c4h7+c3h6  2.500E+13  0.00  4.500E+04
    rev /  1.000E+13  0.00  9.600E+03 /
!
!----------------------- Toluene reactions ----------------------
!NJIT rxns:
! Toluene initiation
!c6h5ch3 = ch2cyc6h6-5       2.42e13  0.0  6.94e4  ! analogy to phenol to 2,4cyclohexadienone, A-factor X3 for degeneracy, Li Zhu and Joseph W. Bozzelli, 2002
!c6h5ch3 = c6h5 + ch3        7.94e16   0.0  104000.0 !as c3h6 85dea [11]  c106
!c6h5ch3 = c6h5ch2j + h      3.10e15   0.0   89205.0 !92bau/cob     [01]  c105
! high pressure limits used in chemaster are above rates
!toluene thermal decomposition (c6h5ch3d.inp) (9 and 15 atm results are within about 12 % max diff of each other)
c6h5ch3    = c6h5 + ch3           5.06e+74  -16.55   141539.     !  1.00e+00 atm, 1000-2000 k,   9% err
!c6h5ch3    = c6h5 + ch3           8.00e+43   -7.68   122266.     !  9.00e+00 atm, 1000-2000 k,   7% err
!c6h5ch3    = c6h5 + ch3           3.22e+35   -5.28   116714.     !  1.50e+01 atm, 1000-2000 k,   5% err
c6h5ch3    = c6h5ch2j + h         5.84e+53  -10.91   114712.     !  1.00e+00 atm, 1000-2000 k,   8% err
!c6h5ch3    = c6h5ch2j + h         1.39e+30   -4.16    99230.     !  9.00e+00 atm, 1000-2000 k,   4% err
!c6h5ch3    = c6h5ch2j + h         1.85e+24   -2.49    95256.     !  1.50e+01 atm, 1000-2000 k,   3% err
c6h5ch3+o2=c6h5ch2j+ho2        9.3e8    1.301  40939.0 !1/2 of isobut+o2, Chen&Boz JPC A 2000,104,p9715
!c6h5ch3+o2=c6h5ch2j+ho2        4.00e13  0.0   39730.0 !est               o697
!c6h5ch3+o2=c6h5ch2j+ho2        3.60e12  0.0   40270.0 !Walker, 1998, Jt Mt Nancy
! Toluene abstraction
c6h5ch3+h=c6h6+ch3             7.57e18  -1.66   6410.0 !ncd013  new         c108
c6h5ch3+h=c6h5ch2j+h2          4.00e02   3.44   3120.0 !92bau/cob
c6h5ch3+oh=c6h5ch2j+h2o        5.19e09  1.0     874.0  !92bau/cob    [38] o696
c6h5ch3+o=c6h5ch2j+oh          6.00e10  0.7    7632.0  !as c3h6+o    [02] o695
c6h5ch3+ho2=c6h5ch2j+h2o2      1.02E+04 2.50   12339.3 ! Scott & Walker, Comb. Flame 129:365-377 (2002)
c6h5ch3+ch3o2=c6h5ch2j+ch3o2h  1.02E+04 2.50   12339.3 ! Analogy with toluene + ho2, Scott & Walker, Comb. Flame 129:365-377 (2002)
c6h5ch3+ch3=c6h5ch2j+ch4       2.21E+00 3.50    5675.0 ! analogy with propene + ch3 (91TSA)
c6h5ch3+ch3o=c6h5ch2j+ch3oh    9.00E+01 2.95    6032.0 ! Analogy with propene+ch3o, 91TSA, 300-2500 K
c6h5ch3+c2h3=c6h5ch2j+c2h4     2.21E+00 3.50    4680.0 ! Analogy with propene+c2h3, 91TSA, 300-2500 K
c6h5ch3+c6h5oj=c6h5ch2j+c6h5oh 2.50e11  0.0     5000.0 !abs               o699
c6h5ch3+c6h5=c6h5ch2j+c6h6     7.94E+13 0.00   11949.0 ! Heckmann,Hippler,Troe,J., Symp.Combust. Proc. 26, 543-550 (1996), 1100-1420K
! Benzyl decomposition:
! Used product path recommended in on p. 7112 of 1997JON/BAC7105-7114.  
! Divided the recommend overall rate equally into two paths:
c6h5ch2j = cy13pd5j + c2h2     2.00E+16 0.0    9.70e+04 
c6h5ch2j => 2c2h2 + c3h3       2.00E+16 0.0    9.70e+04
c6h5ch2j+o2=phch2ooj           8.15e-08 4.22 -23360.0 !ncdc57            o694
c6h5ch2j+o2=c6h5cho+oh         1.12e11  -0.33 18300.0 !ncdc57            o693
c6h5ch2j+o2=c6h5oj+ch2o        5.30e13  -1.07 10840.0 !ncdc57            o692
c6h5ch2j+oh=phch2oh            2.00e13   0.0      0.0 !91hip/rei         o691
c6h5ch2j+o=c6h5cho+h           3.300e14  0.0      0.0 !92Bau/cob      pitz101800 
phch2oh+oh=c6h5oh+ch2oh        2.61e14  -0.67  1710.0 !ncdc56            o690
c6h5ch2j+ho2=phch2ooh          5.04e58 -14.18 15750.0 !ncdc54            o689
!phch2ooh=phch2oj+oh              1.38e74 -17.69 71980.0 !ncdc54            o688
phch2ooh=phch2oj+oh              4.0e15 0.0 44.00 !A-factor from Chen&Boz. isobut+o2, JPC 104,9715 (2000), Ea is del U298
c6h5ch2j+ho2=phch2oj+oh        2.46e55 -11.97 28920.0 !ncdc54            o687
phch2oj=c6h5+ch2o              1.55e-09 5.33  12530.0 !ncdc55            o686 
phch2oj=c6h5cho+h              1.61e08  0.3    4920.0 !ncdc55            o685
! remove abstraction reaction. Looks neglibible
!phch2oh+cy13pd5j=phch2oj+cy13pd 1.20e12 0.0    5000.0 !abs               o684
c6h5cho+oh=h2o+c6h5cjo         3.44e09  1.18   -447.0 !92bau/cob    [01] o683
c6h5cho+h=h2+c6h5cjo           2.28e10  1.05   3279.0 !92bau/cob    [01] o682
c6h5cjo=c6h5+co                3.00e12  0.0   34860.0 !est               o681
!!   part ix  phenol fram
chdko + oh = chdjko + h2o      6.00e12  0.0       0.0 !est as       [15] o664
chdko + o = chdjko + oh        5.00e12  0.0       0.0 !est as o333       o663
c6h5oh+c6h5=c6h6+c6h5oj        1.00e11  0.0    6064.0 !est               o662
c6h5oh+cy13pd5j=cy13pd+c6h5oj  7.20e01  3.1   15425.0 !asch3oh+ch3       o661
c6h5oh+c3h5-a=c6h5oj+c3h6       1.44e01  3.1    6935.0 !87tsa as o483    o659
c6h5oh + c#ccj = c6h5oj+ c3h4-p  3.00e11  0.0    5500.0 !as ch3+c6h5oh   o658
c6h5oh + ch3 = c6h5ch3+oh      5.42e14 -0.83  12100.0 !cdczx09 new       o657
c6h5oh + ch3 = ch4 + c6h5oj    1.44e01  3.1    6935.0 !87tsa asch3oh+ch3 o654
c6h5oh + o2 =c6h5oj + ho2      1.00e13  0.0   37900.0 !o2 ini            o653
c6h5oh + oh = c6h5oj + h2o     6.00e12  0.0       0.0 !88tsa        [15] o652
c6h5oh + o = c6h5oj + oh       1.28e13  0.0    2891.0 !90fre/koc    [42] o651
! remove rxn, replace by Bozzelli's new benzene + OH rxns
!c6h5oh + h = oh + c6h6         1.99e26 -3.79  14820.0 !ncd038            o640
c6h5oh + h = h2 + c6h5oj       1.15e14  0.0   12390.0 !92bau/cob    [01] o639
c6h5oh = h + c6h5oj            1.09e16  0.0   86500.0 !this work         o638
c6h5oj = chdjko                9.24e12 -1.02   2050.0 !ncdc61            o632
c6h5oj = co + cy13pd5j         8.54e06  1.74  41420.0 !ncdc61            o626
chdjko = co + cy13pd5j         9.96e15 -0.78  48600.0 !ncdc61            o625
chdjko + h = chdko             1.32e13  0.0   -5660.0 !xiancma38         o620
chdjko + h = c6h5oh            2.00e15  0.0    4440.0 !xiancma38         o619
c6h5oj+chdko=c6h5oh+c6h5oj     1.00e13  0.0   14000.0 !xian$2            o615
c6h5oj+c2h3cho=c2h3co+c6h5oh   2.00e12  0.0   13300.0 !abs               o614
!  benzene reactions
! Initiation:
c6h6 + o2 = c6h5 + ho2      6.31e13   0.0   67832.0 !boz                 o611
c6h6 = c6h5 + h             1.67e16   0.0  111500.0 !90rit/boz     [03]  c 75
!Abstraction:
c6h6 + oh = c6h5 + h2o      1.63e08  1.42    1451.0 !92bau/cob     [01] o570, 400-1500 K, uncertain=2
c6h6 + h = c6h5 + h2        2.00e13   0.0   18600.0 !90rit/boz     [03]  c 76
!c6h6 + h = cyhx13n5j           1.24e53 -12.16  18310.0 !ncd041             c 80
!c6h6 + h = ch2cy24pd        4.57e32  -5.26  23750.0 !ncd041             c 78
! leave this addition and dissociation step: (note not included in 6/28/02 analyis below)
c6h6 + h = linc6h7          1.22e22  -1.87  31200.0 !90rit/boz     [03]  c 77
!benzene+oh mech add, Chen and Bozzelli, 12/2001, from chemaster input file, oh_bz1b.inp in dosfiles/chemaster, 6/28/02:
!little variation with pressure for 1100K and above.
! c6h6+oh = c6h5oh+h         4.99e+08    1.31     6543.     !  1.00e+00 atm,  500-2400 k,   3% err                   
 c6h6+oh = c6h5oh+h         8.21e+13   -0.13    10673.     !  1.00e+01 atm,  500-2400 k,  10% err                   
! c6h6+oh = c6h5oh+h         6.68e+20   -2.02    16758.     !  1.00e+02 atm,  500-2400 k,  11% err                   
!benzene+h mech add, from chemaster input file, h_bz1c.inp in dosfiles/chemaster, 7/1/02:
! c6h6+h  = cyhx13n5j         1.20+125  -33.66    55212.     !  1.00e+00 atm,  700-2000 k,   5% err                   
! c6h6+h  = cyhx13n5j         4.98+128  -34.47    59329.     !  3.00e+00 atm,  700-2000 k,   8% err                   
!cvn re-fitting: c6h6+h  = cyhx13n5j         3.27+130  -34.75    62718.     !  1.00e+01 atm,  700-2000 k,  16% err  
! EJS May06 - duplicate with that found in chx                 
!  c6h6+h  = cyhx13n5j     5.36E+11   -0.329   -6000.  !  1.00e+01 atm
! c6h6+h  = cyhx13n5j         2.40+129  -34.20    64174.     !  3.00e+01 atm,  700-2000 k,  26% err                   
! c6h6+h  = cyhx13n5j         3.33+124  -32.58    63531.     !  1.00e+02 atm,  700-2000 k,  38% err                   
! Rate to fulvene does not change much with pressure at 1300K and above.  
! Channel only starts to contribute 1% or more compared to cyhx13n5j channel for 1300K and above:
! c6h6+h = fulvene+h       6.42e+26   -3.25    46515.     !  1.00e+00 atm,  700-2000 k,   7% err                   
! c6h6+h = fulvene+h       6.87e+27   -3.54    47297.     !  3.00e+00 atm,  700-2000 k,   6% err                   
 c6h6+h = fulvene+h       8.43e+32   -4.95    51244.     !  1.00e+01 atm,  700-2000 k,   3% err                   
! c6h6+h = fulvene+h       8.23e+42   -7.71    59334.     !  3.00e+01 atm,  700-2000 k,   2% err                   
! c6h6+h = fulvene+h       3.04e+56  -11.42    71447.     !  1.00e+02 atm,  700-2000 k,   3% err                   
! *** need to add fulvene and associated rxns (use Marinov?)
! benzene+o mech add, from chemaster input file, o_bz1a.inp in dosfiles/chemaster, 7/1/02:
! rates are all pressure independent from 1 to 200 atm, except for channel to cyclopentadienyl 
! which shows some pressure dependence below 700K. Kept channel to cyclopentienyl even though it
! contributes slightly less than 1% of the c6h5o. + h channel because it gives two radicals.
! (note c6h5oj and chdjko are really resonant forms of the same radical)
 c6h6+o = c6h5oj + h      2.48e+14   -0.34     4674.     !  1.00e+00 atm,  500-2400 k,   1% err
! These next two channels contribute at most 1% of the above channel:                  
 c6h6+o = chdko           5.93e+16   -1.15    19560.     !  1.00e+00 atm,  500-2400 k,  14% err                   
 c6h6+o = cy13pd5j + hco  5.85e+16   -1.16    21416.     !  1.00e+00 atm,  500-2400 k,  15% err                   
!
!c6h6 + o = chdjko + h       1.68e13 -0.01    2120.0 !ncdc31              o569
c6h6 + ho2 = c6h5 + h2o2      7.50E+03  2.5    27619.0    ! Scott and Walker, Comb. Flame 2002
! missing some c6h5 consumption paths: see Richter and Howard
c6h5 + ho2 = c6h5oj+oh       3.00e13   0.0       0.0 !ncdc76              o567 
c6h5+cy13pd=c6h6+cy13pd5j   1.00e12   0.0       0.0 !try
!chemaster wed, Jan 3, 2001 from Joe Bozzelli Case 1
! phjxo2lm, ave. barrier to phenoxy + o (Ea=41.59 kcal)
! high press rate to:    PHOJ+O    1.6436E+12     0.81800   0.0    41.59 
! 1 atm rates:
!c6h5 + o2  = c6h5o2       6.91e+132  -36.41    49920.     !  1.00e+00 atm,  600-2500 k,  42% err          
!c6h5 + o2  = yoc6jdo      5.98e+32   -6.20    20953.     !  1.00e+00 atm,  600-2500 k,  17% err          
!c6h5 + o2  = c6h5oj+o     1.26e+35   -5.92    20501.     !  1.00e+00 atm,  600-2500 k,  18% err          
!c6h5 + o2  = rodc6jdo     6.59e+35   -6.36    17797.     !  1.00e+00 atm,  600-2500 k,  27% err          
!c6h5 + o2  = cy13pd5j+co2 1.70e+33   -5.96    18648.     !  1.00e+00 atm,  600-2500 k,  21% err          
!c6h5o2      = c6h5oj+o    9.59e+80  -19.82    79043.     !  1.00e+00 atm,  600-2500 k,  38% err          
!c6jyoo     = c6h5o2       6.21e+79  -19.17    75366.     !  1.00e+00 atm,  600-2500 k,  38% err          
!c6jyoo     = yoc6jdo      1.70e+79  -19.20    75382.     !  1.00e+00 atm,  600-2500 k,  38% err          
!yoc6jdo    = rodc6jdo     3.91e+41   -9.00    36324.     !  1.00e+00 atm,  600-2500 k,  19% err          
! 8.5 atm rates:
c6h5 + o2  = c6h5o2       5.67e+132  -35.91    53659.     !  8.50e+00 atm,  600-2500 k,  49% err          
c6h5 + o2  = yoc6jdo      5.14e+39   -8.05    28271.     !  8.50e+00 atm,  600-2500 k,  16% err          
c6h5 + o2  = c6h5oj+o     8.21e+41   -7.74    27770.     !  8.50e+00 atm,  600-2500 k,  17% err          
c6h5 + o2  = rodc6jdo     6.46e+41   -7.94    24808.     !  8.50e+00 atm,  600-2500 k,  22% err          
c6h5 + o2  = cy13pd5j+co2 2.41e+40   -7.86    26448.     !  8.50e+00 atm,  600-2500 k,  19% err          
c6h5o2      = c6h5oj+o    7.51e+67  -15.72    73699.     !  8.50e+00 atm,  600-2500 k, 109% err          
c6jyoo     = c6h5o2       5.49e+80  -19.18    75390.     !  8.50e+00 atm,  600-2500 k,  38% err          
c6jyoo     = yoc6jdo      1.51e+80  -19.21    75405.     !  8.50e+00 atm,  600-2500 k,  38% err          
yoc6jdo    = rodc6jdo     3.99e+40   -8.44    37964.     !  8.50e+00 atm,  600-2500 k,   9% err          
!
c6h5 + oh = c6h5oh          3.00e13   0.0       0.0 !recomb 1.6e13       o562
c6h5 + o = cy13pd5j + co    3.65e07   1.89  -1770.0 !ncd061              o561
!  rodc6jdo consumption:
o*cc*cc*cj + co = rodc6jdo 1.51e11 0.0 4810.0 !86tsa/ham for c2h3+co=c2h3co
! cyclopentene radical reactions:
cyc5h7_1 + o2 = c*occcjc*o      8.00e24 -3.8   20000.0 !scmcp14           o556
cyc5h7_1 + oh = cy13pd + h2o   2.42e13  0.0       0.0 !as c3h7+oh   [15] o555
cyc5h5oh + ho2=h2o2+cyc5h4oh   3.61e03  2.55  10531.0 !90tsa        [34] o554
cyc5h5oh + ho2=h2o2+cyc5h5oj   1.00e13  0.0   15800.0 !abs  ?            o553
cyc5h5oh + oh =h2o+ cyc5h4oh   5.48e12  0.0    1731.0 !as ch3oh     [20] o552
cyc5h5oh + oh =h2o+ cyc5h5oj   1.00e13  0.0    1697.0 !as ch3oh     [25] o551
cyc5h5oh + o = oh + cyc5h4oh   4.17e11  0.0       0.0 !as c2h5oh    [13] o540
cyc5h5oh + o = oh + cyc5h5oj   1.00e13  0.0    4683.0 !as ch3oh     [25] o539
cyc5h5oh + h = h2 + cyc5h4oh   3.15e12  0.0       0.0 !h&c3h6,3,allara   o538
cyc5h5oh + h = h2 + cyc5h5oj   4.00e13  0.0    6094.0 !as ch3oh     [25] o537  
cyc5h4oh = cypdone + h         1.00e13  0.0   47450.0 !bata              o534 
! cyclopentadiene reactions:
cy13pd+hco=cy13pd5j+ch2o       7.2e6    1.9   1.701e4 !WJP based on c3h6+hco, A-factor x 2/3, TSANG, J. Phys. Chem. Ref. Data 20,221-273 (1991)
cy13pd+ho2=cy13pd5j+h2o2       4.00e12  0.0   15900.0 !ho2 abs           o533
cy13pd+o2=cy13pd5j+ho2         4.00e13  0.0   37150.0 !o2addrh           o532
cy13pd+oh=cy13pd5j+h2o         3.12e06  2.00   -298.0 !91tsa             o519
cy13pd + o = cy13pd5j + oh     6.03e10  0.7    7633.0 !as c3h6+o    [15] o518
cy13pd + o = c5h5o1_1 + h      9.39e12 -0.04    150.0 !ncd102
c5h5o1_1 = cypdone + h         2.94e32 -6.5   21220.0 !as ncd105
cy13pd5j+c2h3cho=c2h3co+cy13pd 1.00e13  0.0    8843.0 !as ch3+ch2o       o515
cy13pd5j+ho2=cyc5h5oj+oh       1.84e37 -6.8   16910.0 !ncdc50  new       o514
cy13pd5j+ho2=cpdooh            1.99e68 -17.17 19570.0 !ncdc50  new       o513
cy13pd5j+o2=o*cjc*ccc*o        2.05e13 -1.01   4280.0 !ncd024            o512
cy13pd5j+o2=o*cc*ccjc*o        6.11e17 -2.25   8390.0 !ncd024, p. 304    o511
cy13pd5j+o2=c*cc*c*o+hco       6.77e24 -3.95  17620.0 !ncd024            o510
cy13pd5j + oh = cyc5h5oh       1.24e14 -0.57      0.0 !5xch3+ic3h7  [33] o509
cy13pd5j + o = c*cc*cj + co    1.51e14 -0.29    350.0 !ncd105            o508
cy13pd5j + o = cypdone + h     2.99e13  0.05      0.0 !ncd105            o507
cy13pd5j + o = cyc5h5oj        3.20e-8  4.71 -12990.0 !ncd105            o506
cyc5h5oj=c*cc*cj+co            1.07e79 -19.62 66250.0 !ncd105            o536
cyc5h5oj=cypdone+h             2.94e32 -6.5   21220.0 !ncd105            o535
cpdooh = cyc5h5oj + oh         2.88e76 -18.42 75720.0 !ncdc50            o505
cypdone+h=co+c*cc*cj           2.13e61 -13.27 40810.0 !ncd176            o504
cypdone+h=o*cjc*cc*c            1.60e65 -14.94 36980.0 !ncd176            o503
cypdone+oh=h2o+cpdjone         5.30e07  1.42   1451.0 !as c6h6           o502
cpdjone+o2=co2+cj*cc*c*o       9.67e58 -13.47 38180.0 !ncdc72            o501
c2h2+hcco=cj*cc*c*o            3.16e11   0.0   6000.0 ! WJP analogy with c2h2+c2h3 (Benson, IJCK 21, 233 (1989))
! c5 linear oxygenates
c*occcjc*o+o2=c*occc*o+o*choj    6.29e05  1.65  17480.0 !as scmcp20        o446 
o*cc*cc*cj=c2h2+cj*cc*o        3.00e13  0.0   43710.0 !ncdc34            o445 
o*cc*cc*cj+o2=o*cc*cc*o+hco    5.42e12   0.0      0.0 !WJP: 92bau/cob analogy with c2h3+o2
o*cc*ccjc*o+o2=hcohco+c*ocjc*o   2.78e08 -0.07  13940.0 !ncd113            o444 
o*cc*ccjc*o+o2=o*cc*cc*o+o*choj   1.62e09 -0.03  18800.0 !ncd113            o443
o*cc*ccjc*o+h=c*oc*ccj+hco       2.18e58 -12.39 33110.0 !ncdc60            o442
o*cc*ccjc*o=o*cjc*ccc*o          8.90e22 -3.54  23480.0 !ncd024            o441
o*cjc*ccc*o+o2=c*occjc*o+co2     1.00e30 -5.43  16210.0 !ncd119            o440
o*cjc*ccc*o+o2=cyc4h5o21+co2     1.90e36 -7.7   13760.0 !ncd119, p322      o439
o*cjc*ccc*o+o2=c*ccco2j +co2     2.24e11 -1.07   8880.0 !ncd119            o438
c*occ*cj+co=o*cjc*ccc*o          1.50e11  0.00   4800.0 !WJP: analogy with nc3h7+co, from ic8_2a.mec
o*cjc*ccc*o+o =c*occ*cj +co2     1.50e14  0.0       0.0 !est/but/kar       o437
c*ccjc*c + o2 =c2h3cho +ch2cho 1.23e36 -7.25  33600.0 !ncd117            o434
c*cc*ccj + o2 = c2h3chcho+ch2o  8.16e10  0.18   9140.0 !ncdc66            o433 
!use prf: c2h3chcho + ho2 = c2h3cho + hco + oh 3.5e12  0.00 -1.0e3 !WJP: analogy with c3h5-a+ho2=c3h5o+oh, followed by c3h5o=c2h3+ch2o
c2h3chcho + ho2 = hcohco + c2h3 + oh 3.5e12  0.00 -1.0e3 !
o*cjc*cc*c = c*cc*cj + co       7.11e51 -11.89 43810.0 !ncd105            o430
o*cjc*cc*c + o = c*cc*cj + co2  1.00e10  0.0       0.0 !try (Zhong's thesis)
o*cjc*cc*c + h = c*cc*cj + hco  1.00e12  0.0       0.0 !try (Zhong's thesis)
!    c4 oxygenates
!o*cc*cc*o oxidation
o*cc*cc*o+h=o*cc*ccj*o+h2         2.64e+13 0.00 3.300e+03!WJP analogy with c2h3cho
o*cc*cc*o+o=o*cc*ccj*o+oh         1.19e13 0.00 1.868e+03 !WJP analogy with c2h3cho
o*cc*cc*o+oh=o*cc*ccj*o+h2o       1.85e7 1.5 -960.0      !WJP analogy with c2h3cho
o*cc*cc*o+ch3=o*cc*ccj*o+ch4      5.22e+06 1.78 5.911e+03!WJP analogy with c2h3cho
o*cc*cc*o+ho2=o*cc*ccj*o+h2o2     6.02e12 0.00 1.193e+04 !WJP analogy with c2h3cho
o*cc*cc*o+ch3o2=o*cc*ccj*o+ch3o2h 6.02e12 0.00 1.193e+04 !WJP analogy with c2h3cho
!coc*ccjo consumption:
cj*cc*o+co=o*cc*ccj*o          1.51e11   0.0   4810.0 !WJP 86tsa/ham for c2h3+co=c2h3co
c*oc*ccj+o2=ch2o+c*ocjc*o      7.18e49 -11.41 39820.0 !ncdc67            o414
c*oc*ccj+o=hco+c2h3cho         1.00e14  0.0       0.0 !est               o413 (fair amount of throughput in benzene oxidation, this is the only consumption step.)
c*ccco2j = c3h5-a + co2        1.00e13  0.0    6000.0 !bata              o410
c*occjc*o+o2=c*occ*o + o*choj   6.29e05  1.65  17480.0 !scmcp20           o399
c*occjc*o=c2h3cho+hco          1.44e34 -6.77  33260.0 !ncd138            o398
c*occjc*o=cyc4h5o21            3.34e05  1.41  36780.0 !ncd138            o397
c*occc*o+h=h2+c*occcj*o        2.29e10  1.05   3279.0 !as ch2o+h    [01] o396
c*occc*o+oh=h2o+c*occcj*o      3.49e09  1.18   -447.0 !as ch2o+oh   [29] o395
c*occcj*o+o2=c2h4+dhco2j       1.61e45 -9.92  20670.0 !ncdc59            o394
ch2ch2cho+co=c*occcj*o         1.50e11  0.00   4800.0 !WJP: analogy with nc3h7+co, from ic8_2a.mec
c*occ*cj+o2=c2h3cho+o*choj      1.47e03  2.25    650.0 !scmcp18           o391
c*occ*cj+o2=c*occ*o+hco         5.42e12   0.0      0.0 !WJP: 92bau/cob analogy with c2h3+o2
c*cc*c*o+oh=cj*cc*c*o+h2o      2.02e13  0.0    5933.0 ! analogy with c2h4+oh.
! wjp: lumped all the abstraction reactions for vinylic H to the radical cj*cc*c*o
! since it is the only of 3 possible in the mechanism.
c*cc*c*o+h=c*cccj*o            1.69e07  1.03   -550.0 !ncd133            o390
c*cc*c*o+h=c3h5-a+co           6.60e13 -0.02   2740.0 !ncd133            o389
c*cccj*o = co+ c3h5-a          6.12e05  0.92  -1120.0 !ncd133            o385
c4h6 + oh = c*cc*cj + h2o      8.43e12  0.0    -874.0 !88liu/mul         o384
c*cc#c + o = cj*c*o + c2h3     1.00e13  0.0       0.0 !est               o383 (a lot of rxn throughput here when the fuel is benzene.  We probably need more rxns to consume c*cc#c
c*cc*cj + o2 = c2h3cho +hco    3.32e24 -3.67   6190.0 !ncd120            o382
!    c3 oxydation
c*occ*o + o = ch2cho + o*choj   6.00e12  0.0       0.0 !est               o380
c*ocjc*o + o2 = hcohco +o*choj  4.12e13 -0.46  21710.0 !scmcp12           o379
!cj*cc*o oxidation
cj*cc*o=c2h3co                1.4e9  0.98   32100.0 !Eabs=12.7-(28.2*0.37) RS=29.8 (tab A.1 Benson for cycbutene) Afactor: Table 2, nhept paper
!c2h2+hco=cj*cc*o              6.0e11  0.0  7.75e3  !Bau/cob94 for c2h2+ch3=c2h2ch3
c2h2+hco=cj*cc*o               7.77e6 1.41 7755.0 ! Analogy with c2h2+ch3, Kislitsyn, Slagle and Knyazev, 29th Symp, 2002, 300-3000K.    
cj*cc*o+o2=hcohco+hco         5.42e12   0.0      0.0 !WJP: 92bau/cob analogy with c2h3+o2
c3h5-a + oh = c3h4-a + h2o    6.03e12   0.0       0.0 !91tsa         [08]  o305 (Add this to all LLNL mechs)
dhco2j=co2+o*choj             3.00e13   0.0    4000.0 !bata scission       o302
! c2 oxydation
c*ocjoh+o2=o*choj+hocho       2.82e22  -3.68  11660.0 !ncd034, P. 223 of Zhong's thesis
cj*c*o + o2 = co2 + hco     2.68e28  -4.8    6890.0 !ncdc27              o291
hcohco = hco + hco          9.01e14   0.0   64100.0 !dscp301             o260
hcohco + o2 = ho2 + hcocj*o 6.03e13   0.0   39900.0 !as ch2o+o2    [01]  o259
hcohco + oh = h2o+hcocj*o   3.43e09   1.18   -447.0 !as ch2o+oh    [01]  o258
hcohco + o = oh + hcocj*o   4.16e11   0.57   2762.0 !as ch2o+o     [01]  o257
hcohco + h = h2 + hcocj*o   2.29e10   1.05   3279.0 !as ch2o+h     [01]  o256  
hcocj*o + o2 = o*choj + co2   7.27e25  -3.97   6890.0 !ncd150              o255
hcocj*o = co + hco          4.20e12   0.0   10800.0 !bata 93boz/dea      o254
!  c1 oxidation   
! o*choj reactions:
o*choj + o = oh + co2        6.00e12   0.0       0.0 !as c3h5+oh    [08]  o250
o*choj + oh = h2o + co2      6.00e12   0.0       0.0 !as c3h5+oh    [08]  o249
o*choj = co2 + h             1.75e12   0.307 32920.0 !88lar/ste     [32]  o248   
! Include reactions not in LLNL c1-c4 mech, but in LLNL oxygenated fuel mechs.
ch3oco = ch3o+co 5.831E+12   0.00  1.928E+04  !from Curran et al. methyl formate mechanism, and Pitz et al. dibutyl maleate mech.
          rev/ 1.500E+11   0.00  4.800E+03 /
ch3oco = ch3+co2 1.185E+12  -0.03  1.262E+04 
          rev / 1.500E+11   0.00  3.520E+04 / !from Curran et al. methyl formate mechanism, and Pitz et al. dibutyl maleate mech.
c6h5ch2j+cy13pd=cy13pd5j+c6h5ch3 2.50e11  0.0  5000.0 !abs               c110
ch3cy24pd+ch3=ch4+cpdjch3   2.50e11   0.0    5000.0 !abs                 c104
ch3cy24pd+ch3=ch4+ch2cy24pd 2.50e11   0.0    6000.0 !abs                 c103
ch3cy24pd+h=h2+ch2cy24pd    1.20e14   0.0    8000.0 !as tol+h      [16]  c102
cyc5h4ch3+h2=ch3cy24pd+h    2.00e13   0.0   46000.0 !90rit/boz     [03]  c101
! only reaction for styrene radical, leave in, in case we add more
c6h6+c2h3=styr+h            7.94e11   0.0    6400.0 !89fah/ste           c 83
! cyclopentene reactions
cyc5h8 + h = cyc5h9         4.11e47  -11.49  8490.0 !ncd029              c 74
cyc5h8 + h = c3h5-a + c2h4  1.28e27   -4.07 11800.0 !ncd029              c 73
cyc5h8 = cyc5h7_1 + h       5.00e15   0.0   84170.0 !85dean        [11]  c 72
cyc5h7_1 + h2 = cyc5h8 + h  1.08e05   2.38  19000.0 !as c3h5+h2    [08]  c 71
!  cyclopentadiene pyrolysis
cy13pd+cy13pd=dicypd        1.00e13   0.0   31250.0 !try                 c 70
cy13pd+cy13pd5j=ind+ch3     3.22e15  -1.37  16710.0 !ncd082              c 66
cy13pd+c*cc*cj=c4h6+cy13pd5j 3.00e12  0.0  6000.0 !abs                 c 65
cy13pd+c3h5-a=c3h6+cy13pd5j 6.00e12   0.0   12000.0 !abs                 c 64
cy13pd+c2h3=c6h6+ch3        2.12e67 -16.08  42640.0 !ncd116              c 63
cy13pd+c2h3=cy13pd5j+c2h4   1.20e-01  4.0       0.0 !dean mech           c 62
cy13pd+ch3=ch4+cy13pd5j     1.80e-1   4.0       0.0 !dean est            c 61
cy13pd + h = cyc5h7_1       6.00e-1   2.78 -12460.0 !ncd007              c 60
cy13pd + h = c2h2 + c3h5-a  1.64e36  -5.99  32500.0 !ncd007              c 59
cy13pd + h = c*ccjc*c       1.40e14  -0.18   3150.0 !ndc007              c 58
cy13pd + h = h2 + cy13pd5j  1.30e06   2.4    4471.0 !as c3h8+h->   [15]  c 57
cy13pd = cy13pd5j + h       5.96e14   0.0   75100.0 !dsa15 
!cy13pd5j+cy13pd5j=naph+h2   5.00e13   0.0   22000.0 !est                 c 55
!cy13pd5j+cy13pd5j = bicpdj+h  4.87E+53  -12.34    49703.    !  1.00E+00 atm,  700-2400 K,  11% err        
cy13pd5j+cy13pd5j = bicpdj+h  6.39E+63  -15.10    58777.     !  8.50E+00 atm,  700-2400K, 18% err 
!cy13pd5j+cy13pd5j = bicpd  3.84e+148  -40.68    62839.     !  1.00E+00 atm,  700-2400 K,  39% err          
cy13pd5j+cy13pd5j = bicpd  1.84e+150  -40.75    67789.     !  8.50E+00 atm,  700-2400 K,  36% err           
! use cypd as model for abstraction rxns for bicpd
bicpd+o2=bicpdj+ho2         4.00e13  0.0   37150.0 !o2addrh  o532; analogy with cypd
bicpd+oh=bicpdj+h2o         3.12e06  2.00   -298.0 !91tsa  o519; analogy with cypd
bicpd+o=bicpdj+oh           6.03e10  0.7    7633.0 !as c3h6+o  [15] o518; analogy with cypd
bicpd+h= bicpdj+h2          1.30e06  2.4    4471.0 !as c3h8+h-> [15]  c 57; analogy with cypd
bicpd+ho2=bicpdj+h2o2       4.00e12  0.0   15900.0 !ho2 abs  o533; analogy with cypd
bicpd+ch3=bicpdj+ch4        1.80e-1   4.0      0.0 !dean est c 61; analogy with cypd
bicpdj =naph + h            3.0e11 0.0  2.0e4 ! bozzelli, 12/28/00
cy13pd5j+c3h6=cpdc*c+ch3    1.49e11  -0.06  29790.0 !ncd023              c 54
cy13pd5j + c2h3 = cpdc*c    4.82e13   0.0       0.0 !as c3h5+c2h3 91tsa  c 53
! no consumption reactions for cpdc*c
cy13pd5j + ch3 = ch3cy24pd  6.25e48 -10.44  19130.0 !ncd021              c 52
cy13pd5j + ch3=h+cyc5h4ch3  1.00e78 -18.21  62870.0 !ncd021              c 51
! cyclohexandienyl
cyhx13n5j + h = c4h6 + c2h2    6.50e13   0.0       0.0 !boz est             c 88
cyhx13n5j = linc6h7            3.0e13    0.0   46400.0 !Bozzelli, 2003 estimate
linc6h7 = c*cc*cj + c2h2    5.50e14   0.0   41000.0 !90rit/boz     [03]  c 42
! (add linc6h7 + o2 = ch2o + c*cc*cc*o o*cc*cc*c if significant linc6h7 is formed.  o*cc*cc*cj is already in the mech.)
! linear species pyrolysis
! c*cc*cc rxns
c*cc*cc+h = c4h6 + ch3      5.20e71  -16.38 51060.0 !ncd008              c 41
c*cc*ccj+h2 = h + c*cc*cc   1.08e05   2.38  18990.0 !as c3h5 91tsa [08]  c 40
c*cc*ccj+h = c*cc*cc        2.33e20  -1.6    3020.0 !ncd005              c 39
c*cc*ccj+h = c*cc*cj + ch3  2.91e26  -2.18  36770.0 !ncd005              c 38
c*ccjc*c = c*cc*ccj         5.35e11  -0.7      60.0 !ds001               c 37
!c4h6 = c2h3 + c2h3         1.18e56 -11.16 132360.0 !ncd004              c 36
c*cc*cj+c2h4= c4h6+c2h3     6.31e11   0.0    7800.0 !81ker/mos     [13]  c 35
c*cc*cj + h2 = h + c4h6     3.90e09   0.5    3704.0 !88wei/bon     [12]  c 34
c*cc*cj + h = c4h6          1.13e45  -9.05  15830.0 !ncd004              c 33
c*cc*cj + h = c2h3 + c2h3   3.91e46  -8.66  32250.0 !ncd004              c 32
c*cc*cj = c2h2 + c2h3       1.00e14   0.0   43890.0 !85dea         [11]  c 31
c*cc#c + h = c*cc*cj        5.50e12   0.0    2400.0 !85dea         [11]  c 30
! Add reactions needed to treat soot precursor species:
! c3h3 reactions:
! 30 torr    
!c3h3+c3h3=c6h5+h       1.05E+54  -11.88 2.876E+04 ! 30 torr, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=fulvene      6.31E+76  -19.07 3.154E+04 ! 30 torr, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=c*cc(c#c)*c  1.32E+77  -19.00 3.333E+04 ! 30 torr, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=c6h6         1.82E+74  -18.14 3.190E+04 ! 30 torr, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=fulvene    5.75E+76  -18.67 9.553E+04 ! 30 torr, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=c6h6       6.76E+98  -24.58 1.223E+05 ! 30 torr, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=c6h5+h     2.69E+84  -20.14 1.219E+05 ! 30 torr, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!fulvene=c6h6           5.75E+81  -19.36 1.215E+05 ! 30 torr, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!fulvene=c6h5+h         2.57E+97  -23.61 1.535E+05 ! 30 torr, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c6h6=c6h5+h            1.35E+108 -25.81 1.818E+05 ! 30 torr, 1300-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
! 1 atm    
!c3h3+c3h3=c6h5+h       1.70E+48  -9.98 3.676E+04 ! 1 atm, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=fulvene      1.38E+66 -15.66 2.826E+04 ! 1 atm, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=c*cc(c#c)*c  4.89E+60 -14.02 2.573E+04 ! 1 atm, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c3h3+c3h3=c6h6         3.16E+55 -12.55 2.226E+04 ! 1 atm, 900-2200K,  Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=fulvene    2.34E+56 -12.55 8.641E+04 ! 1 atm, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=c6h6       1.62E+53 -11.34 1.002E+05 ! 1 atm, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c*cc(c#c)*c=c6h5+h     4.17E+77 -17.68 1.335E+05 ! 1 atm, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!fulvene=c6h6           1.45E+45  -8.90 9.700E+04 ! 1 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!fulvene=c6h5+h         2.24E+68 -14.65 1.426E+05 ! 1 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
!c6h6=c6h5+h            6.31E+60 -12.40 1.481E+05 ! 1 atm, 1300-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
! 10 atm:    
c3h3+c3h3=c6h5+h       3.67E+26  -3.88  2.896E+04 ! 10 atm, 800-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
c3h3+c3h3=fulvene      1.26E+56 -12.61  2.352E+04 ! 10 atm, 800-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
c3h3+c3h3=c*cc(c#c)*c  1.48E+55 -12.30  2.362E+04 ! 10 atm, 800-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
c3h3+c3h3=c6h6         3.89E+50 -11.01  2.032E+04 ! 10 atm, 800-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
c*cc(c#c)*c=fulvene    4.90E+26  -4.14  6.542E+04 ! 10 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
c*cc(c#c)*c=c6h6       2.82E+51 -10.68  1.070E+05 ! 10 atm, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2004
c*cc(c#c)*c=c6h5+h     3.09E+43  -7.93  1.187E+05 ! 10 atm, 1200-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2005
fulvene=c6h6           2.95E+31  -4.97  8.847E+04 ! 10 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2006
fulvene=c6h5+h         8.51E+24  -2.51  1.133E+05 ! 10 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2007
! decide on whether to use NJIT rate or Miller-Klippenstein rate
!c6h6=c6h5+h            5.50E+38  -6.18  1.320E+05 ! 10 atm, 1100-2000K, Miller and Klippenstein, submitted to J. Phys. Chem. A, 2003
! to do:
! add n-c4h3(c#cc*cj)(chcchch)(hcchcch, Marinov) +c2h2 rxns to form benzene (McEnally and Pfefferle)
! n-c4h3(c#cc*cj, hcchcch) rxns to make benzene, phenyl
! hcchcch+c2h2=c6h5           9.60E+70 -17.77 31300.! Wang   1994 (also in Marinov 1998)
! reactions to form n-c4h3(c#cc*cj, hcchcch)
!
! fulvene: (from Marinov et al., n-Butane Flame, Combustion Flame 114, 192-213 (1998))
! This is duplicate to Bozzelli's rate.  Bozzelli's rate has a high activation energy
! of about 40 kcal and Marinov's rate has 2kcal Ea!
! fulvene+h=c6h6+h                        3.00E+12   0.5  2000.0 !Marinov 1998
fulvene+h=fulvenyl+h2                   3.03E+2    3.3   5690. !Marinov 1998
fulvene+oh=fulvenyl+h2o                 1.63E+8   1.42   1454. !Marinov 1998
fulvenyl+h=c6h5+h                       1.00E+14   0.0   0.0   !Marinov 1998
fulvenyl+o2=cypdone+hco                 1.00E+12   0.0   0.0   !Marinov 1998
! need any more c3h3 forming rxns?
!
!----------------------- MCH Reactions ---------------------------------------
!updated using mch_hitT_v4.mch
c7h14gl = mch 1.0e08 0.86 0 !3.162277e11 0.0 0.0 !2.80317e07 1.0 0.0 !calculated
c7h14af = mch 1.0e08 0.86 0 !3.162277e11 0.0 0.0 !2.80317e07 1.0 0.0 !calculated
c7h1416 = mch 1.0e08 0.86 0 !3.162277e11 0.0 0.0 !4.65578e07 1.0 0.0 !calculated
chxrad + ch3 = mch 6.63e14 -0.57 0.0 !henrys value for radical recombination 6.63e14

!mch = c7h14gl 1.253e16 0.0 86042
!mch = c7h14af 1.253e16 0.0 86042
!mch = c7h1416 2.512e16 0.0 82457
!mch = chxrad + ch3 1.26e16 0.0 87954

! c6h11 = chxrad 1.0e08 0.86 5900 !2.75e08 1.0 6580 !calculated !! Listed in chx section. Same rate
ac7h13f = mchr1 1.0e08 0.86 5900 !2.74910e+08 1.0 6580 !calculated
gc7h13l = mchr2 1.0e08 0.86 5900 !2.74910e+08 1.0 6580 !calculated
c7h13 = mchr2 1.0e08 0.86 8700 !2.74910e+08 1.0 10130 !calculated
c7h13 = mchr3 1.0e08 0.86 8500 !2.74910e+08 1.0 6580 !calculated
kc7h13g = mchr3 1.0e08 0.86 5900 !2.74910e+08 1.0 6580 !calculated
ec7h13a = mchr4 1.0e08 0.86 5900 !2.74910e+08 1.0 6580 !calculated
! EJS May06 - duplicate with that in chx
! hx13en6j = cyhx1n3j 1.0e08 0.86 6900 !1.62326e+09 1.0 6580 !calculated
! hx14en6j = cyhx1n4j 1.0e08 0.86 6900 !1.62326e+09 0.0 6580 !calculated
c7h13 = cychexch2  1.0e08 0.86 1903 !4.65578e+07 1.0 9130 !calculated
x2c6h1016 = cychexene 1.0e08 0.86 1000 !2.7491e08 1.0 0.0 !calculated
x3c6h1016 = cychexene 1.0e08 0.86 1000 !2.7491e08 1.0 0.0 !calculated

!isomerisation rxns
ac7h13f =ac7h13c 3.67e12 -0.6 15300 !7.4131e11 0.0 21500 !1.95e+09 1.0 10002 !6200+4002 
!c7h13 = c7h13 2.8e10 0.0 7500 !3.162277e11 0.0 12770 !2.56866e+08 1.0 10002 !6200+4002
gc7h13l = gc7h13i 3.67e12 -0.6 13000 !7.4131e11 0.0 21500 !7.58358e+08 1.0 8530 !6200+2330
!c7h13 = c7h13 3.67e12 -0.6 15300 !7.4131e11 0.0 21500 !1.95468e+09 1.0 10002 !6200+4002
!c7h13 = c7h13 2.8e10 0.0 31640 !1.4125375e11 0.0 15140 !6.52530e+07 1.0 11875 !5675+6200
!c7h13 = c7h13 3.67e12 -0.6 17900 !7.4131e11 0.0 21500 !1.51672e+09 1.0 10002 !6200+4002
kc7h13g = kc7h13j 3.67e12 -0.6 15300 !7.4131e11 0.0 21500 !1.17688e+09 1.0 10002 !6200+4002
ec7h13a = ec7h13d 3.67e12 -0.6 15300 !7.4131e11 0.0 21500 !1.17688e+09 1.0 11875 !5675+6200
!c7h13 = x3c7h132  equals via resonance
!c7h13 = c7h13  equals via resonance
!c6h11 = c6h11 3.67e12 -0.6 15300 !7.4131e11 0.0 21500 !1.95468e09 1.0 10002 !6200+4002

!newer rxn - not in previous verion
c7h1416 = c7h14-1 3.67e12 -0.6 15300 !3.162277e11 0.0 12770 !
duplicate
c7h1416 = c7h14-1 2.8e10 0.0 25875 !1.4125375e11 0.0 15140 !
duplicate
c7h1416 = c7h14-2 3.67e12 -0.6 12800 !3.162277e11 0.0 12770 !
c7h14af = ac7h14 3.67e12 -0.6 10500 !3.162277e11 0.0 12770
c7h14af = ec7h14 3.67e12 -0.6 12800 !3.162277e11 0.0 12770
c7h14gl = gc7h14 3.67e12 -0.6 12800 !3.162277e11 0.0 12770
c7h14gl = kc7h14 3.67e12 -0.6 12800 !3.162277e11 0.0 12770
!c5h9 = c5h9 3.67e12 -0.6 10000
!c5h9 = c5h9 3.56e10 0.88 31500 !46710


! h atom abstraction

mch + h = mchr1 + h2 6.02e05 2.40 2583
mch + h = mchr2 + h2 2.6e06 2.40 4471
mch + h = mchr3 + h2 2.6e06 2.40 4471
mch + h = mchr4 + h2 1.3e06 2.40 4471
mch + h = cychexch2 + h2 6.651e05 2.54 6756

mch + ch3 = mchr1 + ch4 6.01e-10 6.362 893
mch + ch3 = mchr2 + ch4 3.02 3.46 5481
mch + ch3 = mchr3 + ch4 3.02 3.46 5481
mch + ch3 = mchr4 + ch4 1.51 3.46 5481
mch + ch3 = cychexch2 + ch4 4.521e-01 3.65 7154

mch + o2 = mchr1 + ho2 1.0e13 0.0 48200
mch + o2 = mchr2 + ho2 4.0e13 0.0 49640
mch + o2 = mchr3 + ho2 4.0e13 0.0 49640
mch + o2 = mchr4 + ho2 2.0e13 0.0 49640
mch + o2 = cychexch2 + ho2 3.0e13 0.0 52290

mch + ho2 = mchr1 + h2o2 3.61e03 2.55 10532
mch + ho2 = mchr2 + h2o2 1.928e04 2.6 13910
mch + ho2 = mchr3 + h2o2 1.928e04 2.6 13910
mch + ho2 = mchr4 + h2o2 9.64e03 2.6 13910
mch + ho2 = cychexch2 + h2o2 2.3799e04 2.55 16494

mch + oh = mchr1 + h2o 5.733e10 0.51 63
mch + oh = mchr2 + h2o 9.34e07 1.61 -35
mch + oh = mchr3 + h2o 9.34e07 1.61 -35
mch + oh = mchr4 + h2o 4.67e07 1.61 -35
mch + oh = cychexch2 + h2o 5.268e09 0.97 1586

mch + ch3o = mchr1 + ch3oh 2.29e10 0.0 2873
mch + ch3o = mchr2 + ch3oh 2.9e11 0.0 4571
mch + ch3o = mchr3 + ch3oh 2.9e11 0.0 4571
mch + ch3o = mchr4 + ch3oh 1.45e11 0.0 4571
mch + ch3o = cychexch2 + ch3oh 2.1699e11 0.0 6458

mch + o = mchr1 + oh 3.830e5 2.41 1140
mch + o = mchr2 + oh 1.102e06 2.45 2830
mch + o = mchr3 + oh 1.102e06 2.45 2830
mch + o = mchr4 + oh 5.51e05 2.45 2830
mch + o = cychexch2 + oh 9.798e05 2.43 4750

x16c7h12 + h = x16c7h114 + h2 1.3e06 2.4 4471 !secondary
x16c7h12 + ch3 = x16c7h114 + ch4 1.51 3.46 5481 !secondary
x16c7h12 + o = x16c7h114 + oh 5.51e05 2.45 2830 !secondary
x16c7h12 + oh = x16c7h114 + h2o 4.67e07 1.61 -35 !secondary

ic5h8 + h = ic5h7 + h2 1.7298e5 2.5 2492 !allylp
ic5h8 + ch3 = ic5h7 + ch4 2.2098 3.5 5675 !allylp
ic5h8 + oh = ic5h7 + h2o 3.12e6 2.0 -298 !allylp
ic5h8 + ho2 = ic5h7 + h2o2 9.639e03 2.6 13910 !allylp
ic5h8 + ch3o = ic5h7 + ch3oh 90 2.95 11987 !allylp
ic5h8 + o = ic5h7 + oh 4.41e5 2.42 3150 !allylp
ic5h8 + o2 = ic5h7 + ho2 3.3e12 0.0 39900 !allylp

! EJS May06 - commenting out rxn set below, as they are duplicates with those generated in chx 
!
! cychexene + h = cyhx1n3j + h2 6.752e05 2.36 207 !(ax4) allyls
! cychexene + ch3 = cyhx1n3j + ch4 7.38 3.31 4002 !(ax4) allyls
! cychexene + o = cyhx1n3j + oh 1.32e06 2.43 1210 !(ax4) allyls
! cychexene + oh = cyhx1n3j + h2o 5.528e04 2.64 -1919 !(ax4) allyls
! cychexene + h = cyhx1n4j + h2 2.6e6 2.4 4471 !(ax4) s
! cychexene + ch3 = cyhx1n4j + ch4 3.02 3.46 5481 !(ax4) s
! cychexene + o = cyhx1n4j + oh 1.102e6 2.45 2830 !(ax4) s
! cychexene + oh = cyhx1n4j + h2o 9.34e07 1.61 -35 !(ax4) s

aec7h12 + h = aec7h11c + h2 3.376e5 2.36 207 !allyls
aec7h12 + h = aec7h11d + h2 3.376e5 2.36 207 !allyls
x15c7h12 + h = x15c7h113 + h2 3.376e5 2.36 207 !allyls
x15c7h12 + h = x15c7h114 + h2 3.376e5 2.36 207 !allyls
gkc7h12 + h = gkc7h11j + h2 3.376e5 2.36 207 !allyls
x14c5h8 + h = c*ccjc*c + h2 3.376e5 2.36 207 !allyls

aec7h12 + ch3 = aec7h11c + ch4 3.69 3.31 4002 !allyls
aec7h12 + ch3 = aec7h11d + ch4 3.69 3.31 4002 !allyls
x15c7h12 + ch3 = x15c7h113 + ch4 3.69 3.31 4002 !allyls
x15c7h12 + ch3 = x15c7h114 + ch4 3.69 3.31 4002 !allyls
gkc7h12 + ch3 = gkc7h11j + ch4 3.69 3.31 4002 !allyls
x14c5h8 + ch3 = c*ccjc*c + ch4 3.69 3.31 4002 !allyls

aec7h12 + o = aec7h11c + oh 6.6e05 2.43 1210 !allyls
aec7h12 + o = aec7h11d + oh 6.6e05 2.43 1210 !allyls
x15c7h12 + o = x15c7h113 + oh 6.6e05 2.43 1210 !allyls
x15c7h12 + o = x15c7h114 + oh 6.6e05 2.43 1210 !allyls
gkc7h12 + o = gkc7h11j + oh 6.6e05 2.43 1210 !allyls
x14c5h8 + o = c*ccjc*c + oh 6.6e05 2.43 1210 !allyls

aec7h12 + oh = aec7h11c + h2o 2.764e4 2.64 -1919 !allyls
aec7h12 + oh = aec7h11d + h2o 2.764e4 2.64 -1919 !allyls
x15c7h12 + oh = x15c7h113 + h2o 2.764e4 2.64 -1919 !allyls
x15c7h12 + oh = x15c7h114 + h2o 2.764e4 2.64 -1919 !allyls
gkc7h12 + oh = gkc7h11j + h2o 2.764e4 2.64 -1919 !allyls
x14c5h8 + oh = c*ccjc*c + h2o 2.764e4 2.64 -1919 !allyls

x15c6h10 + h = x15c6h93 + h2 6.752e05 2.36 207 !(ax4) allyls
x15c6h10 + ch3 = x15c6h93 + ch4 7.38 3.31 4002 !(ax4) allyls
x15c6h10 + o = x15c6h93 + oh 1.32e06 2.43 1210 !(ax4) allyls
x15c6h10 + oh = x15c6h93 + h2o 5.528e04 2.64 -1919 !(ax4) allyls

x16c7h12 + h = x16c7h113 + h2 6.752e05 2.36 207 !(ax4) allyls
x16c7h12 + ch3 = x16c7h113 + ch4 7.38 3.31 4002 !(ax4) allyls
x16c7h12 + o = x16c7h113 + oh 1.32e06 2.43 1210 !(ax4) allyls
x16c7h12 + oh = x16c7h113 + h2o 5.528e04 2.64 -1919 !(ax4) allyls

x15c7h12 + h = x15c7h117 + h2 1.7298e5 2.5 2492 !allylp
!use prf: c*cc*cc + h = c*cc*ccj + h2 1.7298e5 2.5 2492 !allylp
aec7h12 + h = aec7h11g + h2 1.7298e5 2.5 2492 !allylp

x15c7h12 + ch3 = x15c7h117 + ch4 2.2098 3.5 5675 !allylp
c*cc*cc + ch3 = c*cc*ccj + ch4 2.2098 3.5 5675 !allylp
aec7h12 + ch3 = aec7h11g + ch4 2.2098 3.5 5675 !allylp

x15c7h12 + o = x15c7h117 + oh 4.41e05 2.42 3150 !allylp
!c*cc*cc + o = c*cc*ccj + oh 4.41e05 2.42 3150 !allylp
aec7h12 + o = aec7h11g + oh 4.41e05 2.42 3150 !allylp

x15c7h12 + oh = x15c7h117 + h2o 3.12e06 2.0 -298 !allylp
!c*cc*cc + oh = c*cc*ccj + h2o 3.12e06 2.0 -298 !allylp
aec7h12 + oh = aec7h11g + h2o 3.12e06 2.0 -298 !allylp

gkc7h12 + h = gkc7h11m + h2 6.651e05 2.54 6756 !primary
gkc7h12 + ch3 = gkc7h11m + ch4 4.521e-1 3.65 7154 !primary
gkc7h12 + o = gkc7h11m + oh 9.798e05 2.43 4750 !primary
gkc7h12 + oh = gkc7h11m + h2o 5.268e09 0.97 1586 !primary

gkc7h12 + h = gkc7h11i + h2 2.65e6 2.2 0.0 !allylt
gkc7h12 + ch3 = gkc7h11i + ch4 4.613 3.1 2330 !allylt
gkc7h12 + oh = gkc7h11i + h2o 6.14e02 3.2 -3500 !allylt

!use prf: c7h14-1 + h = c7h13 + h2 3.376e05 2.36 207 !allyls
!use prf: c7h14-1 + ch3 = c7h13 + ch4 3.69 3.31 4002 !allyls
!use prf: c7h14-1 + oh = c7h13 + h2o 2.764e04 2.64 -1919 !allyls
c7h14-1 + ho2 = c7h13 + h2o2 4.82e03 2.55 10532 !allyls
c7h14-1 + ch3o = c7h13 + ch3oh 40 2.9 8609 !allyls
!use prf: c7h14-1 + o = c7h13 + oh 6.6e5 2.43 1210 !allyls
c7h14-1 + o2 = c7h13 + ho2 2.2e12 0.0 37220 !allyls

!use prf: c7h14-2 + h = c7h13 + h2 1.7298e05 2.5 2492 !allylp
!use prf: c7h14-2 + h = c7h13 + h2 3.376e05 2.36 207 !allyls
!use prf: c7h14-2 + ch3 = c7h13 + ch4 4.521e-01 3.65 7154 !allylp
!use prf: c7h14-2 + ch3 = c7h13 + ch4 3.69 3.31 4002 !allyls
!use prf: c7h14-2 + o = c7h13 + oh 4.41e05 2.42 3150 !allylp
!use prf: c7h14-2 + oh = c7h13 + h2o 3.12e06 2.0 -298 !allylp
!use prf: c7h14-2 + o = c7h13 + oh 6.6e05 2.43 1210 !allyls
!use prf: c7h14-2 + oh = c7h13 + h2o 2.764e04 2.64 -1919 !allyls

ac7h14 + h = ac7h13c + h2 3.376e05 2.36 207 !allyls
ac7h14 + ch3 = ac7h13c + ch4 3.69 3.31 4002 !allyls
ac7h14 + o = ac7h13c + oh 6.6e05 2.43 1210 !allyls
ac7h14 + oh = ac7h13c + h2o 2.764e04 2.64 -1919 !allyls

ec7h14 + h = ec7h13d + h2 3.376e05 2.36 207 !allyls
ec7h14 + ch3 = ec7h13d + ch4 3.69 3.31 4002 !allyls
ec7h14 + o = ec7h13d + oh 6.6e05 2.43 1210 !allyls
ec7h14 + oh = ec7h13d + h2o 2.764e04 2.64 -1919 !allyls

gc7h14 + h = gc7h13i + h2 2.65e6 2.2 0.0 !allylt
gc7h14 + ch3 = gc7h13i + ch4 4.613 3.1 2330 !allylt
gc7h14 + oh = gc7h13i + h2o 6.14e02 3.2 -3500 !allylt

kc7h14 + h = kc7h13j + h2 3.376e05 2.36 207 !allyls
kc7h14 + ch3 = kc7h13j + ch4 3.69 3.31 4002 !allyls
kc7h14 + o = kc7h13j + oh 6.6e05 2.43 1210 !allyls
kc7h14 + oh = kc7h13j + h2o 2.764e04 2.64 -1919 !allyls


! h atom beta scissioning off

! cychexene + h = chxrad 1.32e13 0.0 3260 !h add to inter c=c ! EJS - duplicate with rxn defined in chx
x15c6h10 + h = c6h11 1.32e13 0.0 3260 !h add to inter c=c 
!in wang c4h6 + h = c4h7 1.32e13 0.0 3260 !h add to int c=c 
c7h13 + h = c7h1416 1.32e13 0.0 3260 !h add to inter c=c 
dup
c7h13 + h = c7h1416 1.32e13 0.0 3260 !h add to inter c=c 
dup
x15c7h12 + h = c7h13 1.32e13 0.0 3260 !h add to inter c=c
dup
x15c7h12 + h = c7h13 1.32e13 0.0 3260 !h add to inter c=c
dup
x16c7h12 + h = c7h13 1.32e13 0.0 3260 !h add to inter c=c
dup
ec7h13a + h = c7h14af 1.32e13 0.0 3260 !h add to inter c=c
aec7h12 + h = ac7h13f 1.32e13 0.0 3260 !h add to inter c=c 
gc7h13l + h = c7h14gl 1.32e13 0.0 3260 !h add to inter c=c
kc7h13g + h = c7h14gl 1.32e13 0.0 3260 !h add to inter c=c
ic5h8 + h = ac5h9d 1.32e13 0.0 3260 !h add to inter c=c
gkc7h12 + h = gc7h13l 1.32e13 0.0 3260 !h add to inter c=c
gkc7h12 + h = kc7h13g 1.32e13 0.0 3260 !h add to inter c=c
x14c5h8 + h = c5h9 1.32e13 0.0 3260 !h add to inter c=c
!x14c5h8 + h = c5h9 1.32e13 0.0 3260 !h add to inter c=c
!c*cc*cc + h = c5h9 1.32e13 0.0 3260 !h add to inter c=c
c3h6 + c2h3 = cc5h9a 1.32e13 0.0 3260 !h add to inter c=c
x136c7h10 + h = x16c7h113 1.32e13 0.0 3260 !h add to inter c=c
x135c6h8 + h = x15c6h93 1.32e13 0.0 3260 !h add to inter c=c
x136c7h10 + h = x16c7h114 1.32e13 0.0 3260 !h add to inter c=c
x135c7h10 + h = x15c7h113 1.32e13 0.0 3260 !h add to inter c=c
x135c7h10 + h = x15c7h114 1.32e13 0.0 3260 !h add to inter c=c
x136c7h10 + h = x15c7h117 1.32e13 0.0 3260 !h add to inter c=c
acec7h10 + h = aec7h11c 1.32e13 0.0 3260 !h add to inter c=c
acec7h10 + h = aec7h11d 1.32e13 0.0 3260 !h add to inter c=c
! EJS May06 - duplicate with that found in chx
! cyhx13ene + h = cyhx1n3j 1.32e13 0.0 3260 !h add to inter c=c
x135c6h8 + h = hx13en6j 1.32e13 0.0 3260 !h add to inter c=c
x135c6h8 + h = hx14en6j 1.32e13 0.0 3260 !h add to inter c=c
hx14en6j + h = x2c6h1016 1.32e13 0.0 3260 !h add to inter c=c
hx13en6j + h = x3c6h1016 1.32e13 0.0 3260 !h add to inter c=c
! WJP: lump methyl cyclcohexene species into mche:
! divide 1.32e13 A-factor by 3 to account for the mche concentration
! being 3 times higher because it is a lumped species with 3 isomers.
mche + h = mchr1 4.4e12 0.0 3260 !h add to inter c=c
! mchr2 and mchr3 can be made by adding to either side of the double bond,
! so the rate is double:
mche + h = mchr2 8.8e12 0.0 3260 !h add to inter c=c
mche + h = mchr3 8.8e12 0.0 3260 !h add to inter c=c
mche + h = mchr4 4.4e12 0.0 3260 !h add to inter c=c
x13c6h10 + h = c6h11 1.32e13 0.0 3260 !h add to inter c=c
acc7h12 + h = ac7h13c 1.32e13 0.0 3260 !h add to inter c=c
x13c7h12 + h = c7h13 1.32e13 0.0 3260 !h add to inter c=c
gic7h12 + h = gc7h13i 1.32e13 0.0 3260 !h add to inter c=c
x24c7h12 + h = c7h13 1.32e13 0.0 3260 !h add to inter c=c
cec7h12 + h =ec7h13d 1.32e13 0.0 3260 !h add to inter c=c
! EJS May06 - duplicate with those found in chx
! cyhx13ene + h = cyhx1n4j 1.32e13 0.0 3260 !h add to int c=c 
! cyhx14ene + h = cyhx1n4j 1.32e13 0.0 3260 !h add to int c=c
!c*cc*cc + h = c5h9 1.32e13 0.0 3260

ac7h13f + h = c7h14af  1.32e13 0.0 4660 !h add to int  tert c=c
aec7h12 + h = ec7h13a  1.32e13 0.0 4660 !h add to int  tert c=c
ic5h8 + h = cc5h9a 1.32e13 0.0 4660 !h add to int  tert c=c
gkmc7h10 + h = gkc7h11m 1.32e13 0.0 4660 !h add to int  tert c=c
gikc7h10 + h = gkc7h11j 1.32e13 0.0 4660 !h add to int  tert c=c
metcychex + h = cychexch2 1.32e13 0.0 4660 !h add to int  tert c=c
! duplicate reaction, eliminate (WJP)
! mche + h = mchr2 1.32e13 0.0 4660 !h add to int  tert c=c
ikc7h12 + h = kc7h13j 1.32e13 0.0 4660 !h add to inter tert c=c

c7h13 + h = c7h1416 2.64e13 0.0 2160 !h add to ext c=c 
dup
x16c7h12 + h = c7h13 2.64e13 0.0 2160 !h add to ext c=c
dup
c*cc*cc + h = c5h9 2.64e13 0.0 2160 !h add to ext c=c
gkmc7h10 + h = gkc7h11i 2.64e13 0.0 2160 !h add to ext c=c
metcychex + h = mchr1 2.64e13 0.0 2160 !h add to ext c=c
gmc7h12 + h = gc7h13i 2.64e13 0.0 2160 !h add to ext c=c


! various rads containing carbon beta scissioning off

!use prf:c4h7 + c2h4 = c6h11 1.32e4 2.48 6130 !c rad add to ext c=c
c5h9 + c2h4 = c7h13 1.32e4 2.48 6130 !c rad add to ext c=c
!c5h9 + c2h4 = c7h13 1.32e4 2.48 6130 !c rad add to ext c=c

!new rxn
ac5h9d + c2h4 = ac7h13f 1.32e4 2.48 6130 !c rad add to ext c=c
cc5h9a + c2h4 = gc7h13l 1.32e4 2.48 6130 !c rad add to ext c=c
!use prf: c2h4 + c3h5-a = c5h9 1.32e4 2.48 6130 !c rad add to ext c=c
c2h4 + c3h5-s =c5h9 1.32e4 2.48 6130 !c rad add to ext c=c
c2h4 + c3h5-t = ac5h9d 1.32e4 2.48 6130 !c rad add to ext c=c
! EJS May06 - duplicate with that in chx
! c2h4 + c*cc*cj = hx13en6j 1.32e4 2.48 6130 !c=c rad or c-c rad add to ext c=c
c5h9 + c2h4 = kc7h13g  1.32e04 2.48 6130 !3.981071706e07 0.0 6900 !sec rad add to ext double bnd
!
! c5h1014 + c2h4 = c7h1416 1.32e04 2.48 6130 !c rad add to ext c=c 
! c7h1416 = c3h6 + c2h4 + c2h4 3.9e+12 0.46 29283 ! k is krev from RevAll. EJS 10oct06 But duplicate (rxn listed below already)
!
! c5h10ad + c2h4 = c7h14af 1.32e04 2.48 6130 !c rad add to ext c=c
! c7h14af = c3h6 + c2h4 + c2h4 3.71e+12 0.5 29271 ! k is krev from RevAll. EJS 10oct06 But duplicate (rxn listed below already)
!
! c5h1014 + c2h4 = c7h14gl 1.32e04 2.48 6130 !c rad add to ext c=c
! c7h14gl = c3h6 + c2h4 + c2h4 4.51e+14 0.03 29108 ! k is krev from RevAll. EJS 10oct06 But duplicate (rxn listed below already)
!
! c5h10ad + c2h4 = c7h14gl 1.32e04 2.48 6130 !c rad add to ext c=c
c7h14gl = c3h6 + c2h4 + c2h4 3.71e+12 0.5 29271 ! k is krev from RevAll. EJS 10oct06

!c2h4 + c3h6 + c2h4 = c7h1416 4.86e05 1.8 5580 !c rad add to ext c=c
!c3h4-a + c4h7 = x16c7h113 4.86e05 1.8 5580 !c rad add to ext c=c
!c4h6 + c3h5-a = x16c7h114 4.86e05 1.8 5580 !prim allyl rad add to ext c=c
!c3h4-a + ic4h7 = x15c7h113 4.86e05 1.8 5580 !prim allyl rad add to ext c=c
!c3h4-a + c3h5-a = x15c6h93 4.86e05 1.8 5580 !prim allyl rad add to ext c=c
!c2h4 + c2h4 + c3h6 = c7h14af 4.86e05 1.8 5580 !c rad add to ext c=c
!c2h4 + c3h6 + c2h4 = c7h14gl 3.981071706e07 0.0 6900 !sec rad add to ext double bnd

!use prf: c3h6 + c4h7 = c7h13 8.8e3 2.48 6130 !c rad add to ext c=c
c4h7 + c3h6 = ec7h13a 8.8e3 2.48 6130 !c rad add to ext c=c
c3h6 + c2h3 = c5h9 8.8e3 2.48 6130 !c rad add to ext c=c
c4h6 + c3h5-a = x15c7h117 8.8e3 2.48 6130 !c rad add to ext c=c
c4h6 + c2h5 = c6h11 8.8e3 2.48 6130 !c rad add to ext c=c
ic5h8 + c2h5 = ac7h13c 8.8e3 2.48 6130 !c rad add to ext c=c
c4h6 + nc3h7 = c7h13 8.8e3 2.48 6130 !c rad add to ext c=c
dup
ic5h8 + c2h5 = gc7h13i 8.8e3 2.48 6130 !c rad add to ext c=c
c*cc*cc + c2h5 = c7h13 8.8e3 2.48 6130 !c rad add to ext c=c
c3h5-t + c4h6 = aec7h11d 8.8e3 2.48 6130 !c rad add to ext c=c
c4h6 + ic3h7 = ec7h13d 8.8e3 2.48 6130 !c rad add to ext c=c
! EJS May06 - duplicate with that found in chx
! c4h6 + c2h3 = hx14en6j 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
c4h6 + c2h3 = x15c6h93 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
x14c5h8 + c2h3 = x16c7h114 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
c4h6 + c3h5-s = x15c7h113 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
c2h3 + c*cc*cc = x15c7h114 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
c2h3 + x14c5h8 = gkc7h11m 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
ic5h8 + c2h3 = aec7h11c 8.8e3 2.48 6130 !c=c rad or c-c rad add to ext c=c
c4h6 + c3h5-a = x16c7h114 8.8e3 2.48 6130 !prim allyl rad add to ext c=c
c4h6 + c3h5-a = x16c7h113 8.8e3 2.48 6130 !prim allyl rad add to ext c=c
c4h6 + c3h5-a = gkc7h11m 8.8e3 2.48 6130 !prim allyl rad add to ext c=c
c4h6 + c3h5-a = gkc7h11i 8.8e3 2.48 6130 !prim allyl rad add to ext c=c
! c4h814 + c3h6 = c7h1416 8.8e03 2.48 6130 !c rad add to ext c=c
c7h1416 = c3h6 + c2h4 + c2h4 8.33e+11 0.71 28834 ! k is krev from RevAll. EJS 9oct06
c4h6 + nc3h7 = c7h13 8.8e03 2.48 6130 !c rad add to ext c=c
dup
c6h11 + ch3 = c7h14af 1.89e03 2.67 6850 !c rad add to int c=c
x15c6h10 + ch3 = ec7h13a 1.89e03 2.67 6850 !c rad add to int c=c
c4h6 + ch3 = cc5h9a 1.89e03 2.67 6850 !c rad add to int c=c
x135c6h8 + ch3 = gkc7h11j 1.89e03 2.67 6850 !c rad add to int c=c
cychexene + ch3 = mchr2 1.89e03 2.67 6850 !c rad add to int c=c
x13c6h10 + ch3 = kc7h13j 1.89e03 2.67 6850 !c rad add to int c=c
x125c6h8 + ch3 = aec7h11c 1.89e03 2.67 6850 !c radical adding to ketene

!use prf: c4h6 + ch3 = c5h9 1.76e04 2.48 6130
!use prf: c4h6 + ch3 = c5h9 1.76e04 2.48 6130

c2h3 + c3h4-a = ic5h7 9.45e02 2.67 6850 !c=c rad or c-c rad add to int c=c
c*cc*cc + c2h5 = kc7h13j 9.45e02 2.67 6850 !c rad add to int c=c
c3h4-a + c4h7 = aec7h11g 9.45e02 2.67 6850 !c radical adding to ketene
! c4h814 + c3h6 = c7h14af 9.45e02 2.67 6580 !c rad add to int c=c
c7h14af = c3h6 + c2h4 + c2h4 1.0e+13 0.46 29110 ! k is krev from RevAll. EJS 9oct06

! formation of 2 radicals from a stable species

c3h5-a + c3h5-a = x15c6h10 6.63e14 -0.57 0.0 !henrys value for radical recombination
c3h5-a + c4h7 = x16c7h12 6.63e14 -0.57 0.0 !henrys value for radical recombination
c3h5-a + ic4h7 = x15c7h12 6.63e14 -0.57 0.0 !henrys value for radical recombination
ic4h7 + c3h5-a = gkc7h12 6.63e14 -0.57 0.0 !henrys value for radical recombination
x15c6h93 + ch3 = gkc7h12 6.63e14 -0.57 0.0 !henrys value for radical recombination
i-c4h5 + ch3 = ic5h8 6.63e14 -0.57 0.0 !henrys value for radical recombination
! c2h4 + c2h4 = c4h814 6.63e14 -0.57 0.0 !henrys value for radical recombination ! excluded EJS 9oct06
c2h4 + c3h6 = c5h1014 6.63e14 -0.57 0.0 !henrys value for radical recombination
!use prf: c3h5-a + pc4h9 = c7h14-1 6.63e14 -0.57 0.0 !henrys value for radical recombination
c4h7 + nc3h7 = c7h14-1 6.63e14 -0.57 0.0 !henrys value for radical recombination
c5h9 + c2h5 = c7h14-1 6.63e14 -0.57 0.0 !henrys value for radical recombination
c*cc*cj + ch3 = c*cc*cc 6.63e14 -0.57 0.0 !henrys value for radical recombination

! rates taken from nist

!cychexene = cyhx13ene + h2 1.9e16 0.0 71199 !nist 1 rxn
! EJS May06 - Below rxns are duplicate with that in chx
! cychexene = c4h6 + c2h4 3.64e62 -13.8 92030 ! nist 15rxns, 1970 on used
! cyhx13ene = c6h6 + h2 2.36e19 -1.38 67530 !nist 2rxn
! EJS May06 - duplicate with that found in chx
! cyhx13ene = cyhx13n5j + h 5.01e15 0.0 72600 !nist 1rxn
!use prf: cyhx13n5j = c6h6 + h 4.8e25 -3.46 33480 !nist 2rxn
! cyhx13n5j = c*cc*cj + c2h2 2.51e14 0.7 41827 !nist 1rxn

!give these attention
x2c6h1016<=>c4h6+c2h4 2.066e+13 0.4391 38219.3
x3c6h1016<=>c2h4+c2h2+c2h4 2.066e+13 0.4391 38219.3
!c4h6 + c2h4 = x2c6h1016 4.86e05 1.8 5580 !c=c rad or c-c rad add to ext c=c
!c2h4 + c2h2 + c2h4 = x3c6h1016 4.86e05 1.8 5580 !c=c rad or c-c rad add to ext c=c
!
!------------------------------------------------------------------------------
!======================= CVN added reactions ==================================
!------------------------------------------------------------------------------
!-------- Reactions of ic5h7 radical --------------------
!Treat ic5h7 as c2h5 radical with similar A-factor and Ea is ~6.5kcal higher for difference in BE
ic5h7 + c6h5ch3 = ic5h8 + c6h5ch2j 3.00E+11 0. 15500. !CVN est (Ea lower than primary H)
ic5h7 + c5h10-1 = ic5h8 + c5h9 7.00E+11 0. 16000. !CVN est for Olefin
ic5h7 + mch = ic5h8 + mchr1 3.01E-10 6.362 9900. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
ic5h7 + mch = ic5h8 + mchr2 1.51E+00 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
ic5h7 + mch = ic5h8 + mchr3 1.51E+00 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
ic5h7 + mch = ic5h8 + mchr4 7.55E-01 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
ic5h7 + mch = ic5h8 + cychexch2 2.26E-01 3.65 16150. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
ic5h7 + c2h4 = ic5h8 + c2h3 6.32E+02 3.13 81800. !TSA86 for C2H4+C2H5 abstr: Ea+6.5k
ic5h7 + c3h6 = ic5h8 + c3h5-a 1.00E+11 0. 16300. !Ea(c2h6+c2h5=c3h5-a)+6.5k
ic5h7 + ic4h8 = ic5h8 + ic4h7 6.00E+11 0. 16000. !CVN est for Olefin
ic5h7 + ch2o = ic5h8 + hco 5.50E+03 2.81 31000. !TSA86 for CH2O+C2H5 + 6.5k
ic5h7 + c*cc*cc = ic5h8 + c*cc*ccj 3.00E+11 0. 16000. !CVN est for Olefin
ic5h7 + c4h6 = ic5h8 + c*cc*cj 3.16E+02 3.13 81800. !same as c2h4 but A/2
ic5h7 + c4h8-1 = ic5h8 + c4h7 5.00E+11 0. 16000. !CVN est for Olefin
ic5h7 + c2h6 = ic5h8 + c2h5 6.00E+11 0. 19900. !iOctane rule
ic5h7 + c6h5cho = ic5h8 + c6h5cjo 1.30E+06 1.78 14900. !ch3cho+ch3 abstr: A/2, Ea+9kcal
ic5h7 + ic5h8 = ic5h8 + ic5h7 3.00E+11 0. 16000. ! Self-reaction
ic5h7 + c6h6 = ic5h8 + c6h5 6.31E+11 0. 68700. !Zhang89 (c6h6+c2h5) +6.5k
ic5h7 + cychexene = ic5h8 + cyhx1n4j 3.69E+00 3.31 13000. !ch3+cychexene: A/2, Ea+9k
ic5h7 + cychexene = ic5h8 + cyhx1n3j 3.69E+00 3.31 13000. !ch3+cychexene: A/2, Ea+9k
ic5h7 + cy13pd = ic5h8 + cy13pd5j 1.10E+11 0. 23031. !Burcat97 for CY13PD+C3H5-a
ic5h7 + ch3cho = ic5h8 + ch3co 1.30E+06 1.78 14900. !ch3cho+ch3 abstr: A/2, Ea+9kcal
ic5h7 + c6h5oh = ic5h8 + c6h5oj 1.44E+01 3.1 6935. !c6h5oh+c3h5-a TSA87
ic5h7 + c6h12-1 = ic5h8 + c6h11 9.00E+11 0. 16000. !CVN est for Olefin
ic5h7 + c2h3cho = ic5h8 + c2h3co 1.30E+06 1.78 14900. !ch3cho+ch3 abstr: A/2, Ea+9kcal
ic5h7 + c2h3chcho = ic5h8 + c*cc*c*o 1.00E+12 0. 0. !CVN est
ic5h7 + h = ic5h8   1.99E+14 0. 0. !TSA91 for c3h5-a+h
ic5h7 + ch3 = c4h7c2h3  1.02E+14 -0.32 549. !TSA91 for ac3h5+ch3
ic5h7 + ic5h7 = (ic5h7)2  1.00E+13 0. 0. !TSA90 for c2h3+c2h3
ic5h7 + c2h5 = c5h9c2h3  1.02E+14 -0.32 549. !TSA91 for ac3h5+ch3
!
!--------------------- Reactions of c6h5ch2j radical ---------------------
!Use similar A-factor as in ic5h7 or c2h5, and Ea ~1kcal higher than ic5h7
!use rev c6h5ch2j + c5h10-1 = c6h5ch3 + c5h9 7.00E+11 0. 17000.
c6h5ch2j + mch = c6h5ch3 + mchr1 3.01E-10 6.362 10900.
c6h5ch2j + mch = c6h5ch3 + mchr2 1.51E+00 3.46 15500.
c6h5ch2j + mch = c6h5ch3 + mchr3 1.51E+00 3.46 15500.
c6h5ch2j + mch = c6h5ch3 + mchr4 7.55E-01 3.46 15500.
c6h5ch2j + mch = c6h5ch3 +cychexch2 2.26E-01 3.65 17150.
c6h5ch2j + c3h6 = c6h5ch3 + c3h5-a 1.00E+11 0. 17300.
c6h5ch2j + ic4h8 = c6h5ch3 + ic4h7 6.00E+11 0. 17000.
c6h5ch2j + ch2o = c6h5ch3 + hco 5.50E+03 2.81 32000.
c6h5ch2j + c*cc*cc = c6h5ch3 +c*cc*ccj 3.00E+11 0. 17000.
c6h5ch2j + c4h6 = c6h5ch3 + c*cc*cj 3.16E+02 3.13 82800.
c6h5ch2j + c4h8-1 = c6h5ch3 + c4h7 5.00E+11 0. 17000.
c6h5ch2j + c2h6 = c6h5ch3 + c2h5 6.00E+11 0. 20900.
c6h5ch2j + c6h5cho = c6h5ch3 + c6h5cjo 1.30E+06 1.78 15900.
c6h5ch2j + cychexene = c6h5ch3 + cyhx1n4j 3.69E+00 3.31 14000.
c6h5ch2j + cychexene = c6h5ch3 + cyhx1n3j 3.69E+00 3.31 14000.
c6h5ch2j + ch3cho = c6h5ch3 + ch3co 1.30E+06 1.78 15900.
c6h5ch2j + c6h12-1 = c6h5ch3 + c6h11 9.00E+11 0. 17000.
c6h5ch2j + c2h3cho = c6h5ch3 + c2h3co 1.30E+06 1.78 15900.
c6h5ch2j + ch3 = ebz   1.19E+13 0 913 !91Brand/Hippler
!
!----------- Reactions of c2h3chcho radical -------------------------
!Based on ic5h7: A-factor / 3.5 due to secondary carbon, Ea + 2kcal for BE difference
c2h3chcho + c6h5ch3 = ac3h5cho + c6h5ch2j 8.57E+10 0. 17500.
c2h3chcho + c5h10-1 = ac3h5cho + c5h9 2.00E+11 0. 18000.
c2h3chcho + mch = ac3h5cho + mchr1 8.59E-11 6.362 11900.
c2h3chcho + mch = ac3h5cho + mchr2 4.31E-01 3.46 16500.
c2h3chcho + mch = ac3h5cho + mchr3 4.31E-01 3.46 16500.
c2h3chcho + mch = ac3h5cho + mchr4 2.16E-01 3.46 16500.
c2h3chcho + mch = ac3h5cho + cychexch2 6.46E-02 3.65 18150.
c2h3chcho + c2h4 = ac3h5cho + c2h3 1.81E+02 3.13 83800.
c2h3chcho + c3h6 = ac3h5cho + c3h5-a 2.86E+10 0. 18300.
c2h3chcho + ic4h8 = ac3h5cho + ic4h7 1.71E+11 0. 18000.
c2h3chcho + ch4 = ac3h5cho + ch3 2.46E-02 4.14 61000.
c2h3chcho + c*cc*cc = ac3h5cho + c*cc*ccj 8.57E+10 0. 18000.
c2h3chcho + c4h6 = ac3h5cho + c*cc*cj 9.03E+01 3.13 83800.
c2h3chcho + c4h8-1 = ac3h5cho + c4h7 1.43E+11 0. 18000.
c2h3chcho + c2h6 = ac3h5cho + c2h5 1.71E+11 0. 21900.
c2h3chcho + c6h5cho = ac3h5cho + c6h5cjo 3.71E+05 1.78 16900.
c2h3chcho + ic5h8 = ac3h5cho + ic5h7 8.57E+10 0. 18000.
c2h3chcho + c6h6 = ac3h5cho + c6h5 1.80E+11 0. 70700. 
! Ver k9
! c2h3chcho + cychexene = ac3h5cho + cyhx1n4j 2.0e+11 0. 10400. ! Test using ic8 rate for sec H abs by c2h5
! Ver k8 - commented out the rxn altogether
! Ver k7 - using rate below
! c2h3chcho + cychexene = ac3h5cho + cyhx1n4j 1.05e-1 3.31 20000. ! EJS 27thJune06 A-factor further reduced and Ea increased
                                                                ! To match Lemaire's expt data  
! Ver k6 - using rate below                                                                                                
! c2h3chcho + cychexene = ac3h5cho + cyhx1n4j 2.6e-1 3.31 15000. ! EJS 26thJune06 A-factor reduced from 1.05e+00, 75% reduction
                                                               ! To match Lemaire's expt data
! all previous versions and now verl1 - rate below                                                               
c2h3chcho + cychexene = ac3h5cho + cyhx1n4j 1.05E+00 3.31 15000. ! Orignial rate used from mch. No ref
c2h3chcho + cychexene = ac3h5cho + cyhx1n3j 1.05E+00 3.31 15000                                                                                               .
c2h3chcho + cy13pd = ac3h5cho + cy13pd5j 3.14E+10 0. 25031.
c2h3chcho + ch3cho = ac3h5cho + ch3co 3.71E+05 1.78 16900.
c2h3chcho + c6h5oh = ac3h5cho + c6h5oj 4.11E+00 3.1 8935
c2h3chcho + c6h12-1 = ac3h5cho + c6h11 2.57E+11 0. 18000.
c2h3chcho + c2h3cho = ac3h5cho + c2h3co 3.71E+05 1.78 16900.
c2h3chcho + ch3 = c*cc*c*o + ch4 2.00E+12 0. 0. !CVN est
c2h3chcho + ch3o2 = c*cc*c*o + ch3o2h 1.00E+12 0. 0. !CVN est
c2h3chcho + c6h5ch2j = c*cc*c*o + c6h5ch3 1.00E+12 0. 0. !CVN est
c2h3chcho + c2h3chcho = ac3h5cho + c*cc*c*o 1.00E+12 0. 0. !CVN est
c2h3chcho + h = ac3h5cho   1.00E+14 0. 0. !CVN est
c2h3chcho + ch3 = c2h5coc2h3   1.20E+13 0. 0. !CVN est
!
!---------------------- Reactions of tc4h9 radical ------------------
tc4h9 + c3h6 = ic4h10 + c3h5-a 3.01E-05 4.9 33258. !TSA91
tc4h9 + ch2o = ic4h10 + hco 3.25E+09 0. 14883. !TSA90
tc4h9 + c2h5 = ic4h10 + c2h4 2.20E+14 -0.75 0. !TSA90
tc4h9 + tc4h9 = ic4h10 + ic4h8 2.50E+12 0. 0. !WAR84
!
!--------------------- Reaction of c5h9 radical ----------------------------
!This is resonantly stabilized radical from PRF mechanism (not from MCH mechanism)
!Use same rate coefficients as in ic5h7 species
c5h9 + c6h5ch3 = c5h10-1 + c6h5ch2j 3.00E+11 0. 15500. !CVN est (Ea lower than primary H)
c5h9 + c5h10-1 = c5h10-1 + c5h9 7.00E+11 0. 16000. !CVN est for Olefin
c5h9 + mch = c5h10-1 + mchr1 3.01E-10 6.362 9900. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
c5h9 + mch = c5h10-1 + mchr2 1.51E+00 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
c5h9 + mch = c5h10-1 + mchr3 1.51E+00 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
c5h9 + mch = c5h10-1 + mchr4 7.55E-01 3.46 14500. !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
c5h9 + mch = c5h10-1 + cychexch2 2.26E-01 3.65 16150 !analogy to mch+ch3 abstr : A factor/2 and Ea+9kcal
c5h9 + c2h4 = c5h10-1 + c2h3 6.32E+02 3.13 81800. !TSA86 for C2H4+C2H5 abstr: Ea+6.5k
c5h9 + c3h6 = c5h10-1 + c3h5-a 1.00E+11 0. 16300. !Ea(c2h6+c2h5=c3h5-a)+6.5k
c5h9 + ic4h8 = c5h10-1 + ic4h7 6.00E+11 0. 16000. !CVN est for Olefin
c5h9 + ch2o = c5h10-1 + hco 5.50E+03 2.81 31000. !TSA86 for CH2O+C2H5 + 6.5k
c5h9 + c*cc*cc = c5h10-1 + c*cc*ccj 3.00E+11 0. 16000. !CVN est for Olefin
c5h9 + c4h6 = c5h10-1 + c*cc*cj 3.16E+02 3.13 81800. !same as c2h4 but A/2
c5h9 + c4h8-1 = c5h10-1 + c4h7 5.00E+11 0. 16000. !CVN est for Olefin
c5h9 + c2h6 = c5h10-1 + c2h5 6.00E+11 0. 19900. !iOctane rule
c5h9 + c6h5cho = c5h10-1 + c6h5cjo 1.30E+06 1.78 14900. !ch3cho+ch3 abstr: A/2, Ea+9kcal
c5h9 + h2o2 = c5h10-1 + ho2 8.70E+09 0. 10500. !TSA86(c2h5+h2o2) + 6.5k
c5h9 + c6h6 = c5h10-1 + c6h5 6.31E+11 0. 68700. !Zhang89 (c6h6+c2h5) +6.5k
c5h9 + ho2 = c*cc*cc + h2o2 2.00E+12 0. 0. !CVN est
c5h9 + ch3 = c*cc*cc + ch4 2.00E+12 0. 0. !CVN est
c5h9 + ch3o2 = c*cc*cc + ch3o2h 2.00E+12 0. 0. !CVN est
c5h9 + ic5h7 = c*cc*cc + ic5h8 2.00E+12 0. 0. !CVN est
c5h9 + c6h5ch2j = c*cc*cc + c6h5ch3 2.00E+12 0. 0. !CVN est
c5h9 + h = c5h10-1   1.99E+14 0. 0. !TSA91 for c3h5-a+h
!
!-------------------- Additional reactions --------------------------
! EJS May06 - ho2 addition below are duplicates with those in chx 
! ho2 + cychexene = h2o2 + cyhx1n3j 8.00E+12 0. 16000. !CVN est Olefin+HO2 : 2E12  0.0  16000. per H
! ho2 + cychexene = h2o2 + cyhx1n4j 8.00E+12 0. 16000. !CVN est Olefin+HO2 : 2E12  0.0  16000. per H
c6h5 + c2h5 = ebz   1.00E+13 0. 0. !CVN est
ic5h7 + ho2 = ic5h6oj + oh 7.00E+12 0. -1000. !generic, skipp the intermediate rooh specie
ch2o + c*cc*cj = ic5h6oj   2.00E+12 0. 9000. !CVN est based on ch2o+c2h5, c*cjc*c written as c*cc*cj to avoid extra species
c4h7 + c2h3 = c4h7c2h3   2.00E+13 0. 0. !CVN est, c4h7 here is c*cjcc
c*cc*cj + c2h5 = c4h7c2h3   1.60E+13 0. 0. !TSA86 for c2h5+c2h3, the radical c*cjc*c is written here as c*cc*cj
c5h9 + c2h3 = c5h9c2h3   2.00E+13 0. 0. !CVN est, c5h9 here is c*cjccc
c*cc*cj + nc3h7 = c5h9c2h3   9.64E+12 0. 0. !TSA86 for nc3h7+c2h3, the radical c*cjc*c is written here as c*cc*cj
!
!--------------------- RO2+RH reactions -----------------------------
c2h5o2 + c6h5ch3 = c2h5o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o2
nc3h7o2 + c6h5ch3 = nc3h7o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o3
ic3h7o2 + c6h5ch3 = ic3h7o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o3
ic4h9o2 + c6h5ch3 = ic4h9o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o3
pc4h9o2 + c6h5ch3 = pc4h9o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o3
tc4h9o2 + c6h5ch3 = tc4h9o2h + c6h5ch2j 1.02E+04 2.5 12339.3 ! = c6h5ch3+ch3o3
!          
ch3o2 + c5h10-1 = ch3o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
c2h5o2 + c5h10-1 = c2h5o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
nc3h7o2 + c5h10-1 = nc3h7o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
ic3h7o2 + c5h10-1 = ic3h7o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
ic4h9o2 + c5h10-1 = ic4h9o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
pc4h9o2 + c5h10-1 = pc4h9o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
tc4h9o2 + c5h10-1 = tc4h9o2h + c5h9 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
!
ch3o2 + mch = ch3o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
c2h5o2 + mch = c2h5o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
nc3h7o2 + mch = nc3h7o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
ic3h7o2 + mch = ic3h7o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
ic4h9o2 + mch = ic4h9o2h + mchr1 3.61E+03 2.55 1153. !=k(ho2+mch) , Ea+1 kcal/mol
pc4h9o2 + mch = pc4h9o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
tc4h9o2 + mch = tc4h9o2h + mchr1 3.61E+03 2.55 11532. !=k(ho2+mch) , Ea+1 kcal/mol
!
ch3o2 + mch = ch3o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
c2h5o2 + mch = c2h5o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
nc3h7o2 + mch = nc3h7o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic3h7o2 + mch = ic3h7o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic4h9o2 + mch = ic4h9o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
pc4h9o2 + mch = pc4h9o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
tc4h9o2 + mch = tc4h9o2h + mchr2 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
!          
ch3o2 + mch = ch3o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
c2h5o2 + mch = c2h5o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
nc3h7o2 + mch = nc3h7o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic3h7o2 + mch = ic3h7o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic4h9o2 + mch = ic4h9o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
pc4h9o2 + mch = pc4h9o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
tc4h9o2 + mch = tc4h9o2h + mchr3 1.93E+04 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
!          
ch3o2 + mch = ch3o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
c2h5o2 + mch = c2h5o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
nc3h7o2 + mch = nc3h7o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic3h7o2 + mch = ic3h7o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
ic4h9o2 + mch = ic4h9o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
pc4h9o2 + mch = pc4h9o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
tc4h9o2 + mch = tc4h9o2h + mchr4 9.64E+03 2.6 14910. !=k(ho2+mch) , Ea+1 kcal/mol
!          
ch3o2 + mch = ch3o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
c2h5o2 + mch = c2h5o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
nc3h7o2 + mch = nc3h7o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
ic3h7o2 + mch = ic3h7o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
ic4h9o2 + mch = ic4h9o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
pc4h9o2 + mch = pc4h9o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
tc4h9o2 + mch = tc4h9o2h + cychexch2 2.38E+04 2.55 17494. !=k(ho2+mch) , Ea+1 kcal/mol
!                    
c2h5o2 + ic4h8 = c2h5o2h + ic4h7 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
!
ch3o2 + c*cc*cc = ch3o2h + c*cc*ccj 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
c2h5o2 + c*cc*cc = c2h5o2h + c*cc*ccj 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
!
ch3o2 + c6h5cho = ch3o2h + c6h5cjo 3.00E+12 0. 12000. !CVN est
c2h5o2 + c6h5cho = c2h5o2h + c6h5cjo 3.00E+12 0. 12000. !CVN est
!
ch3o2 + ic5h8 = ch3o2h + ic5h7 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
c2h5o2 + ic5h8 = c2h5o2h + ic5h7 3.24E+11 0. 14900. != generic ro2+c3h6=ro2h+c3h5-a
!
ch3o2 + h2o2 = ch3o2h + ho2 1.32E+04 2.5 9560. !CVN estimation
c2h5o2 + h2o2 = c2h5o2h + ho2 1.32E+04 2.5 9560. !CVN estimation
nc3h7o2 + h2o2 = nc3h7o2h + ho2 1.32E+04 2.5 9560. !CVN estimation
ic3h7o2 + h2o2 = ic3h7o2h + ho2 1.32E+04 2.5 9560. !CVN estimation
!
!---------------------------- RO2+RO2 reactions -----------------------------
phch2ooj + ho2 = phch2ooh + o2    1.75E+11 0 -1711 ! New cvn k=5e11  0.  -1711.
!
ch3o2 + phch2ooj = ch3o + phch2oj + o2  1.40E+16 -1.61 1860. 
!
c2h5o2 + c5h11o2-1 = c2h5o + c5h11o-1 + o2  1.40E+16 -1.61 1860. 
c2h5o2 + c5h11o2-2 = c2h5o + c5h11o-2 + o2  1.40E+16 -1.61 1860. 
c2h5o2 + phch2ooj = c2h5o + phch2oj + o2  1.40E+16 -1.61 1860.
!
nc3h7o2 + c5h11o2-1 = nc3h7o + c5h11o-1 + o2  1.40E+16 -1.61 1860.
nc3h7o2 + c5h11o2-2 = nc3h7o + c5h11o-2 + o2  1.40E+16 -1.61 1860.
nc3h7o2 + phch2ooj = nc3h7o + phch2oj + o2  1.40E+16 -1.61 1860.
!
ic3h7o2 + c5h11o2-1 = ic3h7o + c5h11o-1 + o2  1.40E+16 -1.61 1860.
ic3h7o2 + c5h11o2-2 = ic3h7o + c5h11o-2 + o2  1.40E+16 -1.61 1860.
ic3h7o2 + phch2ooj = ic3h7o + phch2oj + o2  1.40E+16 -1.61 1860.
!
ic4h9o2 + c5h11o2-1 = ic4h9o + c5h11o-1 + o2  1.40E+16 -1.61 1860.
ic4h9o2 + c5h11o2-2 = ic4h9o + c5h11o-2 + o2  1.40E+16 -1.61 1860.
ic4h9o2 + phch2ooj = ic4h9o + phch2oj + o2  1.40E+16 -1.61 1860.
!
pc4h9o2 + c5h11o2-1 = pc4h9o + c5h11o-1 + o2  1.40E+16 -1.61 1860.
pc4h9o2 + c5h11o2-2 = pc4h9o + c5h11o-2 + o2  1.40E+16 -1.61 1860.
pc4h9o2 + phch2ooj = pc4h9o + phch2oj + o2  1.40E+16 -1.61 1860.
!            
tc4h9o2 + c5h11o2-1 = tc4h9o + c5h11o-1 + o2  1.40E+16 -1.61 1860.
tc4h9o2 + c5h11o2-2 = tc4h9o + c5h11o-2 + o2  1.40E+16 -1.61 186.
tc4h9o2 + phch2ooj = tc4h9o + phch2oj + o2  1.40E+16 -1.61 1860.
!
!------------------ c*cc*cc abstraction reactions -----------------------
o + c*cc*cc = oh + c*cc*ccj  5.24E+11 0.7 5884 !prf mech for abstraction from C*CC
oh + c*cc*cc = h2o + c*cc*ccj  3.12E+06 2 -298 !prf mech for abstraction from C*CC
o2 + c*cc*cc = ho2 + c*cc*ccj  4.00E+12 0 39900 !prf mech for abstraction from C*CC
c2h5 + c*cc*cc = c2h6 + c*cc*ccj  1.00E+11 0 9800 !prf mech for abstraction from C*CC
ho2 + c*cc*cc = h2o2 + c*cc*ccj  1.50E+11 0 14190 !prf mech for abstraction from C*CC
!
!12/25/04 CVN -Updated low T MCH kinetics from lowTmch_v3.mech
!============ Low temperature chemistry for MCH oxidation ===========
!
!  Check the need to include cyclohexene low T chemistry
!  Check the need to include further reactions of methyl cyclohexene(mche) and cyclic ethers
!  Intra radical H transfer in QOOH type MCH radicals is expected to be very slow due to the ring structure
!
!--- mchr2+o2 system ---
!mchr2+o2 = mche+ho2     9.0E+13   0.0   7530.  !CVN: abstraction rate based on Evans/Polani
mchr2+o2 = mche+ho2     9.0E+11   0.0   7530.  !CVN: abstraction rate based on Evans/Polani
! 
mchr2+o2 = mch2oo    3.0E+12   0.0   0.0  !Wu, circa 1987 Total rate of cyclohexane +o2 divided into product channels
!5 member h transfer
!mch2oo = mch2qj3    1.0E+13   0.0   26850. !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
!mch2oo = mch2qj3    2.00E+11 0. 29350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati and Walker.
mch2oo = mch2qj3    1.2E+11 0.0 27500.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 0.6, Ea+0.6kcal from Handford-Styring and Walker.
!mch2oo = mch2qj1    5.0E+12   0.0   24100. !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
!mch2oo = mch2qj1   1.00E+11 0.0 26600.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati and Walker
mch2oo = mch2qj1    6.2e10 0.0 24700.0 !Curran et al. Isooctane, CF2002, tert C-H, A-factor times 0.6, Ea+0.6kcal from Handford-Styring and Walker.
mch2qj3 = mchyo23+oh    6.3E+12   0.0   15900. ! Green et al. JPCA 2003; Adjusted A-factors for # of rotors.
mch2qj1 = mchyo23+oh    1.35E+13   0.0   13400. ! Green et al. JPCA 2003; Adjusted A-factors for # of rotors.
mche+ho2 = mch2qj3    8.0E+10   0.0   7000.    ! CVN: HO2 addition to double bond.
mche+ho2 = mch2qj1    8.0E+10   0.0   7000.  ! CVN: HO2 addition to double bond.
!6 member h transfer
! factor of 48 for one rotor not tied up:
!mch2oo = mch2qx     1.8E+12   0.0   24400.  !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
!mch2oo = mch2qx     2.25e11   0.0   24400.  !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
mch2oo = mch2qx     1.1e11   0.0   24400.  !Curran et al. Isooctane, CF2002, A-factor adjusted by 3 for # of rotors
!mch2oo = mch2qj4     2.0E+13   0.0   20850. !Curran et al. Isooctane, CF2002, A-factor adjusted for 2 of rotors
!mch2oo = mch2qj4     2.5E+10   0.0   23350. !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati and Walker
mch2oo = mch2qj4     9.3E+10   0.0   24100. !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 3.7 & Ea+3.2kcal 
                                            ! from Handford-String and Walker
!mch2oo = mch2qj6     2.0E+13   0.0   20850. !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
!mch2oo = mch2qj6     2.5E+10   0.0   23350. !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati and Walker
mch2oo = mch2qj6     9.3E+10   0.0   24100. !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 3.7 & Ea+3.2kcal 
                                            ! from Handford-String and Walker
mch2qx = chxyco-2+oh    9.1E+12   0.0   21900.  !chxyco-2 is a cyclic ether: 
! the o attaches to the ch2 group and the 2 position on the ring
! radical site on CH2 group abstracts H atom from carbon no. 2 with OOH group:
mch2qx = mcho+oh     1.5E+13   0.0   35000.  ! CVN: assumed the same as alkyl isomerization.  Adjusted for C-H bond strength.
mch2qj4 = mchyo24+oh    4.0E+12   0.0   19500.    !mchyo24 is a lumped cyclic oxide with 4-mem CCCO ring on MCH
mch2qj6 = mchyo24+oh    4.0E+12   0.0   19500.    !mchyo24 is a lumped cyclic oxide with 4-mem CCCO ring on MCH
! further decomposition paths for gamma mchXqjY
! gamma mchXqjY radical means OOH group is "gamma" to the radical site
! (add these for all gamma mchXqjY if important)=> They are important: 5 times faster at 800K than cyclic ether formation!
! Use to calculate decomposition rate of gamma radical mch2qj4:(mchj2q4ene is c*cccc(c)cjooh)
! mchj2q4ene = mch2qj4   1.00E+08 0.86 5.900E+03 ! A-factor and n from Matheu et al. IJCK 2003 for 1,6 addition to terminal c*c.
!mch2qj6 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
mch2qj6 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
!mch2qj4 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
mch2qj4 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
!mch2qx = oh + c7ene-one 7.62e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
mch2qx = oh + c7ene-one 3.8e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
c7ene-one + oh  = c7ene-onej + h2o  2.00E+06 1.8   1300.0  ! Analogy with ch3cho+oh, Taylor et al. Proc. Comb. Symp., 26, p. 497-504 (1996)
c7ene-one + ho2 = c7ene-onej + h2o2 4.82E+03 2.6   13910.0 ! Analogy with ch3cho+ho2, from Curran et al. 2004, C3_31 mech
c7ene-one + h   = c7ene-onej + h2   1.34E+13 0.0   3300.0  ! Assume rate rule for aldehydic H from nc7_38 LLNL mech 
!                                                            (ch3cho+h from Whytock et al. J. Chem. Phys. 65 (1976).
c7ene-one + ch3 = c7ene-onej + ch4  1.34E+13 0.0   3300.0  ! Assume rate rule for aldehydic H from nc7_38 LLNL mech
c7ene-one + oh  = c7enej-one + h2o  3.17E+06 2.00 -1434.0  ! Rate rule for secondary Allylic H, Heyberger et al., Oxidation of Small Alkenes, 
!                                                            IJCK 34:666-677 2002). Estimated uncertainty factor = 1.5
c7ene-one + ho2 = c7enej-one + h2o2 6.80E+03 2.50  10113.8 ! Rate rule for seconary allylic H, Scott and Walker, Addition of Toluene, 
!                                                            COMBUSTION AND FLAME 129:365�377 (2002).  Estimated based on ethylbenzene+ho2
c7ene-one + h   = c7enej-one + h2   5.02E+04 2.50 -1912.0  ! Rate rule for secondary Allylic H, Heyberger et al., Oxidation of Small Alkenes, 
!                                                            IJCK 34:666-677 2002). Estimated uncertainty factor = 1.5
c7ene-one + ch3 = c7enej-one + ch4  1.00E-01 3.50  4046.1  ! WJP: Used primary rate rule from Allylic H, Heyberger et al., 
!                                                            Oxidation of Small Alkenes, IJCK 34:666-677 2002). 
!                                                            Lowered Ea by 0.65(BD primary allylic - secondary allylic). 
!                                                           0.65 is for ch3 abstractions reactions from Dean and Bozzelli 
!                                                            Combustion Chemistry of Nitrogen, 1997.  Estimated uncertainty factor = 3
c7ene-onej => co+c3h6+c3h5-a         1.83E+15 -0.73 12910.0 ! Analogy with c2h5co = c2h5+co, Curran et al. C3_31 mech, 2004, 
!                                                            reverse rate rule = 1.510E+11exp(-4.810E+03cal/RT)
c7enej-one = c4h6+ch3chcho          1.83E+14 0.258 40425.1 ! Analogy with jc8h15-B decomp, Pitz et al., diisobutylene mech, 2004
! mch2qj4 = c2h4 + products ! usual beta scission path
! Rate is small so neglect:
!mch2qj4 = c6h11cho1+oh    1.0E+17   0.0   88000.  !CVN estimate.  c6h11cho1 is a lumped stable specie
!7 member h transfer
!mch2oo = mch2qj5     1.0E+13   0.0   19050.  !Curran et al. Isooctane, CF2002, A-factor adjusted for # of rotors
!mch2oo = mch2qj5 3.12E+09 0.0 24050.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+5.0kcal from Gulati and Walker
mch2oo = mch2qj5 1.1E+10 0.0 24350.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 3.5 & Ea+5.3kcal from Handford-String & Walker
mch2qj5 = mchyo25+oh    3.3E+12   0.0   13000.  ! Green et al. JPCA 2003; Adjusted A-factors for # of rotors. mchy025 is a lumped cyclic oxide with 5-mem CCCCO ring across MCH

!--- mchr3+o2 system ---
!mchr3+o2 = mche+ho2   1.2E+14   0.0   8100.  !abstr
mchr3+o2 = mche+ho2   1.2E+12   0.0   8100.  !abstr
!
mchr3+o2 = mch3oo    3.0E+12   0.0   0.0  
!5-mem
! mch3qj2 is a lumped species of mch3qj2 and mch3qj4
!mch3oo = mch3qj2     2.0E+13   0.0   26850.   !A-factor twice due to two possible pathways from position 2 and 4
!mch3oo = mch3qj2     4.00E+11 0.0  29350.0   !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker, A-factor twice due to two possible pathways from position 2 and 4
mch3oo = mch3qj2     2.5E+11 0.0  27500.0   !Curran et al. Isooctane, CF2002, sec C-H, EA-factor times 0.6, Ea+0.6kcal from Handford-Styring and Walker, 
!                                            A-factor doubled due to lumping of mch3qj2 and mch3qj4
mch3qj2 = mchyo23+oh    6.3E+12   0.0   15900.
mche+ho2 = mch3qj2    1.6E+11   0.0   7000.
!6-mem
!mch3oo = mch3qj5     1.0E+13   0.0   20850. !isomerization rate from ic8h18, Curran et al. CF2002, Adjust rate for 2 rotors not lost
!isomerization rate from ic8h18, Curran et al. CF2002, Adjust rate for 2 rotors not lost
! This means a factor of 20 for each rotor!
!mch3oo = mch3qj5     2.50E+10 0.0 23350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker
mch3oo = mch3qj5     9.3E+10 0.0 24100.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 3.7 & Ea+3.2kcal from Handford-String & Walker
!mch3oo = mch3qj1     5.0E+12   0.0   19100.  !isomerization rate from ic8h18, Curran et al. CF2002, abstraction of a tertiary H
!mch3oo = mch3qj1     1.25E+10 0.0 21550.0 !Curran et al. Isooctane, CF2002, tert C-H, Ea+2.5kcal from Gulati & Walker
mch3oo = mch3qj1     4.6E+10 0.0 22300.0 !Curran et al. Isooctane, CF2002, tert C-H, A-factor times 3.7 & Ea+3.2kcal from Handford-String and Walker
mch3qj5 = mchyo24+oh    4.0E+12   0.0   19500.  
mch3qj1 = mchyo24+oh    6.7E+12   0.0   17400. !Green et al. JPCA 2003; Adjusted A-factors for # of rotors. Model: CCC.CCOOH=CCcyCCCO + OH
! The above TST has 1 methyl outside the TST and 3 carbons outside the TST in a second ring.
! beta scission of gamma radical:
!mch3qj1 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
!mch3qj5 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
mch3qj1 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
mch3qj5 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
!mch3qj5 = c6h11cho1+oh    1.0E+17   0.0   88000.
!mch3qj1 = c6h11cho1+oh    
!7-mem
! Means a factor of 19 per rotor not tied up:
!mch3oo = mch3qj6     1.0E+13   0.0   19050.  !isom rate from iso-octane, Curran et al. CF2002, Adjust for 3 rotors not lost
!mch3oo = mch3qj6     3.12E+09 0.0 24050.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+5.0kcal from Gulati & Walker
mch3oo = mch3qj6     1.1E+10 0.0 24350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+5.0kcal from Gulati & Walker
mch3qj6 = mchyo25+oh    3.3E+12   0.0   13000.
!
!--- mchr4+o2 system ---
!mchr4+o2 = mche+ho2    1.2E+14   0.0   8100.   !abstr
mchr4+o2 = mche+ho2    1.2E+12   0.0   8100.   !abstr
!
mchr4+o2 = mch4oo    1.5E+12   0.0   0.0
!5-mem
! mch4oo = mch4qj3     2.0E+13   0.0   26850. !isom rate from iso-octane, Curran et al. CF2002, factor 50 for 1 rotors not lost
!mch4oo = mch4qj3     4.00E+11 0.0 29350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker 
mch4oo = mch4qj3     2.5E+11 0.0 27500.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 0.6, Ea+0.6kcal from Handford-Styring & Walker.
mch4qj3 = mchyo23+oh    6.3E+12   0.0   15900.
mche+ho2 = mch4qj3    1.6E+11   0.0   7000.
!6-mem
! mch4oo = mch4qj2     2.0E+13   0.0   20850.  !isomerization rate from ic8h18, Curran et al. CF2002, Adjust rate for 2 rotors not lost
!mch4oo = mch4qj2     5.00E+10 0.0 23350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker
mch4oo = mch4qj2     1.9E+11 0.0 24100.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor times 3.7 & Ea+3.2kcal from Handford-String & Walker
mch4qj2 = mchyo24+oh    4.0E+12   0.0   19500.
! decomposition of gamma radical:
!mch4qj2 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
mch4qj2 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! assume same rate as mch2qj4 beta scission (the rxns look almost identical)
!mch4qj2 = c6h11cho1+oh
!7-mem
!mch4oo = mch4qj1     5.0E+12   0.0   17050. !tert C-H, isomerization rate from ic8h18, Curran et al. CF2002, Adjust rate for 3 rotors not lost (factor of 20 each)
!mch4oo = mch4qj1 1.56E+09 0.0 22050.0 !Curran et al. Isooctane, CF2002, tert C-H, Ea+5kcal from Gulati & Walker
mch4oo = mch4qj1 5.4E+09 0.0 22400.0 !Curran et al. Isooctane, CF2002, tert C-H, A-factor times 3.5 & Ea+5.3kcal from Handford-String & Walker
mch4qj1 = mchyo25+oh    2.3E+12   0.0   11500.  !product mchyo14 written as mchyo25 to avoid additional rxns

!--- mchr1+o2 system ---
!mchr1+o2 = mche+ho2    1.2E+14   0.0   8100. !abstr
mchr1+o2 = mche+ho2    1.2E+12   0.0   8100. !abstr
!
mchr1+o2 = mch1oo    1.5E+12   0.0   0.0
!5-mem
!mch1oo = mch1qx     1.8E+12   0.0   29400. ! A- factor should be 3.0e11?  The TST is outside the cyclohexane ring
mch1oo = mch1qx     3.0E+11   0.0   29400. ! 5 mem, primary C-H, Curran et al. rule, iso-Octane, Comb. Flame
!mch1oo = mch1qj2     2.0E+13   0.0   26850. !Sec C-H
!mch1oo = mch1qj2     4.0e11   0.0   29350. !Sec C-H, degen=4, 5-mem, Ea+2.5 kcal from Gulati & Walker
mch1oo = mch1qj2     2.5e11   0.0   27500. !Sec C-H, degen=4, 5-mem, A-factor times 0.6, Ea+0.6kcal from Handford-Styring and Walker.
mch1qx = mchyo23+oh    4.0E+12   0.0   17000.    !mchyo23 is a lumped species
chxdch2+ho2 = mch1qx    8.0E+10   0.0   6000.
mch1qj2 = mchyo23+oh    6.3E+12   0.0   15900.
mche+ho2 = mch1qj2    8.0E+10   0.0   6000.
!6-mem
!mch1oo = mch1qj3     2.0E+13   0.0   20850. ! Curran et al. C&F2002, Adj a-factor for rotors not tied up.
!mch1oo = mch1qj3     5.0e10   0.0   23350. ! Curran et al. C&F2002, sec C-H, Ea+2.5kcal from Gulati and Walker
mch1oo = mch1qj3     1.9e11   0.0   24100. ! Curran et al. C&F2002, sec C-H, A-factor times 3.7 & Ea+3.2kcal from Handford-String and Walker
mch1qj3 = mchyo24+oh    4.0E+12   0.0   19500.
!mch1qj3 = oh + c7ene-one 7.62e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
mch1qj3 = oh + c7ene-one 3.8e16 -0.43 27904.2 ! calculated from reverse rate of mchj2q4ene = mch2qj4 using ChemRev
!mch1qj3 = c6h11cho1+oh
!7-mem
! mch1oo = mch1qj4     1.0E+13   0.0   19050.
!mch1oo = mch1qj4   3.12E+09 0.0 24050.0 ! Curran et al. C&F2002, sec C-H, Ea+5.0kcal from Gulati and Walker
mch1oo = mch1qj4   1.1E+10 0.0 24400.0 ! Curran et al. C&F2002, sec C-H, A-factor times 3.5 & Ea+5.3kcal from Handford-String & Walker
mch1qj4 = mchyo25+oh    3.3E+12   0.0   18300.  !added 5.3kcal to form boat form from chair Ea~13kcal
          !product mchyo14 written as mchyo25 to avoid additional rxns

!--- cychexch2+o2 system ---
cychexch2+o2 = chxdch2+ho2    3.0E+13   0.0   6400.  !abstr
!
cychexch2+o2 = chxch2oo    2.0E+12   0.0   0.0 ! CVN est.
!5-mem
!chxch2oo = chxj1ch2q      6.0E+11   0.0   24100.  !ic8 Curran et al., tert C-H, no adj. for no. of rotors
! fixed A-factor: don't know why it was 6 times too high (WJP)
chxch2oo = chxj1ch2q      1.0E+11   0.0   24100.  !ic8 Curran et al., degen=1, tert C-H, no adj. for no. of rotors
chxdch2+ho2 = chxj1ch2q    1.6E+11   0.0   7700.
chxj1ch2q = mchyo23+oh    1.35E+13   0.0   13400.
!6-mem
!chxch2oo = chxj2ch2q     1.8E+12   0.0   20850. !ic8 Curran et al., adj for one rotor not tied up
! above a-factor looks like is should be 5.0e10 then increased by one rotor not tied up based on ic8 curran et al., so about 4.e11
!chxch2oo = chxj2ch2q     3.0e11   0.0   20850. !ic8 Curran et al., factor of 6 adj for one rotor not tied up
chxch2oo = chxj2ch2q     1.5e11   0.0   20850. !ic8 Curran et al., factor of 3 adj for one rotor not tied up
chxj2ch2q = chxyco-2+oh    4.0E+12  0.0   19500.
! beta scission for gamma radical:
! use to get decompostion rate of chxj2ch2q:
!cychexene+ch2ooh =  chxj2ch2q 5.84e3 2.36 8360.0 ! Analogy to ch3+c3h6=ic4h9, Curran, Alkyl decomp., IJCK, 2004, submitted.
!ch2o+oh = ch2ooh 1.0e13 0.0 0.0                  !WJP estimate for radical-radical addition.
chxj2ch2q => cychexene+ch2o+oh 2.60e+14 0.036 33448.5 !Forward rate from reverse of cychexene+ch2ooh =  chxj2ch2q
!7-mem (add?)
! chxch2oo = chxj3ch2q     1.8E+12   0.0     19050.  !7-mem isom, ic8 Curran et. al. , adj for number of rotors
! chxj3ch2q = chxyco-2+oh    4.0E+12   0.0   19500.  

!--- Ring opening of products ---
mchyo24 = c6h11cho1       1.0E+17   0.0   88000.  !CVN estimate.  WJP: 4-centered molecular elimination reaction
!                                                  that breaks the ring and forms a c6-ene-al species.
chxyco-2 = cychexene+ch2o    1.0E+17   0.0   88000.

!--- RO2+HO2 ---
! (CVN: rate could be 2-3 times higher)
mch1oo+ho2 = mch1ooh+o2    1.75E+11  0.00 -1.711E+03  !Curran et al. Isooctane, CF2002
mch2oo+ho2 = mch2ooh+o2    1.75E+11  0.00 -1.711E+03
mch3oo+ho2 = mch3ooh+o2    1.75E+11  0.00 -1.711E+03
mch4oo+ho2 = mch4ooh+o2    1.75E+11  0.00 -1.711E+03
chxch2oo+ho2 = chxch2ooh+o2    1.75E+11  0.00 -1.711E+03

!--- ROOH dissociation ---
!mch1ooh = mch1oj+oh    7.500E+15  0.00  4.154E+04  ! Curran et al. Isooctane, CF2002
!mch2ooh = mch2oj+oh    7.500E+15  0.00  4.154E+04
!mch3ooh = mch3oj+oh    7.500E+15  0.00  4.154E+04
!mch4ooh = mch4oj+oh    7.500E+15  0.00  4.154E+04
!chxch2ooh = chxch2oj+oh    7.500E+15  0.00  4.154E+04

mch1oj+oh = mch1ooh      1.0E+13  0.00  0.0  ! CVN estimate
mch2oj+oh = mch2ooh      1.0E+13  0.00  0.0
mch3oj+oh = mch3ooh      1.0E+13  0.00  0.0
mch4oj+oh = mch4ooh      1.0E+13  0.00  0.0
chxch2oj+oh = chxch2ooh  1.0E+13  0.00  0.0

!--- R+HO2 ---
mchr1+ho2 = mch1oj+oh    7.000E+12  0.00 -1.000E+03  ! Curran et al. Isooctane, CF2002
mchr2+ho2 = mch2oj+oh    7.000E+12  0.00 -1.000E+03
mchr3+ho2 = mch3oj+oh    7.000E+12  0.00 -1.000E+03
mchr4+ho2 = mch4oj+oh    7.000E+12  0.00 -1.000E+03
cychexch2+ho2 = chxch2oj+oh     7.000E+12  0.00 -1.000E+03

!--- RO2+RO2 ---
mch1oo+ch3o2 = mch1oj+ch3o+o2        1.400E+16  -1.61  1.860E+03  ! Curran et al. Isooctane, CF2002
mch2oo+ch3o2 = mch2oj+ch3o+o2        1.400E+16  -1.61  1.860E+03
mch3oo+ch3o2 = mch3oj+ch3o+o2        1.400E+16  -1.61  1.860E+03
mch4oo+ch3o2 = mch4oj+ch3o+o2        1.400E+16  -1.61  1.860E+03
chxch2oo+ch3o2 = chxch2oj+ch3o+o2    1.400E+16  -1.61  1.860E+03
mch2oo+mch1oo = mch2oj+mch1oj+o2        1.400E+16  -1.61  1.860E+03
mch2oo+mch2oo = mch2oj+mch2oj+o2        1.400E+16  -1.61  1.860E+03
mch2oo+mch3oo = mch2oj+mch3oj+o2        1.400E+16  -1.61  1.860E+03
mch2oo+mch4oo = mch2oj+mch4oj+o2        1.400E+16  -1.61  1.860E+03
mch2oo+chxch2oo = mch2oj+chxch2oj+o2    1.400E+16  -1.61  1.860E+03
mch3oo+mch1oo = mch3oj+mch1oj+o2        1.400E+16  -1.61  1.860E+03    
mch3oo+mch3oo = mch3oj+mch3oj+o2        1.400E+16  -1.61  1.860E+03    
mch3oo+mch4oo = mch3oj+mch4oj+o2        1.400E+16  -1.61  1.860E+03    
mch3oo+chxch2oo = mch3oj+chxch2oj+o2    1.400E+16  -1.61  1.860E+03

!---- RO2+RH ----
mch1oo+mch = mch1ooh+mchr1    3.61E+03 2.55 11532  ! CVN est. based on Lightfoot, ch3o2, c2h5o2
mch1oo+mch = mch1ooh+mchr2    1.93E+04 2.6 14910
mch1oo+mch = mch1ooh+mchr3    1.93E+04 2.6 14910
mch1oo+mch = mch1ooh+mchr4    9.64E+03 2.6 14910
mch1oo+mch = mch1ooh+cychexch2    2.38E+04 2.55 17494
mch2oo+mch = mch2ooh+mchr1    3.61E+03 2.55 11532        
mch2oo+mch = mch2ooh+mchr2    1.93E+04 2.6 14910        
mch2oo+mch = mch2ooh+mchr3    1.93E+04 2.6 14910        
mch2oo+mch = mch2ooh+mchr4    9.64E+03 2.6 14910        
mch2oo+mch = mch2ooh+cychexch2    2.38E+04 2.55 17494        
mch3oo+mch = mch3ooh+mchr1    3.61E+03 2.55 11532        
mch3oo+mch = mch3ooh+mchr2    1.93E+04 2.6 14910        
mch3oo+mch = mch3ooh+mchr3    1.93E+04 2.6 14910        
mch3oo+mch = mch3ooh+mchr4    9.64E+03 2.6 14910        
mch3oo+mch = mch3ooh+cychexch2    2.38E+04 2.55 17494        
mch4oo+mch = mch4ooh+mchr1    3.61E+03 2.55 11532        
mch4oo+mch = mch4ooh+mchr2    1.93E+04 2.6 14910        
mch4oo+mch = mch4ooh+mchr3    1.93E+04 2.6 14910        
mch4oo+mch = mch4ooh+mchr4    9.64E+03 2.6 14910        
mch4oo+mch = mch4ooh+cychexch2    2.38E+04 2.55 17494        
chxch2oo+mch = chxch2ooh+mchr1    3.61E+03 2.55 11532        
chxch2oo+mch = chxch2ooh+mchr2    1.93E+04 2.6 14910        
chxch2oo+mch = chxch2ooh+mchr3    1.93E+04 2.6 14910        
chxch2oo+mch = chxch2ooh+mchr4    9.64E+03 2.6 14910        
chxch2oo+mch = chxch2ooh+cychexch2    2.38E+04 2.55 17494        

!---- RO. decomposition ----
chx1*o+ch3 = mch1oj    2.92E+03   2.36   8360.
ccoccccc. = mch1oj    2.16E+07 0.86 1.010E+04 ! A-factor and n from Matheu et al. IJCK 2003 for 
! 1,6 addition reduced by factor of 4.6 for additional rotor tied up.  4.6 is ratio of 1,6 to 1,5 
! addition. Ea adjusted for difference between addition to c=o compared to c=c (4.2kcal) based on Curran, IJCK 2004.
c2h4+c3h6coch3-1 = ccoccccc.   1.32E+04   2.48   6130.
cc.ccccco = mch2oj    2.16E+07 0.86 1.010E+04 ! see ccoccccc. = mch1oj
c3h6+c3h6cho-1 = cc.ccccco    8.8E+03   2.48   6130.   
ic6h12cho5 = mch2oj     2.16E+07 0.86 1.010E+04 ! see ccoccccc. = mch1oj
c2h4+c4h8cho-1 = ic6h12cho5    1.32E+04   2.48   6130.
!
ic6h12cho2 = mch3oj     2.16E+07 0.86 1.010E+04 ! see ccoccccc. = mch1oj
c3h6+c3h6cho-1 = ic6h12cho2    8.8E+03   2.48   6130.
ic6h12cho4 = mch3oj     2.16E+07 0.86 1.010E+04 ! see ccoccccc. = mch1oj
c2h4+c4h8cho-1 = ic6h12cho4    1.32E+04   2.48   6130.
!
ic6h12cho3 = mch4oj     2.16E+07 0.86 1.010E+04 ! see ccoccccc. = mch1oj
c2h4+c4h8cho-2 = ic6h12cho3    1.32E+04   2.48   6130.
!
ch2o+chxrad = chxch2oj    7.0E+10   0.0   10000.

!--- mcho.+RH asbtractions --- not important

!---- O2 reaction with alkoxy ----
mch1oj+o2 = mcho+ho2    3.0E+13   0.0   4130. !CVN est
mch2oj+o2 = mcho+ho2    3.0E+13   0.0   4130. !CVN est
mch3oj+o2 = mcho+ho2    3.0E+13   0.0   4130. !CVN est
mch4oj+o2 = mcho+ho2    3.0E+13   0.0   4130. !CVN est
!chxch2oj+o2 = chxcho+ho2    3.0E+13   0.0   5729. !CVN est 

!---- mche reactions (methylcyclohexene, lumped species)-----
mche+oh = mchje+h2o    4.50E+13   0.0   2217.  !c4h8-1+oh
mche+ho2 = mchje+h2o2    2.80E+12   0.0   14900.  !c4h8-1+ho2   
mche+ch3 = mchje+ch4    2.00E+11   0.0   7300.  !c4h8-1+ch3
mche+c2h5 = mchje+c2h6    2.00E+11   0.0   8300.  !c4h8-1+ch3: Ea+1k
mche+o2 = mchje+ho2    5.40E+13  0.0  38200.  !c4h8-1+o2 , Ea+5kcal
!---- mchje reactions (methylcyclohexene radical, lumped radical)
mchje+oh = mchde+h2o    2.41E+06   2.00   -1192.  !CVN est
mchje+ho2 = mchde+h2o2    1.32E+04   2.50   -1490.
mchje+ch3 = mchde+ch4    1.63E+06   1.87   -1113.
mchje+c2h5 = mchde+c2h6    1.32E+04   2.51   -111.  
mchje+o2 = mchde+ho2    6.00E+13   0.00   15470.
!
! When mchje is 6-methyl-cyclohex-1-ene-4-yl (secondary radical):
c*ccc*cc.c = mchje    6.0E+11   0.0   8000.  !CVN est: A from isom, Ea from addition 
c*cc*cc+c2h3 = c*ccc*cc.c    2.00E+11   0.0   3000.  !CVN est for c2h3 addition
! When mchje is 5-methyl-cyclohex-1-ene-6yl:
! cc*ccc*ccj = mchje (add?)
! cc*cc*c+c2h4 = cc*ccc*ccj
mchde+oh = mchjde+h2o    2.25E+13   0.0   1217.  !mche+oh: Ea- 1k          
mchde+ho2 = mchjde+h2o2    1.40E+12   0.0   13900.
mchde+ch3 = mchjde+ch4    1.00E+11   0.0   6300.  
mchde+c2h5 = mchjde+c2h6    1.00E+11   0.0   7300.
mchde+o2 = mchjde+ho2    2.70E+13  0.0  38200.  !Ea+5kcal 
!
!mchjde+oh = c6h5ch3+h2o     2.41E+06   2.00   -1192.  !CVN est 
!mchjde+ho2 = c6h5ch3+h2o2   1.32E+04   2.50   -1490.
!mchjde+ch3 = c6h5ch3+ch4    1.63E+06   1.87   -1113.
!mchjde+c2h5 = c6h5ch3+c2h6  1.32E+04   2.51   -111.
h+c6h5ch3 = mchjde           7.8e13     0.0     0.0           ! Analogy with benzene+h,1992BAU/COB411-429
mchjde+o2 = c6h5ch3+ho2      6.00E+13   0.00    0.
!
! mchjde is methycyclohexadiene radical, it has 3 resonant structures that lead to 3 sets of products:
c6h6+ch3=mchjde  6.2e11 0.0 7.59e3  ! Holt and Kerr, IJCK vol. 9, 1977
mchjde => c3h5-s+c2h2+c2h2    9.29E+16   -0.195   44703.  ! k from rev of cc*cc*cc*cj=mchdej (2.76E+12 0.0 4000.)
!
!---------------- mchyo25 ------------------
mchyo25+oh = c4h6+ch3chcho+h2o    2.50E+12   0.0   0.0  !iOctane for c7h14o1-2+oh
mchyo25+oh = c*cc*cc+ch2cho+h2o    2.50E+12   0.0   0.0  !iOctane for c7h14o1-2+oh
mchyo25+oh = cc.c*cccco+h2o    2.50E+12   0.0   0.0  ! est

mchyo25+ho2 = c4h6+ch3chcho+h2o2    5.0E+12   0.0   16700. !iOctane for c7h14o1-2+oh: Ea-1k
mchyo25+ho2 = c*cc*cc+ch2cho+h2o2    5.0E+12   0.0   16700.
mchyo25+ho2 = cc.c*cccco+h2o2    5.0E+12   0.0   15700. !Ea-2k

mchyo25+ch3 = c4h6+ch3chcho+ch4    5.0E+12   0.0   7500. !est
mchyo25+ch3 = c*cc*cc+ch2cho+ch4    5.0E+12   0.0   7500. !est 
mchyo25+ch3 = cc.c*cccco+ch4    5.0E+12   0.0   6500. !est

mchyo25+c2h5 = c4h6+ch3chcho+c2h6    5.0E+12   0.0   9000. !est
mchyo25+c2h5 = c*cc*cc+ch2cho+c2h6    5.0E+12   0.0   9000. !est
mchyo25+c2h5 = cc.c*cccco+c2h6    5.0E+12   0.0   8000. !est

mchyo25+o2 => c4h6+ch3chcho+ho2    1.40E+13  0.0  47000.
mchyo25+o2 => c*cc*cc+ch2cho+ho2    1.40E+13  0.0  47000.
mchyo25+o2 = cc.c*cccco+ho2    1.40E+13  0.0  46000.

hco+x13c6h10 = cc.c*cccco    1.0E+11   0.0   6000.  !iOctane rule

!Reactions of mchyo14
!Not added currently due to low branching of mch to mchr1 and mchr4

!------------- chxdch2 ------------
! chxdch2+h = mchr1        3.0E+13   0.0   3000.  !CVN est: h addition to ext c=c
chxdch2+h = mchr1        1.06e12  0.51 1230.0  ! Analogy with ic4h8+h=tc4h9, Curran, Alkyl decomp, IJCK, submitted 2004

! chxdch2+h = cychexch2    1.0E+13   0.0   2500.  !CVN est: h addition to int c=c
chxdch2+h = cychexch2    6.25e11  0.51  2620.0 ! Analogy with ic4h8+h=ic4h9, Curran, Alkyl decomp, IJCK, submitted 2004


!----------------- 2nd O2 association & further reactions ---------
!---mch2qj3---
mch2qj3+o2 = mch2q3qj    3.00E+12   0.0   0.0
! 5-membered ring:
! Ea reduced by 3 kcal for O2QOOH isomerizations:
!mch2q3qj = mch2o3q+oh    3.33E+10   0.0   23850.  !o2qooh isomer based on iOctane (5-mem), Curran et al. CF 2002,
! increase Ea by 2.5 kcal (Gulati and Walker).  A factor should be 1.0e11 not 3.33e10:
!mch2q3qj = mch2o3q+oh    1.00E+11 0.0 26350.0   !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker
mch2q3qj = mch2o3q+oh    6.2E+10 0.0 24500.0   !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 0.6, Ea+0.6 ( Handford-Styring & Walker) - 3 kcal for weak C-H
!mch2o3q = mch2o3oj+oh    1.50E+16   0.0   42000.  !iOctane rule 
mch2o3oj+oh = mch2o3q    1.0E+13   0.0   0.0  !CVN est
! The following are ring opening: (what does "slower than ring opening" mean?)
mch2o3oj => c3h6cho-1+ch3chco    9.61E+12    0.195   32665.  ! reverse from product addition (this is slower than ring opening)
!stable intermediate: (uncomment following reaction:)
! if co breaks off get:
! mch2o3oj = c3h6+ch2ch2cho+co    1.09E+11    0.275    26673.  ! reverse from product addition (this is slower than ring opening)
! mch2o3oj = c5h10cho-2+co       1.09E+11    0.275    26673.  ! Same rxn as above, except c5h10cho-2 does not break down.
mch2o3oj+o2 = ho2+mch2o3o    3.0E+13   0.0   2600. !CVN est
!
!---mch2qj1---
mch2qj1+o2 = mch2q1qj    1.50E+12   0.0   0.0 
! WJP: don't understand Ea increase of 1 kcal:
!mch2q1qj = mch2o1q+oh    3.33E+10   0.0   24850.  !based on iOctane (5-mem) !Ea increased by 1 kcal due to weaker position 1
! increase Ea by 2.5 kcal (Gulati and Walker).  A factor should be 1.0e11 not 3.33e10:
!mch2q1qj = mch2o1q+oh    1.0e11   0.0 26350.0   !Curran et al. Isooctane, CF2002, 5-mem ring, sec C-H, Ea+2.5kcal from Gulati & Walker
mch2q1qj = mch2o1q+oh    6.2e10   0.0 24500.0   !Curran et al. Isooctane, CF2002, 5-mem ring, sec C-H, Ea+2.5kcal from Gulati & Walker
!mch2o1q = mch2o1oj+oh    1.50E+16   0.0   42000.  !iOctane rule
mch2o1oj+oh = mch2o1q    1.0E+13   0.0   0.0  !CVN est
! How were the following commented out products arrived at?
!mch2o1oj = c3h6cho-1+ch3chco    9.61E+12    0.195   32665.  ! reverse from product addition (this is slower than ring opening)
!mch2o1oj = c2h4+hco+co+c3h6    1.09E+11    0.275    26673.  ! reverse from product addition (this is slower than ring opening)
mch2o1oj =>  c4h8coch3-1 + co    9.61E+12    0.195   32665.   ! reverse from product addition (this is slower than ring opening)
mch2o1oj => 2c2h4+ch3co+co       1.09E+11    0.275   26673.   ! reverse from product addition (this is slower than ring opening)
! (for 3 products in the above rxn use ch3coco = ch3co + co)
ch3+chx1o2o = mch2o1oj    8.0E+12   0.0   8500. !CVN est (A factor doubled for 2 C=O positions)

!---mch2qx---
mch2qx+o2 = mch2qxqj    2.0E+12   0.0   0.0
! second isomer, Ea reduced by 3 kcal for weak C-H:
!mch2qxqj = mch2oxq+oh    4.17E+09   0.0   17850.  !(6-mem)
! should have used 1.25e10 for A-factor above.
!mch2qxqj = mch2oxq+oh    7.50E+10 0.0 17850.0  !Curran et al. Isooctane, CF2002, sec C-H, factor of 6 for rotor not tied up
mch2qxqj = mch2oxq+oh    3.8E+10 0.0 17850.0  !Curran et al. Isooctane, CF2002, sec C-H, factor of 3 for rotor not tied up
!mch2oxq = mch2oxoj+oh    1.50E+16   0.0   42000.
mch2oxoj+oh = mch2oxq    1.0E+13   0.0   0.0  !CVN est
ch2o+chx1*o2j = mch2oxoj    1.00E+11   0.0   11900.  ! iOctane rate for c2h5+ch2o
chx1*o2j => c2h3+ch2co+c2h4    8.11E+13   0.508   28517.  !(rev of cyclization c*cc(*o)ccc.=chx2o1j, k=2.7E11  0.  8.0 )
chx1*o2j => c2h4+c2h4+hcco    4.24E+15   0.195   36287.  !(rev of cyclization o*c*ccccc.=chx2o1j, k=2.7E11  0.  8.5 )
!chx1*o2j+o2 = ho2+chx1o2o    3.0E+13   0.0   2600. !CVN est

!---mch2qj4---
mch2qj4+o2 = mch2q4qj    1.5E+12   0.0   0.0
!mch2q4qj = mch2o4q+oh    4.17E+09   0.0   17850.  !(6-mem)
! correct reduction of above  a-factor by 3:
!mch2q4qj = mch2o4q+oh    1.25E+10 0.0 20350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker.
mch2q4qj = mch2o4q+oh    4.6E+10 0.0 21100.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.7, Ea+3.2 ( Handford-Styring & Walker) - 3 kcal for weak C-H
!mch2o4q = mch2o4oj+oh    1.50E+16   0.0   42000.
mch2o4oj+oh = mch2o4q     1.0E+13   0.0   0.0  !CVN est
mch2o4oj => ch2cho+ch3chco+c2h4    1.73E+12     -0.033  24620. ! reverse from product addition (this is slower than ring opening)
mch2o4oj => ch2co+c4h8cho-2    3.65E+12      0.039   31126.  ! reverse from product addition (this is slower than ring opening)
mch2o4oj+o2 = ho2+mch2o4o    3.0E+13   0.0   4130. !CVN est

!---mch2qj5---
mch2qj5+o2 = mch2q5qj    3.0E+12   0.0   0.0
!mch2q5qj = mch2o5q+oh    1.56E+09 0.0 21050.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+5kcal from Gulati & Walker Ea-3kcal for weak C-H
mch2q5qj = mch2o5q+oh    5.4E+09 0.0 21400.0  !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.5, Ea+5.3 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch2o5q = mch2o5oj+oh    1.50E+16   0.0   42000.
mch2o5oj+oh = mch2o5q   1.0E+13   0.0   0.0  !CVN est
mch2o5oj => c3h6+ch2cho+ch2co    4.73E+10    0.729   19243.  ! reverse from product addition (ring opening k=2.30E+14  0.385  16.24, krev=3.0E10 0. 9.)
mch2o5oj => ch2cho+c2h4+ch3chco    1.88E+10    0.620   20669.  ! reverse from product addition
! For formation of co rather than ketone: (more energetically favored):
!mch2o5oj = c3h6+co+ch2ch2cho   4.73E+10    0.729   19243.  ! reverse from product addition (ring opening k=2.30E+14  0.385  16.24, krev=3.0E10 0. 9.)
!mch2o5oj = c2h4+co+c3h6+hco    1.88E+10    0.620   20669.  ! reverse from product addition
! or use product c3h6cho-2 which decomposes to c3h6+hco
mch2o5oj+o2 = ho2+mch2o5o    3.0E+13   0.0   4130. !CVN est
!---mch2qj6---
mch2qj6+o2 = mch2q6qj    3.0E+12   0.0   0.0
!mch2q6qj = mch2o6q+oh    4.17E+09   0.0   17850.  !(6-mem)
!mch2q6qj = mch2o6q+oh    1.25E+10 0.0  20350.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker - 3kcal for weak C-H
mch2q6qj = mch2o6q+oh    4.6E+10 0.0  21100.0  !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.7, Ea+3.2 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch2o6q = mch2o6oj+oh    1.50E+16   0.0   42000.
mch2o6oj+oh = mch2o6q    1.0E+13   0.0   0.0  !CVN est
! to get decomposition rate of mch2o6oj: c7h11j46*o is cjccc(*o)c(c)c*o
! c7h11j46*o = mch2o6oj    2.16E+07 0.86 1.010E+04 ! A-factor and n from Matheu et al. 
!                         IJCK 2003 for 1,6 addition reduced by factor of 4.6 for additional rotor tied up.  4.6 is ratio of 1,6 to 1,5 addition. 
!                         Ea adjusted for difference between addition to c=o compared to c=c (4.2kcal) based on Curran, IJCK 2004.

!Addition of a primary radical to the C side of carbonyl.  A-factor: ties up 5 rotors.
mch2o6oj => ch3chco+ch2cho+c2h4  1.13e18 -0.788 20488.0 ! Reverse rate from ChemRev, forward from c7h11j46*o = mch2o6oj, 
!                                                         A-factor times 2 since it can beta-scission two ways, 2*5.67e17
!mch2o6oj => ch3chcho+ch2cho+c2h4

!---mch3qj2---(mch3qj2 is a lumped species of mch3qj2 and mch3qj4)
mch3qj2+o2 = mch3q2qj    3.0E+12   0.0   0.0
!mch3q2qj = mch3o2q+oh    3.33E+10   0.0   23850. 5-mem
! correct a-factor above for factor of 3 reduction.
!mch3q2qj = mch3o2q+oh    1.00E+11 0.0 26350.0 !Curran et al. Isooctane,CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker - 3kcal for weak C-H 
mch3q2qj = mch3o2q+oh    6.2E+10 0.0 24500.0 !Curran et al. Isooctane,CF2002, sec C-H, A-factor x 0.6, Ea+0.6 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch3o2q = mch3o2oj+oh    1.50E+16   0.0   42000.
mch3o2oj+oh = mch3o2q     1.0E+13   0.0   0.0  !CVN est
!mch3o2oj => ch2co+ch3+c2h4+hcco 
mch3o2oj => ch2cho+c2h4+ch3chco    9.61E+12    0.195   32665.  !similar to mch2o3oj
mch3o2oj+o2 = ho2+mch2o3o    3.0E+13   0.0   2600. !CVN est

!---mch3qj5---
mch3qj5+o2 = mch3q5qj    3.0E+12   0.0   0.0
!mch3q5qj = mch3o5q+oh    4.17E+09   0.0   17850. !(6-membered isomerization)
!mch3q5qj = mch3o5q+oh    1.25E+10 0.0 20350.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker - 3kcal for weak C-H
mch3q5qj = mch3o5q+oh    4.6E+10 0.0 21100.0  !Curran et al. Isooctane, CF2002, sec C-H, EA-factor x 0.6, Ea+0.6 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch3o5q = mch3o5oj+oh    1.50E+16   0.0   42000.
mch3o5oj+oh = mch3o5q     1.0E+13   0.0   0.0  !CVN est
mch3o5oj => c3h6+ch2co+ch2cho    1.38E+11      0.315  32183. !reverse from product addition to coc4coc.
duplicate
mch3o5oj => c3h6+ch2co+ch2cho    2.76E+12      0.242  22100. !reverse from product addition to ic4.cocco
duplicate
mch3o5oj+o2 = ho2+mch3o5o    3.0E+13   0.0   4130. !CVN est

!---mch3qj1---
mch3qj1+o2 = mch3q1qj    1.50E+12   0.0   0.0
! Explain "weaker position 1":?
!mch3q1qj = mch3o1q+oh    4.17E+09   0.0   18850.  !Ea increased by 1 kcal due to weaker position 1
! 6-mem ring TST:
!mch3q1qj = mch3o1q+oh    1.25E+10 0.0 20350.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker, Ea - 3kcal for weak C-H
mch3q1qj = mch3o1q+oh    4.6E+10 0.0 21100.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.7, Ea+3.2 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch3o1q = mch3o1oj+oh    1.50E+16   0.0   42000.
mch3o1oj+oh = mch3o1q     1.0E+13   0.0   0.0  !CVN est
mch3o1oj => ch2co+c2h4+ch3coch2    8.66E+11      0.181  23857.  !reverse from product addition to ccoccoc3.
duplicate
mch3o1oj => ch2co+c2h4+ch3coch2    4.40E+11      0.297  31906.  !reverse from product addition to ccoc3coc.
duplicate
ch3+chx1o3o = mch3o1oj    8.0E+12   0.0   8500.

!---mch3qj4---(this species has been lumped with mch3qj2, note that it gives c3h6)
!(add when you have thermo for species and last 2 rates below)
!mch3qj4+o2 = mch3q4qj    1.50E+12   0.0   0.0
!mch3q4qj = mch3o4q+oh    3.33E+10   0.0   23850.  !o2qooh isomer based on iOctane (5-mem), Curran et al. CF 2002
!mch3o4q = mch3o4oj+oh    1.50E+16   0.0   42000.
!mch3o4oj = c2h4+c3h6+hco+co
!mch3o4oj = co+c3h6+ch2ch2cho

!---mch3qj6---
mch3qj6+o2 = mch3q6qj    3.0E+12   0.0   0.0
!mch3q6qj = mch3o6q+oh    5.20E+08   0.0   16050.
! 7-membered TST:
! Correct A-factor for factor of 3 reduction above:
!mch3q6qj = mch3o6q+oh   1.56E+09 0.0 21050.0 !Curran et al. Isooctane, CF2002, sec C-H, Ea+5.0kcal from Gulati & Walker, Ea - 3kcal for weak C-H
mch3q6qj = mch3o6q+oh   5.4E+09 0.0 21400.0 !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.5, Ea+5.3 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch3o6q = mch3o6oj+oh    1.50E+16   0.0   42000.
mch3o6oj+oh = mch3o6q     1.0E+13   0.0   0.0  !CVN est
mch3o6oj => c3h6+ch2co+ch2cho    4.73E+10    0.729   19243.  ! from mch2o5oj
mch3o6oj => c2h4+ch2co+ch3chcho    1.88E+10    0.620   20669. ! from mch2o5oj
mch3o6oj+o2 = ho2+mch3o6o       3.0E+13   0.0   4130. !CVN est

!--- mch4qj3 ---
!all rates from mch3qj2
mch4qj3+o2 = mch4q3qj    3.0E+12   0.0   0.0 
!mch4q3qj = mch4o3q+oh    3.33E+10   0.0   23850.
! 5-mem ring TST:
!mch4q3qj = mch4o3q+oh    1.00E+11 0.0 26350.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker - 3kcal for weak C-H
mch4q3qj = mch4o3q+oh    6.2E+10 0.0 24500.0  !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 0.6, Ea+0.6 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch4o3q = mch4o3oj+oh    1.50E+16   0.0   42000.
mch4o3oj+oh = mch4o3q    1.0E+13   0.0   0.0  !CVN est
mch4o3oj => ch2co + c3h6+ch2cho    9.61E+12    0.195   32665.
mch4o3oj+o2 = ho2+mch3o4o    3.0E+13   0.0   2600.

!--- mch4qj2 ---
!all rates from mch2qj4
mch4qj2+o2 = mch4q2qj    3.0E+12   0.0   0.0
!mch4q2qj = mch4o2q+oh    4.17E+09   0.0   17850.
! 6-mem ring TST
! Correct factor of 3 reduction above in A-factor:
!mch4q2qj = mch4o2q+oh    1.25E+10 0.0 20350.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+2.5kcal from Gulati & Walker, Ea - 3kcal for weak C-H
mch4q2qj = mch4o2q+oh    4.6E+10 0.0 21100.0  !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.7, Ea+3.2 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch4o2q = mch4o2oj+oh    1.50E+16   0.0   42000.
mch4o2oj+oh = mch4o2q     1.0E+13   0.0   0.0  !CVN est
mch4o2oj => ch2co + c2h4+ch3chcho    1.73E+12     -0.033  24620.
mch4o2oj => c3h6 + ch2co+ch2cho    3.65E+12      0.039   31126.
mch4o2oj+o2 = ho2+mch2o4o    3.0E+13   0.0   4130.
!
!--- mch4qj1 ---
mch4qj1+o2 = mch4q1qj    1.50E+12   0.0   0.0
! mch4q1qj = mch4o1q+oh    5.20E+08   0.0   16050.
! 7-mem ring TST, correct above factor of 3 reduction in a-factor:
!mch4q1qj = mch4o1q+oh  1.56E+09 0.0 21050.0  !Curran et al. Isooctane, CF2002, sec C-H, Ea+5.0kcal from Gulati & Walker, Ea - 3kcal for weak C-H
mch4q1qj = mch4o1q+oh  5.4E+09 0.0 21400.0  !Curran et al. Isooctane, CF2002, sec C-H, A-factor x 3.7, Ea+3.2 (Handford-Styring & Walker) - 3 kcal for weak C-H
!mch4o1q = mch4o1oj+oh    1.50E+16   0.0   42000.
mch4o1oj+oh = mch4o1q    1.0E+13   0.0   0.0  !CVN est
mch4o1oj => c2h4 + ch2co+ch3coch2      1.88E+10    0.620   20669.
ch3+chx1o4o = mch4o1oj    8.0E+12   0.0   8500. !CVN est (A factor doubled for 2 C=O positions)
!
! Tertiary position, 1, has no weak H-atom to abstract.  We have neglected
! the second addition of o2 and o2qooh isomerization here.
! The neglected alternative isomerizations that may be important.
!--- mch1qx ---
!This channel is may not important if
! mch1q radicals tend to dissociate before adding 2nd o2
!--- mch1qj2 ---
!--- mch1qj3 ---
! 2 out of 3 alternative ro2 isomerizations lead to OH, one to HO2:
!--- mch1qj4 ---
!
! Should rename the next two species to be consistent with naming convention above:
!--- chxj3ch2q --- Add 7 membered ring?:
!chxj3ch2q+o2=chxq3ch2q 1.56e9 0.0 19350.0 ! o2qooh, 7-membered ring, primary based on iso-octane, Curran et al.
!chxq3ch2q = chx3q1cho + oh  1.50E+16   0.0   42000.  !iOctane rule
!chx3q1cho = ch2cho+c3h6cho-1
!chx3q1cho = c2h4+ch2chcho+ch2cho
!--- chxj1ch2q ---
chxj1ch2q+o2 = mchxq1qj    1.5E+12   0.0   0.0
! mchxq1qj = chxcho1q+oh    6.67E+10   0.0   26400.
! 5-mem ring TST, primary C-H, correct above factor of 3 reduction in A-factor:
mchxq1qj = chxcho1q+oh    2.00E+11 0.0 26400.0  !Curran et al. Isooctane, CF2002, prim C-H, Ea-3kcal for weak C-H, degen=2
chxcho1q = oh + chx1*o+hco    1.0E+16   0.0   46000.  !CVN est
!--- chxj2ch2q ---
chxj2ch2q+o2 = mchxq2qj    3.0E+12   0.0   0.0
! mchxq2qj = chxcho2q+oh    8.33E+09   0.0   21400.
! 6-mem ring TST:
mchxq2qj = chxcho2q+oh   7.5E+10 0.0 21400.0 !Curran et al. Isooctane, CF2002, prim C-H, Ea-3kcal for weak C-H, deg=2, factor of 3 for rotor not tied up
!chxcho2q = chxcho2oj+oh    1.50E+16   0.0   42000.
chxcho2oj+oh = chxcho2q     1.0E+13   0.0   0.0  !CVN est
hco+chxyo12 = chxcho2oj     1.0E+11   0.0   5500.  !CVN est based on hco+c2h4 addition
! CHX
! -@-@-@-@-@-@-@-@-@-@-@- Cyclohexane (chx) chemistry begins here EJS May 2006 -@-@-@-@-@-@-@-@-
! chx Low Temperature
! R = beta scission products
c6h11-16 = chxrad 1.00e+08 0.86 5900. ! Ring opening step in rev, based on Green's 1-6 endo addition
                                   ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) 
! R + O2 = RO2
chxrad + o2 = chxo2j 3.00e+12 0.0 0.0 ! Analogy with MCH_ver1r.mech, by Pitz et al submitted 
                                      ! to 31st Symposium (Aug 2006)
                                      ! Note: Wu and Bates give 8.4e+12 - maybe increase rate used here to this value. 
! Direct elimination of HO2 and cychexene from ro2 added now 1jun06 - using Ranzi rate
! chxo2j = cychexene + ho2 7.7e+12 0.0 29000. ! Direct elimnation of HO2
                                            ! Orig. rate by Ranzi et al. 
                                            ! paper submitted to Symposium 2006  
! chxo2j = cychexene + ho2 2.96e+12 0.0 29000. ! Direct elimnation of HO2
                                             ! A-factor reduced by 2.6 --- Ranzi et al. 
                                             ! paper submitted to Symposium 2006 
chxo2j = cychexene + ho2 3.85e+12 0.0 29000. ! Direct elimnation of HO2
                                             ! A-factor reduced by 2.0 --- Ranzi et al. 
                                             ! paper submitted to Symposium 2006                                              
! RO2 => QOOH
chxo2j = chx1q2j 4.94e+11 0.0 31000. ! Ea reduced to 31kcal (from 33kcal) 5mem
                                     ! (A factor times 2 for expt agreement)
                                     ! Ea = Ea for ho2 elim + 4 kcal 
                                     ! DeSain, Klippenstein, Miller and Taajtes JPCA, 2003.
! chxo2j = chx1q2j 2.47e+11 0.0 31000. ! Ea reduced to 31kcal (from 33kcal) 5mem 
                                     ! Ea = Ea for ho2 elim + 4 kcal 
                                     ! DeSain, Klippenstein, Miller and Taajtes JPCA, 2003.
! chxo2j = chx1q2j 2.47e+11 0.0 33000. ! Ea = Ea for ho2 elim + 4 kcal 5mem
                                     ! DeSain, Klippenstein, Miller and Taajtes JPCA, 2003.
! chxo2j = chx1q2j 2.47e+11 0.0 27495. ! Curran et al. Isooctane, CF(2002) sec C-H, A-factor times 0.6, Ea+0.6kcal 
                                     ! from Handford-Styring and Walker.
chxo2j = chx1q3j 1.86e+11 0.0 24077. ! Curran et al. Isooctane, CF(2002) sec C-H, A-factor times 3.7 & Ea+3.2kcal 
                                     ! from Handford-String and Walker 
chxo2j = chx1q4j 1.08e+10 0.0 24356. ! Curran et al. Isooctane, CF(2002) sec C-H, A-factor times 3.5 & Ea+5.3kcal 
                                     ! from Handford-String & Walker
! QOOH various decomposition routes
! For chx1q2j: 
cychexene + ho2 = chx1q2j  8.0e+10 0.0 6000. ! Average value from MCH_ver1r.mech, which was CVN estimate for ho2 
                                             ! addition to double bond
! chx1q2j = cychexene + ho2 5.0e+11 0.0 33000. ! Ea is Ranzi Ea for elimination plus 4kcal based on 
                                             ! Miller & Klippenstein JPCA 2003
                                             ! A-factor is an estimate - verify later 
hx1en3q6j = chx1q2j 2.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
hx1en1q6j = chx1q2j 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
! Reduction of a-factor for above 2 rxns by factor of 20. 
! Not enough qooh going to chain bracnhing routes - hence ring opening step above may be too fast. 
! hx1en3q6j = chx1q2j 1.0e+7 0.86 5900. ! EJS - 16may06: Above Matheu A-factor reduced by factor of 20*degen
! hx1en1q6j = chx1q2j 5.0e+6 0.86 5900. ! EJS - 16may06: Above Matheu A-factor reduced by factor of 20*degen
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 17000. ! Ranzi et al. rate for qooh = qo + oh below, but Ea further increased 
                                          ! to 17kcal 
                                          ! Increase is to match RCM expts of Lemaire et al. 
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 16000. ! Ranzi et al. rate for qooh = qo + oh below, but Ea increased to 16kcal 
                                          ! Increase is to match RCM expts of Lemaire et al.                         
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 15400. ! Rate used by Ranzi et al. for qooh = qo + oh
                                          ! paper submitted to Symposium 2006
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 14000. ! Ranzi et al. for qooh = qo + oh as above, but Ea decreased to 14kcal
                                          ! Decrease is to match RCM expts of Lemaire et al.
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 13400. ! Rate used by Ranzi et al. for qooh = qo + oh, Ea reduced to 13.4kcal
                                          ! paper submitted to Symposium 2006
chx1q2j = chxyo12 + oh 5.8e+12 0.0 13400. ! Rate used by Ranzi et al. for qooh = qo + oh, Ea reduced to 13.4kcal
                                          ! A factor times 2
                                          ! paper submitted to Symposium 2006                                                                                      
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 12500. ! Ranzi et al. for qooh = qo + oh as above, but Ea further decreased to 12.5kcal
                                          ! Decrease is to match RCM expts of Lemaire et al
! chx1q2j = chxyo12 + oh 2.9e+12 0.0 10000. ! Ranzi et al. for qooh = qo + oh as above, but Ea further decreased to 10kcal
                                          ! Decrease is to match RCM expts of Lemaire et al                                                                                                                                           
! Original rate ver1h:                                          
! chx1q2j = chxyo12 + oh 6.21e+12 0.0 15900. ! Table 11 Green et al. JPCA 107: 4908-4920 (2003); 
                                           ! Adjusted A-factors for 1 rotor not lost. 
                                           ! From cc.cooh = cCycco + oh
! chx1q2j = chxyo12 + oh 1.24e+12 0.0 15900. ! EJS - 16may06: Above Green A-factor reduced by factor of 5
                                           ! to improve reactivity. Above didn't have enough going to 
                                           ! branching + hence was unreactive 
! Decomposition of subsequent prod/radicals
c2h4 + bt1en3q4j = hx1en3q6j 1.32e+4 2.48 6130. ! c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran 
                                                ! Int J Chem Kinet 38:250�275, (2006)  
c4h6 + ho2 = bt1en3q4j 2.0e+11 0.0 7600. ! Addition of ho2 to internal C atom in C=C double bond. 
                                         ! A factor x 2 for twice possible addition sites
                                         ! Rxn Type 20, page 263 H.J. Curran C&F 129:253�280 (2002) 
bt1en1q4j + c2h4 = hx1en1q6j 1.32e+4 2.48 6130. ! c2h4 + c2h5 = pc4h9, from H.J. Curran 
                                                ! Int J Chem Kinet 38:250�275, (2006)
c2h4 + c2h2ooh = bt1en1q4j 2.00e+11 0.0 2010. ! Analogy with c2h4+c2h3 from Weissman and Benson IJCK (1989), 
                                              ! Benson says Ea is lower limit
chxyo12 + oh = chx1*o2j + h2o 3.4e+6 1.90 -1451. ! H abs of tertiary-type H, 2 available
                                                 ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo12 + h = chx1*o2j + h2 1.20e+6 2.4 2583. ! H abs of tertiary-type H, 2 available
                                              ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo12 + ch3 = chx1*o2j + ch4 1.79e+4 2.33 6147. ! H abs of tertiary-type H, 2 available
                                                  ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo12 + ho2 = chx1*o2j + h2o2 3.0e+4 2.5 12260. ! H abs of tertiary-type H, 2 available
                                                  ! ho2 + ic4h10, A factor for 2 tertiary C-H sites
                                                  ! No n available from Curran data, hence use of Walker data here
                                                  ! Table 7, Scott and Walker C&F 129:365�377 (2002)
hx1n3*o6j = chx1*o2j 1.0e+08 0.86 5900. ! Ring opening step, based on Green's 1,6 endo addition
                                        ! Only approx. as ring strain may be diff due to c=o
                                        ! Matheu et al. IJCK 35: 95�119 (2003)
c2h4 + bt1n3*o4j = hx1n3*o6j 1.76e+4 2.48 6130. ! c2h4 + ch3 = nc3h7 Table 3 from H.J. Curran
                                                ! Int J Chem Kinet 38:250�275, (2006)
ch2co + c2h3 = bt1n3*o4j 2.0e+11 0.0 2010. ! Analogy with c2h4 + c2h3, Weissman and Benson, IJCK (1989) 
                                           ! Benson says Ea is lower limit
! For chx1q3j:
hx1en6q6j = chx1q3j 5.0e+07 0.86 5900. ! 75% reduction of Matheu et al. A-factor below.
                                       ! Rate adjusted to match RCM expts of Lemaire et al. 
! hx1en6q6j = chx1q3j 2.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                        ! Actually chx1q3j = hex5enal + oh (straight away)
                                        ! Get rate from reverse of above reaction, and then comment out this rxn
                                        ! and just have this qooh going straight to hex5enal + oh
hx1en4q6j = chx1q3j 2.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
! Reduction of a-factor for above 2 rxns by factor of 20. 
! Not enough qooh going to chain bracnhing routes - hence ring opening step above may be too fast.
! hx1en6q6j = chx1q3j 1.0e+07 0.86 5900. ! EJS - 16may06: Above Matheu A-factor reduced by factor of 20*degen
! hx1en4q6j = chx1q3j 1.0e+07 0.86 5900. ! EJS - 16may06: Above Matheu A-factor reduced by factor of 20*degen
chx1q3j = chxyo13 + oh 1.4e+12 0.0 20000. ! Ranzi et al. rate for qooh = qo + oh below, but Ea reduced to 20kcal
                                          ! Reduction to match RCM expts of Lemaire et al. 
! chx1q3j = chxyo13 + oh 1.4e+12 0.0 23400. ! Rate used by Ranzi et al. for qooh = qo + oh
                                          ! paper submitted to Symposium 2006 
! Original rate ver1h:
! chx1q3j = chxyo13 + oh 6.71e+12 0.0 17400. ! Table 11 Green et al. JPCA 107: 4908-4920 (2003); 
                                           ! Adjusted A-factors for 2 rotors not lost.
                                           ! From  CCC.CCOOH=CCcyCCCO + OH
! chx1q3j = chxyo13 + oh 1.34e+12 0.0 17400. ! EJS - 16may06: Above Green A-factor reduced by factor of 5
                                           ! to improve reactivity. Above didn't have enough going to 
                                           ! branching + hence was unreactive 
! Decomposition of subsequent prod/radicals
hex5enal + oh = hx1en6q6j 4.76e+7 1.54 34700. ! Addition of oh to o of c=o
                                              ! Analogy with the reverse rate of rxn ch3oco = ch3 + co2 
                                              ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                              ! Glaude 2003, cbsQ + isodesmic + rotors
c2h3ooh + c4h7 = hx1en6q6j 1.32e+4 2.48 6130. ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran
                                              ! Int J Chem Kinet 38:250�275, (2006)
hex5enal + oh = hx5enal1j + h2o 2.0e+6 1.8 1300. ! H abs by oh of h on c=o
                                                 ! Analogy with ch3cho + oh
                                                 ! Taylor et al, Proc. Comb. Inst. 26: 497-504 (1996)
hex5enal + oh = hx5enal4j + h2o 3.17e+06 2.0 -1434. ! Rate rule for secondary Allylic H, Heyberger et al
                                                    ! IJCK 34:666-677 (2002)
! hex5enal + oh = hx5enal4j + h2o 1.8e+6 2.0 -1133. ! H abs by oh from ch2 
                                                  ! ic8 by Curran C&F 129: 253-280 (2002)
hex5enal + h = hx5enal1j + h2 1.34e+13 0.0 3300. ! H abs by oh of h on c=o
                                                 ! Assume rate rule for aldehydic H from nc7_38 LLNL mech
                                                 ! ch3cho + h from Whytock et al J.Chem.Phys 65 (1976)
hex5enal + h = hx5enal4j + h2 5.02e+04 2.5 -1912. ! Rate rule for secondary Allylic H, Heyberger et al
                                                  ! IJCK 34:666-677 (2002)
! hex5enal + h = hx5enal4j + h2 1.15e+6 2.49 4124. ! H abs by h from ch2
                                                 ! ic8 by Curran C&F 129: 253-280 (2002)
hex5enal + ch3 = hx5enal1j + ch4 1.34e+13 0.0 3300. ! H abs by ch3 of h on c=o
                                                    ! Assume rate rule for aldehydic H from nc7_38 LLNL mech
hex5enal + ch3 = hx5enal4j + ch4 1.00e-01 3.50 4046. ! Used primary rate rule for Allylic H, Heyberger et al
                                                     ! IJCK 34:666-677 (2002)
                                                     ! Lowered Ea by 0.65(BD primary allyllic - secondary allyllic).
                                                     ! .65 is for ch3 abs rxns Dean&Bozz Comb. Chem. of N2 (1997)
! hex5enal + ch3 = hx5enal4j + ch4 5.42e+4 2.26 7287. ! H abs by ch3 from ch2
                                                    ! ic8 by Curran C&F 129: 253-280 (2002)
hex5enal + ho2 = hx5enal1j + h2o2 2.06e+4 2.5 10205.23 ! H abs by ho2 of h on c=o
                                                       ! Analogy with ch2o + ho2
                                                       ! Eiteneer & Frenklach JPCA 102: 5196-5205 (1998)                                                    
! hex5enal + ho2 = hx5enal1j + h2o2 4.82e+3 2.6 13910. ! H abs by ho2 of h on c=o
                                                     ! Analogy with ch3cho + ho2
                                                     ! Curran et al, C3_31 mech (2004)
hex5enal + ho2 = hx5enal4j + h2o2 6.80e+03 2.50 10113.8 ! Rate rule for secondary allylic H, 
                                                        ! Scott and Walker C&F 129:365�377 (2002).
                                                        ! Estimate based on ethylbenzene+ho2
! hex5enal + ho2 = hx5enal4j + h2o2 1.12e+13 0.0 17686. ! H abs by ho2 from ch2
                                                      ! ic8 by Curran C&F 129: 253-280 (2002)
ch2co + c4h7 = hx5enal1j 1.32e+4 2.48 6130. ! Addition of c2h5 type radical to c of c=c
                                            ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran 
                                            ! Int J Chem Kinet 38:250�275, (2006)
c4h6 + ch2cho = hx5enal4j 3.52e+4 2.48 6130. ! Analogy with c3h6 + ch3 = sc4h9, Table 3 from H.J. Curran
                                             ! A factor x 2 for 2 possible addition sites
                                             ! Int J Chem Kinet 38:250�275, (2006)
c2h3ooh + oh = c2h2ooh + h2o 1.8e+6 2.0 -1133. ! H abstrac by oh, analogy with rates by Curran et al
                                               ! Table 1, ic8 by Curran C&F 129: 253-280 (2002)
c2h3ooh + h = c2h2ooh + h2 1.15e+6 2.49 4124. ! H abstrac by h, analogy with rates by Curran et al
                                               ! Table 1, ic8 by Curran C&F 129: 253-280 (2002)
c2h3ooh + ch3 = c2h2ooh + ch4 5.42e+4 2.26 7287. ! H abstrac by ch3, analogy with rates by Curran et al
                                                 ! Table 1, ic8 by Curran C&F 129: 253-280 (2002)
c2h3ooh + ho2 = c2h2ooh + h2o2 1.12e+13 0.0 17686. ! H abstrac by ho2, analogy with rates by Curran et al
                                                   ! Table 1, ic8 by Curran C&F 129: 253-280 (2002)
c2h2 + ho2 = c2h2ooh 2.0e+11 0.0 12500. ! Addition of ho2 to c 
                                        ! A factor x 2 for 2 terminal H's/addition sites
                                        ! Rxn Type 20, page 263 H.J. Curran C&F 129:253�280 (2002)
c2h4 + bt1en4q4j = hx1en4q6j 1.32e+4 2.48 6130. ! Analogy with c2h4 + c2h5 = pc4h9, table 3 from H.J. Curran
                                                ! Int J Chem Kinet 38:250�275, (2006)
ac3h5cho + oh = bt1en4q4j 4.76e+7 1.54 34700. ! Addition of oh to o of c=o
                                              ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                              ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                              ! Glaude 2003, cbsQ + isodesmic + rotors  
chxyo13 + oh = chx1*o3j + h2o 3.4e+6 1.90 -1451. ! H abs of tertiary-type H, 2 available
                                                 ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo13 + h = chx1*o3j + h2 1.20e+6 2.4 2583. ! H abs of tertiary-type H, 2 available
                                              ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo13 + ch3 = chx1*o3j + ch4 1.79e+4 2.33 6147. ! H abs of tertiary-type H, 2 available
                                                  ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo13 + ho2 = chx1*o3j + h2o2 3.0e+4 2.5 12260. ! H abs of tertiary-type H, 2 available
                                                  ! ho2 + ic4h10, A factor for 2 tertiary C-H sites
                                                  ! No n available from Curran data, hence use of Walker data here
                                                  ! Table 7, Scott and Walker C&F 129:365�377 (2002)
hx5enal1j = chx1*o3j 1.0e+08 0.86 5900. ! Ring opening step, based on Green's 1,6 endo addition
                                        ! Only approx. as ring strain may be diff due to c=o
                                        ! Matheu et al. IJCK 35: 95�119 (2003)
hxen4al6j = chx1*o3j 1.0e+08 0.86 5900. ! Ring opening step, based on Green's 1,6 endo addition
                                        ! Only approx. as ring strain may be diff due to c=o
                                        ! Matheu et al. IJCK 35: 95�119 (2003)
c2h4 + ac3h5c*o4 = hxen4al6j 1.32e+4 2.48 6130. ! Analogy with c2h4 + c2h5 = pc4h9, table 3 from H.J. Curran
                                                ! Int J Chem Kinet 38:250�275, (2006)
ch2co + c2h3 = ac3h5c*o4 2.0e+11 0.0 2010. ! Analogy with c2h4 + c2h3, Weissman and Benson, IJCK (1989) 
                                           ! Benson says Ea is lower limit
! For chx1q4j:
hx1en5q6j = chx1q4j 2.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
! Reduction of a-factor for above rxn by factor of 20. 
! Not enough qooh going to chain bracnhing routes - hence ring opening step above may be too fast.
! hx1en5q6j = chx1q4j 1.0e+07 0.86 5900. ! EJS - 16may06: Above Matheu A-factor reduced by factor of 20*degen
chx1q4j = chxyo14 + oh 8.6e+12 0.0 18500. ! Ranzi et al. rate for qooh = qo + oh below, but Ea further reduced 
                                           ! to 18.5kcal 
                                           ! Reduced to match RCM expts of Lemaire et al.
! chx1q4j = chxyo14 + oh 8.6e+12 0.0 19000. ! Ranzi et al. rate for qooh = qo + oh below, but Ea reduced to 19kcal 
                                           ! Reduced to match RCM expts of Lemaire et al.
! chx1q4j = chxyo14 + oh 8.6e+12 0.0 20700. ! Rate used by Ranzi et al. for qooh = qo + oh
                                           ! paper submitted to Symposium 2006 
! Original rate ver1h:
! chx1q4j = chxyo14 + oh 3.31e+12 0.0 13000. ! Table 11 Green et al. JPCA 107: 4908-4920 (2003);
                                           ! Adjusted A-factors for 3 rotors not lost.
                                           ! Analogy from MCH mech where 5-mem CCCCO ring across MCH was used
! chx1q4j = chxyo14 + oh 6.62e+11 0.0 13000. ! EJS - 16may06: Above Green A-factor reduced by factor of 5
                                           ! to improve reactivity. Above didn't have enough going to 
                                           ! branching + hence was unreactive 
! Decomposition of subsequent prod/radicals
x15c6h10 + ho2 = hx1en5q6j 2.0e+11 0.0 12500. ! Addition of ho2 to terminal c of c=c 
                                              ! A factor x 2 for 2 H's/addition sites
                                              ! Rxn Type 20, page 263 H.J. Curran C&F 129:253�280 (2002)
c2h3ooh + c4h7 = hx1en5q6j 1.89e+3 2.67 6850. ! Analogy with c3h6 + ch3 = ic4h9, Table 3 from H.J. Curran 
                                              ! Int J Chem Kinet 38:250�275, (2006)
chxyo14 + oh = chx1*o4j + h2o 3.4e+6 1.90 -1451. ! H abs of tertiary-type H, 2 available
                                                 ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo14 + h = chx1*o4j + h2 1.20e+6 2.4 2583. ! H abs of tertiary-type H, 2 available
                                              ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo14 + ch3 = chx1*o4j + ch4 1.79e+4 2.33 6147. ! H abs of tertiary-type H, 2 available
                                                  ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chxyo14 + ho2 = chx1*o4j + h2o2 3.0e+4 2.5 12260. ! H abs of tertiary-type H, 2 available
                                                  ! ho2 + ic4h10, A factor for 2 tertiary C-H sites
                                                  ! No n available from Curran data, hence use of Walker data here
                                                  ! Table 7, Scott and Walker C&F 129:365�377 (2002)
hx1n5al6j = chx1*o4j 1.0E+08 0.86 5900. ! Ring opening step, based on Green's 1,6 endo addition
                                        ! Only approx. as ring strain may be diff due to c=o
                                        ! Matheu et al. IJCK 35: 95�119 (2003)
ch2co + c4h7 = hx1n5al6j 1.32e+4 2.48 6130. ! Addition of c2h5 type radical to c of c=c
                                            ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran 
                                            ! Int J Chem Kinet 38:250�275, (2006)
! QOOH + O2 = O2QOOH
chx1q2j + o2 = chx1q2qj 3.00e+12 0.0 0.0 ! Analogy with MCH_ver1r.mech by Pitz et al submitted 
                                         ! to 31st Symposium (Aug 2006)
chx1q3j + o2 = chx1q3qj 3.00e+12 0.0 0.0 ! Analogy with MCH_ver1r.mech by Pitz et al submitted 
                                         ! to 31st Symposium (Aug 2006)
chx1q4j + o2 = chx1q4qj 3.00e+12 0.0 0.0 ! Analogy with MCH_ver1r.mech by Pitz et al submitted 
                                         ! to 31st Symposium (Aug 2006)
! O2QOOH = ketohyroperoxide + oh
! chx1q2qj = chx1*o2q + oh 2.0e+11 0.0 26850. ! 5-membered ring, secondary type h
                                            ! Recommended rate from Curran et al 
                                            ! C&F 129:253�280 (2002)
chx1q2qj = chx1*o2q + oh 6.17e+10 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                              ! 5 mem sec C-H, A-factor x 0.6,(Handford & Walker) 
                                              ! Ea +0.6 kcal - 3kcal for weak c-h
! chx1q3qj = chx1*o3q + oh 2.5e+10 0.0 20850. ! 6-membered ring, secondary type h abs
                                            ! Recommended rate from Curran et al 
                                            ! C&F 129:253�280 (2002)
chx1q3qj = chx1*o3q + oh 4.64e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                              ! 6 mem sec C-H, A-factor x 3.72,(Handford & Walker) 
                                              ! Ea +3.23 kcal - 3kcal for weak c-h
! chx1q4qj = chx1*o4q + oh 3.13e+9 0.0 19050. ! 7-membered ring, secondary type h abs
                                            ! Recommended rate from Curran et al 
                                            ! C&F 129:253�280 (2002)
chx1q4qj = chx1*o4q + oh 5.41e+09 0.0 21355.9 ! Curran ic8, C&F 129:253�280 (2002) 
                                              ! 7 mem sec C-H, A-factor x 3.5,(Handford & Walker) 
                                              ! Ea +5.3 kcal - 3kcal for weak c-h
! Decomposition of the ketohydroperoxides
! chx1*o2oj + oh = chx1*o2q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                              ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                              ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                              ! Glaude 2003, cbsQ + isodesmic + rotors   
! chx1*o2oj + oh = chx1*o2q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                         ! Analogy with ch3o + oh in NIST
                                         ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986) 
chx1*o2q = chx1*o2oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition
                                             ! Curran ic8, C&F 129:253�280 (2002)                                                                                                                             
hx16al1j = chx1*o2oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                         ! Ring opening step.                                           
ch2co + c3h6cho-1 = hx16al1j 1.32e+4 2.48 6130. ! Addition of c2h5 type radical to c of c=c
                                                ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran 
                                                ! Int J Chem Kinet 38:250�275, (2006)
hx12al6j = chx1*o2oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                         ! Ring opening step.  
c2h4 + but12al4j = hx12al6j 1.32e+4 2.48 6130. ! Addition of ch3 type rad to c=c 
                                               ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                               ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
c2h4 + chocjo = but12al4j 1.32e+4 2.48 6130. ! Addition of '.c=o' type radical to c=c 
                                             ! Analogy with c2h4 + c2h5 = pc4h9
                                             ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)                                       
! chx1*o3oj + oh = chx1*o3q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                              ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                              ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                              ! Glaude 2003, cbsQ + isodesmic + rotors
! chx1*o3oj + oh = chx1*o3q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                         ! Analogy with ch3o + oh in NIST
                                         ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
chx1*o3q = chx1*o3oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition
                                             ! Curran ic8, C&F 129:253�280 (2002)                                                                                         
hx13al6j = chx1*o3oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                         ! Ring opening step.                                           
c2h4 + but13al4j = hx13al6j 1.32e+4 2.48 6130. ! Addition of ch3 type rad to c=c 
                                               ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                               ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
ch2co + ch2cho = but13al4j 1.76e+4 2.48 6130. ! Addition of "ch3" to internal c in ketene (c=c=o)
                                              ! Analogy of c2h4 + ch3 = pc4h9, Table 3
                                              ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
hx15al6j = chx1*o3oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                         ! Ring opening step. 
ch2co + c3h6cho-1 = hx15al6j 1.32e+4 2.48 6130. ! Addition of c2h5 to internal c of c=c=o
                                                ! Analogy with c2h4 + c2h5 = pc4h9, Table 3
                                                ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! chx1*o4oj + oh = chx1*o4q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                              ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                              ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                              ! Glaude 2003, cbsQ + isodesmic + rotors 
! chx1*o4oj + oh = chx1*o4q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                         ! Analogy with ch3o + oh in NIST
                                         ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
chx1*o4q = chx1*o4oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition
                                             ! Curran ic8, C&F 129:253�280 (2002)                                                                                          
hx14al6j = chx1*o4oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                         ! Ring opening step.                                           
c2h4 + bt14al1j = hx14al6j 1.32e+4 2.48 6130. ! Addition of '.c=o' type radical to c=c 
                                              ! Analogy with c2h4 + c2h5 = pc4h9
                                              ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
ch2co + ch2cho = bt14al1j 1.32e+4 2.48 6130. ! Addition of ch3 to c=c 
                                             ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                             ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! O2QOOH = Alternative isomerisations
! chx1q2qj = chx1q2q3j 2.0e+11 0.0 26850. ! Isomerization via 5 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q2qj = chx1q2q3j 6.17e+10 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h
chx1q2qj = chx1q2q3j 1.23e+11 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q2qj = chx1q2q4j 2.5e+10 0.0 20850. ! Isomerization via 6 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q2qj = chx1q2q4j 4.64e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h
chx1q2qj = chx1q2q4j 9.28e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q2qj = chx1q2q4j 3.13e+9 0.0 19050. ! Isomerization via 7 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q2qj = chx1q2q4j 5.41e+09 0.0 21355.9 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 7 mem sec H, A-factor x 3.5,(Handford & Walker) 
                                          ! Ea +5.3 kcal - 3kcal for weak c-h
chx1q2qj = chx1q2q4j 1.08e+10 0.0 21355.9 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 7 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 3.5,(Handford & Walker) 
                                          ! Ea +5.3 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q2qj = chx1q2q3j 2.5e+10 0.0 20850. ! Isomerization via 6 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q2qj = chx1q2q3j 4.64e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h
chx1q2qj = chx1q2q3j 9.28e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q3qj = chx1q3q4j 2.0e+11 0.0 26850. ! Isomerization via 5 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q3qj = chx1q3q4j 6.17e+10 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h
chx1q3qj = chx1q3q4j 1.23e+11 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q3qj = chx1q3q2j 2.0e+11 0.0 26850. ! Isomerization via 5 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q3qj = chx1q3q2j 6.17e+10 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h
chx1q3qj = chx1q3q2j 1.23e+11 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec H, A-factor *2 for degeneracy  
                                          ! A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h                                                                                  
! chx1q3qj = chx1q3q5j 2.5e+10 0.0 20850. ! Isomerization via 6 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q3qj = chx1q3q5j 4.64e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h 
chx1q3qj = chx1q3q5j 9.28e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h                                                                                
! chx1q3qj = chx1q3q4j 3.13e+9 0.0 19050. ! Isomerization via 7 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q3qj = chx1q3q4j 5.41e+09 0.0 21355.9 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 7 mem sec H, A-factor x 3.5,(Handford & Walker) 
                                          ! Ea +5.3 kcal - 3kcal for weak c-h
chx1q3qj = chx1q3q4j 1.08e+10 0.0 21355.9 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 7 mem sec H, A-factor *2 for degeneracy
                                          ! A-factor x 3.5,(Handford & Walker) 
                                          ! Ea +5.3 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q4qj = chx1q4q2j 2.5e+10 0.0 20850. ! Isomerization via 6 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q4qj = chx1q4q2j 4.64e+10 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec C-H, A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h
chx1q4qj = chx1q4q2j 1.86e+11 0.0 21076.6 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 6 mem sec H, A-factor *4 for degeneracy
                                          ! A-factor x 3.72,(Handford & Walker) 
                                          ! Ea +3.23 kcal - 3kcal for weak c-h                                          
DUPLICATE
! chx1q4qj = chx1q4q2j 2.0e+11 0.0 26850. ! Isomerization via 5 member ring, secondary h
                                        ! Curran et al, C&F 129:253�280 (2002)
! chx1q4qj = chx1q4q2j 6.17e+10 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec C-H, A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h
chx1q4qj = chx1q4q2j 2.47e+11 0.0 24495.3 ! Curran ic8, C&F 129:253�280 (2002) 
                                          ! 5 mem sec C-H, A-factor *4 for degeneracy
                                          ! A-factor x 0.6,(Handford & Walker) 
                                          ! Ea +0.6 kcal - 3kcal for weak c-h                                           
DUPLICATE
! Decomposition of o2qooh alternatives
! chx1q2q3j
cyhx1en3q + ho2 = chx1q2q3j 8.0e+10 0.0 6000. ! Addition of ho2 to ch (double bond) in cyc6 ring
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond
! cyhx1n3oj + oh = cyhx1en3q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                                ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                                ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                                ! Glaude 2003, cbsQ + isodesmic + rotors
cyhx1n3oj + oh = cyhx1en3q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! cyhx1en3q = cyhx1n3oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                                     
hxen6al1j = cyhx1n3oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                          ! Ring opening step.
c2h2 + c3h6cho-1 = hxen6al1j 7.77e6 1.41 7755. ! Addition of ch3 to c2h2
                                               ! Analogy with c2h2+ch3 Kislitsyn, Slagle & Knyazev, 29th Symp (2002)
hx1n1q6al + oh = chx1q2q3j 4.76e+7 1.54 34700.  ! Addition of oh to o of c=o
                                                ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                                ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                                ! Glaude 2003, cbsQ + isodesmic + rotors 
! hx1noj6al + oh = hx1n1q6al 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors 
hx1noj6al + oh = hx1n1q6al 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hx1n1q6al = hx1noj6al + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                          
c2h3cho + ch2ch2cho = hx1noj6al 1.32e+4 2.48 6130. ! Addition of ch3 to c=c 
                                                   ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                                   ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! chx1q2q4j
hex15en3q + ho2 = chx1q2q4j  8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                               ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                               ! addition to double bond (nothing specific for ho2 add to internal c=c)
! hx15en3oj + oh = hex15en3q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
hx15en3oj + oh = hex15en3q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hex15en3q = hx15en3oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                         
ac3h5cho + c2h3 = hx15en3oj 3.39e+8 0.0 2490. ! Addition of vinyl radical to c of c=o
                                              ! Analogy with the rxn ch2o + c2h3 = ch2=chch2o
                                              ! From NIST database, Radom et al
                                              ! Can J. Chem 81: 431-442 (2003)
c2h3cho + c3h5-a = hx15en3oj 1.0e+11 0.0 11900. ! Addition of allylic rad (a, primary position) to c of c=o
                                                  ! Based on analogy with c4h7o1-4 = ch2o +c3h5-a
                                                  ! Used reverse rate of this, obtained in MCH_ver1r.mech 
                                                  ! Pitz et al submitted to 31st Symposium (Aug 2006)                                            
                                               ! Analogy with ch2o + nc3h7 = pc4h9o, Table XII
                                               ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
hx1n5q6al + oh = chx1q2q4j 4.76e+7 1.54 34700. ! Addition of oh to o of c=o
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors 
! h1n5oj6al + oh = hx1n5q6al 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
h1n5oj6al + oh = hx1n5q6al 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hx1n5q6al = h1n5oj6al + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                          
c4h7cho1-4 + hco = h1n5oj6al 1.32e+4 2.48 6130. ! Addition of hco to c of c=o 
                                                ! Analogy with c2h4 + c2h5 = pc4h9
                                                ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
chocho + c4h71-4 = h1n5oj6al 5.0e+10 0.0 3457.  ! Addition of ch3 to c of c=o
                                                ! Analogy with ch2o + nc3h7 = pc4h9o, Table XII
                                                ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
chocho + h = chocjo + h2 6.02e+5 2.40 2583. ! Abstraction of tertiary h by h
                                            ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chocho + oh = chocjo + h2o 1.70e+6 1.90 -1451. ! Abstraction of tertiary h by oh
                                               ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chocho + ch3 = chocjo + ch4 8.96e+3 2.33 6147. ! Abstraction of tertiary h by ch3
                                               ! Table 1, H.J. Curran C&F 129:253�280 (2002)
chocho + ho2 = chocjo + h2o2 2.80e+12 0.0 16013. ! Abstraction of tertiary h by ho2
                                                 ! Table 1, H.J. Curran C&F 129:253�280 (2002)
co + hco = chocjo 1.5e+11 0.0 4810. ! Analogy with c2h5 + co = c2h5co, addition of c2h5 to c side of co
                                    ! NIST database, but also used in MCH mechanism
                                    ! Tsang & Hampson (Methane review) J.Phys.Chem Ref Data 1986  
! choco2j + oh = chocjo + ho2 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                                ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                                ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                                ! Glaude 2003, cbsQ + isodesmic + rotors
choco2j + oh = chocjo + ho2 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                           ! Analogy with ch3o + oh in NIST
                                           ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)                                               
co2 + hco = choco2j 4.76e+7 1.54 34700. ! Addition of c (of hco radical) to c of co2
                                        ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                        ! However the ch3 is adding to the o of co2 - assume adding to c will similar rate 
                                        ! Glaude 2003, cbsQ + isodesmic + rotors
! chx1q3q4j
cyhx1en4q + ho2 = chx1q3q4j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond (nothing specific for ho2 add to internal c=c)
! cyhx1n4oj + oh = cyhx1en4q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
cyhx1n4oj + oh = cyhx1en4q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! cyhx1en4q = cyhx1n4oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                        
c4h6 + ch2cho = cyhx1n4oj 1.32e+4 2.48 6130. ! Addition of "ch3" to c=c 
                                             ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                             ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
c2h4 + ac3h4cho1 = cyhx1n4oj 2.00e+11 0.0 2010.0 ! Addition of vinyl rad to terminal c of c=c
                                                 ! Analogy with c2h4+c2h3 from Weissman and Benson IJCK (1989), 
                                                 ! Benson says Ea is lower limit
c2h2 + ch2cho = ac3h4cho1 7.77e6 1.41 7755. ! Addition of ch3 to c2h2
                                            ! Analogy with c2h2+ch3 Kislitsyn, Slagle & Knyazev, 29th Symp (2002)
hex15en3q + ho2 = chx1q3q4j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond (nothing specific for ho2 add to internal c=c)
hex15en1q + ho2 = chx1q3q4j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond (nothing specific for ho2 add to internal c=c)
! hx15en1oj + oh = hex15en1q 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
hx15en1oj + oh = hex15en1q 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hex15en1q = hx15en1oj + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                        
c2h3cho + c3h5-a = hx15en1oj 8.5e+10 0.0 11300. ! Addition of allylic rad to terminal c in c=c-c
                                                ! Sumathi CBS-Q, cited in Matheu et al. IJCK 35: 95-110 (2003)
! chx1q3q2j
cyhx1en3q + ho2 = chx1q3q2j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond (nothing specific for ho2 add to internal c=c)
! chx1q3q5j
hx1n4q6al + oh = chx1q3q5j 4.76e+7 1.54 34700. ! Addition of oh to o of c=o
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors  
! h1n4oj6al + oh = hx1n4q6al 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
h1n4oj6al + oh = hx1n4q6al 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hx1n4q6al = h1n4oj6al + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                          
ac3h5cho + ch2cho = h1n4oj6al 1.0e+11 0.0 3496. ! Addition of ch3 to c of c=o
                                                ! Analogy with ch2o + c2h5 = nc3h7o, Table XII
                                                ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
pro13dial + c3h5-a = h1n4oj6al 1.0e+11 0.0 11900. ! Addition of allylic rad (a, primary position) to c of c=o
                                                  ! Based on analogy with c4h7o1-4 = ch2o +c3h5-a
                                                  ! Used reverse rate of this, obtained in MCH_ver1r.mech 
                                                  ! Pitz et al submitted to 31st Symposium (Aug 2006) 
pro13dial + h = pro13al1j + h2 1.34e+13 0.0 3300. ! H abs by oh of h on c=o
                                                  ! Assume rate rule for aldehydic H from nc7_38 LLNL mech
                                                  ! ch3cho + h from Whytock et al J.Chem.Phys 65 (1976)
! pro13dial + h = pro13al1j + h2 6.02e+5 2.40 2583. ! Abstraction of tertiary h by h
                                                  ! Table 1, H.J. Curran C&F 129:253�280 (2002)
pro13dial + oh = pro13al1j + h2o 2.0e+6 1.8 1300. ! H abs by oh of h on c=o
                                                  ! Analogy with ch3cho + oh
                                                  ! Taylor et al, Proc. Comb. Inst. 26: 497-504 (1996)
! pro13dial + oh = pro13al1j + h2o 1.70e+6 1.9 -1451. ! Abstraction of tertiary h by oh
                                                    ! Table 1, H.J. Curran C&F 129:253�280 (2002)
pro13dial + ch3 = pro13al1j + ch4 1.34e+13 0.0 3300. ! H abs by ch3 of h on c=o
                                                     ! Assume rate rule for aldehydic H from nc7_38 LLNL mech
! pro13dial + ch3 = pro13al1j + ch4 8.96e+3 2.33 6147. ! Abstraction of tertiary h by ch3
                                                     ! Table 1, H.J. Curran C&F 129:253�280 (2002)
pro13dial + ho2 = pro13al1j + h2o2 2.06e+4 2.5 10205.23 ! H abs by ho2 of h on c=o
                                                        ! Analogy with ch2o + ho2
                                                        ! Eiteneer & Frenklach JPCA 102: 5196-5205 (1998)                                                    
! pro13dial + ho2 = pro13al1j + h2o2 4.82e+3 2.6 13910. ! H abs by ho2 of h on c=o
                                                      ! Analogy with ch3cho + ho2
                                                      ! Curran et al, C3_31 mech (2004)                                                     
! pro13dial + ho2 = pro13al1j + h2o2 2.80e+12 0.0 16013. ! Abstraction of tertiary h by ho2
                                                       ! Table 1, H.J. Curran C&F 129:253�280 (2002)
ch2co + hco = pro13al1j 1.32e+4 2.48 6130. ! Addition of "hco" to c of c=c
                                           ! Analogy with c2h4 + c2h5 = pc4h9, Table 3
                                           ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! chx1q4q2j
cyhx1en4q + ho2 = chx1q4q2j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                              ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                              ! addition to double bond (nothing specific for ho2 add to internal c=c)
hx1n3q6al + oh = chx1q4q2j 4.76e+7 1.54 34700. ! Addition of oh to o of c=o
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
! h1n3oj6al + oh = hx1n3q6al 4.76e+7 1.54 34700. ! Addition of oh to o of c-o.
                                               ! Analogy with the reverse rate of rxn ch3oco = ch3 +co2 
                                               ! the ch3 is adding to one of o of co2 (correct side for our rxn)
                                               ! Glaude 2003, cbsQ + isodesmic + rotors
h1n3oj6al + oh = hx1n3q6al 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                          ! Analogy with ch3o + oh in NIST
                                          ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! hx1n3q6al = h1n3oj6al + oh 1.5e+16 0.0 42000. ! Rxn type 24 Carbonylhydroperoxide decomposition  
                                              ! Curran ic8, C&F 129:253�280 (2002)                                                                                          
but14dial + c2h3 = h1n3oj6al 3.39e+8 0.0 2490. ! Addition of vinyl radical to c of c=o
                                               ! Analogy with the rxn ch2o + c2h3 = ch2=chch2o
                                               ! From NIST database, Radom et al
                                               ! Can J. Chem 81: 431-442 (2003)
but14dial + h = bt14al1j + h2 1.2e+6 2.40 2583. ! Abstraction of tertiary type h by h
                                                ! A factor x2, symmetrical molecule, 2x h available for abs
                                                ! Table 1, H.J. Curran C&F 129:253�280 (2002)
but14dial + oh = bt14al1j + h2o 3.4e+6 1.90 -1451. ! Abstraction of tertiary type h by oh
                                                   ! A factor x2, symmetrical molecule, 2x h available for abs
                                                   ! Table 1, H.J. Curran C&F 129:253�280 (2002)
but14dial + ch3 = bt14al1j + ch4 1.79e+4 2.33 6147. ! Abstraction of tertiary type h by ch3
                                                    ! A factor x2, symmetrical molecule, 2x h available for abs
                                                    ! Table 1, H.J. Curran C&F 129:253�280 (2002)
but14dial + ho2 = bt14al1j + h2o2 5.6e+12 0.0 16013. ! Abstraction of tertiary type h by ho2
                                                     ! A factor x2, symmetrical molecule, 2x h available for abs
                                                     ! Table 1, H.J. Curran C&F 129:253�280 (2002)
c2h3cho + ch2ch2cho = h1n3oj6al 5.0e+10 0.0 3457. ! Addition of ch3 to c of c=o
                                                  ! Analogy with ch2o + nc3h7 = pc4h9o, Table XII
                                                  ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! hex1en3q + ho2 = chx1q4q2j 8.0e+10 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                             ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                             ! addition to double bond (nothing specific for ho2 add to internal c=c)
! hex1en3q + h = hx1en3q6j + h2 7.34e+5 2.77 8147. ! Primary h abs by h
                                                 ! Table 1, H.J. Curran C&F 129:253�280 (2002)
! hex1en3q + oh = hx1en3q6j + h2o 2.63e+7 1.80 278. ! Primary h abs by oh
                                                   ! Table 1, H.J. Curran C&F 129:253�280 (2002)
! hex1en3q + ch3 = hx1en3q6j + ch4 4.26e-14 8.06 4154. ! Primary h abs by ch3
                                                     ! Table 1, H.J. Curran C&F 129:253�280 (2002)
! hex1en3q + ho2 = hx1en3q6j + h2o2 2.52e+13 0.0 20435. ! Primary h abs by ho2
                                                      ! Table 1, H.J. Curran C&F 129:253�280 (2002)
! c2h4 + bt1en3q4j = hx1en3q6j 1.32e+4 2.48 6130. ! Addition of ch3 to c=c 
                                                ! Analogy with rxn c2h4 + c2h5 = pc4h9, Table 3
                                                ! H.J. Curran, Int J Chem Kinet 38:250�275, (2006)
! c2h3ooh + c2h3 = bt1en3q4j 2.00e+11 0.0 2010.0 ! Addition of vinyl rad to internal c of c=c
                                                 ! Analogy with c2h4+c2h3 from Weissman and Benson IJCK (1989), 
                                                 ! Benson says Ea is lower limit
! c4h6 + ho2 = bt1en3q4j 1.6e+11 0.0 6000. ! Addition of ho2 to internal c of c-c=c
                                           ! Average value from MCH_ver1r.mech which was CVN estimate for ho2 
                                           ! addition to double bond (nothing specific for ho2 add to internal c=c)
                                           ! A factor x 2 for 2 possible addition sites - 1,3-Butadiene
! @-@-@-@-@-@-@ chx High Temp chemistry begins here @-@-@-@-@-@
! Molecular Elimination
! Initiation rxns
chx = c2h4 + c2h4 + c2h4 4.00e+12 0. 57400. ! Assume analogous to rxn of 1-hexene = propene+propene
                                            ! Tsang IJCK 20 (1978) Thermal Stability of Cyclohexane and 1-Hexene 
chx = c3h6 + c3h6 4.00e+12 0. 57400. ! Tsang IJCK 20 (1978) Thermal Stability of Cyclohexane and 1-Hexene 
! chx bond breaking
! Initiation rxns
c6h12-16 = chx 1.00e+08 0.86 0.0 ! From MCH. Their ref says  !calculated
                                 ! Using this value here since the same is applied in MCH 
                                 ! when have diradical recombining to RING structure
chxrad + h = chx 1.00e+14 0. 0.0 ! addition of h to radical site of chxrad
                                 ! consider as "radical-radical" recombination
                                 ! Tsang, W., Propene, J Phys. Chem. Ref. Data, 20, p. 221-273 (1991)
! decomp of diradical
c6h12-16 = c6h12-1 3.67e+12 -0.6 12800. ! From MCH - no particular ref specified
                                        ! Analogy with c7h14gl = gc7h14 in MCH
                                        ! "gl" structure is substituted hexane - with radical sites also on 
                                        ! 1 and 6, same as c6h12-16 in this mech
! chx + o2 
! Initiation rxn
chx + o2 = chxrad + ho2 1.68e+14 0. 48210. ! Curran et al ic8 C&F 129:253�280 (2002)
                                           ! degen = 12, therefore a factor times 12
! H-atom Abstraction
chx + h = chxrad + h2 6.89e+06 2.49 4124. ! Sec h atom abs by h
                                          ! Curran et al ic8 C&F 129:253�280 (2002)
                                          ! rate per H atom, degen = 12
chx + ch3 = chxrad + ch4 3.25e+05 2.26 7287. ! Sec h atom abs by ch3
                                             ! Curran et al ic8 C&F 129:253�280 (2002)
                                             ! rate per H atom, degen = 12
! chx + ho2 = chxrad + h2o2 1.47e+05 2.5 14862.76 ! Sec h atom abs by ho2
                                                ! Scott and Walker, C&F 129:365�377 (2002)
                                                ! rate per C-H site, times 6
chx + ho2 = chxrad + h2o2 1.12e+05 2.5 14147.44 ! reaction of HO2 radicals with secondary C-H bonds.
                                                ! Handford-Styring and Walker, PCCP 3:2043-2052 (2001)
                                                ! chx specific rate                                                
chx + oh = chxrad + h2o 1.08e+07 2. -1133. ! Sec h atom abs by oh
                                             ! Curran et al ic8 C&F 129:253�280 (2002)
                                             ! rate per H atom, degen = 12
chx + ch3o = chxrad + ch3oh 1.32e+12 0. 5000. ! Sec h atom abs by ch3o
                                              ! Curran et al ic8 C&F 129:253�280 (2002)
                                              ! rate per H atom, degen = 12
chx + o = chxrad + oh 5.72e+05 2.71 2106. ! Sec h atom abs by o
                                          ! Curran et al ic8 C&F 129:253�280 (2002)
                                          ! rate per H atom, degen = 12
chx + c2h3 = chxrad + c2h4 4.80e+12 0. 16800. ! Sec h atom abs by c2h3
                                              ! Curran et al ic8 C&F 129:253�280 (2002)
                                              ! rate per H atom, degen = 12
chx + c2h5 = chxrad + c2h6 6.00e+11 0. 10400. ! Sec h atom abs by c2h5
                                              ! Curran et al ic8 C&F 129:253�280 (2002)
                                              ! rate per H atom, degen = 12
!----------------------Disproportionation Rxns----------------------
! RH + R'O2 = R + R'O2H reaction 
chx + ch3o2 = chxrad + ch3o2h 1.47e+05 2.5 14862.76 ! Analogy with rate for Sec h atom abs by ho2
                                                    ! TABLE 7 Scott and Walker, C&F 129:365�377 (2002)
                                                    ! rate per C-H site, times 6
chx + chxo2j = chxrad + chxo2h 1.47e+5 2.5 14862.76 ! Analogy with rate for Sec h atom abs by ho2
                                                    ! TABLE 7 Scott and Walker, C&F 129:365�377 (2002)
                                                    ! rate per C-H site, times 6
!----- RO2 + HO2 = RO2H + O2 -----
chxo2j + ho2 = chxo2h + o2 1.75e+10 0. -3275. ! Rxn type 13 in ic8 paper 
! chxo2j + ho2 = chxo2h + o2 5.83e+10 0. -1711. ! Orig. A-factor/3 - to decrease k for this rxn 
                                              ! Trying to increase reactivity at low T
! chxo2j + ho2 = chxo2h + o2 5.25e+11 0. -1711. ! A-factor x 3 - to boost this rxn and increase
                                              ! formation of OH - thus increase reactivity at low T
! chxo2j + ho2 = chxo2h + o2 1.75e+11 0. -1711. ! Based on (Rxn type 13 in ic8 paper? Or Lightfoot)
                                              ! This rate is same as that used in MCH mech
                                              ! ref is ic8 C&F 129:253�280 (2002)
!----- ROOH dissocation -----
! chxo2h = chxoj + oh write in reverse direction 
! Rxn type 17 in ic8 paper
chxoj + oh = chxo2h 1.81e+13 0. 0. ! Addition of oh to o of c-o.
                                   ! Analogy with ch3o + oh in NIST
                                   ! W. Tsang Methane Review, J. Physc. Chem Chem Phys. (1986)
! chxrad paths 
!----- R + HO2 = RO + OH -----
chxrad + ho2 = chxoj + oh 7.00e+12 0. -1000 ! Rxn type 11 in ic8 paper 
                                            ! Curran et al ic8 C&F 129:253�280 (2002)
                                            ! Reaction Type 11: R +  R'O2 = RO  R'O
!----- RO2 + CH3O2 = RO + CH3O + O2 -----
chxo2j + ch3o2 = chxoj + ch3o + o2 1.40e+16 -1.61 1860. ! Rxn type 15 in ic8 paper
                                                        ! Rate same as that used in MCH
                                                        ! Curran recommendation, ic8 C&F 129:253�280 (2002)
!----- RO2 + R'O2 = RO + R'O + O2 -----
chxo2j + chxo2j = chxoj + chxoj + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                          ! As used in MCH
                                                          ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + c2h5o2 = chxoj + c2h5o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                          ! As used in MCH
                                                          ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + nc3h7o2 = chxoj + nc3h7o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                            ! As used in MCH
                                                            ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + ic3h7o2 = chxoj + ic3h7o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                            ! As used in MCH
                                                            ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + ic4h9o2 = chxoj + ic4h9o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                            ! As used in MCH
                                                            ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + pc4h9o2 = chxoj + pc4h9o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                            ! As used in MCH
                                                            ! Curran recommendation, ic8 C&F 129:253-280 (2002)
chxo2j + tc4h9o2 = chxoj + tc4h9o + o2 1.40e+16 -1.61 1860. ! Rxn type 16 in ic8 paper
                                                            ! As used in MCH
                                                            ! Curran recommendation, ic8 C&F 129:253-280 (2002)
! RO2 + H2O2 = RO2H + HO2
! Rxn type 14 from ic8 papar
! Commented out as not used in MCH and to check if i should include or not 
! chxo2j + h2o2 = chxo2h + ho2 2.4e+12 0. 10000. ! Rxn type 16 in ic8 paper
                                                 ! Rate is Curran recommendation, ic8 C&F 129:253-280 (2002)
! Radical Decomposition 
! c6h11-16 = chxrad 1.00e+08 0.86 5900.! Ring closing step LISTED in LOW T section
                                     ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
cychexene + h = chxrad 6.25e+11 0.51 2620. ! Addition of h atom across internal c of c=c
                                           !Table 3 Int J Chem Kinet 38: 250�275 (2006)
! isomerisation
c6h11-16 = c6h11-13 3.67e+12 -0.6 15300. ! 1,4 H shift - p->a values (5 mem t.s.)
                                         ! Matheu, Green & Grenda  Table 2 35: 95�119 IJCK (2003)
c2h4 + c4h71-4 = c6h11-16 1.32e+04 2.48 6130. ! Additon of c2h5 type radical to c2h4
                                              ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran
                                              ! Int J Chem Kinet 38:250�275 (2006)
c4h6 + c2h5 = c6h11-13 1.32e+04 2.48 6130. ! Addition of c2h5 to c=c in c4h6. 
                                           ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran
                                           ! Int J Chem Kinet 38:250�275 (2006)                                              
!c4h6 + c2h5 = c6h11-13 2.64e+04 2.48 6130. ! Addition of c2h5 to c=c in c4h6. 
                                           ! Symmetrical molecule with twice no. of sites for add. so double A factor.
                                           ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran
                                           ! Int J Chem Kinet 38:250�275 (2006)
! Decomp of above
hex1al6j = chxoj 1.00e+08 0.86 5900. ! Ring opening step - but write in reverse, therefore defining ring closing here
                                     ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
c2h4 + c3h6cho-1 = hex1al6j 1.32e+04 2.48 6130. ! Additon of c2h5 type radical to c2h4
                                                ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran
                                                ! Int J Chem Kinet 38:250�275, (2006)
! Rxn of the stable intermediates 
cychexene = c4h6 + c2h4 4.00e+12 0 57400. ! Assume analogous to rxn of 1-hexene = propene+propene
                                          ! Also, this rate was applied for chx = stable products ie. Molecular elimination
                                          ! Tsang IJCK 20 (1978) Thermal Stability of Cyclohexane and 1-Hexene
cychexene + h = cyhx1n3j + h2 1.00e+05 2.50 -1912. ! Rate rule for secondary Allylic H 
                                                   ! Heyberger et al., Oxidation of Small Alkenes
                                                    ! IJCK 34:666-677 (2002)
cychexene + h = cyhx1n4j + h2 2.30e+06 2.49 4124. ! Rate rule for regular secondary H 
                                                  ! Curran et al ic8 C&F 129:253�280 (2002), degen = 4
cychexene + ch3 = cyhx1n3j + ch4 2.00e-01 3.50 4046.1 ! WJP: Used primary rate rule from Allylic H
                                                      ! Heyberger et al. Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cychexene + ch3 = cyhx1n4j + ch4 1.08e+05 2.26 7287 ! Rate rule for regular secondary H 
                                                    ! Curran et al ic8 C&F 129:253�280 (2002), degen = 4
cychexene + o = cyhx1n3j + oh 1.592e+11 0.7 3107.07 ! Rate rule for secondary Allylic H
                                                    ! Heyberger et al., Oxidation of Small Alkenes
                                                    ! IJCK 34:666-677 (2002)
cychexene + o = cyhx1n4j + oh 1.91e+05 2.71 2106. ! Rate rule for regular secondary H 
                                                  ! Curran et al ic8 C&F 129:253�280 (2002), degen = 4
cychexene + oh = cyhx1n3j + h2o 6.34e+06 2.0 -1434. ! Rate rule for secondary Allylic H 
                                                      ! Heyberger et al., Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cychexene + oh = cyhx1n4j + h2o 3.60e+06 2.0 -1133. ! Rate rule for regular secondary H 
                                                   ! Curran et al ic8 C&F 129:253�280 (2002), degen = 4
cychexene + ho2 = cyhx1n3j + h2o2 1.36e+04 2.50 10113.8 ! Rate rule for secondary allylic H
                                                        ! Scott & Walker C&F 129:365�377 (2002) 
                                                        ! Estimate based on ethylbenzene+ho2
cychexene + ho2 = cyhx1n4j + h2o2 2.24e+13 0. 17686. ! Rate rule for regular secondary H 
                                                     ! Curran et al ic8 C&F 129:253�280 (2002), degen = 4
! Decomposition routes of above formed radicals 
hx13en6j = cyhx1n3j  1.00e+08 0.86 5900. ! Beta route leading to ring opening
                                         ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
c2h4 + c*cc*cj = hx13en6j  2.00e+11 0.0 2010.0 ! Addition of c2h3 (vinylic type rad) to c of c=c
                                               ! Analogy with c2h4+c2h3 from Weissman and Benson IJCK (1989), 
                                               ! Benson says Ea is lower limit
! Reaction of allylic 'ene' with o2 to give diene + ho2
! direct elimination 
cyhx1n3j + o2 = cyhx13ene + ho2 2.1e+9 0. 0. ! Baldwin and Walker 'elementary rxns in the ox. of alkenes'
                                             ! Proc Comb. Inst 18 (1981) 
! cyhx1n3j + o2 = cyhx13ene + ho2 2.06e+4 2.19 17590. ! Bozzelli and Lee
                                                    ! Proc Comb. Inst 30 1015-1022 (2005) - note: rate for p = 1 atm
! Reaction of cyhx1n3j with ho2
cyhx1n3j + ho2 = cyhx1n3oj + oh 7.00e+12 0. -1000. ! C3_31 mech Curran et al. 2004 
                                                   ! Curran et al ic8 C&F 129:253�280 (2002)
                                                   ! Reaction Type 11: R +  R'O2 = RO  R'O
! hxen6al1j = cyhx1n3oj 1.00e+08 0.86 5900. ! Rxn already included in mech
                                            ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                            ! Ring opening step. 
hx2enal6j = cyhx1n3oj 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                          ! Ring opening step.
c2h4 + sc3h5co = hx2enal6j 1.32e+4 2.48 6130. ! Addition of "c2h5" type radical to c of c=c
                                                ! Analogy with c2h4 + c2h5 = pc4h9, Table 3 from H.J. Curran 
                                                ! Int J Chem Kinet 38:250�275, (2006)
! bt2n4*o1j = sc3h5co ..... mch_ver1u.mech                                                
! co + c3h5-s = bt2n4*o1j 3.39e+8 0.0 2490. ! Addition of vinyl radical to c of co (CarbonMonoxide)
                                          ! Analogy with the rxn ch2o + c2h3 = ch2=chch2o
                                          ! From NIST database, Radom et al
                                          ! Can J. Chem 81: 431-442 (2003)
! Beta scission of h to form diene 
cyhx13ene + h = cyhx1n3j 1.25e+12 0.51 1500. ! Addition of h atom across internal c of c=c
                                             ! 4oct06 A factor times 2 to account for degeneracy
                                             ! Ea reduced from 2620 to 1500 cal (allylic rad + Ea should be less)
                                             !Table 3 Int J Chem Kinet 38: 250�275 (2006)
cyhx13ene = c6h6 + h2 4.00e+12 0. 57400. ! Molecular elimination from the above formed diene
                                         ! Tsang IJCK 20 (1978) Thermal Stability of Cyclohexane and 1-Hexene
cyhx13n5j + h = cyhx13ene 1.0e+14 0. 0. ! Addition of h to radical site of cyhx13n5j 
                                        ! consider as a rad-rad recombination
                                        ! Tsang, W., Propene, J Phys. Chem. Ref. Data, 20, p. 221-273 (1991)
c2h2 + c*cc*cj = cyhx13n5j 3.16e+11 0. 6000. ! Addition of c2h3 (vinylic type rad) to c c2h2 (ethyne)
                                             ! c2h2+c2h3 = c4h5 from Benson,  IJCK (1989)
hx14en6j = cyhx1n4j 1.00e+08 0.86 5900. ! Matheu et al. Table 1 IJCK  35: 95�119 (2003) for 1,6 endo addition.
                                        ! Ring opening step.
c4h6 + c2h3 = hx14en6j 1.48e+12 -0.17 -3240. ! Addition of c2h3 (vinyl rad) to c of c=c in butadiene
                                             ! Westmoreland & Dean J. Phys. Chem. 93 (1989)
                                             ! CH2=CHCH=CH2 + C2H3  = Adduct
! Beta scission of h to form diene - 2 forms, depending on the h
cyhx13ene + h = cyhx1n4j 1.25e+12 0.51 2620. ! Addition of h atom across internal c of c=c
                                             ! 6.25e+11 * 2 since d = 2 = use 1.25e+12 
                                             ! Table 3 Int J Chem Kinet 38: 250�275 (2006) 
cyhx14ene + h = cyhx1n4j 2.5e+12 0.51 2620. ! Addition of h atom across internal c of c=c
                                             ! 3.25e+11 *4 since d = 4, = use 2.5e+12
                                             ! Table 3 Int J Chem Kinet 38: 250�275 (2006) 
! Reaction of the formed dienes with various radicals.
cyhx13ene + h = cyhx13n5j + h2 1.00e+05 2.50 -1912. ! Rate rule for secondary Allylic H 
                                                    ! Heyberger et al., Oxidation of Small Alkenes
                                                    ! IJCK 34:666-677 (2002)
cyhx14ene + h = cyhx14n3j + h2 1.00e+05 2.50 -1912. ! Rate rule for secondary Allylic H 
                                                    ! Heyberger et al., Oxidation of Small Alkenes
                                                    ! IJCK 34:666-677 (2002)
cyhx13ene + o = cyhx13n5j + oh 1.592e+11 0.7 3107.07 ! Rate rule for secondary Allylic H 
                                                     ! Heyberger et al., Oxidation of Small Alkenes
                                                     ! IJCK 34:666-677 (2002)
cyhx14ene + o = cyhx14n3j + oh 1.592e+11 0.7 3107.07 ! Rate rule for secondary Allylic H 
                                                     ! Heyberger et al., Oxidation of Small Alkenes
                                                     ! IJCK 34:666-677 (2002)
cyhx13ene + oh = cyhx13n5j + h2o 6.34e+06 2.0 -1434.0 ! Rate rule for secondary Allylic H 
                                                      ! Heyberger et al., Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cyhx14ene + oh = cyhx14n3j + h2o 6.34e+06 2.0 -1434.0 ! Rate rule for secondary Allylic H 
                                                      ! Heyberger et al., Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cyhx13ene + ch3 = cyhx13n5j + ch4 2.00e-01 3.5 4046.1 ! WJP: Used primary rate rule from Allylic H, 
                                                      ! Heyberger et al., Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cyhx14ene + ch3 = cyhx14n3j + ch4 2.00e-01 3.5 4046.1 ! WJP: Used primary rate rule from Allylic H, 
                                                      ! Heyberger et al., Oxidation of Small Alkenes
                                                      ! IJCK 34:666-677 (2002)
cyhx13ene + ho2 = cyhx13n5j + h2o2 1.36e+04 2.50 10113.8 ! Rate rule for seconary allylic H
                                                         ! Scott & Walker,C&F 129:365�377 (2002)
                                                         ! Estimated based on ethylbenzene+ho2
cyhx14ene + ho2 = cyhx14n3j + h2o2 1.36e+04 2.50 10113.8 ! Rate rule for seconary allylic H
                                                         ! Scott & Walker,C&F 129:365�377 (2002)
                                                         ! Estimated based on ethylbenzene+ho2 
! Decomp of radicals formed from above step
c6h6 + h = cyhx13n5j 5.36e+11 -0.329 -6000.  ! CVN determined rate
                                             ! Taken from MCH mech
cyhx13n5j + ho2 = co + oh + pent13n1j 7.00e+12 0. -1000. ! Curran et al ic8 C&F 129:253�280 (2002)
                                                    ! Reaction Type 11: R +  R'O2 = RO  R'O
c2h2 + c3h5-s = pent13n1j 3.16e+11 0. 6000. ! Addition of c2h3 (vinylic type rad) to c c2h2 (ethyne)
                                            ! c2h2+c2h3 = c4h5 from Benson,  IJCK (1989)
cyhx14n3j = cyhx13n5j 3.80e+10 0.67 38700. ! 1,3 H Shift - radical site just changing location around the ring. 
                                           ! Matheu, Green & Grenda, Table 2 35: 95�119, IJCK (2003)
end

