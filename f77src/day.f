      SUBROUTINE day(I,NHW,NHE,NVN,NVS)
C
C     THIS SUBROUTINE REINITIALIZES DAILY VARIABLES USED IN OTHER 
C     SUBROUTINES E.G. LAND MANAGEMENT
C
      include "parameters.h"
      include "filec.h"
      include "files.h"
      include "blkc.h"
      include "blk2a.h"
      include "blk2b.h"
      include "blk2c.h"
      include "blk6.h"
      include "blk8a.h"
      include "blk8b.h"
      include "blk11a.h"
      include "blk11b.h"
      include "blk13a.h"
      include "blk13b.h"
      include "blk13c.h"
      include "blk14.h"
      include "blk16.h"
      include "blk17.h"
      include "blk18a.h"
      include "blk18b.h"
      include "blk19a.h"
      include "blk19b.h"
      include "blk19c.h"
      include "blk19d.h"
      CHARACTER*16 DATA(30),DATAC(30,250,250),DATAP(JP,JY,JX)
     2,DATAM(JP,JY,JX),DATAX(JP),DATAY(JP),DATAZ(JP,JY,JX)
     3,OUTS(10),OUTP(10),OUTFILS(10,JY,JX),OUTFILP(10,JP,JY,JX)
      CHARACTER*3 CHOICE(102,20)
      CHARACTER*8 CDATE
      CHARACTER*3 CHARN1,CHARN2
      CHARACTER*4 CHARN3
      PARAMETER (TWILGT=0.06976)
C
C     WRITE DATE
C
      N=0
      NN=0
      DO 500 M=1,12
      N=30*M+ICOR(M)
      IF(MOD(IDATA(3),4))520,510,520
510   IF(M.GE.2)N=N+1
520   IF(I.LE.N)THEN
      N1=I-NN
      N2=M
      N3=IDATA(3)
      WRITE(CHARN1,'(I3)')N1+100
      WRITE(CHARN2,'(I3)')N2+100
      WRITE(CHARN3,'(I4)')N3
      WRITE(CDATE,'(2A2,A4)')CHARN1(2:3),CHARN2(2:3),CHARN3(1:4)
      GO TO 501
      ENDIF
      NN=N
500   CONTINUE
C
C     WRITE DAILY MAX MIN ACCUMULATORS FOR WEATHER VARIABLES
C
501   DO 955 NX=NHW,NHE
      DO 950 NY=NVN,NVS
      TRAD(NY,NX)=0.0
      TAMX(NY,NX)=-100.0
      TAMN(NY,NX)=100.0
      HUDX(NY,NX)=0.0
      HUDN(NY,NX)=100.0
      TWIND(NY,NX)=0.0
      TRAI(NY,NX)=0.0
      DO 945 L=0,JZ
      TSMX(L,NY,NX)=-9999
      TSMN(L,NY,NX)=9999
945   CONTINUE
      IF((ALAT(NY,NX).GE.0.0.AND.I.EQ.1)
     2.OR.(ALAT(NY,NX).LT.0.0.AND.I.EQ.1))THEN
      UORGF(NY,NX)=0.0
      UXCSN(NY,NX)=0.0
      UCOP(NY,NX)=0.0
      UDOCQ(NY,NX)=0.0
      UDOCD(NY,NX)=0.0
      UDICQ(NY,NX)=0.0
      UDICD(NY,NX)=0.0
      TNBP(NY,NX)=0.0
      URAIN(NY,NX)=0.0
      UEVAP(NY,NX)=0.0
      URUN(NY,NX)=0.0
      USEDOU(NY,NX)=0.0
      UVOLO(NY,NX)=0.0
      UIONOU(NY,NX)=0.0
      UFERTN(NY,NX)=0.0
      UXZSN(NY,NX)=0.0
      UDONQ(NY,NX)=0.0
      UDOND(NY,NX)=0.0
      UDINQ(NY,NX)=0.0
      UDIND(NY,NX)=0.0
      UFERTP(NY,NX)=0.0
      UXPSN(NY,NX)=0.0
      UDOPQ(NY,NX)=0.0
      UDOPD(NY,NX)=0.0
      UDIPQ(NY,NX)=0.0
      UDIPD(NY,NX)=0.0
      UCO2G(NY,NX)=0.0
      UCH4G(NY,NX)=0.0
      UOXYG(NY,NX)=0.0
      UN2OG(NY,NX)=0.0
      UN2GG(NY,NX)=0.0
      UNH3G(NY,NX)=0.0
      UN2GS(NY,NX)=0.0
      UH2GG(NY,NX)=0.0
      UCO2F(NY,NX)=0.0
      UCH4F(NY,NX)=0.0
      UOXYF(NY,NX)=0.0
      UN2OF(NY,NX)=0.0
      UNH3F(NY,NX)=0.0
      UPO4F(NY,NX)=0.0
      THRE(NY,NX)=0.0
      TGPP(NY,NX)=0.0
      TNPP(NY,NX)=0.0
      TRAU(NY,NX)=0.0
      XHVSTC(NY,NX)=0.0
      XHVSTN(NY,NX)=0.0
      XHVSTP(NY,NX)=0.0
      DO 960 NZ=1,NP0(NY,NX)
      RSETC(NZ,NY,NX)=RSETC(NZ,NY,NX)+CARBN(NZ,NY,NX)+TCUPTK(NZ,NY,NX)
     2-TCSNC(NZ,NY,NX)+TCO2T(NZ,NY,NX)-VCO2F(NZ,NY,NX)-VCH4F(NZ,NY,NX)
      RSETN(NZ,NY,NX)=RSETN(NZ,NY,NX)+TZUPTK(NZ,NY,NX)+TNH3C(NZ,NY,NX)
     2-TZSNC(NZ,NY,NX)-VNH3F(NZ,NY,NX)-VN2OF(NZ,NY,NX)+TZUPFX(NZ,NY,NX)
      RSETP(NZ,NY,NX)=RSETP(NZ,NY,NX)+TPUPTK(NZ,NY,NX) 
     2-TPSNC(NZ,NY,NX)-VPO4F(NZ,NY,NX)
      CARBN(NZ,NY,NX)=0.0
      TCUPTK(NZ,NY,NX)=0.0
      TCO2T(NZ,NY,NX)=0.0
      TCO2A(NZ,NY,NX)=0.0
      CTRAN(NZ,NY,NX)=0.0
      TZUPTK(NZ,NY,NX)=0.0
      TZUPFX(NZ,NY,NX)=0.0
      TNH3C(NZ,NY,NX)=0.0
      TPUPTK(NZ,NY,NX)=0.0
      VCO2F(NZ,NY,NX)=0.0
      VCH4F(NZ,NY,NX)=0.0
      VOXYF(NZ,NY,NX)=0.0
      VNH3F(NZ,NY,NX)=0.0
      VN2OF(NZ,NY,NX)=0.0
      VPO4F(NZ,NY,NX)=0.0
      THVSTC(NZ,NY,NX)=THVSTC(NZ,NY,NX)+HVSTC(NZ,NY,NX)
      THVSTN(NZ,NY,NX)=THVSTN(NZ,NY,NX)+HVSTN(NZ,NY,NX)
      THVSTP(NZ,NY,NX)=THVSTP(NZ,NY,NX)+HVSTP(NZ,NY,NX)
      HVSTC(NZ,NY,NX)=0.0
      HVSTN(NZ,NY,NX)=0.0
      HVSTP(NZ,NY,NX)=0.0
      TCSN0(NZ,NY,NX)=0.0
      TZSN0(NZ,NY,NX)=0.0
      TPSN0(NZ,NY,NX)=0.0
      TCSNC(NZ,NY,NX)=0.0
      TZSNC(NZ,NY,NX)=0.0
      TPSNC(NZ,NY,NX)=0.0
960   CONTINUE
      ENDIF
C
C     CALCULATE DAYLENGTH FROM SOLAR ANGLE
C
      XI=I
      IF(I.EQ.366)XI=365.5
      DECDAY=XI+100
      DECLIN=SIN((DECDAY*0.9863)*1.7453E-02)*(-23.47)
      AZI=SIN(ALAT(NY,NX)*1.7453E-02)*SIN(DECLIN*1.7453E-02)
      DEC=COS(ALAT(NY,NX)*1.7453E-02)*COS(DECLIN*1.7453E-02)
      DYLX(NY,NX)=DYLN(NY,NX)
      IF(AZI/DEC.GE.1.0-TWILGT)THEN
      DYLN(NY,NX)=24.0
      ELSEIF(AZI/DEC.LE.-1.0+TWILGT)THEN
      DYLN(NY,NX)=0.0
      ELSE
      DYLN(NY,NX)=12.0*(1.0+2.0/3.1416*ASIN(TWILGT+AZI/DEC))
      ENDIF
      IF(IGO.EQ.0.OR.I.LE.ILAST)THEN
      ITYPE=IWTHR(1)
      ELSE
      ITYPE=IWTHR(2)
      ENDIF
C
C     PARAMETERS FOR CALCULATING HOURLY RADIATION, TEMPERATURE
C     AND VAPOR PRESSURE FROM DAILY VALUES
C
      IF(ITYPE.EQ.1)THEN
      IF(IETYP(NY,NX).GE.-1)THEN
      IF(DYLN(NY,NX).GT.ZERO)THEN
      RMAX=SRAD(I)/(DYLN(NY,NX)*0.658)
      ELSE
      RMAX=0.0
      ENDIF
      ELSE
      RMAX=SRAD(I)
      ENDIF
      I2=I-1
      I3=I+1
      IF(I.EQ.1)I2=LYRX
      IF(I.EQ.IBEGIN)I2=I
      IF(I.EQ.LYRC)I3=I
      TAVG1=(TMPX(I2)+TMPN(I))/2
      TAVG2=(TMPX(I)+TMPN(I))/2
      TAVG3=(TMPX(I)+TMPN(I3))/2
      AMP1=TAVG1-TMPN(I)
      AMP2=TAVG2-TMPN(I)
      AMP3=TAVG3-TMPN(I3)
      VAVG1=(DWPT(1,I2)+DWPT(2,I))/2
      VAVG2=(DWPT(1,I)+DWPT(2,I))/2
      VAVG3=(DWPT(1,I)+DWPT(2,I3))/2
      VMP1=VAVG1-DWPT(2,I)
      VMP2=VAVG2-DWPT(2,I)
      VMP3=VAVG3-DWPT(2,I3)
      ENDIF
C
C     MODIFIERS TO TEMPERATURE, RADIATION, WIND, HUMIDITY, PRECIPITATION,
C     IRRIGATION AND CO2 INPUTS FROM CLIMATE CHANGES ENTERED IN 'READS'
C
      DO 600 N=1,12
      IF(ICLM.EQ.1)THEN
      TDTPX(NY,NX,N)=DTMPX(N)
      TDTPN(NY,NX,N)=DTMPN(N)
      TDRAD(NY,NX,N)=DRAD(N)
      TDWND(NY,NX,N)=DWIND(N)
      TDHUM(NY,NX,N)=DHUM(N)
      TDPRC(NY,NX,N)=DPREC(N)
      TDIRI(NY,NX,N)=DIRRI(N)
      TDCO2(NY,NX,N)=DCO2E(N)
      TDCN4(NY,NX,N)=DCN4R(N)
      TDCNO(NY,NX,N)=DCNOR(N)
      ELSEIF(ICLM.EQ.2)THEN
      TDTPX(NY,NX,N)=TDTPX(NY,NX,N)+DTMPX(N)/LYRC
      TDTPN(NY,NX,N)=TDTPN(NY,NX,N)+DTMPN(N)/LYRC
      TDRAD(NY,NX,N)=TDRAD(NY,NX,N)+(DRAD(N)-1.0)/LYRC
      TDWND(NY,NX,N)=TDWND(NY,NX,N)+(DWIND(N)-1.0)/LYRC
      TDHUM(NY,NX,N)=TDHUM(NY,NX,N)+(DHUM(N)-1.0)/LYRC
      TDPRC(NY,NX,N)=TDPRC(NY,NX,N)+(DPREC(N)-1.0)/LYRC
      TDIRI(NY,NX,N)=TDIRI(NY,NX,N)+(DIRRI(N)-1.0)/LYRC
      TDCO2(NY,NX,N)=TDCO2(NY,NX,N)*EXP(LOG(DCO2E(N))/LYRC)
      TDCN4(NY,NX,N)=TDCN4(NY,NX,N)+(DCN4R(N)-1.0)/LYRC
      TDCNO(NY,NX,N)=TDCNO(NY,NX,N)+(DCNOR(N)-1.0)/LYRC
      ENDIF
600   CONTINUE
950   CONTINUE
955   CONTINUE
      DO 9995 NX=NHW,NHE
      DO 9990 NY=NVN,NVS
C
C     ATTRIBUTE MIXING COEFFICIENTS AND SURFACE ROUGHNESS PARAMETERS
C     TO TILLAGE EVENTS FROM ARRAY LOADED IN 'READS'
C
      IF(ITILL(I,NY,NX).LE.10)THEN
      CORP=AMIN1(1.0,AMAX1(0.0,ITILL(I,NY,NX)/10.0))      
      XCORP(NY,NX)=AMAX1(1.0E-03,1.0-CORP)
      ENDIF
C
C     AUTOMATIC IRRIGATION IF SELECTED
C
      IF(DATA(6)(1:4).EQ.'auto')THEN
      IF(I.GE.IIRRA(1,NY,NX).AND.I.LE.IIRRA(2,NY,NX))THEN
      TFC=0.0
      TWP=0.0
      TVW=0.0
      DO 165 L=NU(NY,NX),NL(NY,NX)
      IF(CDPTH(L-1,NY,NX).LT.DIRRA(1,NY,NX))THEN
      FW=AMIN1(1.0,(DIRRA(1,NY,NX)-CDPTH(L-1,NY,NX))
     2/(CDPTH(L,NY,NX)-CDPTH(L-1,NY,NX)))
      FZ=AMIN1(POROS(L,NY,NX),WP(L,NY,NX)+CIRRA(NY,NX)
     2*(FC(L,NY,NX)-WP(L,NY,NX)))
      TFC=TFC+FW*FZ*VOLX(L,NY,NX)
      TWP=TWP+FW*WP(L,NY,NX)*VOLX(L,NY,NX)
      TVW=TVW+FW*(VOLW(L,NY,NX)+VOLI(L,NY,NX))
      ENDIF
165   CONTINUE
      IF(TVW.LT.TWP+FIRRA(NY,NX)*(TFC-TWP))THEN
      RR=AMAX1(0.0,TFC-TVW)
      DO 170 J=IIRRA(3,NY,NX),IIRRA(4,NY,NX)
      RRIG(J,I,NY,NX)=RR/(IIRRA(4,NY,NX)-IIRRA(3,NY,NX)+1)
170   CONTINUE
      WDPTH(I,NY,NX)=DIRRA(2,NY,NX)
C     WRITE(*,2222)'auto',I,IIRRA(3,NY,NX),IIRRA(4,NY,NX)
C    2,RR,TFC,TVW,TWP,FIRRA(NY,NX)
C    2,CIRRA(NY,NX),DIRRA(1,NY,NX),WDPTH(I,NY,NX)
C    3,(RRIG(J,I,NY,NX),J=1,24)
2222  FORMAT(A8,3I4,40E12.4)
      ENDIF
      ENDIF
      ENDIF
9990  CONTINUE
9995  CONTINUE
      RETURN
      END
