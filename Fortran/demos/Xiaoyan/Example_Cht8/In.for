
            Program  Main
c=============================================================================
c
c===== This Program can solve the elastic problem of plane stress,
c===== plane strain, axisymmetric solid and Mindlin plate
c
c=============================================================================
c===== Define large-scale arrays for dynamic allocation

         implicit   real*8(a-h,o-z)

         parameter( max_IZ = 1000 )    !  IZ(max_IZ) store integer values
         parameter( max_VR = 8000 )    !  VR(max_VR) store   real  values

         dimension  IZ(max_IZ), VR(max_VR)

c==============================================================================
c===== Input all the information about the FE model

c
c*****   allot storage space for all the values to be inputed
c
         call  para_input (nd,ne,nc,id,  nx,np,
     $                     M1,M2,M3,M4,  M10,
     $                     N1,N2,N3,N4,  N10   )
c
c*****   input all the datas of FE model at appointed address
c
         call  main_input (nd,ne,nc, nx,np,mG, nFdis,mSolv,
     $                     IZ(M1),IZ(M2),IZ(M3),IZ(M4),            ! input.for
     $                     VR(N1),VR(N2),VR(N3),VR(N4)  )
c
c*****   verify inputed datas by outputing into file <test_in>
c
         call  test_input (nd,ne,nc,id,  nx,np,mG, mSolv,
     $                     IZ(M1),IZ(M2),IZ(M3),IZ(M4),
     $                     VR(N1),VR(N2),VR(N3),VR(N4)  )

c==============================================================================
c===== Assemble the global matrixs: mass [M], stiffness [K] and load {P}

c
c*****   allot storage space for global matrixes and local matrixes
c
         call  para_assem (nd,nc,id,  nd2,nc2,    nFdis,
     $                     M11,                   M10,M20,
     $                     N11,N12, N13,N14,
     $                     N15,N16, N17,N18,N19,  N10,N20 )
c
c*****   assemble all the local matrixes to form global matrixs
c
         call  main_assem (nd,ne,nc,id,  nx,np,mG, nd2,nc2, mSolv,
     $                     IZ(M1), VR(N1), IZ(M2), VR(N2),
     $                     IZ(M3), VR(N3), IZ(M4), VR(N4),         ! assem.for
     $                     VR(N11),VR(N12),VR(N13),VR(N14),
     $                     IZ(M11),VR(N15),
     $                     VR(N16),VR(N17),VR(N18),VR(N19) )
c
c*****   verify the global matrixes by outputing into file <test_mkp>
c
         call  test_assem (nc2,id,  nFdis,  mSolv,
     $                     VR(N11),VR(N12), VR(N13), VR(N14) )

c=============================================================================
c===== Solve the static Problem by the triangle decomposition method

c
c*****   Get the displacements of nodes by solving eqation  [K]{u}={p}
c
         call  main_stati_disp (nc2,id,    mSolv,
     $                          VR(N12),   VR(N14)  )
c
c****    Get the stress of integral points within each element
c
         call  main_stati_stre (nd,ne,nc,  nd2,nc2,     mSolv,
     $                          IZ(M1), IZ(M2), VR(N1), VR(N2),    ! stati.for
     $                          VR(N14),
     $                          VR(N15),IZ(M11),
     $                          VR(N16),VR(N17),VR(N18),VR(N19) )


c=============================================================================
c===== ouput dynamic array allocation address to all the problems

         open(10, file='memo')

         write(10,11)  max_IZ, max_VR, M10,N10, M20,N20 
11       format(10x,'IZ',6x,'VR',3(/5x,i8,i8),2(/13x,i8))

         close(10)

c=============================================================================

         end

