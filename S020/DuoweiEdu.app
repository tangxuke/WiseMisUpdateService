��� 3 
 �: �4 #                    ��0

   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _4221BHRGU1151250812      /  F      ]                          �      �                       WINDOWS _4221BHRGV1152011623�      �  �      �      �  J                  !                           WINDOWS _4221BHRGU1152010779�            *                                                           WINDOWS _4221BKVHS1152010806�      �      !      �  T                                               WINDOWS _4221CL6341152010845�      �  �  �  �      ;  |                                               WINDOWS _4221CL6351151251717:      G  T  b  o                                                           WINDOWS _42C0JW6391152010779)       6   C   W   d                                                            WINDOWS _42C0JW63A1152011623,!      9!  F!  [!  h!      �!  b$                                               COMMENT RESERVED                                c'                                                            '�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �BorderStyle = 2
Height = 144
Width = 375
ShowWindow = 1
DoCreate = .T.
AutoCenter = .T.
Caption = "����"
MaxButton = .F.
MinButton = .F.
WindowType = 1
_memberdata =      519<VFPData><memberdata name="setcardreader" type="method" display="SetCardReader"/><memberdata name="creaderip" type="property" display="cReaderIP"/><memberdata name="creaderip_assign" type="method" display="cReaderIP_Assign"/><memberdata name="ccardid" type="property" display="cCardID"/><memberdata name="oclient" type="property" display="oClient"/><memberdata name="transformgetdata" type="method" display="TransformGetData"/><memberdata name="transformsenddata" type="method" display="TransformSendData"/></VFPData>

creaderip = 
ccardid = 
oclient = 
Name = "Form1"
     IPROCEDURE creaderip_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cReaderIP = m.vNewVal
this.oLabelIpPort.Caption=m.vNewVal
IF VARTYPE(this.oClient)="O"
	WITH this.oClient as UdpClass.UdpClass
		.Close()
	ENDWITH 
ELSE
	this.oClient=CREATEOBJECT("UdpClass.UdpClass")
ENDIF 

LOCAL cIP,nPort
cIP=GETWORDNUM(m.vNewVal,1,":")
nPort=CAST(GETWORDNUM(m.vNewVal,2,":") as I)

WITH this.oClient as UdpClass.UdpClass
	.SendData(this.TransformSendData("AAFFE5B0"),cIP,nPort)
ENDWITH 

this.oConnectTimer.Enabled= .T.
this.oReceiveTimer.Enabled= .T.
ENDPROC
PROCEDURE transformsenddata
LPARAMETERS sData as String
IF VARTYPE(sData)<>"C" OR EMPTY(sData)
	RETURN ""
ENDIF 

sData=STRCONV(sData,16)
sData=STRCONV(sData,13)

RETURN sData
ENDPROC
PROCEDURE transformgetdata
LPARAMETERS sData as String
IF VARTYPE(sData)<>"C" OR EMPTY(sData)
	RETURN ""
ENDIF 

sData=STRCONV(sData,14)
sData=STRCONV(sData,15)

RETURN sData
ENDPROC
PROCEDURE Destroy
IF VARTYPE(this.oClient)="O"
	WITH this.oClient as UdpClass.UdpClass
		.Close()
	ENDWITH 
ENDIF 
ENDPROC
PROCEDURE Init
this.cCardID=""
LOCAL cIpPort
cIpPort=regRead("��������ַ","SOFTWARE\��ά����",2147483650)

IF EMPTY(cIpPort)
	cIpPort=INPUTBOX("�����������IP��ַ���˿ڣ�","�趨","192.168.0.101:8080")
	IF EMPTY(cIpPort)
		RETURN .f.
	ENDIF 
	IF !regWrite("��������ַ",cIpPort,"SOFTWARE\��ά����",2147483650)
		MESSAGEBOX("д��ע���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		RETURN .f.
	ENDIF 
ENDIF 

this.cReaderIP=cIpPort
ENDPROC
PROCEDURE Unload
RETURN this.cCardID
ENDPROC
     ����    �  �                        yG   %   )        ;   �          �  U  b ��  � T� � ���  �� T� � � ���  �� %�C� � ��� O��z �% ��� � �Q� UDPCLASS.UdpClass�v � ��C�� �� �� �� �$ T� � �C� UdpClass.UdpClass�N�� � �� � � T� �C��  �� :����! T� �CC��  �� :��� I���% ��� � �Q� UDPCLASS.UdpClass�9�% ��CC� AAFFE5B0� �
  �  � ��	 �� �� T� � � �a�� T� � � �a�� U  VNEWVAL THIS	 CREADERIP OLABELIPPORT CAPTION OCLIENT CLOSE CIP NPORT SENDDATA TRANSFORMSENDDATA OCONNECTTIMER ENABLED ORECEIVETIMERn  ��  Q� STRING� %�C�  ��� C� C�  ���8 �	 B��  �� � T�  �C�  ���� T�  �C�  ����	 B��  �� U  SDATAn  ��  Q� STRING� %�C�  ��� C� C�  ���8 �	 B��  �� � T�  �C�  ���� T�  �C�  ����	 B��  �� U  SDATAS  %�C�  � ��� O��L �% ���  � �Q� UDPCLASS.UdpClass�H � ��C�� �� �� � U  THIS OCLIENT CLOSEK T�  � ��  �� �� �: T� �C�
 ��������ַ� SOFTWARE\��ά�����
   @   �A� �� %�C� ���4�F T� �C� �����������IP��ַ���˿ڣ�� �趨� 192.168.0.101:8080���� %�C� ���� � B�-�� �? %�C�
 ��������ַ � � SOFTWARE\��ά�����
   @   �A� 
��0�* ��C� д��ע���ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� � � T�  � �� �� U  THIS CCARDID CIPPORT REGREAD REGWRITE	 CREADERIP  B��  � �� U  THIS CCARDID creaderip_assign,     �� transformsenddata#    �� transformgetdata�    �� Destroy    �� Init�    �� Unload    ��1 q "Q�Q� A � AA � �RQA 2 �� A 21� 2 �� A 21� 2 �Q� A A 2 q �� a� q A ��q A A 2 � 1                       T        |          >  �  $   $   �  [  /   *   v    6   9   +  >  H    )   �                        �_memberdata XML Metadata for customizable properties
creaderip ������IP��ַ
ccardid ����
oclient UdpClient
*creaderip_assign 
*transformsenddata ת��Ҫ���͵�����
*transformgetdata ת�����յ�������
      label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "������IP��ַ���˿ڣ�"
Height = 21
Left = 12
Top = 106
Width = 131
Name = "Label1"
      commandbutton      commandbutton      Command1      Form1      {Top = 104
Left = 311
Height = 27
Width = 61
FontName = "΢���ź�"
FontSize = 10
Caption = "����"
Name = "Command1"
     �PROCEDURE Click
LOCAL cIpPort
cIpPort=regRead("��������ַ","SOFTWARE\��ά����",2147483650)

IF EMPTY(cIpPort)
	cIpPort="192.168.0.101:8080"
ENDIF
cIpPort=INPUTBOX("�����������IP��ַ���˿ڣ�","�趨",cIpPort)
IF EMPTY(cIpPort)
	RETURN
ENDIF
IF !regWrite("��������ַ",cIpPort,"SOFTWARE\��ά����",2147483650)
	MESSAGEBOX("д��ע���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF

thisform.cReaderIP=cIpPort

ENDPROC
     4���                              �_   %   �      �     �          �  U  B ��  �: T�  �C�
 ��������ַ� SOFTWARE\��ά�����
   @   �A� �� %�C�  ���o � T�  �� 192.168.0.101:8080�� �4 T�  �C� �����������IP��ַ���˿ڣ�� �趨�  ���� %�C�  ���� � B� �? %�C�
 ��������ַ �  � SOFTWARE\��ά�����
   @   �A� 
��+�* ��C� д��ע���ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � T� � ��  �� U  CIPPORT REGREAD REGWRITE THISFORM	 CREADERIP Click,     ��1 q �� �A A� A A ��A A 2                       �      )                           timer      timer      oConnectTimer      Form1      gTop = 24
Left = 336
Height = 23
Width = 23
Enabled = .F.
Interval = 5000
Name = "oConnectTimer"
     9PROCEDURE Timer
IF VARTYPE(thisform.oClient)<>"O"
	RETURN 
ENDIF 
LOCAL cIP,nPort
cIP=GETWORDNUM(thisform.cReaderIP,1,":")
nPort=CAST(GETWORDNUM(thisform.cReaderIP,2,":") as I)

WITH thisform.oClient as UdpClass.UdpClass
	.SendData(thisform.TransformSendData("AAFFE5B0"),cIP,nPort)
ENDWITH 

ENDPROC
     ����    �  �                        ��   %   /      T     >          �  U  �  %�C�  � ��� O�� � B� � �� � � T� �C�  � �� :����" T� �CC�  � �� :��� I���% ���  � �Q� UDPCLASS.UdpClass�� �% ��CC� AAFFE5B0�  �  �  � �� �� �� U  THISFORM OCLIENT CIP NPORT	 CREADERIP SENDDATA TRANSFORMSENDDATA Timer,     ��1 �A A � �!RQA 2                       .      )   �                        label      label      Label2      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 16
BackStyle = 0
Caption = "��ˢ������"
Height = 30
Left = 138
Top = 31
Width = 99
ForeColor = 64,0,64
Name = "Label2"
      label      label      oLabelIpPort      Form1      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 10
Alignment = 2
BackStyle = 0
Caption = ""
Height = 21
Left = 139
Top = 108
Width = 161
ForeColor = 64,0,128
Name = "oLabelIpPort"
      timer      timer      oReceiveTimer      Form1      fTop = 60
Left = 336
Height = 23
Width = 23
Enabled = .F.
Interval = 100
Name = "oReceiveTimer"
     �PROCEDURE Timer
IF VARTYPE(thisform.oClient)<>"O"
	RETURN 
ENDIF 

WITH thisform.oClient as UdpClass.UdpClass
	IF .Available=0
		RETURN 
	ENDIF 
	
	LOCAL cIP,nPort
	cIP=""
	nPort=0
	LOCAL cIP1,nPort1
	cIP1=GETWORDNUM(thisform.cReaderIP,1,":")
	nPort1=CAST(GETWORDNUM(thisform.cReaderIP,2,":") as I)
	
	LOCAL sData
	sData=thisform.TransformGetData(.GetData(@cIP,@nPort))
	
	IF cIP<>cIP1 OR nPort<>nPort1
		RETURN 
	ENDIF 
	
	IF LEFT(sData,6)=="BBFF00"
		thisform.cCardID=SUBSTR(sData,7,8)
		.SendData(thisform.TransformSendData("AAFFB0010A0104EB"),cIP,nPort)
		thisform.Release
		RETURN 
	ENDIF 
ENDWITH 
ENDPROC
     ����    �  �                        �s   %   R      �     a          �  U  � %�C�  � ��� O�� � B� �% ���  � �Q� UDPCLASS.UdpClass��� %��� � ��[ � B� � �� � � T� ��  �� T� �� �� �� � � T� �C�  � �� :����" T� �CC�  � �� :��� I��� �� � T� �CC� � ��
 �  �	 �� %�� � � � � ��� B� � %�C� �=� BBFF00���� T�  � �C� ��\��- ��CC� AAFFB0010A0104EB�  �  �  � �� ��
 ��  � � B� � �� U  THISFORM OCLIENT	 AVAILABLE CIP NPORT CIP1 NPORT1	 CREADERIP SDATA TRANSFORMGETDATA GETDATA CCARDID SENDDATA TRANSFORMSENDDATA RELEASE Timer,     ��1 �A A R!A A � � � � �!r ��A A ���� A A A 1                       y      )   �                        FArial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
0H   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _49I10AQG01177913092      /  F      ]                          �      �                       WINDOWS _49I10AQGR1247247072�      �  �      �      0  B                  Qx                           WINDOWS _4HQ1F2N331244364995\z      iz  vz  �z  �z      {  �{                                               WINDOWS _49I13LL901233551178�|      �|  �|  �|  �|                                                           WINDOWS _49I13LL911233551973z}      �}  �}  �}  �}      J~  �~                                               WINDOWS _49I10AQG01233551178�      �  �  �  �                                                           WINDOWS _49I10AQGR1233551178��      ��  ˀ  ܀  �                                                           WINDOWS _49I10AQG01233551178i�      v�  ��  ��  ��                                                           WINDOWS _49I10AQGR1233551178K�      Z�  i�  z�  ��                                                           WINDOWS _49I13LL931233552273�      �  �  ,�  9�                                                           WINDOWS _49I13LL941177916305��      �  �  %�  A�                                                           WINDOWS _49I13LL961177916305��      ��  ��  ͏  �                                                           WINDOWS _49I13LL981177916305J�      X�  f�  u�  ��                                                           WINDOWS _49I13LL991184214497�      �  �  �  9�      ё  ��                                               WINDOWS _49I13LL9A1224424590��      ϓ  ݓ  �  	�                                                           WINDOWS _49I13LL9B1178765466p�      �  ��  ��  ��                                                           WINDOWS _49I13LL9C1224424590]�      k�  y�  ��  ��                                                           WINDOWS _49I13LL9D1178765661	�      �  '�  4�  P�                                                           WINDOWS _49L105NB11178109603��      �  �   �  <�                                                           WINDOWS _49L105NB21184215653��      ��  Ǘ  ח  �      Ę  L�                                               WINDOWS _49U108YBB1178765014|�      ��  ��  ��  Ú                                                           WINDOWS _4BY0XH9TL1184070823$�      2�  @�  O�  l�                                                           WINDOWS _4BY0XH9TM1184214541ϛ      ޛ  �  ��  �      ��  ��                                               WINDOWS _4FM1E61K31193131535#�      1�  ?�  N�  j�                                                           WINDOWS _4FM1E61K41233025324˞      ۞  �  ��  �      h�  C�                                               WINDOWS _4OX0G4MJI1224424431�      �  ��  �  '�                                                           WINDOWS _4OX0G4MJJ1224424431��      ��  ��  ��  Ԧ                                                           WINDOWS _4OX0GB04S1224424590D�      R�  `�  o�  ��                                                           WINDOWS _4OX0GB04T1224424590�      ��  �  �  5�                                                           WINDOWS _4SF0WHH2C1233025324��      ��  ��  Ш  �                                                           WINDOWS _49I10AQG01233552273M�      Z�  g�  u�  ��                                                           WINDOWS _49I10AQGR1233552273/�      >�  M�  \�  i�                                                           WINDOWS _49I13LL9H1233552273�      ��  �  $�  1�      *�  ��                                               WINDOWS _49I10AQG01233551178��      ��  ��  ɭ  ֭                                                           WINDOWS _49I13LL9I1233551178��      ��  ��  ��  ��      �  Q�                                               WINDOWS _49I10AQG01233551178.�      ;�  H�  V�  c�                                                           WINDOWS _49I10AQG01233551178�      "�  /�  >�  K�                                                           WINDOWS _49I13LL9K1233551178��      �  �  .�  ;�                                                           WINDOWS _49I13LL9L1233551178��      ̲  ۲  �  ��      ��  ��                                               WINDOWS _49I10AQG01233551178M�      Y�  e�  r�  �                                                           WINDOWS _49I10AQG01233551178Ƹ      ۸  �   �  �      ��  ��                                               WINDOWS _49I10AQG01233551178��      ��  ��  Ⱥ  պ      \�  ��                                               WINDOWS _49I13LL9N1233551178_�      t�  ��  ��  ��      9�  ܽ                                               WINDOWS _49I10AQG01234078262�      &�  ;�  T�  a�      1�  V�                                               WINDOWS _49I10AQG01233551178��      ��  ��  ��  ��                                                           WINDOWS _49O1C15Q41233551178i�      {�  ��  ��  ��      ��  E�  �  �                                       WINDOWS _49I10AQG01233551178R�      g�  |�  ��  ��      �  P�                                               WINDOWS _49I10AQG01233551178!�      .�  ;�  I�  V�                                                           WINDOWS _49I10AQGR1233551178�      �  %�  4�  A�                                                           WINDOWS _49I10AQG01233551178��      ��  ��  ��  ��                                                           WINDOWS _49R1B8YXY1233551178��      ��  ��  ��  ��                                                           WINDOWS _49I10AQG01233552433��      ��  ��  ��  �      ��  o�                                               WINDOWS _49T0TJH5F1233617820��      ��  ��  ��  ��      ��  ��                                               WINDOWS _49U0KWVH01233551178        . ;     � S                                              WINDOWS _49U0KWVH11233551178^     m | � �                                                          WINDOWS _4BY0VRV2N1233551178     % : J W     � ]                                              WINDOWS _49I10AQG01244430407Q	     a	 q	 �	 �	     T
 �                                              WINDOWS _49I10AQGR1244365425�     � � � �                                                          WINDOWS _49I10AQG01244430407�     � � � �     � �                                              WINDOWS _49I10AQGR1244365425�     � � � 
                                                          WINDOWS _4C1014RY61233551178�     � � �                                                           WINDOWS _4C101IWEB1244430407I     Y i z �     Q ;                                              WINDOWS _4C101IWEC1244365425�     �        � `                                              WINDOWS _4CC0WUAZD1233551178w     � � � �     =                                               WINDOWS _4D1127COZ1233551178�     � � � �     �  �                                               WINDOWS _49I10AQG01244235362�!     �! �! �! "     �" �%                                              WINDOWS _4EC0XQL3X1244235362�(     �( �( ) )     �) �+                                              WINDOWS _4GA1DX6V31233552621�.     �. �. �. �.     �/ P1                                              WINDOWS _4RE0SLPE91233552273�3     �3 �3 �3 �3     Y4 B5                                              WINDOWS _4TM0ZBWJZ1247247072�6     �6 �6 �6 7                                                          COMMENT RESERVED                                �7                                                          8�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     	3BorderStyle = 3
Height = 542
Width = 985
ShowWindow = 2
DoCreate = .T.
ShowTips = .T.
AutoCenter = .T.
Caption = "�����ɷ�"
MaxButton = .F.
MinButton = .F.
_memberdata =     1503<VFPData><memberdata name="refreshxq" type="method" display="RefreshXQ"/><memberdata name="refreshxn" type="method" display="RefreshXN"/><memberdata name="refreshkmmx" type="method" display="RefreshKMMX"/><memberdata name="refreshtotal" type="method" display="RefreshTotal"/><memberdata name="createnew" type="method" display="CreateNew"/><memberdata name="save" type="method" display="Save"/><memberdata name="bsave" type="property" display="bSave"/><memberdata name="bsave_assign" type="method" display="bSave_Assign"/><memberdata name="nzkl" type="property" display="nZKL"/><memberdata name="refreshzkl" type="method" display="RefreshZKL"/><memberdata name="refreshkc" type="method" display="RefreshKC"/><memberdata name="ckxkm" type="property" display="cKXKM"/><memberdata name="njcf" type="property" display="nJCF"/><memberdata name="ntotal_ksf" type="property" display="nTotal_KSF"/><memberdata name="printsj" type="method" display="PrintSJ"/><memberdata name="checkunfinish" type="method" display="CheckUnFinish"/><memberdata name="checkstudent" type="method" display="CheckStudent"/><memberdata name="binit" type="property" display="bInit"/><memberdata name="refreshprice" type="method" display="RefreshPrice"/><memberdata name="cpricecursor" type="property" display="cPriceCursor"/><memberdata name="refreshsetzkl" type="method" display="RefreshSetZKL"/><memberdata name="csetcursor" type="property" display="cSetCursor"/><memberdata name="ntfzkl" type="property" display="nTFZKL"/></VFPData>

bsave = .T.
nzkl = 1
ckxkm = 
njcf = 
ntotal_ksf = 0
binit = .F.
cpricecursor = 
csetcursor = 
ntfzkl = 1
nsjtotal = 0
Name = "Form1"
     5�PROCEDURE refreshxq

*!*��ʼ��У��
this.oComboXQ.Clear
LOCAL cSQL,cCursor
cSQL="select * from У���� where ISNULL(����,0)=0 order by ˳���"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡУ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboXQ.AddItem(ALLTRIM(У�����))
ENDSCAN 
=CloseAlias(cCursor)
ENDPROC
PROCEDURE refreshkmmx
IF EMPTY(this.oTextXSBH.Value)
	RETURN 
ENDIF 

LOCAL cXQ,cXN,cXSBH
cXQ=this.oComboXQ.DisplayValue
cXSBH=this.oTextXSBH.Value

IF this.oCheckClear.Value
LOCAL cSQL
	TEXT TO cSQL NOSHOW TEXTMERGE
	declare @У�� varchar(50),@ѧ����� varchar(50),@�꼶 varchar(50)
	set @У��='<<cXQ>>'
	set @ѧ�����='<<cXSBH>>'

	select a.ѧ��
	,a.�꼶
	,a.�γ����� as ��Ŀ
	,a.�༶���� as ���
	,ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0) as ��ʱ
	,dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����) as ��ʱ��
	,b.��ʱ�� as ��׼��ʱ��
	from ѧ��������Ϣ a
		inner join �γ��շѱ� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.�༶����=b.�༶����
		inner join ѧ��� c on a.У��=c.У�� and a.ѧ��=c.ѧ��
	where a.У��=@У��
		and a.ѧ�����=@ѧ�����
		and ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0)<>0
		and ISNULL(�ر�,0)=0
	ENDTEXT
ELSE 
	TEXT TO cSQL NOSHOW TEXTMERGE
	declare @У�� varchar(50),@ѧ����� varchar(50),@�꼶 varchar(50)
	set @У��='<<cXQ>>'
	set @ѧ�����='<<cXSBH>>'

	select a.ѧ��
	,a.�꼶
	,a.�γ����� as ��Ŀ
	,a.�༶���� as ���
	,b.��ʱ��-isnull(a.���ѿ�ʱ,0) as ��ʱ
	,b.��ʱ��
	,b.��ʱ�� as ��׼��ʱ��
	from ѧ��������Ϣ a
		inner join �γ��շѱ� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.�༶����=b.�༶����
		inner join ѧ��� c on a.У��=c.У�� and a.ѧ��=c.ѧ��
	where a.У��=@У��
		and a.ѧ�����=@ѧ�����
		and ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0)>0
		and ISNULL(�ر�,0)=0
	ENDTEXT
ENDIF 


SELECT ��Ŀ��ϸ
ZAP

LOCAL cCursor
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡѧ����Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF

SELECT 0
INSERT INTO ��Ŀ��ϸ(ѧ��,�꼶,��Ŀ,���,��ʱ,��ʱ��,��׼��ʱ��) SELECT ѧ��,�꼶,��Ŀ,���,��ʱ,��ʱ��,��׼��ʱ�� FROM (cCursor)

SELECT ��Ŀ��ϸ
GOTO TOP
this.Grid1.Refresh

this.RefreshTotal
ENDPROC
PROCEDURE refreshtotal
this.RefreshZKL

SELECT ��Ŀ��ϸ
LOCAL nRecno
nRecno=RECNO()
CALCULATE SUM(NVL(��ʱ*��׼��ʱ��,0)) TO nSum
CALCULATE SUM(NVL(�̲ķ�,0)) TO nJCF
CALCULATE SUM(NVL(��ʱ*��ʱ��,0)) TO nSJSum
TRY 
	GOTO nRecno
CATCH 
ENDTRY 
this.Cls

this.nTotal_KSF=nSum
this.nJCF=nJCF
this.nSJTotal=nSJSum

this.oTextTotal.Value=ROUND(this.nTotal_KSF+this.nJCF,0)


IF this.oCheckClear.Value
	*this.oTextSSJE.Value=ROUND(this.oTextTotal.Value*this.nTFZKL,0)
	this.oTextSSJE.Value=ROUND(nSJSum,0)
ELSE 
	*this.oTextSSJE.Value=ROUND(this.nTotal_KSF*this.nZKL,0)+this.nJCF
	this.oTextSSJE.Value=ROUND(nSJSum+this.nJCF,0)
ENDIF 

ENDPROC
PROCEDURE createnew
IF !this.bSave
	IF MESSAGEBOX("�Ƿ�������浱ǰ�վݣ�",1+32,"ϵͳ��ʾ")<>1
		RETURN 
	ENDIF 
ENDIF 

this.Shape1.ZOrder(1)

this.oTextDH.Value=""

*this.oDate.object.Value=DATE()
this.oTextXSBH.Value=""
this.oTextXSXM.Value=""
this.oTextNJ.Value=""
this.oEditRemark.Value=""
this.oTextTotal.Value=0
this.oTextSSJE.Value=0
this.oTextDJQ.Value=0
this.nJCF=0.00
this.oCmdSelectKM.Enabled= .T.
this.oCheckXJ.Value=.f.
this.oCheckSK.Value=.f.
this.oCheckDJQ.Value=.f.
this.oCmdChangeName.Enabled= .T.
this.oCmdChangeGrade.Enabled= .T.

SELECT ��Ŀ��ϸ
ZAP 
this.Grid1.Refresh
this.Grid1.ColumnNJ.Enabled= .T.
this.Grid1.ColumnKM.Enabled= .T.
this.Grid1.ColumnBB.Enabled= .T.
this.Grid1.ColumnKS.Enabled= .T.
this.Grid1.ColumnJCF.Enabled= .T.
this.Grid1.ColumnFB.Enabled= .T.

this.bSave=.t.
this.nZKL=1

thisform.oCmdSave.Enabled= .T.
thisform.oCmdPrint.Enabled= .F.
thisform.oCmdZF.Enabled= .F.
this.oCheckClear.Value=.f.
this.oCheckClear.Enabled= .T.

=RAISEEVENT(this.oCmdSelectStudent,"Click")
ENDPROC
PROCEDURE save
this.ocmdChangeName.Enabled= .F.
this.oCmdChangeGrade.Enabled= .F.

IF EMPTY(this.oTextXSBH.Value)
	MESSAGEBOX("ѧ����Ų���Ϊ�գ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF

LOCAL cXQ,cXSBH,cXSXM,cJSFS,cRQ,cDH,cRemark,nHJJE,nSSJE,cNJ,cKPR,cSFFS,nDJQ,nJCF,nXJJE,nSKJE,nXJTF,nSKTF
cXQ=this.oComboXQ.DisplayValue
cXSBH=this.oTextXSBH.Value
cXSXM=this.oTextXSXM.Value

cRQ=TRANSFORM(this.oDate.object.Value)

cRemark=ALLTRIM(this.oEditRemark.Value)
nHJJE=this.oTextTotal.Value
nSSJE=this.oTextSSJE.Value
cNJ=this.oTextNJ.Value
cKPR=this.oTextKPR.Value
LOCAL nZKL
IF this.nSJTotal=0
	nZKL=1
ELSE 
	*nZKL=1.000*nSSJE/nHJJE
	nZKL=1.000*(nSSJE-this.nJCF)/this.nSJTotal
ENDIF 

nDJQ=this.oTextDJQ.Value
IF this.oTextXJ.Value>=0
	nXJJE=this.oTextXJ.Value
	nXJTF=0
ELSE
	nXJJE=0
	nXJTF=this.oTextXJ.Value
ENDIF 
IF this.oTextSK.Value>=0
	nSKJE=this.oTextSK.Value
	nSKTF=0
ELSE
	nSKJE=0
	nSKTF=this.oTextSK.Value
ENDIF 

SELECT ��Ŀ��ϸ
SELECT ѧ��,SUM(��ʱ*��׼��ʱ��) as ��� FROM ��Ŀ��ϸ GROUP BY ѧ�� INTO CURSOR ѧ�����
SELECT ѧ�����
IF RECCOUNT()>1
	LOCATE FOR ���=0
	IF FOUND()
		MESSAGEBOX("�շѶ���һ������ʱ�����м����շѽ���Ӧ�����㣡",0+64,"ϵͳ��ʾ")
		USE 
		RETURN 
	ENDIF 
ENDIF 
IF RECCOUNT()=0
	MESSAGEBOX("����ָ��һ���շѼ��ȣ�",0+64,"ϵͳ��ʾ")
	USE 
	RETURN 
ENDIF 
USE 

IF nXJJE+nSKJE+nDJQ+nXJTF+nSKTF<>nSSJE
	MESSAGEBOX("�ֽ�ˢ���ʹ���ȯ�ϼƲ�����ʵ�ս�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

IF (nHJJE=0 OR nSSJE=0) AND EMPTY(thisform.oEditRemark.Value)
	MESSAGEBOX("����ϼƽ�����ʵ�ս��Ϊ�㣬����ע��ԭ��",0+64,"ϵͳ��ʾ")
	thisform.oEditRemark.SetFocus
	RETURN
ENDIF
IF EMPTY(cXSBH)
	MESSAGEBOX("ѧ�����Ϊ�գ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF

cDH=this.oTextDH.Value
IF EMPTY(cDH)
	cDH=GetNewID("�ɷѵ���")
	this.oTextDH.Value=cDH
ENDIF

LOCAL cSQL,cSQLDetail
cSQLDetail=""

TEXT TO cSQL NOSHOW TEXTMERGE
BEGIN TRANSACTION
IF exists(select * from ѧ���ɷѱ� where �ɷѵ���='<<cDH>>')
BEGIN
	raiserror('{b}�˵����Ѵ��ڣ�{e}',18,1)
	ROLLBACK
	RETURN
end
ELSE
begin
	INSERT INTO ѧ���ɷѱ�(�ɷѵ���, ��Ʊ����, У��, ѧ�����, ѧ������, �꼶, Remark, ʵ�ս��, �ϼƽ��,��Ʊ��,����ȯ,�̲ķ�,�ֽ�,ˢ��,�ֽ��˷�,ˢ���˷�)
		values ('<<cDH>>','<<cRQ>>','<<cXQ>>','<<cXSBH>>','<<cXSXM>>','<<cNJ>>','<<cRemark>>',<<nSSJE>>,<<nHJJE>>,'<<cKPR>>',<<nDJQ>>,<<this.nJCF>>,<<nXJJE>>,<<nSKJE>>,<<nXJTF>>,<<nSKTF>>)
	IF @@error<>0
	BEGIN
		ROLLBACK
		RETURN
	END
	exec WiseMis_SetNewId '�ɷѵ���','<<cDH>>'
	IF @@error<>0
	BEGIN
		ROLLBACK
		RETURN
	END
END
DECLARE @��� varchar(50)
ENDTEXT

SELECT ��Ŀ��ϸ
IF RECCOUNT()=0
	APPEND BLANK
ENDIF 
SCAN
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + TEXTMERGE("insert into ѧ���ɷѱ���ϸ(�ɷѵ���,У��,ѧ��,�꼶,�γ�����,�༶����,ѧ�����,��ʱ��,��ʱ��,�̲ķ�,��ע) values ('<<cDH>>','<<cXQ>>','<<ALLTRIM(ѧ��)>>','<<ALLTRIM(�꼶)>>','<<ALLTRIM(��Ŀ)>>','<<ALLTRIM(���)>>',")
	cSQLDetail = cSQLDetail + TEXTMERGE("'<<cXSBH>>',<<NVL(��ʱ,0)>>,<<NVL(��ʱ��,0)*nZKL>>,<<NVL(�̲ķ�,0)>>,'<<ALLTRIM(NVL(�ְ�,[]))>>')")
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "if @@error<>0"
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "begin"
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "		rollback"
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "		return"
	cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "end"
	
	*�ְ�
	IF !EMPTY(NVL(�ְ�,""))
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + TEXTMERGE("if not exists(select * from ѧ���γ̱� where ѧ�����='<<cXSBH>>' and У��='<<cXQ>>' and ѧ��='<<ALLTRIM(ѧ��)>>' and �꼶='<<ALLTRIM(�꼶)>>' and �γ�����='<<ALLTRIM(��Ŀ)>>' and ���='<<ALLTRIM(NVL(�ְ�,[]))>>')")
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "begin"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + TEXTMERGE("		insert into ѧ���γ̱�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���) values ('<<cXSBH>>','<<cXQ>>','<<ALLTRIM(ѧ��)>>','<<ALLTRIM(�꼶)>>','<<ALLTRIM(��Ŀ)>>','<<ALLTRIM(NVL(�ְ�,[]))>>')")
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "		if @@error<>0"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "		begin"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "			rollback"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "			return"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "		end"
		cSQLDetail = cSQLDetail + CHR(13) + CHR(10) + "end"
	ENDIF 
ENDSCAN

cSQL = cSQL + CHR(13) + CHR(10) + cSQLDetail +CHR(13) + CHR(10) + "commit"

IF Execute(cSQL)
	MESSAGEBOX("����ɹ���",0+64,"ϵͳ��ʾ")
	thisform.oCmdSave.Enabled= .F.
	this.Shape1.ZOrder(0)
ELSE
	MESSAGEBOX("����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF


this.bSave=.t.
this.PrintSJ

this.oCmdPrint.Enabled= .T.
this.oCmdZF.Enabled= .T.

ENDPROC
PROCEDURE bsave_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bSave = m.vNewVal
this.oLabelSave.Visible=(!m.vNewVal)
ENDPROC
PROCEDURE refreshzkl
IF EMPTY(this.oTextXSBH.Value)
	RETURN 
ENDIF 

LOCAL cXSBH,cXQ
cXSBH=ALLTRIM(this.oTextXSBH.Value)
cXQ=ALLTRIM(this.oComboXQ.DisplayValue)

this.nZKL=NVL(GetValue(TEXTMERGE("select dbo.ѧ���ۿ���('<<cXSBH>>','<<cXQ>>','')")),1.000)
*!*	this.nTFZKL=NVL(GetValue(TEXTMERGE("select �ۼ��ۿ��� from ѧ���շ���Ϣ where ѧ�����='<<cXSBH>>' and У��='<<cXQ>>' and ѧ��='<<cXN>>'")),1.000)

IF this.oCheckClear.Value
	RETURN 
ENDIF 

*CREATE CURSOR ��Ŀ��ϸ(ѧ�� C(50) null,�꼶 C(50) null,��Ŀ C(50) null,��� C(50) null,��ʱ I null,��ʱ�� N(11,3) null,��׼��ʱ�� N(11,3) null,�̲ķ� I null,�ְ� C(50) null)
LOCAL cZKCursor,cXNCursor,nTotalZKL,nXNCount
cZKCursor=SYS(2015)
cXNCursor=SYS(2015)
SELECT 0
SELECT ѧ�� FROM ��Ŀ��ϸ GROUP BY ѧ�� INTO CURSOR &cXNCursor
SELECT (cXNCursor)
nXNCount=RECCOUNT(cXNCursor)
nTotalZKL=NVL(GetValue(TEXTMERGE("select dbo.�༾���ۿ�(<<nXNCount>>)")),1.000)
=CloseAlias(cXNCursor)
IF this.nZKL<1
	nTotalZKL=1.00
ENDIF 

SELECT 0
SELECT ѧ��,�꼶,COUNT(*) as ��Ŀ�� FROM ��Ŀ��ϸ GROUP BY ѧ��,�꼶 INTO CURSOR &cZKCursor
SELECT (cZKCursor)
SCAN 
	LOCAL cXN1,cNJ1,nQty
	cXN1=ALLTRIM(ѧ��)
	cNJ1=ALLTRIM(�꼶)
	nQty=��Ŀ��
	LOCAL cSQL,nZKL
	cSQL=TEXTMERGE("select dbo.�շ��ۿ�('<<cXSBH>>','<<cXQ>>','<<cXN1>>','<<cNJ1>>',<<nQty>>)")
	nZKL=NVL(GetValue(cSQL),1.0000)
	SELECT ��Ŀ��ϸ
	REPLACE ��ʱ�� WITH ��׼��ʱ��*nZKL*nTotalZKL FOR ALLTRIM(ѧ��)=ALLTRIM(cXN1) AND ALLTRIM(�꼶)=ALLTRIM(cNJ1) ALL 
	
	SELECT (cZKCursor)
ENDSCAN 
=CloseAlias(cZKCursor)
ENDPROC
PROCEDURE nzkl_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.nZKL = m.vNewVal
IF m.vNewVal<1
	this.oLabelVIP.Visible= .T.
ELSE 
	this.oLabelVIP.Visible= .F.
ENDIF 
ENDPROC
PROCEDURE printsj
LOCAL cDH
cDH=thisform.oTextDH.Value
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE
	select *
	,dbo.WiseMis_GetReportItem('ѧ���ɷѱ�','�վ�','Footer') as Footer
	from ѧ���շ���ͼ
	where �ɷѵ���='<<cDH>>'
ENDTEXT
LOCAL cCursor
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF
SELECT (cCursor)
IF RECCOUNT()=0
	APPEND BLANK 
ENDIF 
REPORT FORM D:\WiseMis3\�վ� TO PRINTER
this.Cls
=CloseAlias(cCursor)
ENDPROC
PROCEDURE checkunfinish
LOCAL cXQ,cXN,cXSBH
ENDPROC
PROCEDURE checkstudent
LOCAL cXSBH,cXQ
cXSBH=ALLTRIM(this.oTextXSBH.Value)
cXQ=ALLTRIM(this.oComboXQ.DisplayValue)

LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @ѧ����� varchar(50),@У�� varchar(50),@ѧ�� varchar(50)
set @ѧ�����='<<cXSBH>>'
set @У��='<<cXQ>>'

select a.ѧ��,b.��ʼ����,SUM((ISNULL(a.������ʱ,0)-ISNULL(a.���ѿ�ʱ,0))*dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����)) as ����
from ѧ��������Ϣ a inner join ѧ��� b on a.У��=b.У�� and a.ѧ��=b.ѧ��
where a.ѧ�����=@ѧ�����
and a.У��=@У��
and isnull(b.��ǰѧ��,0)=0
and isnull(a.���ѿ�ʱ,0)<>isnull(a.������ʱ,0)
and ISNULL(a.�ر�,0)=0
group by a.ѧ��,b.��ʼ����
having SUM((ISNULL(a.������ʱ,0)-ISNULL(a.���ѿ�ʱ,0))*dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����))<>0
order by b.��ʼ����
ENDTEXT 
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ��ǰ����Ӧ��Ӧ����Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
LOCAL cMessage
cMessage="��ǰ����δ�����������£�"
SELECT (cCursor)
IF RECCOUNT()=0
	=CloseAlias(cCursor)
	RETURN 
ENDIF 
SCAN 
	cMessage = cMessage + CHR(13) + CHR(10) + ALLTRIM(ѧ��) + "    " + TRANSFORM(NVL(����,0)) + "Ԫ" + "    " + IIF(NVL(����,0)>=0,"Ӧ��","Ӧ��")
ENDSCAN 
=CloseAlias(cCursor)
MESSAGEBOX(cMessage,0+64,"δ�������ʾ")
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @ѧ����� varchar(50),@У�� varchar(50)
SET @ѧ�����='<<cXSBH>>'
SET @У��='<<cXQ>>'

IF exists(select * from ѧ��������Ϣ where ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)>ISNULL(������ʱ,0)) 
	AND exists(select * from ѧ��������Ϣ where ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)<ISNULL(������ʱ,0))
	SELECT 1
ELSE
	SELECT 0
ENDTEXT 

IF GetValue(cSQL)=1
	this.oCmdHXKS.Enabled=.t.
ELSE
	this.oCmdHXKS.Enabled=.f.
ENDIF 
ENDPROC
PROCEDURE Init
this.oDate.object.Value=DATE()

this.cPriceCursor=SYS(2015)
this.cSetCursor=SYS(2015)

this.RefreshXQ


ENDPROC
PROCEDURE Load
SELECT 0
CREATE CURSOR ��Ŀ��ϸ(ѧ�� C(50) null,�꼶 C(50) null,��Ŀ C(50) null,��� C(50) null,��ʱ N(11,2) null,��ʱ�� N(11,3) null,��׼��ʱ�� N(11,3) null,�̲ķ� N(11,2) null,�ְ� C(50) null)

ENDPROC
PROCEDURE Unload
=CloseAlias("��Ŀ��ϸ")
=CloseAlias(this.cPriceCursor)
=CloseAlias(this.cSetCursor)
ENDPROC
PROCEDURE Activate
IF !this.bInit
	this.CreateNew
	this.bInit=.t.
ENDIF 
ENDPROC
     6F���    -6  -6                        �   %   �0      5  �  �1          �  U  �  ��  � � � �� � �H T� ��; select * from У���� where ISNULL(����,0)=0 order by ˳����� T� �C��]�� %�C �  � � 
��� �( ��C� ��ȡУ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�� � ��CC� ��  � � �� � ��C � � �� U	  THIS OCOMBOXQ CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM У�����
 CLOSEALIAS+ %�C�  � � ��� � B� � �� � � � T� ��  � � �� T� ��  � � �� %��  � � ��s� ��	 �
 M(�	 `��H �B 	declare @У�� varchar(50),@ѧ����� varchar(50),@�꼶 varchar(50)� � 	set @У��='<<cXQ>>'�  � 	set @ѧ�����='<<cXSBH>>'� �  � � 	select a.ѧ��� � 	,a.�꼶� � 	,a.�γ����� as ��Ŀ� � 	,a.�༶���� as ����9 �3 	,ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0) as ��ʱ�W �Q 	,dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����) as ��ʱ��� � 	,b.��ʱ�� as ��׼��ʱ��� � 	from ѧ��������Ϣ a�� �� 		inner join �γ��շѱ� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.�༶����=b.�༶�����> �8 		inner join ѧ��� c on a.У��=c.У�� and a.ѧ��=c.ѧ��� � 	where a.У��=@У���  � 		and a.ѧ�����=@ѧ������8 �2 		and ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0)<>0� � 		and ISNULL(�ر�,0)=0� � �.�
 M(�	 `��H �B 	declare @У�� varchar(50),@ѧ����� varchar(50),@�꼶 varchar(50)� � 	set @У��='<<cXQ>>'�  � 	set @ѧ�����='<<cXSBH>>'� �  � � 	select a.ѧ��� � 	,a.�꼶� � 	,a.�γ����� as ��Ŀ� � 	,a.�༶���� as ����- �' 	,b.��ʱ��-isnull(a.���ѿ�ʱ,0) as ��ʱ� �
 	,b.��ʱ��� � 	,b.��ʱ�� as ��׼��ʱ��� � 	from ѧ��������Ϣ a�� �� 		inner join �γ��շѱ� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.�༶����=b.�༶�����> �8 		inner join ѧ��� c on a.У��=c.У�� and a.ѧ��=c.ѧ��� � 	where a.У��=@У���  � 		and a.ѧ�����=@ѧ������7 �1 		and ISNULL(a.������ʱ,0)-isnull(a.���ѿ�ʱ,0)>0� � 		and ISNULL(�ر�,0)=0� � � F�
 � S� �� � T� �C��]�� %�C �	  � � 
����, ��C� ��ȡѧ����Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F�  �^ r�� ��Ŀ��ϸ� � � � � � � o�� ��� ��� ��� ��� ��� ��� ��� �� F�
 � #)� ��  � � �
 ��  � � U  THIS	 OTEXTXSBH VALUE CXQ CXN CXSBH OCOMBOXQ DISPLAYVALUE OCHECKCLEAR CSQL ��Ŀ��ϸ CCURSOR
 SELECTDATA ѧ�� �꼶 ��Ŀ ��� ��ʱ ��ʱ��
 ��׼��ʱ�� GRID1 REFRESH REFRESHTOTAL=
 ��  � � F� � �� � T� �CO�� }(� ��C� � � ��� }(� ��C� � ��� }(�
 ��C� �	 � ��� ��| �	 #�� �� ��� � ��
 ��  � � T�  � �� �� T�  � �� �� T�  � ��
 ��" T�  � � �C�  � �  � � T�� %��  � � ��� T�  � � �C�
 � T�� �6� T�  � � �C�
 �  � � T�� � U  THIS
 REFRESHZKL ��Ŀ��ϸ NRECNO ��ʱ
 ��׼��ʱ�� NSUM �̲ķ� NJCF ��ʱ�� NSJSUM CLS
 NTOTAL_KSF NSJTOTAL
 OTEXTTOTAL VALUE OCHECKCLEAR	 OTEXTSSJE� %��  � 
��Q �8 %�C� �Ƿ�������浱ǰ�վݣ��!� ϵͳ��ʾ�x���M � B� � � ��C��  � � �� T�  � � ��  �� T�  � � ��  �� T�  � � ��  �� T�  � � ��  �� T�  �	 � ��  �� T�  �
 � �� �� T�  � � �� �� T�  � � �� �� T�  � ��        �� T�  � � �a�� T�  � � �-�� T�  � � �-�� T�  � � �-�� T�  � � �a�� T�  � � �a�� F� � S� ��  � � � T�  � � � �a�� T�  � � � �a�� T�  � � � �a�� T�  � � � �a�� T�  � � � �a�� T�  � � � �a�� T�  � �a�� T�  � ���� T� �  � �a�� T� �! � �-�� T� �" � �-�� T�  �# � �-�� T�  �# � �a�� ��C�  �$ � Click�� U%  THIS BSAVE SHAPE1 ZORDER OTEXTDH VALUE	 OTEXTXSBH	 OTEXTXSXM OTEXTNJ OEDITREMARK
 OTEXTTOTAL	 OTEXTSSJE OTEXTDJQ NJCF OCMDSELECTKM ENABLED OCHECKXJ OCHECKSK	 OCHECKDJQ OCMDCHANGENAME OCMDCHANGEGRADE ��Ŀ��ϸ GRID1 REFRESH COLUMNNJ COLUMNKM COLUMNBB COLUMNKS	 COLUMNJCF COLUMNFB NZKL THISFORM OCMDSAVE	 OCMDPRINT OCMDZF OCHECKCLEAR OCMDSELECTSTUDENT� T�  � � �-�� T�  � � �-�� %�C�  � � ���g �, ��C� ѧ����Ų���Ϊ�գ��@� ϵͳ��ʾ�x�� B� �K �� � � �	 �
 � � � � � � � � � � � � � � T� ��  � � �� T� ��  � � �� T� ��  � � �� T�
 �C�  � � � _�� T� �C�  � � ��� T� ��  � � �� T� ��  � � �� T� ��  �  � �� T� ��  �! � �� ��" � %��  �# � ���� T�" ���� ���( T�" ��      �?� �  � �  �# �� � T� ��  �$ � �� %��  �% � � ��� T� ��  �% � �� T� �� �� �6� T� �� �� T� ��  �% � �� � %��  �& � � ��q� T� ��  �& � �� T� �� �� ��� T� �� �� T� ��  �& � �� � F�' �9 o� ��Ŀ��ϸ��( ��C�) �* ���Q�+ ���( ���� ѧ������ F�, � %�CN���d� -��+ � �� %�C4��`�J ��C�0 �շѶ���һ������ʱ�����м����շѽ���Ӧ�����㣡�@� ϵͳ��ʾ�x�� Q� B� � � %�CN� ����0 ��C� ����ָ��һ���շѼ��ȣ��@� ϵͳ��ʾ�x�� Q� B� � Q�! %�� � � � � � ���@ ��C�& �ֽ�ˢ���ʹ���ȯ�ϼƲ�����ʵ�ս��@� ϵͳ��ʾ�x�� B� �, %�� � � � � � C�- � � �	����F ��C�, ����ϼƽ�����ʵ�ս��Ϊ�㣬����ע��ԭ���@� ϵͳ��ʾ�x�� ��- � �. � B� � %�C� �����( ��C� ѧ�����Ϊ�գ��@� ϵͳ��ʾ�x�� B� � T� ��  �/ � �� %�C� ���5� T� �C� �ɷѵ����0 �� T�  �/ � �� �� � ��1 �2 � T�2 ��  ��
 M(�1 `�� � BEGIN TRANSACTION�B �< IF exists(select * from ѧ���ɷѱ� where �ɷѵ���='<<cDH>>')� � BEGIN�- �' 	raiserror('{b}�˵����Ѵ��ڣ�{e}',18,1)� �	 	ROLLBACK� � 	RETURN�	 � end�
 � ELSE� � begin�� �� 	INSERT INTO ѧ���ɷѱ�(�ɷѵ���, ��Ʊ����, У��, ѧ�����, ѧ������, �꼶, Remark, ʵ�ս��, �ϼƽ��,��Ʊ��,����ȯ,�̲ķ�,�ֽ�,ˢ��,�ֽ��˷�,ˢ���˷�)�� �� 		values ('<<cDH>>','<<cRQ>>','<<cXQ>>','<<cXSBH>>','<<cXSXM>>','<<cNJ>>','<<cRemark>>',<<nSSJE>>,<<nHJJE>>,'<<cKPR>>',<<nDJQ>>,<<this.nJCF>>,<<nXJJE>>,<<nSKJE>>,<<nXJTF>>,<<nSKTF>>)� � 	IF @@error<>0� � 	BEGIN� �
 		ROLLBACK� � 		RETURN�
 � 	END�1 �+ 	exec WiseMis_SetNewId '�ɷѵ���','<<cDH>>'� � 	IF @@error<>0� � 	BEGIN� �
 		ROLLBACK� � 		RETURN�
 � 	END�	 � END� � DECLARE @��� varchar(50)� � F�' � %�CN� ���� � � ~���� T�2 ��2 C� C�
 C�� insert into ѧ���ɷѱ���ϸ(�ɷѵ���,У��,ѧ��,�꼶,�γ�����,�༶����,ѧ�����,��ʱ��,��ʱ��,�̲ķ�,��ע) values ('<<cDH>>','<<cXQ>>','<<ALLTRIM(ѧ��)>>','<<ALLTRIM(�꼶)>>','<<ALLTRIM(��Ŀ)>>','<<ALLTRIM(���)>>',����u T�2 ��2 C�a '<<cXSBH>>',<<NVL(��ʱ,0)>>,<<NVL(��ʱ��,0)*nZKL>>,<<NVL(�̲ķ�,0)>>,'<<ALLTRIM(NVL(�ְ�,[]))>>')����* T�2 ��2 C� C�
 � if @@error<>0��" T�2 ��2 C� C�
 � begin��' T�2 ��2 C� C�
 �
 		rollback��% T�2 ��2 C� C�
 � 		return��  T�2 ��2 C� C�
 � end�� %�CC�3 �  ҡ
����� T�2 ��2 C� C�
 C�� if not exists(select * from ѧ���γ̱� where ѧ�����='<<cXSBH>>' and У��='<<cXQ>>' and ѧ��='<<ALLTRIM(ѧ��)>>' and �꼶='<<ALLTRIM(�꼶)>>' and �γ�����='<<ALLTRIM(��Ŀ)>>' and ���='<<ALLTRIM(NVL(�ְ�,[]))>>')����" T�2 ��2 C� C�
 � begin��� T�2 ��2 C� C�
 Cٶ 		insert into ѧ���γ̱�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���) values ('<<cXSBH>>','<<cXQ>>','<<ALLTRIM(ѧ��)>>','<<ALLTRIM(�꼶)>>','<<ALLTRIM(��Ŀ)>>','<<ALLTRIM(NVL(�ְ�,[]))>>')����, T�2 ��2 C� C�
 � 		if @@error<>0��$ T�2 ��2 C� C�
 � 		begin��( T�2 ��2 C� C�
 � 			rollback��& T�2 ��2 C� C�
 �	 			return��" T�2 ��2 C� C�
 � 		end��  T�2 ��2 C� C�
 � end�� � �3 T�1 ��1 C� C�
 �2 C� C�
 � commit�� %�C �1 �4 ��.�$ ��C�
 ����ɹ����@� ϵͳ��ʾ�x�� T�- �5 � �-�� ��C� �  �6 �7 �� �^�$ ��C�
 ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � T�  �8 �a��
 ��  �9 � T�  �: � �a�� T�  �; � �a�� U<  THIS OCMDCHANGENAME ENABLED OCMDCHANGEGRADE	 OTEXTXSBH VALUE CXQ CXSBH CXSXM CJSFS CRQ CDH CREMARK NHJJE NSSJE CNJ CKPR CSFFS NDJQ NJCF NXJJE NSKJE NXJTF NSKTF OCOMBOXQ DISPLAYVALUE	 OTEXTXSXM ODATE OBJECT OEDITREMARK
 OTEXTTOTAL	 OTEXTSSJE OTEXTNJ OTEXTKPR NZKL NSJTOTAL OTEXTDJQ OTEXTXJ OTEXTSK ��Ŀ��ϸ ѧ�� ��ʱ
 ��׼��ʱ�� ��� ѧ����� THISFORM SETFOCUS OTEXTDH GETNEWID CSQL
 CSQLDETAIL �ְ� EXECUTE OCMDSAVE SHAPE1 ZORDER BSAVE PRINTSJ	 OCMDPRINT OCMDZF3  ��  � T� � ���  �� T� � � ���  
�� U  VNEWVAL THIS BSAVE
 OLABELSAVE VISIBLEd %�C�  � � ��� � B� � �� � � T� �C�  � � ��� T� �C�  � � ���S T�  � �CCC�/ select dbo.ѧ���ۿ���('<<cXSBH>>','<<cXQ>>','')��� �      �?��� %��  �	 � ��� � B� � ��
 � � � � T�
 �C��]�� T� �C��]�� F�  �B SELECT ѧ�� FROM ��Ŀ��ϸ GROUP BY ѧ�� INTO CURSOR &cXNCursor

 F�� �� T� �C� N��D T� �CCC�# select dbo.�༾���ۿ�(<<nXNCount>>)��� �      �?��� ��C � � �� %��  � ����� T� ��      �?�� � F�  �_ SELECT ѧ��,�꼶,COUNT(*) as ��Ŀ�� FROM ��Ŀ��ϸ GROUP BY ѧ��,�꼶 INTO CURSOR &cZKCursor

 F��
 �� ~�O� �� � � � T� �C� ��� T� �C� ��� T� �� �� �� � �Y T� �C�I select dbo.�շ��ۿ�('<<cXSBH>>','<<cXQ>>','<<cXN1>>','<<cNJ1>>',<<nQty>>)���� T� �CC � � �      �?��� F� �3 >� ��� � � ��C� �C� �� C� �C� �	��
 F��
 �� � ��C �
 � �� U  THIS	 OTEXTXSBH VALUE CXSBH CXQ OCOMBOXQ DISPLAYVALUE NZKL GETVALUE OCHECKCLEAR	 CZKCURSOR	 CXNCURSOR	 NTOTALZKL NXNCOUNT
 CLOSEALIAS CXN1 CNJ1 NQTY ѧ�� �꼶 ��Ŀ�� CSQL ��Ŀ��ϸ ��ʱ��
 ��׼��ʱ�� FOR]  ��  � T� � ���  �� %���  ���= � T� � � �a�� �V � T� � � �-�� � U  VNEWVAL THIS NZKL	 OLABELVIP VISIBLEt ��  � T�  �� � � �� �� �
 M(� `�� �	 	select *�I �C 	,dbo.WiseMis_GetReportItem('ѧ���ɷѱ�','�վ�','Footer') as Footer� � 	from ѧ���շ���ͼ� � 	where �ɷѵ���='<<cDH>>'� � �� � T� �C��]�� %�C �  � � 
���( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B� �
 F�� �� %�CN� ��;� � � ?� D:\WiseMis3\�վ�(!�
 �� �	 � ��C � �
 �� U  CDH THISFORM OTEXTDH VALUE CSQL CCURSOR
 SELECTDATA D THIS CLS
 CLOSEALIAS  ��  � � � U  CXQ CXN CXSBHw ��  � � T�  �C� � � ��� T� �C� � � ��� �� � �
 M(� `��G �A declare @ѧ����� varchar(50),@У�� varchar(50),@ѧ�� varchar(50)� � set @ѧ�����='<<cXSBH>>'� � set @У��='<<cXQ>>'� �  �� �� select a.ѧ��,b.��ʼ����,SUM((ISNULL(a.������ʱ,0)-ISNULL(a.���ѿ�ʱ,0))*dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����)) as �����P �J from ѧ��������Ϣ a inner join ѧ��� b on a.У��=b.У�� and a.ѧ��=b.ѧ���  � where a.ѧ�����=@ѧ������ � and a.У��=@У���  � and isnull(b.��ǰѧ��,0)=0�4 �. and isnull(a.���ѿ�ʱ,0)<>isnull(a.������ʱ,0)� � and ISNULL(a.�ر�,0)=0�  � group by a.ѧ��,b.��ʼ������ �� having SUM((ISNULL(a.������ʱ,0)-ISNULL(a.���ѿ�ʱ,0))*dbo.ѧ����ʱ��(a.ѧ�����,a.У��,a.ѧ��,a.�꼶,a.�γ�����,a.�༶����))<>0� � order by b.��ʼ����� � T� �C��]�� %�C �  � �	 
����8 ��C� ��ѯ��ǰ����Ӧ��Ӧ����Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � ��
 �% T�
 �� ��ǰ����δ�����������£���
 F�� �� %�CN� ���� ��C � � �� B� � ~�S�c T�
 ��
 C� C�
 C� ��     CC� � �_� Ԫ�     CC� � �� �
 � Ӧ��� � Ӧ��6�� � ��C � � �� ��C�
 �@� δ�������ʾ�x�� �� �
 M(� `��5 �/ DECLARE @ѧ����� varchar(50),@У�� varchar(50)� � SET @ѧ�����='<<cXSBH>>'� � SET @У��='<<cXQ>>'� �  �~ �x IF exists(select * from ѧ��������Ϣ where ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)>ISNULL(������ʱ,0)) � �y 	AND exists(select * from ѧ��������Ϣ where ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)<ISNULL(������ʱ,0))� �	 	SELECT 1�
 � ELSE� �	 	SELECT 0� � %�C � � ���W� T� � � �a�� �p� T� � � �-�� � U  CXSBH CXQ THIS	 OTEXTXSBH VALUE OCOMBOXQ DISPLAYVALUE CSQL CCURSOR
 SELECTDATA CMESSAGE
 CLOSEALIAS ѧ�� ���� GETVALUE OCMDHXKS ENABLEDH  T�  � � � �C$�� T�  � �C��]�� T�  � �C��]��
 ��  � � U  THIS ODATE OBJECT VALUE CPRICECURSOR
 CSETCURSOR	 REFRESHXQ�  F�  �� h�� ��Ŀ��ϸ� � C��2��� � C��2��� � C��2��� � C��2��� � N�������� � N�������� � N�������� � N��������	 � C��2��� U
  ��Ŀ��ϸ ѧ�� �꼶 ��Ŀ ��� ��ʱ ��ʱ��
 ��׼��ʱ�� �̲ķ� �ְ�8  ��C� ��Ŀ��ϸ�  �� ��C� � �  �� ��C� � �  �� U 
 CLOSEALIAS THIS CPRICECURSOR
 CSETCURSOR0  %��  � 
��) �
 ��  � � T�  � �a�� � U  THIS BINIT	 CREATENEW	 refreshxq,     �� refreshkmmxw    �� refreshtotali	    ��	 createnewJ    �� saved    �� bsave_assign
     ��
 refreshzkll     �� nzkl_assign�$    �� printsj=%    �� checkunfinish	'    �� checkstudent0'    �� InitA.    �� Load�.    �� Unload�/    �� ActivateH0    ��1 � � �q�q A � � QA � 2 QA A � 112q � ��a A� ���q�������A � � ��a A� ��������q�A A s A r q�A A � �r Q � � 2 � r q � �Q�� � � A � "3�� �A 3 �A A A 223111111�r A � AAAAAA� r2 R�A A �111�R1111q A� � �A 2q1� � � 1A q1� � � 1A r �q � � �A A A A A A A A A A �a� A A � �A A 2� �1A � � � q!� �� � � � � �	�A� � � A� � � � �A r Q A � QQ�!qQSQ!a�A�a!A A 2"A1� AA A � � 3 q "q2 QA A � QQ23A A 3� !� � A� AQA � �� � � � � � � ��q 1� A � 2 q "1� A 2 q 1q � � ���A q q�A A � Q A �� � 2 � 2 � QQ� � q��a �	aA�a�A q�A A q Q� � A A � 1A � �q � Q��a ��� � � A b� A 2 Q21� 4 � �3 Q2 � � A 1                       j        �  	     P   @	  �  \   f   �  �  {   �     }"  �     �"  $#  K    E#  :)  Q  B  \)  *  �  J  2*  ,  �  a  1,  D,  �  c  g,  �3  �  �  �3  4  �  �  24  �4  �  �  5  i5  �  �  �5  �5  �   )   -6                       _memberdata XML Metadata for customizable properties
bsave �Ƿ��ѱ���
nzkl �ۿ���
ckxkm ��ѡ��Ŀ
njcf �̲ķ�
ntotal_ksf ��ʱ�Ѻϼ�
binit
cpricecursor �շѱ�׼�α�
csetcursor �ײ��ۿ��α�
ntfzkl �˷��ۿ���
nsjtotal ʵ���ܽ��
*refreshxq ˢ��У��
*refreshkmmx ˢ�¿�Ŀ��ϸ
*refreshtotal ˢ�ºϼƽ��
*createnew �����¼�¼
*save ����
*bsave_assign 
*refreshzkl ˢ���ۿ���
*nzkl_assign 
*refreshbjlx ˢ�°༶����
*printsj ��ӡ�վ�
*checkunfinish �����ǰ����δ������
*checkstudent ���ѧ����Ϣ
      shape      shape      Shape1      Form1      �Top = 11
Left = 24
Height = 475
Width = 948
BackStyle = 0
BorderStyle = 0
BorderWidth = 0
FillStyle = 1
Name = "Shape1"
      lPROCEDURE Click
IF thisform.bSave
	MESSAGEBOX("�˵��ѱ��棬�뿪�µ���",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ���    �   �                         �(   %   �       �      �           �  U  G  %��  � ��@ �0 ��C� �˵��ѱ��棬�뿪�µ����@� ϵͳ��ʾ�x�� � U  THISFORM BSAVE Click,     ��1 A 1                       a       )   �                         label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "У����"
Height = 21
Left = 53
Top = 63
Width = 41
Name = "Label1"
      combobox      combobox      oComboXQ      Form1      �FontName = "΢���ź�"
FontSize = 10
Anchor = 3
Value = 1
Height = 26
Left = 101
Style = 2
Top = 61
Width = 141
Name = "oComboXQ"
      jPROCEDURE InteractiveChange
thisform.bSave=.f.

SELECT ��Ŀ��ϸ
ZAP 
thisform.RefreshTotal
ENDPROC
     ���    �   �                         u   %          �      �           �  U  &  T�  � �-�� F� � S�
 ��  � � U  THISFORM BSAVE ��Ŀ��ϸ REFRESHTOTAL InteractiveChange,     ��1 � r A � 1                       _       )   �                         label      label      Label3      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "ѧ�ţ�"
Height = 21
Left = 53
Top = 27
Width = 41
Name = "Label3"
      textbox      textbox      	oTextXSBH      Form1      xFontName = "΢���ź�"
FontSize = 10
Enabled = .F.
Height = 25
Left = 100
Top = 24
Width = 86
Name = "oTextXSBH"
      label      label      Label4      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "������"
Height = 21
Left = 308
Top = 28
Width = 41
Name = "Label4"
      textbox      textbox      	oTextXSXM      Form1      xFontName = "΢���ź�"
FontSize = 10
Enabled = .F.
Height = 25
Left = 357
Top = 25
Width = 96
Name = "oTextXSXM"
      grid      grid      Grid1      Form1     �ColumnCount = 12
FontName = "΢���ź�"
FontSize = 10
DeleteMark = .F.
HeaderHeight = 29
Height = 264
Left = 28
Panel = 1
RecordMark = .F.
RecordSource = "��Ŀ��ϸ"
RowHeight = 28
SplitBar = .F.
Top = 96
Width = 934
Name = "Grid1"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.Alignment = 2
Column1.ColumnOrder = 3
Column1.ControlSource = "��Ŀ"
Column1.Enabled = .F.
Column1.Width = 87
Column1.Name = "ColumnKM"
Column2.FontName = "΢���ź�"
Column2.FontSize = 10
Column2.Alignment = 2
Column2.ColumnOrder = 4
Column2.ControlSource = "���"
Column2.Enabled = .F.
Column2.Width = 76
Column2.Name = "ColumnBB"
Column3.FontName = "΢���ź�"
Column3.FontSize = 10
Column3.Alignment = 2
Column3.ColumnOrder = 5
Column3.ControlSource = "��ʱ"
Column3.Width = 66
Column3.DynamicForeColor = "iif(��ʱ>=0,rgb(0,0,255),rgb(255,0,0))"
Column3.ForeColor = 0,0,255
Column3.Name = "ColumnKS"
Column4.FontName = "΢���ź�"
Column4.FontSize = 10
Column4.Alignment = 2
Column4.ColumnOrder = 7
Column4.ControlSource = "��ʱ��"
Column4.Enabled = .F.
Column4.Width = 68
Column4.DynamicBackColor = "rgb(240,240,240)"
Column4.DynamicForeColor = "iif(��ʱ��<>��׼��ʱ��,rgb(255,0,0),rgb(0,0,0))"
Column4.Name = "ColumnKSF"
Column5.FontName = "΢���ź�"
Column5.FontSize = 10
Column5.Alignment = 2
Column5.ColumnOrder = 10
Column5.ControlSource = "round(nvl(��ʱ*��ʱ��,0)+nvl(�̲ķ�,0),2)"
Column5.Enabled = .F.
Column5.Width = 74
Column5.DynamicBackColor = "rgb(240,240,240)"
Column5.DynamicForeColor = "iif(��ʱ>=0,rgb(0,0,255),rgb(255,0,0))"
Column5.Name = "ColumnJE"
Column6.FontName = "΢���ź�"
Column6.FontSize = 10
Column6.ColumnOrder = 12
Column6.Width = 56
Column6.Sparse = .F.
Column6.Name = "ColumnCZ"
Column7.FontName = "΢���ź�"
Column7.FontSize = 10
Column7.Alignment = 2
Column7.ColumnOrder = 2
Column7.ControlSource = "�꼶"
Column7.Enabled = .F.
Column7.Width = 74
Column7.Name = "ColumnNJ"
Column8.FontName = "΢���ź�"
Column8.FontSize = 10
Column8.ColumnOrder = 8
Column8.ControlSource = "�̲ķ�"
Column8.Width = 57
Column8.Name = "ColumnJCF"
Column9.FontName = "΢���ź�"
Column9.FontSize = 10
Column9.ColumnOrder = 11
Column9.ControlSource = "�ְ�"
Column9.Width = 101
Column9.Name = "ColumnFB"
Column10.FontName = "΢���ź�"
Column10.FontSize = 10
Column10.ColumnOrder = 6
Column10.ControlSource = "��׼��ʱ��"
Column10.Enabled = .F.
Column10.Width = 71
Column10.DynamicBackColor = "rgb(240,240,240)"
Column10.Name = "Column1"
Column11.FontName = "΢���ź�"
Column11.FontSize = 10
Column11.ColumnOrder = 9
Column11.ControlSource = "round(nvl(��ʱ*��׼��ʱ��,0)+nvl(�̲ķ�,0),2)"
Column11.Enabled = .F.
Column11.Width = 78
Column11.DynamicBackColor = "rgb(240,240,240)"
Column11.Name = "Column2"
Column12.FontName = "΢���ź�"
Column12.FontSize = 10
Column12.ColumnOrder = 1
Column12.ControlSource = "ѧ��"
Column12.Enabled = .F.
Column12.Width = 91
Column12.Name = "ColumnXN"
      header      header      Header1      Form1.Grid1.ColumnKM      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��Ŀ"
Name = "Header1"
      header      header      Header1      Form1.Grid1.ColumnBB      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "���"
Name = "Header1"
      header      header      Header1      Form1.Grid1.ColumnKS      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnKS      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
BorderStyle = 0
Margin = 0
ForeColor = 0,0,255
BackColor = 255,255,255
Name = "Text1"
      �PROCEDURE Valid
*!*	SELECT ��Ŀ��ϸ
*!*	REPLACE ��� WITH ��ʱ*��ʱ��
*!*	thisform.Grid1.Refresh
thisform.RefreshTotal
ENDPROC
PROCEDURE InteractiveChange
thisform.bSave=.f.
ENDPROC
     !���                              ��   %   {       �      �           �  U   
 ��  � � U  THISFORM REFRESHTOTAL  T�  � �-�� U  THISFORM BSAVE Valid,     �� InteractiveChangeU     ��1 � 2 � 1                       z         �   �       )                           header      header      Header1      Form1.Grid1.ColumnKSF      _FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "ʵ�ʿ�ʱ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnKSF      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
BorderStyle = 0
Enabled = .F.
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnJE      ]FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "ʵ�ʽ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnJE      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
BorderStyle = 0
Enabled = .F.
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnCZ      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "����"
Name = "Header1"
      commandbutton      commandbutton      Command1      Form1.Grid1.ColumnCZ      �Top = 47
Left = 49
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "ɾ��"
TabStop = .F.
SpecialEffect = 2
ForeColor = 0,0,255
BackColor = 255,255,255
Name = "Command1"
      �PROCEDURE Click
SELECT ��Ŀ��ϸ
DELETE 
thisform.Grid1.Refresh
thisform.RefreshTotal
thisform.oTextSSJE.SetFocus
ENDPROC
     (���                              .�   %   �       �      �           �  U  2  F�  � � �� � � �
 �� � � �� � � � U  ��Ŀ��ϸ THISFORM GRID1 REFRESH REFRESHTOTAL	 OTEXTSSJE SETFOCUS Click,     ��1 q A � � � 1                       u       )                           header      header      Header1      Form1.Grid1.ColumnNJ      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�꼶"
Name = "Header1"
      header      header      Header1      Form1.Grid1.ColumnJCF      [FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�̲ķ�"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnJCF      hBorderStyle = 0
Enabled = .T.
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      kPROCEDURE InteractiveChange
thisform.bSave=.f.
ENDPROC
PROCEDURE Valid
thisform.RefreshTotal
ENDPROC
     !���                              ��   %   {       �      �           �  U    T�  � �-�� U  THISFORM BSAVE 
 ��  � � U  THISFORM REFRESHTOTAL InteractiveChange,     �� ValidR     ��1 � 2 � 1                       /         K   `       )                           header      header      Header1      Form1.Grid1.ColumnFB      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�ְ�"
Name = "Header1"
      combobox      combobox      Combo1      Form1.Grid1.ColumnFB      KHeight = 24
Left = 21
Style = 2
Top = 47
Width = 100
Name = "Combo1"
     �PROCEDURE When
this.Clear

LOCAL cSQL,cXQ,cXN,cNJ,cKC,cCursor,cBJLX
cXQ=thisform.oComboXQ.DisplayValue

SELECT ��Ŀ��ϸ
cXN=ALLTRIM(ѧ��)
cKC=ALLTRIM(��Ŀ)
cNJ=ALLTRIM(�꼶)
cBJLX=ALLTRIM(���)

IF EMPTY(NVL(cKC,""))
	RETURN 
ENDIF 

cSQL=TEXTMERGE("select ��� from �༶�γ̱� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>' and (ISNULL(��������,0)-ISNULL(��������,0)>0 or ISNULL(��������,0)=0) order by ���")
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 

this.AddItem("")
SELECT (cCursor)
SCAN 
	this.AddItem(ALLTRIM(���))
ENDSCAN 
=CloseAlias(cCursor)

ENDPROC
     ����    }  }                        m�   %   �      4               �  U  (
 ��  � � �� � � � � � � � T� ��	 �
 � �� F� � T� �C� ��� T� �C� ��� T� �C� ��� T� �C� ��� %�CC� �  ҡ��� � B� �� T� �C�� select ��� from �༶�γ̱� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>' and (ISNULL(��������,0)-ISNULL(��������,0)>0 or ISNULL(��������,0)=0) order by ������� T� �C��]�� %�C �  � � 
����( ��C� ��ȡ���ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� � ��C�  �  � ��
 F�� �� ~�� ��CC� ��  � �� � ��C � � �� U  THIS CLEAR CSQL CXQ CXN CNJ CKC CCURSOR CBJLX THISFORM OCOMBOXQ DISPLAYVALUE ��Ŀ��ϸ ѧ�� ��Ŀ �꼶 ���
 SELECTDATA ADDITEM
 CLOSEALIAS When,     ��1 � �1r � � � � BA A �q�q A � � !A � 2                       �      )   }                        header      header      Header1      Form1.Grid1.Column1      _FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��׼��ʱ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column1      hBorderStyle = 0
Enabled = .F.
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.Column2      ]FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�ϼƽ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column2      hBorderStyle = 0
Enabled = .F.
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnXN      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "����"
Name = "Header1"
      label      label      Label5      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "�꼶��"
Height = 21
Left = 550
Top = 28
Width = 41
Name = "Label5"
      textbox      textbox      oTextNJ      Form1      vFontName = "΢���ź�"
FontSize = 10
Enabled = .F.
Height = 25
Left = 594
Top = 25
Width = 72
Name = "oTextNJ"
      commandbutton      commandbutton      oCmdRefresh      Form1      �Top = 61
Left = 396
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Picture = ..\..\images\system\sc_refresh.bmp
Caption = "���¶�ȡ"
ToolTipText = "���¶�ȡ"
SpecialEffect = 2
PicturePosition = 1
Name = "oCmdRefresh"
      aPROCEDURE Click
thisform.RefreshKMMX
thisform.bSave=.f.
thisform.oTextSSJE.SetFocus
ENDPROC
     ���    �   �                         "R   %   �       �      �           �  U  ( 
 ��  � � T�  � �-�� ��  � � � U  THISFORM REFRESHKMMX BSAVE	 OTEXTSSJE SETFOCUS Click,     ��1 � � � 1                       V       )   �                         label      label      Label6      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "��ע��"
Height = 21
Left = 31
Top = 369
Width = 41
Name = "Label6"
      editbox      editbox      oEditRemark      Form1      FHeight = 46
Left = 79
Top = 366
Width = 211
Name = "oEditRemark"
      :PROCEDURE InteractiveChange
thisform.bSave=.f.
ENDPROC
      ����    �   �                         ��   %   R       s      m           �  U    T�  � �-�� U  THISFORM BSAVE InteractiveChange,     ��1 � 1                       /       )   �                         label      label      Label9      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "�ϼƽ�"
Height = 21
Left = 304
Top = 378
Width = 67
Name = "Label9"
      label      label      Label10      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "ʵ�ս�"
Height = 21
Left = 601
Top = 377
Width = 67
Name = "Label10"
      textbox      textbox      
oTextTotal      Form1      zFontName = "΢���ź�"
FontSize = 10
Enabled = .F.
Height = 25
Left = 377
Top = 376
Width = 72
Name = "oTextTotal"
      textbox      textbox      	oTextSSJE      Form1      �FontName = "΢���ź�"
FontSize = 10
Alignment = 3
Value = 0
Height = 25
Left = 671
SelectOnEntry = .T.
Top = 372
Width = 96
Name = "oTextSSJE"
     PROCEDURE InteractiveChange
thisform.bSave=.f.
thisform.oCheckSK.Value=.f.
thisform.oCheckXJ.Value=.f.
IF this.Value>=0
	thisform.oCheckXJ.Caption="�ֽ�"
	thisform.oCheckXJ.ForeColor=RGB(0,0,0)
	thisform.oCheckSK.Caption="ˢ��"
	thisform.oCheckSK.ForeColor=RGB(0,0,0)
ELSE
	thisform.oCheckXJ.Caption="�ֽ��˷�"
	thisform.oCheckXJ.ForeColor=RGB(0,0,255)
	thisform.oCheckSK.Caption="ˢ���˷�"
	thisform.oCheckSK.ForeColor=RGB(0,0,255)
ENDIF 
ENDPROC
PROCEDURE ProgrammaticChange
this.InteractiveChange
ENDPROC
     ����    {  {                        r�   %   �      "     �          �  U  ' T�  � �-�� T�  � � �-�� T�  � � �-�� %�� � � ��� � T�  � � �� �ֽ��� T�  � � �C� � � �^�� T�  � � �� ˢ���� T�  � � �C� � � �^�� � � T�  � � �� �ֽ��˷��� T�  � � �C� � ���^�� T�  � � �� ˢ���˷��� T�  � � �C� � ���^�� � U  THISFORM BSAVE OCHECKSK VALUE OCHECKXJ THIS CAPTION	 FORECOLOR 
 ��  � � U  THIS INTERACTIVECHANGE InteractiveChange,     �� ProgrammaticChange�    ��1 � Aq�q�� ����A 2 � 1                       �        �        )   {                        line      line      Line1      Form1      ?Height = 0
Left = 15
Top = 424
Width = 883
Name = "Line1"
      commandbutton      commandbutton      oCmdSave      Form1      {Top = 496
Left = 364
Height = 39
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "����"
Name = "oCmdSave"
      )PROCEDURE Click
thisform.Save
ENDPROC
      ����    �   �                         �   %   M       b      \           �  U   
 ��  � � U  THISFORM SAVE Click,     ��1 � 1                              )   �                         commandbutton      commandbutton      	oCmdPrint      Form1      Top = 496
Left = 28
Height = 39
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "���´�ӡ"
Name = "oCmdPrint"
      ,PROCEDURE Click
thisform.PrintSJ
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM PRINTSJ Click,     ��1 � 1                       !       )   �                         commandbutton      commandbutton      	oCmdClose      Form1      �Top = 496
Left = 786
Height = 39
Width = 84
FontName = "΢���ź�"
FontSize = 10
Cancel = .T.
Caption = "�ر�"
Name = "oCmdClose"
      �PROCEDURE Click
IF !thisform.bSave
	IF MESSAGEBOX("�Ƿ�������浱ǰ�վݣ�",1+32,"ϵͳ��ʾ")<>1
		RETURN 
	ENDIF 
ENDIF 

thisform.Release
ENDPROC
     -���                              ~)   %   �       �      �           �  U  b  %��  � 
��Q �8 %�C� �Ƿ�������浱ǰ�վݣ��!� ϵͳ��ʾ�x���M � B� � �
 ��  � � U  THISFORM BSAVE RELEASE Click,     ��1 �A A A � 1                       �       )                           commandbutton      commandbutton      oCmdSelectStudent      Form1      �Top = 24
Left = 186
Height = 27
Width = 29
Picture = ..\..\images\system\search.bmp
Caption = "��"
ToolTipText = "��ѯѧԱ"
SpecialEffect = 2
PicturePosition = 14
Name = "oCmdSelectStudent"
     	PROCEDURE Click
LOCAL cXQ
cXQ=ALLTRIM(thisform.oComboXQ.DisplayValue)

LOCAL cXSBH,cSQL
cSQL="select ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰 from ��ѧ�ǼǱ� where У��='"+cXQ+"' order by ѧ�����"
DO FORM frm_f7 WITH null,cSQL,"ѧ�����" TO cXSBH

IF EMPTY(NVL(cXSBH,""))
	thisform.oTextXSBH.Value=""
	thisform.oTextXSXM.Value=""
	thisform.oTextNJ.Value=""
	RETURN 
ENDIF 

thisform.oTextXSBH.Value=cXSBH
thisform.oTextXSXM.Value=GetValue("select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='"+cXSBH+"'")
LOCAL cNJ
cNJ=GetValue("select �꼶 from ��ѧ�ǼǱ� where ѧ�����='"+cXSBH+"'")
IF EMPTY(NVL(cNJ,""))
	DO FORM frm_f7 WITH null,"select �꼶 from �꼶�� order by ���","�꼶" TO cNJ
	IF !EMPTY(NVL(cNJ,""))
		=Execute("update ��ѧ�ǼǱ� set �꼶='"+cNJ+"' where ѧ�����='"+cXSBH+"'")
	ENDIF 
ENDIF 
IF EMPTY(NVL(cNJ,""))
	MESSAGEBOX("��ά����ѧ���꼶��",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

*!*���绰����
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * from ��ѧ�ǼǱ� where ѧ�����='<<cXSBH>>' AND ISNULL(ĸ�׵绰,'')='' AND ISNULL(���׵绰,'')='' AND ISNULL(���õ绰,'')='')
	SELECT 1
ELSE 
	SELECT 0
ENDTEXT 
LOCAL cTel1,cTel2
IF GetValue(cSQL)=1
	cTel1=INPUTBOX1("������ĸ�׵绰��","ĸ�׵绰","")
	DO WHILE !INLIST(LEN(cTel1),0,11,8,13,12)	
		MESSAGEBOX("�绰λ�����Ϸ���",0+64,"ϵͳ��ʾ")
		cTel1=INPUTBOX1("������ĸ�׵绰��","ĸ�׵绰","")
	ENDDO
	cTel2=INPUTBOX1("�����븸�׵绰��","���׵绰","")
	DO WHILE !INLIST(LEN(cTel2),0,11,8,13,12)	
		MESSAGEBOX("�绰λ�����Ϸ���",0+64,"ϵͳ��ʾ")
		cTel2=INPUTBOX1("�����븸�׵绰��","���׵绰","")
	ENDDO
		
	IF EMPTY(cTel1) AND EMPTY(cTel2)
		MESSAGEBOX("��ĸ�׵绰Ϊ�գ�",0+64,"ϵͳ��ʾ")
		thisform.oTextXSBH.Value=""
		thisform.oTextXSXM.Value=""
		RETURN 
	ENDIF 
	LOCAL cCYDH
	cCYDH=IIF(EMPTY(cTel1),cTel2,cTel1)
	IF !INLIST(LEN(cCYDH),11,8,13,12)
		MESSAGEBOX("�绰λ�����Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
	=Execute(TEXTMERGE("update ��ѧ�ǼǱ� set ĸ�׵绰='<<cTel1>>',���׵绰='<<cTel2>>',���õ绰='<<cCYDH>>' where ѧ�����='<<cXSBH>>'"))
ENDIF 

thisform.oTextNJ.Value=cNJ

thisform.CheckStudent

thisform.RefreshKMMX
thisform.bSave=.f.
thisform.oTextSSJE.SetFocus

SELECT ��Ŀ��ϸ
IF RECCOUNT()=0
	=RAISEEVENT(thisform.oCmdSelectKM,"Click")
ENDIF 


ENDPROC
     	#���    
	  
	                        �F   %   (      �  E   7          �  U   ��  � T�  �C� � � ��� �� � �} T� ��U select ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰 from ��ѧ�ǼǱ� where У��='�  � ' order by ѧ�������( � frm_f7(� ����� �� ѧ������� %�CC� �  ҡ��� T� � � ��  �� T� �	 � ��  �� T� �
 � ��  �� B� � T� � � �� ��P T� �	 � �C�0 select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='� � '� �� �� �F T� �C�, select �꼶 from ��ѧ�ǼǱ� where ѧ�����='� � '� �� %�CC� �  ҡ����K � frm_f7(� ������% select �꼶 from �꼶�� order by ������ �꼶�� %�CC� �  ҡ
����L ��C� update ��ѧ�ǼǱ� set �꼶='� � ' where ѧ�����='� � '� �� � � %�CC� �  ҡ����, ��C� ��ά����ѧ���꼶���@� ϵͳ��ʾ�x�� B� � �� �
 M(� `��� �� IF exists(select * from ��ѧ�ǼǱ� where ѧ�����='<<cXSBH>>' AND ISNULL(ĸ�׵绰,'')='' AND ISNULL(���׵绰,'')='' AND ISNULL(���õ绰,'')='')� �	 	SELECT 1� � ELSE � �	 	SELECT 0� � �� � � %�C � � �����/ T� �C� ������ĸ�׵绰��� ĸ�׵绰�  � ��" +�CC� >� �����
���* ��C� �绰λ�����Ϸ����@� ϵͳ��ʾ�x��/ T� �C� ������ĸ�׵绰��� ĸ�׵绰�  � �� �/ T� �C� �����븸�׵绰��� ���׵绰�  � ��" +�CC� >� �����
��-�* ��C� �绰λ�����Ϸ����@� ϵͳ��ʾ�x��/ T� �C� �����븸�׵绰��� ���׵绰�  � �� � %�C� �� C� �	����* ��C� ��ĸ�׵绰Ϊ�գ��@� ϵͳ��ʾ�x�� T� � � ��  �� T� �	 � ��  �� B� � �� � T� �CC� �� � � � 6�� %�CC� >�����
���* ��C� �绰λ�����Ϸ����@� ϵͳ��ʾ�x�� B� � ��CC�o update ��ѧ�ǼǱ� set ĸ�׵绰='<<cTel1>>',���׵绰='<<cTel2>>',���õ绰='<<cCYDH>>' where ѧ�����='<<cXSBH>>'��� �� � T� �
 � �� ��
 �� � �
 �� � � T� � �-�� �� � � � F� � %�CN� ��� ��C� � � Click�� � U  CXQ THISFORM OCOMBOXQ DISPLAYVALUE CXSBH CSQL FRM_F7	 OTEXTXSBH VALUE	 OTEXTXSXM OTEXTNJ GETVALUE CNJ EXECUTE CTEL1 CTEL2	 INPUTBOX1 CCYDH CHECKSTUDENT REFRESHKMMX BSAVE	 OTEXTSSJE SETFOCUS ��Ŀ��ϸ OCMDSELECTKM Click,     ��1 q Q� ��B111A A 2q aA�Q�A A A�A A s � Q	� � � A � a�!��A �!��A ��11A A q ���A A �A 2� � � � r qA 3                       	      )   
	                        label      label      Label12      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "��    �ڣ�"
Height = 21
Left = 763
Top = 14
Width = 57
Name = "Label12"
      
olecontrol      
olecontrol      oDate      Form1      @Top = 12
Left = 820
Height = 24
Width = 110
Name = "oDate"
      NPROCEDURE Change
*** ActiveX Control Event ***
thisform.bSave=.f.
ENDPROC
      ����    �   �                         �   %   R       h      b           �  U    T�  � �-�� U  THISFORM BSAVE Change,     ��1 � 1                       C       )   �                        
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               ��f����   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       \        C h a n g e d P r o p s                                         ������������                                                    ��������   �������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������� ć���  �uM�!C4   ^  {  A(       �           ' \                          $   8                       651A8940-87C5-11d1-8BE3-0000F8754DA1                                      �                                                                      A                  �ͫ   |�    ��������`��u    ��  ��                                                                                                                                                                                       +OLEObject = D:\WiseMis3\Libs\mscomct2.ocx
      commandbutton      commandbutton      oCmdNew      Form1      zTop = 496
Left = 122
Height = 39
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "�µ�"
Name = "oCmdNew"
      .PROCEDURE Click
thisform.CreateNew
ENDPROC
      ����    �   �                         D   %   R       g      a           �  U   
 ��  � � U  THISFORM	 CREATENEW Click,     ��1 � 1                       #       )   �                         label      label      Label7      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "��    �ţ�"
Height = 21
Left = 764
Top = 39
Width = 57
Name = "Label7"
      textbox      textbox      oTextDH      Form1      BHeight = 23
Left = 820
Top = 38
Width = 108
Name = "oTextDH"
      label      label      
oLabelSave      Form1      �FontName = "΢���ź�"
FontSize = 11
Anchor = 3
BackStyle = 0
BorderStyle = 1
Caption = "δ����"
Height = 25
Left = 467
Top = 503
Visible = .F.
Width = 60
ForeColor = 255,0,0
Rotation = 360
Name = "oLabelSave"
      label      label      	oLabelVIP      Form1      �AutoSize = .T.
FontBold = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "VIP"
Height = 21
Left = 674
Top = 400
Visible = .F.
Width = 24
ForeColor = 255,0,0
Name = "oLabelVIP"
      commandbutton      commandbutton      oCmdNewStudent      Form1      �Top = 24
Left = 214
Height = 27
Width = 29
Picture = ..\..\images\system\plus1.bmp
Caption = "��"
ToolTipText = "�½�ѧԱ"
SpecialEffect = 2
PicturePosition = 14
Name = "oCmdNewStudent"
     �PROCEDURE Click
LOCAL cXQ
cXQ=thisform.oComboXQ.DisplayValue

LOCAL cMQDH,cFQDH,cCYDH
cCYDH=""
cMQDH=INPUTBOX1("������ĸ�׵绰��","����ѧ��","")
cFQDH=INPUTBOX1("�����븸�׵绰��","����ѧ��","")
IF !EMPTY(cMQDH)
	cCYDH=cMQDH
ENDIF 
IF !EMPTY(cFQDH) AND EMPTY(cMQDH)
	cCYDH=cFQDH
ENDIF
IF !INLIST(LEN(cCYDH),11,8,13,12)
	MESSAGEBOX("�绰λ�����Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cXSXM,cNJ,cJDXX
cXSXM=INPUTBOX1("������ѧ�������������","����ѧ��","")
IF EMPTY(cXSXM)
	RETURN 
ENDIF 

DO FORM frm_f7 WITH null,"select �꼶 from �꼶�� order by ���","�꼶" TO cNJ
IF EMPTY(NVL(cNJ,""))
	RETURN 
ENDIF 



DO FORM frm_f7 WITH null,"select distinct �Ͷ�ѧУ from ��ѧ�ǼǱ� where ISNULL(�Ͷ�ѧУ,'')<>'' order by �Ͷ�ѧУ","�Ͷ�ѧУ" TO cJDXX
IF EMPTY(NVL(cJDXX,""))
	cJDXX=INPUTBOX1("������Ͷ�ѧУ��","����ѧ��","")
ENDIF 

LOCAL cXSBH
cXSBH=GetValue(TEXTMERGE("exec ������ѧԱ @У��='<<cXQ>>',@ѧ������='<<cXSXM>>',@�꼶='<<cNJ>>',@�Ͷ�ѧУ='<<cJDXX>>',@ĸ�׵绰='<<cMQDH>>',@���׵绰='<<cFQDH>>',@���õ绰='<<cCYDH>>'"))
IF EMPTY(NVL(cXSBH,""))
	MESSAGEBOX("����ѧ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

thisform.oTextXSBH.Value=cXSBH
thisform.oTextXSXM.Value=cXSXM
thisform.oTextNJ.Value=cNJ

thisform.CheckStudent

thisform.nZKL=1

thisform.RefreshKMMX

MESSAGEBOX("����ѧ���ɹ���",0+64,"ϵͳ��ʾ")
=RAISEEVENT(thisform.oCmdSelectKM,"Click")

ENDPROC
     ���                              �   %   O      �  -   ^          �  U  W ��  � T�  �� � � �� �� � � � T� ��  ��/ T� �C� ������ĸ�׵绰��� ����ѧ���  � ��/ T� �C� �����븸�׵绰��� ����ѧ���  � �� %�C� �
��� � T� �� �� � %�C� �
� C� �	��� � T� �� �� � %�CC� >�����
��+�* ��C� �绰λ�����Ϸ����@� ϵͳ��ʾ�x�� B� � �� �	 �
 �7 T� �C� ������ѧ�������������� ����ѧ���  � �� %�C� ����� B� �K � frm_f7(�	 ������% select �꼶 from �꼶�� order by ������ �꼶�� %�CC�	 �  ҡ���� B� �� � frm_f7(�
 ������X select distinct �Ͷ�ѧУ from ��ѧ�ǼǱ� where ISNULL(�Ͷ�ѧУ,'')<>'' order by �Ͷ�ѧУ��� �Ͷ�ѧУ�� %�CC�
 �  ҡ����/ T�
 �C� ������Ͷ�ѧУ��� ����ѧ���  � �� � �� �� T� �CCٝ exec ������ѧԱ @У��='<<cXQ>>',@ѧ������='<<cXSXM>>',@�꼶='<<cNJ>>',@�Ͷ�ѧУ='<<cJDXX>>',@ĸ�׵绰='<<cMQDH>>',@���׵绰='<<cFQDH>>',@���õ绰='<<cCYDH>>'��� �� %�CC� �  ҡ����( ��C� ����ѧ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � T� � � �� �� T� � � �� �� T� � � ��	 ��
 �� � � T� � ����
 �� � �( ��C� ����ѧ���ɹ����@� ϵͳ��ʾ�x�� ��C� � � Click�� U  CXQ THISFORM OCOMBOXQ DISPLAYVALUE CMQDH CFQDH CCYDH	 INPUTBOX1 CXSXM CNJ CJDXX FRM_F7 CXSBH GETVALUE	 OTEXTXSBH VALUE	 OTEXTXSXM OTEXTNJ CHECKSTUDENT NZKL REFRESHKMMX OCMDSELECTKM Click,     ��1 q 1� � ��� A �� A ��A A � q� A A �AA A $A�A r A�A A 211� � �q2                       �      )                           commandbutton      commandbutton      oCmdSelectKM      Form1      �Top = 61
Left = 300
Height = 27
Width = 84
FontBold = .T.
FontName = "΢���ź�"
FontSize = 10
Picture = ..\..\images\system\select.bmp
Caption = "ѡ���Ŀ"
ToolTipText = "ѡ���Ŀ"
PicturePosition = 1
Name = "oCmdSelectKM"
     �PROCEDURE Click
IF EMPTY(thisform.oTextXSBH.Value)
	MESSAGEBOX("����ѡ��ѧ����",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

*DO FORM Addons\��ά����\ѡ���Ŀ WITH thisform.cKXKM,thisform.Grid1.ColumnBB.Combo1.RowSource TO cSelected

LOCAL nKSS,nKSF,cXQ,cXN,cNJ,nJCF
cXQ=thisform.oComboXQ.DisplayValue
cNJ=thisform.oTextNJ.Value
DO FORM Addons\��ά����\ѡ���Ŀ WITH cXQ,cNJ TO cSelected

IF !EMPTY(cSelected)
	LOCAL cBJLX,cKMs,cNJ1
	cBJLX=STREXTRACT(cSelected,"<�༶����>","</�༶����>")
	cKMs=STREXTRACT(cSelected,"<ѡ���Ŀ>","</ѡ���Ŀ>")
	cXN=STREXTRACT(cSelected,"<ѧ��>","</ѧ��>")
	cNJ1=STREXTRACT(cSelected,"<�꼶>","</�꼶>")
	SELECT ��Ŀ��ϸ
	FOR i=1 TO GETWORDCOUNT(cKMs,",")
		LOCAL cKC,cNJ
		cKC=GETWORDNUM(cKMs,i,",")
		nKSS=NVL(GetValue(TEXTMERGE("select ��ʱ�� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'")),0)
		LOCAL nJFKS
		nJFKS=NVL(GetValue(TEXTMERGE("select ���ѿ�ʱ from ѧ��������Ϣ where ѧ�����='<<thisform.oTextXSBH.Value>>' and У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'")),0)
		nKSF=NVL(GetValue(TEXTMERGE("select ��ʱ�� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'")),0)
		nJCF=NVL(GetValue(TEXTMERGE("select �̲ķ� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'")),0)
		SELECT ��Ŀ��ϸ
		LOCATE FOR ALLTRIM(ѧ��)=ALLTRIM(cXN) AND ALLTRIM(�꼶)=ALLTRIM(cNJ1) AND ALLTRIM(��Ŀ)=ALLTRIM(cKC) AND ALLTRIM(���)=ALLTRIM(cBJLX)
		IF !FOUND()
			APPEND BLANK
			REPLACE ѧ�� WITH cXN,�꼶 WITH cNJ1,��Ŀ WITH cKC,��� WITH cBJLX,��ʱ WITH nKSS-nJFKS,��ʱ�� WITH nKSF,��׼��ʱ�� WITH nKSF,�̲ķ� WITH nJCF
		ENDIF 
	ENDFOR 
	thisform.Grid1.Refresh
	thisform.RefreshTotal
	thisform.oTextSSJE.SetFocus
ENDIF 
ENDPROC
     f���    M  M                           %   �        $   �          �  U  i %�C�  � � ���A �( ��C� ����ѡ��ѧ�����@� ϵͳ��ʾ�x�� B� � �� � � � � � � T� ��  �	 �
 �� T� ��  � � ��, � Addons\��ά����\ѡ���Ŀ(� �� � � %�C� �
��b� �� � � �+ T� �C� �
 <�༶����>� </�༶����>����+ T� �C� �
 <ѡ���Ŀ>� </ѡ���Ŀ>����# T� �C� � <ѧ��>� </ѧ��>����# T� �C� � <�꼶>� </�꼶>���� F� � �� ���(�C� � ,����:� �� � � T� �C� � � ,����� T� �CCCَ select ��ʱ�� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'��� � ��� �� �� T� �CCCپ select ���ѿ�ʱ from ѧ��������Ϣ where ѧ�����='<<thisform.oTextXSBH.Value>>' and У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'��� � ���� T� �CCCَ select ��ʱ�� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'��� � ���� T� �CCCَ select �̲ķ� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶 in ('<<cNJ1>>') and �γ�����='<<cKC>>' and �༶����='<<cBJLX>>'��� � ��� F� �? -�C� �C� �� C� �C� �	� C� �C� �	� C� �C� �	�� %�C4
��6� �W >� ��� �� ��� �� ��� �� ��� �� ��� � �� ��� �� ��� �� ��� �� � �� ��  � � �
 ��  �  � ��  �! �" � � U#  THISFORM	 OTEXTXSBH VALUE NKSS NKSF CXQ CXN CNJ NJCF OCOMBOXQ DISPLAYVALUE OTEXTNJ ADDONS	 CSELECTED CBJLX CKMS CNJ1 ��Ŀ��ϸ I CKC GETVALUE NJFKS ѧ�� �꼶 ��Ŀ ��� ��ʱ ��ʱ��
 ��׼��ʱ�� �̲ķ� GRID1 REFRESH REFRESHTOTAL	 OTEXTSSJE SETFOCUS Click,     ��1 Q�A A �11�� ��11q �� qq
q qq
q
q �� Q qA A � � � A 1                       �      )   M                        label      label      Label8      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "��Ʊ�ˣ�"
Height = 21
Left = 764
Top = 63
Width = 54
Name = "Label8"
      aPROCEDURE DblClick
IF _screen.cUserName="sa"
	thisform.oTextKPR.Enabled= .T.
ENDIF 
ENDPROC
     ���    �   �                         �(   %   �       �      �           �  U  -  %��9�  � sa��& � T� � � �a�� � U 	 CUSERNAME THISFORM OTEXTKPR ENABLED DblClick,     ��1 QA 1                       V       )   �                         textbox      textbox      oTextKPR      Form1      oValue = (_screen.cUserName)
Enabled = .F.
Height = 23
Left = 820
Top = 62
Width = 108
Name = "oTextKPR"
      commandbutton      commandbutton      Command1      Form1      �Top = 372
Left = 769
Height = 25
Width = 26
FontBold = .T.
FontName = "΢���ź�"
Caption = "..."
SpecialEffect = 2
Name = "Command1"
     hPROCEDURE Click
LOCAL cZKL
cZKL=INPUTBOX("�������ۿ��ʣ�0.00-1.00����","�趨�ۿ�","1.00")
IF !ISDIGIT(cZKL)
	MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
IF VAL(cZKL)<=0 OR VAL(cZKL)>1
	MESSAGEBOX("�ۿ۷�Χ���Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
thisform.oTextSSJE.Value=ROUND(thisform.nSJTotal*VAL(cZKL)+thisform.nJCF,0)
ENDPROC
     ����    �  �                        v�   %   a      �     p          �  U  �  ��  �= T�  �C� �������ۿ��ʣ�0.00-1.00����� �趨�ۿ�� 1.00���� %�C�  �
��~ �& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �  %�C�  g� �
 C�  g���� �* ��C� �ۿ۷�Χ���Ϸ����@� ϵͳ��ʾ�x�� B� �( T� � � �C� � C�  g� � � T�� U  CZKL THISFORM	 OTEXTSSJE VALUE NSJTOTAL NJCF Click,     ��1 q �aA A �A A �1                       ]      )   �                        checkbox      checkbox      oCheckXJ      Form1      �Top = 437
Left = 79
Height = 34
Width = 71
FontName = "΢���ź�"
FontSize = 10
Alignment = 0
BackStyle = 0
Caption = "�ֽ�"
Value = .F.
Style = 1
Themes = .F.
Name = "oCheckXJ"
     @PROCEDURE InteractiveChange
thisform.oTextXJ.Enabled=this.Value
IF this.Value
	thisform.oTextXJ.Value=thisform.oTextSSJE.Value-thisform.oTextDJQ.Value-thisform.oTextSK.Value
	thisform.oTextXJ.SetFocus
ELSE 
	thisform.oTextXJ.Value=0
ENDIF 
ENDPROC
PROCEDURE ProgrammaticChange
this.InteractiveChange
ENDPROC
     ����    �  �                        v�   %   -      z     d          �  U  �  T�  � � �� � �� %�� � ��` �- T�  � � ��  � � �  � � �  � � �� ��  � � � �{ � T�  � � �� �� � U	  THISFORM OTEXTXJ ENABLED THIS VALUE	 OTEXTSSJE OTEXTDJQ OTEXTSK SETFOCUS 
 ��  � � U  THIS INTERACTIVECHANGE InteractiveChange,     �� ProgrammaticChange    ��1 a�� � 1A 2 � 1                       �      	     5  
    )   �                        textbox      textbox      oTextXJ      Form1      �FontName = "΢���ź�"
FontSize = 12
Alignment = 2
Value = 0.00
Enabled = .F.
Height = 33
Left = 150
SelectOnEntry = .T.
Top = 438
Width = 93
ForeColor = 0,0,255
Name = "oTextXJ"
      checkbox      checkbox      oCheckSK      Form1      �Top = 437
Left = 365
Height = 34
Width = 71
FontName = "΢���ź�"
FontSize = 10
Alignment = 0
BackStyle = 0
Caption = "ˢ��"
Value = .F.
Style = 1
Themes = .F.
Name = "oCheckSK"
     @PROCEDURE InteractiveChange
thisform.oTextSK.Enabled=this.Value
IF this.Value
	thisform.oTextSK.Value=thisform.oTextSSJE.Value-thisform.oTextDJQ.Value-thisform.oTextXJ.Value
	thisform.oTextSK.SetFocus
ELSE 
	thisform.oTextSK.Value=0
ENDIF 
ENDPROC
PROCEDURE ProgrammaticChange
this.InteractiveChange
ENDPROC
     ����    �  �                        v�   %   -      z     d          �  U  �  T�  � � �� � �� %�� � ��` �- T�  � � ��  � � �  � � �  � � �� ��  � � � �{ � T�  � � �� �� � U	  THISFORM OTEXTSK ENABLED THIS VALUE	 OTEXTSSJE OTEXTDJQ OTEXTXJ SETFOCUS 
 ��  � � U  THIS INTERACTIVECHANGE InteractiveChange,     �� ProgrammaticChange    ��1 a�� � 1A 2 � 1                       �      	     5  
    )   �                        textbox      textbox      oTextSK      Form1      �FontName = "΢���ź�"
FontSize = 12
Alignment = 2
Value = 0.00
Enabled = .F.
Height = 33
Left = 436
SelectOnEntry = .T.
Top = 438
Width = 93
ForeColor = 0,0,255
Name = "oTextSK"
      line      line      Line2      Form1      ?Height = 0
Left = 14
Top = 484
Width = 883
Name = "Line2"
      checkbox      checkbox      	oCheckDJQ      Form1      �Top = 435
Left = 713
Height = 34
Width = 60
FontName = "΢���ź�"
FontSize = 10
Alignment = 0
BackStyle = 0
Caption = "����ȯ"
Value = .F.
Style = 1
Themes = .F.
Name = "oCheckDJQ"
      �PROCEDURE InteractiveChange
thisform.oTextDJQ.Enabled=this.Value
IF this.Value
	thisform.oTextDJQ.SetFocus
ELSE 
	thisform.oTextDJQ.Value=0
ENDIF 
ENDPROC
PROCEDURE ProgrammaticChange
this.InteractiveChange
ENDPROC
     ����    �  �                        ?n   %   �       .  
             �  U  U  T�  � � �� � �� %�� � ��3 � ��  � � � �N � T�  � � �� �� � U  THISFORM OTEXTDJQ ENABLED THIS VALUE SETFOCUS 
 ��  � � U  THIS INTERACTIVECHANGE InteractiveChange,     �� ProgrammaticChange�     ��1 a� � 1A 2 � 1                       �         �   �   	    )   �                        textbox      textbox      oTextDJQ      Form1      �FontName = "΢���ź�"
FontSize = 12
Alignment = 2
Value = 0.00
Enabled = .F.
Height = 33
Left = 773
SelectOnEntry = .T.
Top = 436
Width = 93
ForeColor = 0,0,255
Name = "oTextDJQ"
      sPROCEDURE Valid
IF this.Value<0
	MESSAGEBOX("����Ϊ������",0+64,"ϵͳ��ʾ")
	this.Value=0
ENDIF 
ENDPROC
     ���    �   �                         r�   %   �       �      �           �  U  U  %��  � � ��N �* ��C� ����Ϊ�������@� ϵͳ��ʾ�x�� T�  � �� �� � U  THIS VALUE Valid,     ��1 A�A 1                       h       )   �                         commandbutton      commandbutton      oCmdZF      Form1      yTop = 496
Left = 574
Height = 39
Width = 60
FontName = "΢���ź�"
FontSize = 10
Caption = "����"
Name = "oCmdZF"
     �PROCEDURE Click
IF MESSAGEBOX("�����Ҫ���ϵ�ǰ������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cDH
cDH=ALLTRIM(thisform.oTextDH.Value)
IF EMPTY(cDH)
	MESSAGEBOX("����δ���ɣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
exec �������� '<<cDH>>'
ENDTEXT 
IF Execute(cSQL)
	MESSAGEBOX("���ϳɹ���",0+64,"ϵͳ��ʾ")
	this.Enabled=.f.
	thisform.PrintSJ
ELSE 
	MESSAGEBOX("����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     a���    H  H                        8�   %   �      �     �          �  U  N: %�C� �����Ҫ���ϵ�ǰ�������!� ϵͳ��ʾ�x���> � B� � ��  � T�  �C� � � ��� %�C�  ���� �& ��C� ����δ���ɣ��@� ϵͳ��ʾ�x�� B� � �� �
 M(� `�� � exec �������� '<<cDH>>'� � %�C � � ���$ ��C�
 ���ϳɹ����@� ϵͳ��ʾ�x�� T� � �-��
 �� � � �G�$ ��C�
 ����ʧ�ܣ��@� ϵͳ��ʾ�x�� � U	  CDH THISFORM OTEXTDH VALUE CSQL EXECUTE THIS ENABLED PRINTSJ Click,     ��1 �A A r Q� aA A r � �A !A� � � AA 1                       �      )   H                        commandbutton      commandbutton      Command2      Form1      �Top = 11
Left = 929
Height = 25
Width = 27
FontName = "΢���ź�"
FontSize = 10
Caption = "��"
ToolTipText = "����"
SpecialEffect = 2
PicturePosition = 14
Name = "Command2"
      >PROCEDURE Click
thisform.oDate.object.Value=DATE()
ENDPROC
      ����    �   �                         ��   %   h       }      w           �  U    T�  � � � �C$�� U  THISFORM ODATE OBJECT VALUE Click,     ��1 Q1                       3       )   �                         commandbutton      commandbutton      oCmdChangeGrade      Form1      �Top = 24
Left = 667
Height = 27
Width = 29
FontName = "΢���ź�"
Caption = "��"
ToolTipText = "���꼶"
SpecialEffect = 2
ForeColor = 0,0,255
Name = "oCmdChangeGrade"
     �PROCEDURE Click
IF EMPTY(thisform.oTextXSBH.Value)
	MESSAGEBOX("δѡ��ѧ����",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cXSBH
cXSBH=ALLTRIM(thisform.oTextXSBH.Value)
LOCAL cNJ
DO FORM frm_f7 WITH null,"select �꼶 from �꼶�� order by ���","�꼶" TO cNJ
IF !EMPTY(NVL(cNJ,""))
	IF Execute("update ��ѧ�ǼǱ� set �꼶='"+cNJ+"' where ѧ�����='"+cXSBH+"'")
		MESSAGEBOX("�����꼶�ɹ���",0+64,"ϵͳ��ʾ")
		thisform.oTextNJ.Value=cNJ
	ELSE 
		MESSAGEBOX("�����꼶ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
ENDIF 

thisform.RefreshKMMX
thisform.bSave=.f.
thisform.oTextSSJE.SetFocus

SELECT ��Ŀ��ϸ
IF RECCOUNT()=0
	=RAISEEVENT(thisform.oCmdSelectKM,"Click")
ENDIF 

ENDPROC
     ?���    &  &                        y�   %   �      �     �          �  U  � %�C�  � � ���? �& ��C� δѡ��ѧ�����@� ϵͳ��ʾ�x�� B� � �� � T� �C�  � � ��� �� �K � frm_f7(� ������% select �꼶 from �꼶�� order by ������ �꼶�� %�CC� �  ҡ
����P %�C� update ��ѧ�ǼǱ� set �꼶='� � ' where ѧ�����='� � '� ��Q�( ��C� �����꼶�ɹ����@� ϵͳ��ʾ�x�� T�  � � �� �� ���( ��C� �����꼶ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �
 ��  � � T�  �	 �-�� ��  �
 � � F� � %�CN� ���� ��C�  � � Click�� � U  THISFORM	 OTEXTXSBH VALUE CXSBH CNJ FRM_F7 EXECUTE OTEXTNJ REFRESHKMMX BSAVE	 OTEXTSSJE SETFOCUS ��Ŀ��ϸ OCMDSELECTKM Click,     ��1 QaA A r Qq �Q�1� �A A A � � � r qA 2                       �      )   &                        commandbutton      commandbutton      oCmdChangeName      Form1      �Top = 24
Left = 452
Height = 27
Width = 29
FontName = "΢���ź�"
Caption = "��"
ToolTipText = "������"
SpecialEffect = 2
ForeColor = 0,0,255
Name = "oCmdChangeName"
      PROCEDURE Click
IF EMPTY(thisform.oTextXSBH.Value)
	MESSAGEBOX("δѡ��ѧ����",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cXSBH,cXSXM
cXSBH=ALLTRIM(thisform.oTextXSBH.Value)
cXSXM=InputBox1("�������µ�ѧ��������","��ѧ������",ALLTRIM(thisform.oTextXSXM.Value))
IF EMPTY(cXSXM)
	RETURN 
ENDIF 
IF Execute("update ��ѧ�ǼǱ� set ѧ������='"+cXSXM+"' where ѧ�����='"+cXSBH+"'")
	MESSAGEBOX("�޸�ѧ�������ɹ���",0+64,"ϵͳ��ʾ")
	thisform.oTextXSXM.Value=cXSXM
ELSE
	MESSAGEBOX("�޸�ѧ������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ����    z  z                        �   %   �      1               �  U  � %�C�  � � ���? �& ��C� δѡ��ѧ�����@� ϵͳ��ʾ�x�� B� � �� � � T� �C�  � � ���= T� �C� �������µ�ѧ���������
 ��ѧ������C�  � � �� �� %�C� ���� � B� �T %�C�  update ��ѧ�ǼǱ� set ѧ������='� � ' where ѧ�����='� � '� ��J�, ��C� �޸�ѧ�������ɹ����@� ϵͳ��ʾ�x�� T�  � � �� �� �~�, ��C� �޸�ѧ������ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM	 OTEXTXSBH VALUE CXSBH CXSXM	 INPUTBOX1	 OTEXTXSXM EXECUTE Click,     ��1 QaA A � Q�� A A A�1� �A 1                             )   z                        checkbox      checkbox      oCheckClear      Form1      �Top = 61
Left = 528
Height = 28
Width = 71
FontName = "΢���ź�"
FontSize = 10
Alignment = 0
BackStyle = 0
Caption = "�������"
Value = .F.
Style = 1
Themes = .F.
Name = "oCheckClear"
     �PROCEDURE ProgrammaticChange
this.InteractiveChange
ENDPROC
PROCEDURE InteractiveChange
thisform.RefreshKMMX
IF this.Value
	thisform.oCmdSelectKM.Enabled= .F.
	thisform.Grid1.ColumnJCF.Enabled= .F.
	thisform.Grid1.ColumnFB.Enabled= .F.
ELSE 
	thisform.oCmdSelectKM.Enabled= .T.
	thisform.Grid1.ColumnKS.Enabled= .T.
	thisform.Grid1.ColumnJCF.Enabled= .T.
	thisform.Grid1.ColumnFB.Enabled= .T.
ENDIF 
ENDPROC
     1���                              -k   %   j      �     �          �  U   
 ��  � � U  THIS INTERACTIVECHANGE� 
 ��  � � %�� � ��S � T�  � � �-�� T�  � � � �-�� T�  � � � �-�� �� � T�  � � �a�� T�  � �	 � �a�� T�  � � � �a�� T�  � � � �a�� � U
  THISFORM REFRESHKMMX THIS VALUE OCMDSELECTKM ENABLED GRID1	 COLUMNJCF COLUMNFB COLUMNKS ProgrammaticChange,     �� InteractiveChangeV     ��1 � 2 � AA� AAAA 1                       4         \   �      )                           commandbutton      commandbutton      oCmdHXKS      Form1      �Top = 62
Left = 613
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "������ʱ..."
Name = "oCmdHXKS"
      �PROCEDURE Click
LOCAL cXSBH,cXQ
cXSBH=ALLTRIM(thisform.oTextXSBH.Value)
cXQ=ALLTRIM(thisform.oComboXQ.DisplayValue)

DO FORM Addons\��ά����\��ʱ���� WITH cXSBH,cXQ
thisform.RefreshKMMX
thisform.CheckStudent
ENDPROC
     ����    o  o                        �_   %         &               �  U  t  ��  � � T�  �C� � � ��� T� �C� � � ���( � Addons\��ά����\��ʱ������  � �
 �� � �
 �� �	 � U
  CXSBH CXQ THISFORM	 OTEXTXSBH VALUE OCOMBOXQ DISPLAYVALUE ADDONS REFRESHKMMX CHECKSTUDENT Click,     ��1 � QQ�� � 1                       �       )   o                        label      label      Label2      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 8
BackStyle = 0
Caption = "�汾�ţ�003"
Height = 18
Left = 3
Top = 3
Width = 64
ForeColor = 64,128,128
Name = "Label2"
      �Arial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 1, 10, 7, 19, 15, 19, 4, 0
΢���ź�, 1, 9, 6, 17, 13, 17, 4, 0
΢���ź�, 0, 12, 8, 21, 17, 23, 4, 0
΢���ź�, 0, 9, 6, 17, 13, 17, 4, 0
0U   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _48I0NJULR1167224146      /  F      ]                          �      �                       WINDOWS _48I0NJULS1244431825�      �  �      �      �  ��                  ��                          WINDOWS _48I0NJULR1186041920��     Ͳ ڲ � ��                                                          WINDOWS _48I0NJULS1186041920��     �� �� ų ҳ                                                          WINDOWS _48I0NJULR1186041920n�     �� �� �� ��     T� ��                                              WINDOWS _48I0NJULR1189643579�     0� E� U� b�     � �                                              WINDOWS _48I0NJULR1189643579�     � � -� :�     �� .�                                              WINDOWS _48I0Z3UU41186041920]�     j� w� �� ��                                                          WINDOWS _48L0WGY2911896435795�     B� O� _� l�                                                          WINDOWS _48I0NJULR1189643579�     � -� >� K�     �� '�                                              WINDOWS _4940TUZGO1186041920?�     Q� c� w� ��     �� � �� ��                                      WINDOWS _4980QYZ8K1226409596#�     8� M� _� l�     �� ��                                              WINDOWS _48I0NJULR1167224146<�     I� V� i� v�                                                          WINDOWS _4980RQLMZ1186041920=�     J� W� e� r�                                                          WINDOWS _4980RQLN01186041920�      � -� =� J�                                                          WINDOWS _48I0NJULR1197911411��     �� � � ,�     �� /�                                              WINDOWS _48I0NJULR1197910388&�     ;� P� f� s�     � h�                                              WINDOWS _49913SLQ11193373177O�     `� q� �� ��                                                          WINDOWS _48I0NJULR1186041920�     � � *� 7�                                                          WINDOWS _48I0NJULS1186041920��     �� �� � �                                                          WINDOWS _48I0NJULR1186041920��     �� �� �� ��                                                          WINDOWS _48I0NJULS1186041920{�     �� �� �� ��                                                          WINDOWS _48I0Z3UU41186041920G�     T� a� o� |�                                                          WINDOWS _48L0WGY291186041920�     *� 7� F� S�                                                          WINDOWS _4991ARMBV1186041920��     �� � � �                                                          WINDOWS _4991ARMBW1186041920��     �� �� �� ��                                                          WINDOWS _48I0NJULR1186041920��     �� �� �� ��                                                          WINDOWS _48I0NJULS1186041920a�     n� {� �� ��                                                          WINDOWS _48I0NJULR1186041920>�     S� h� v� ��     � _�                                              WINDOWS _49C0RVR491186041920.�     :� F� S� `�                                                          WINDOWS _49C0RVR4A1186041920��     �� �� �� �                                                          WINDOWS _48I0NJULR1186041920��     �� �� �� ��                                                          WINDOWS _48I0NJULS1177591188?�     M� [� j� ��                                                          WINDOWS _48I0Z3UU41177511952��     �� � � ,�                                                          WINDOWS _48L0WGY291167525896��     �� �� �� ��                                                          WINDOWS _48L0WGY2A1167423776Z�     i� x� �� ��                                                          WINDOWS _48N025HJJ1167525896'�     5� C� R� m�                                                          WINDOWS _48N025HJK1167525896��     �� �� �� �                                                          WINDOWS _48N025HJL1167525896��     �� �� �� ��                                                          WINDOWS _48N025HJM1167525956B�     Q� `� m� ��                                                          WINDOWS _4B71BJQXK1182249314�     � +� :� U�                                                          WINDOWS _4B71BJQXL1182249314��     �� �� ��  �                                                          WINDOWS _49D16GOLF1186041920a�     m� y� �� ��                                                          WINDOWS _49D16GOLG1177591318!     / = L g                                                          WINDOWS _49D16GOLH1177591318�     � � �                                                           WINDOWS _49D16GOLI1177591318�     � � � �                                                          WINDOWS _49D16GOLJ1177591318<     K Z g �                                                          WINDOWS _49D16GOLK1177591318	      % 4 O                                                          WINDOWS _49D16GOLL1177591318�     � � � �                                                          WINDOWS _49D16GOLM1177591318}     � � � �                                                          WINDOWS _49D16GOLN1177591318$     3 B O j                                                          WINDOWS _49D16GOLO1177591318�     �   7                                                          WINDOWS _49D16GOLP1177591318�     � � � �                                                          WINDOWS _49E0M46O91197910388?	     T	 i	 ~	 �	     !
 �                                              WINDOWS _48I0NJULR1197910388�     � �       � *                                              WINDOWS _49P0Z44RT1189643579-     B W n {      l                                              WINDOWS _48I0Z3UU41187285737J     V b o |     y +                                              WINDOWS _48L0WGY291167525896|     � � � �                                                          WINDOWS _48L0WGY2A1167423776'     6 E R m                                                          WINDOWS _48N025HJJ1167525896�        :                                                          WINDOWS _48N025HJK1167525896y     � � � �                                                          WINDOWS _48I0NJULR1186301043      5 J ` m     � �"                                              WINDOWS _4AQ0X97XQ1226410561W&     l& �& �& �&     )' e0                                              WINDOWS _48I0NJULR1226410251�9     �9 �9 �9 :     �: 1?                                              WINDOWS _48I0NJULR1193373457�D     �D �D �D �D     |E AF                                              WINDOWS _48I0NJULR1226410251�G     �G �G �G �G     QH kL                                              WINDOWS _48I0NJULR1226408918BQ     RQ bQ pQ }Q     ]R �R                                              WINDOWS _4CI0LKUD81186041920�S     �S �S �S �S     �T �V                                              WINDOWS _4CO1EDC761226410561UY     jY Y �Y �Y     Z `                                              WINDOWS _48I0NJULR1193373177�f     �f g "g /g     �g 6i                                              WINDOWS _48I0NJULS1193373177k      k 5k Ek Rk     l �n                                              WINDOWS _4CU0ZKE1C1218599762�p     �p �p �p �p     �q �|                                              WINDOWS _4DB0WBTE61197914533��     �� ш � ��     }� �                                              WINDOWS _4E60ZSF8P1226410561L�     a� v� �� ��     � <�                                              WINDOWS _4E611R91I1189645494#�     0� =� Q� ^�                                                          WINDOWS _48I0NJULR11978449531�     F� [� l� y�     �� 9�                                              WINDOWS _4HI19JFYM1244431825�     $� 9� I� V�     ۰ t�                                              WINDOWS _4HJ0PM4R51197891362N�     _� p� �� ��                                                          WINDOWS _4HJ0PM4R61197893896�     � $� 1� O�                                                          WINDOWS _4HJ0PM4R71197894125��     � � -� K�     �� Z�                                              WINDOWS _4HJ0PM4R81197891362��     �� �� �� �     �� ��                                              WINDOWS _4HJ0PM4R91197894217��     �� �� �� ��     |� 5�                                              WINDOWS _4OF0ZH7A61223263569p�     �� �� �� ��     z� w�                                              COMMENT RESERVED                                �                                                          Ӥ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Height = 604
Width = 1295
ShowWindow = 2
DoCreate = .T.
ShowTips = .T.
AutoCenter = .T.
Caption = "�˹�����"
Closable = .F.
WindowState = 0
_memberdata =     3319<VFPData><memberdata name="refreshxq" type="method" display="RefreshXQ"/><memberdata name="refreshxn" type="method" display="RefreshXN"/><memberdata name="refreshnj" type="method" display="RefreshNJ"/><memberdata name="refreshkc" type="method" display="RefreshKC"/><memberdata name="refreshbb" type="method" display="RefreshBB"/><memberdata name="refreshteacher" type="method" display="RefreshTeacher"/><memberdata name="refreshkq" type="method" display="RefreshKQ"/><memberdata name="ckqcursor" type="property" display="cKQCursor"/><memberdata name="refreshxskq" type="method" display="RefreshXSKQ"/><memberdata name="bsaved" type="property" display="bSaved"/><memberdata name="nkc" type="property" display="nKC"/><memberdata name="savedata" type="method" display="SaveData"/><memberdata name="onheadrightclick" type="method" display="OnHeadRightClick"/><memberdata name="onvaluechange" type="method" display="OnValueChange"/><memberdata name="bsaved_assign" type="method" display="bSaved_Assign"/><memberdata name="cteacher" type="property" display="cTeacher"/><memberdata name="cxn" type="property" display="cXN"/><memberdata name="cxq" type="property" display="cXQ"/><memberdata name="nmonth" type="property" display="nMonth"/><memberdata name="nyear" type="property" display="nYear"/><memberdata name="refreshclasses" type="method" display="RefreshClasses"/><memberdata name="cbb" type="property" display="cBB"/><memberdata name="ckc" type="property" display="cKC"/><memberdata name="cnj" type="property" display="cNJ"/><memberdata name="obb" type="property" display="oBB"/><memberdata name="onbbclick" type="method" display="OnBBClick"/><memberdata name="bisok" type="property" display="bIsOk"/><memberdata name="nversion" type="property" display="nVersion"/><memberdata name="bshowsummary" type="property" display="bShowSummary"/><memberdata name="bshowsummary_assign" type="method" display="bShowSummary_Assign"/><memberdata name="cbjcursor" type="property" display="cBJCursor"/><memberdata name="cnjcursor" type="property" display="cNJCursor"/><memberdata name="refreshgrid" type="method" display="RefreshGrid"/><memberdata name="onwhen" type="method" display="OnWhen"/><memberdata name="cbjlx" type="property" display="cBJLX"/><memberdata name="bxyzj" type="property" display="bXYZJ"/><memberdata name="getrq" type="method" display="GetRQ"/><memberdata name="bchecked" type="property" display="bChecked"/><memberdata name="bshowalldays" type="property" display="bShowAllDays"/><memberdata name="bhidenodata" type="property" display="bHideNoData"/><memberdata name="ndcks" type="property" display="nDCKS"/><memberdata name="refreshupanddown" type="method" display="RefreshUpAndDown"/><memberdata name="setlessiontime" type="method" display="SetLessionTime"/><memberdata name="addstudent" type="method" display="AddStudent"/><memberdata name="setcolumn" type="method" display="SetColumn"/><memberdata name="refreshclass" type="method" display="RefreshClass"/><memberdata name="refreshimage" type="method" display="RefreshImage"/><memberdata name="onbbrightclick" type="method" display="OnBBRightClick"/><memberdata name="ckslist" type="property" display="cKSList"/><memberdata name="cfilterexpr" type="property" display="cFilterExpr"/><memberdata name="refreshks" type="method" display="RefreshKS"/></VFPData>

ckqcursor = 
bsaved = .T.
nkc = 0
cxq = 
cxn = 
cteacher = 
nyear = 0
nmonth = 0
cnj = 
ckc = 
cbb = 
obb = 
bisok = .F.
nversion = 0
bshowsummary = .T.
cbjcursor = 
cnjcursor = 
cbjlx = 
bxyzj = .F.
bchecked = .F.
bshowalldays = .F.
bhidenodata = .F.
ndcks = 2
ckslist = 
cfilterexpr = 
Name = "Form1"
     ��PROCEDURE refreshxq

*!*��ʼ��У��
this.oComboXQ.Clear
LOCAL cSQL,cCursor
cSQL="select * from У���� order by ˳���"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡУ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboXQ.AddItem(ALLTRIM(У�����))
ENDSCAN 
=CloseAlias(cCursor)

this.RefreshXN(this.oComboXQ.DisplayValue)


ENDPROC
PROCEDURE refreshxn
LPARAMETERS cXQ as String


IF VARTYPE(cXQ)<>"C" OR EMPTY(cXQ)
	cXQ=ALLTRIM(this.oComboXQ.DisplayValue)
ENDIF 

this.oComboXN.Clear
*!*��ʼ��ѧ��
LOCAL cSQL,cCursor
cSQL="select * from ѧ��� where У��='"+ALLTRIM(cXQ)+"' order by ��ǰѧ�� desc,��ʼ����"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboXN.AddItem(ALLTRIM(ѧ��))
ENDSCAN 
=CloseAlias(cCursor)
ENDPROC
PROCEDURE refreshnj


this.oComboNJ.Clear
LOCAL cSQL,cCursor
cSQL="select �꼶 from �꼶�� order by ���"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ�꼶ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboNJ.AddItem(ALLTRIM(�꼶))
ENDSCAN 
=CloseAlias(cCursor)

*!*ˢ�¿γ�
this.RefreshKC(ALLTRIM(this.oComboNJ.DisplayValue))
ENDPROC
PROCEDURE refreshkc
LPARAMETERS cNJ as String



this.oComboKC.Clear
LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @�꼶 varchar(50)
set @�꼶='<<cNJ>>'

create table #tb(�γ����� varchar(50))

if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and Ӣ��=1)
	insert into #tb(�γ�����) values ('Ӣ��') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ѧ=1)
	insert into #tb(�γ�����) values ('��ѧ') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)
	insert into #tb(�γ�����) values ('����') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ѧ=1)
	insert into #tb(�γ�����) values ('��ѧ') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)
	insert into #tb(�γ�����) values ('����') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)
	insert into #tb(�γ�����) values ('����') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)
	insert into #tb(�γ�����) values ('����') 
if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ʷ=1)
	insert into #tb(�γ�����) values ('��ʷ') 
select * from #tb
drop table #tb
ENDTEXT 

cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ�γ�ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboKC.AddItem(ALLTRIM(�γ�����))
ENDSCAN 
=CloseAlias(cCursor)

this.RefreshBB
ENDPROC
PROCEDURE refreshbb
LPARAMETERS cXQ as String,cXN as String,cNJ as String,cKC as String
IF VARTYPE(cXQ)<>"C" OR EMPTY(cXQ)
	cXQ=ALLTRIM(this.oComboXQ.DisplayValue)
ENDIF 
IF VARTYPE(cXN)<>"C" OR EMPTY(cXN)
	cXN=ALLTRIM(this.oComboXN.DisplayValue)
ENDIF 
IF VARTYPE(cNJ)<>"C" OR EMPTY(cNJ)
	cNJ=ALLTRIM(this.oComboNJ.DisplayValue)
ENDIF 
IF VARTYPE(cKC)<>"C" OR EMPTY(cKC)
	cKC=ALLTRIM(this.oComboKC.DisplayValue)
ENDIF 


this.oComboBB.Clear
LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
select [���] as [���]
from [�༶�γ̱�]
where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>'
--order by ...
ENDTEXT 
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboBB.AddItem(ALLTRIM(���))
ENDSCAN 
=CloseAlias(cCursor)
this.oComboBB.Value=1

this.RefreshKQ
ENDPROC
PROCEDURE refreshkq
thisform.LockScreen= .T.
this.Grid1.RecordSource=null

LOCAL nLeft,nTop,nWidth,nHeight
nLeft=this.Grid1.Left
nTop=this.Grid1.Top
nWidth=this.Grid1.Width
nHeight=this.Grid1.Height
this.RemoveObject("Grid1")

this.oCmdDeleteLine.Enabled= .F.
this.oCmdDeleteStudent.Enabled= .F.
*!*	SELECT (thisform.cKQCursor)
*!*	ZAP 
*this.RefreshGrid
this.cKSList=NVL(GetValue(TEXTMERGE("select ���������ʱ from �༶�γ̱� with(nolock) where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>'")),"")
IF EMPTY(this.cKSList)
	this.cKSList="2,1"
ENDIF 
this.cKSList = this.cKSList + ",,���"

this.RefreshKS


LOCAL cSQL
*!*��ȡ�����Ͽ�����
IF this.bShowAllDays
TEXT TO cSQL NOSHOW TEXTMERGE
SELECT a.�Ͽ�����,a.�δ�,a.���,a.����,CAST((case when convert(varchar,a.�Ͽ�����,112)<=convert(varchar,getdate(),112) then 1 else 0 end) as bit) as ��Ч
,a.�Ͽ�ʱ��
FROM �༶�ſα� a with(nolock)
WHERE a.У��='<<this.cXQ>>' 
	AND a.ѧ��='<<this.cXN>>' 
	AND a.�꼶='<<this.cNJ>>' 
	AND a.�γ�����='<<this.cKC>>' 
	AND a.���='<<this.cBB>>' 
	and a.�ο���ʦ='<<this.cTeacher>>'
order by a.�Ͽ�����
ENDTEXT
ELSE 
TEXT TO cSQL NOSHOW TEXTMERGE
SELECT a.�Ͽ�����,a.�δ�,a.���,a.�����,a.����,CAST((case when convert(varchar,a.�Ͽ�����,112)<=convert(varchar,getdate(),112) then 1 else 0 end) as bit) as ��Ч
,a.�Ͽ�ʱ��,a.��ʦǩ��
FROM �༶�ſα� a with(nolock)
WHERE a.У��='<<this.cXQ>>' 
	AND a.ѧ��='<<this.cXN>>' 
	AND a.�꼶='<<this.cNJ>>' 
	AND a.�γ�����='<<this.cKC>>' 
	AND a.���='<<this.cBB>>' 
	and a.�ο���ʦ='<<this.cTeacher>>'
	AND YEAR(a.�Ͽ�����)=<<this.nYear>> 
	and MONTH(a.�Ͽ�����)=<<this.nMonth>>
order by a.�Ͽ�����
ENDTEXT
ENDIF 
LOCAL cCursor
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ�ſ���Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF


*!*�����α�
LOCAL cFieldsList
cFieldsList="ѧ�� L null,ѧ����� C(50),ѧ������ C(50)"
SELECT (cCursor)
SCAN
	cFieldsList = cFieldsList + "," + "I" + TRANSFORM(�δ�) + " C(4) null"
	cFieldsList = cFieldsList + "," + "Q" + TRANSFORM(�δ�) + " C(4) null"
ENDSCAN 
LOCAL cCursorExpr
cCursorExpr="CREATE CURSOR "+thisform.cKQCursor+"("+cFieldsList+")"
=CloseAlias(this.cKQCursor)
SELECT 0
&cCursorExpr

*!*����Grid

this.AddObject("Grid1","Grid_")
=BINDEVENT(this.Grid1,"AfterRowColChange",this,"OnAfterRowColChange")
this.Grid1.Left=nLeft
this.Grid1.Top=nTop
this.Grid1.Width=nWidth
this.Grid1.Height=nHeight
this.Grid1.Anchor=15
this.Grid1.Visible= .T.
this.Grid1.Themes= .F.
this.Grid1.DeleteMark= .F.
this.Grid1.FontName="΢���ź�"
this.Grid1.FontSize=10
this.Grid1.HeaderHeight=40
this.Grid1.RowHeight=28
this.Grid1.RecordSource=thisform.cKQCursor
this.Grid1.ColumnCount=3+RECCOUNT(cCursor)
this.Grid1.LockColumns=3
WITH this.Grid1.Columns[1] as Column
	.ControlSource="recno()"
	.Alignment= 2
	.Width=30
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	.DynamicBackColor="RGB(240,240,240)"
	WITH .Header1 as Header
		.Caption="���"
		.Alignment= 2
	ENDWITH 
	WITH .Text1 as TextBox
		.Alignment= 2
	ENDWITH 
ENDWITH 

WITH this.Grid1.Columns[2] as Column
	.ControlSource="ѧ�����"
	.Width=80
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	WITH .Header1 as Header
		.Caption="���"
		.Alignment= 2
	ENDWITH 
	WITH .Text1 as TextBox
		.Alignment= 2
	ENDWITH 
	.DynamicBackColor="iif(ѧ��,RGB(255,255,255),RGB(140,140,140))"
ENDWITH 

WITH this.Grid1.Columns[3] as Column
	.ControlSource="ѧ������"
	.Width=80
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	WITH .Header1 as Header
		.Caption="ѧ�� or ����"
		.Alignment= 2
	ENDWITH 
	WITH .Text1 as TextBox
		.Alignment= 2
	ENDWITH 
	.DynamicBackColor="iif(ѧ��,RGB(255,255,255),RGB(140,140,140))"
ENDWITH 

SELECT (cCursor)
SCAN 
	LOCAL i
	i=�δ�
	WITH this.Grid1.Columns[3+RECNO()] as Column
		.ControlSource="I"+TRANSFORM(i)
		.DynamicFontBold="iif(VAL(I"+TRANSFORM(i)+")<>VAL(Q"+TRANSFORM(i)+"),.t.,.f.)"
		.Width=90
		WITH .Header1 as Header
			.Alignment= 2
			IF this.bShowAllDays
				.Caption=TRANSFORM(MONTH(�Ͽ�����))+"��"+TRANSFORM(DAY(�Ͽ�����))+"��"
			ELSE 
				.Caption=TRANSFORM(DAY(�Ͽ�����))+"��"
			ENDIF 
			.Caption = .Caption + IIF(NVL(����,.f.)," ��","")+IIF(NVL(���,.f.)," "+ALLTRIM(�����),"")
			IF !EMPTY(ALLTRIM(NVL(�Ͽ�ʱ��,"")))
				.Caption = .Caption + CHR(13) + CHR(10) + ALLTRIM(NVL(�Ͽ�ʱ��,"")) 
			ELSE 
				.Caption = .Caption + CHR(13) + CHR(10) + "�����趨ʱ��"
			ENDIF 
			=BINDEVENT(.Parent.Header1,"Click",this,"SetLessionTime")
			IF NVL(����,.f.)
				.Forecolor=RGB(0,0,255)
			ENDIF 
			IF NVL(���,.f.)
				.Forecolor=RGB(255,0,0)
			ENDIF 
			.ToolTiptext="��"+TRANSFORM(�δ�)+"�ڿΣ�������ͷ�ɸ����Ͽ�ʱ��"
			.WordWrap= .T.
		ENDWITH 
		
		
		=BINDEVENT(.Header1,"RightClick",this,"OnHeadRightClick")
		LOCAL cTempName
		cTempName=SYS(2015)
		.AddObject(cTempName,"ComboBox_")
		WITH .Controls[3] as ComboBox
			.Style= 2
			.RowSourceType= 1
			.RowSource=this.cKSList
			.Alignment= 2
			.Visible= .T.
		ENDWITH 
		=BINDEVENT(.Controls[3],"InteractiveChange",this,"OnValueChange")
		=BINDEVENT(.Controls[3],"When",this,"OnWhen")
		.CurrentControl=cTempName
		.Alignment= 2
		.DynamicBackColor="ICASE(VAL(I"+TRANSFORM(i)+")=2,RGB(240,240,240),VAL(I"+TRANSFORM(i)+")=1,RGB(192,192,192),RGB(255,255,255))"
		IF NVL(���,.f.)
			this.oCmdDeleteLine.Enabled= .F.
			this.oCmdDeleteStudent.Enabled= .F.
		ENDIF 
		IF NVL(����,.f.)
			.DynamicForeColor="RGB(0,0,255)"
		ELSE 
			.DynamicForeColor="ICASE(ALLTRIM(I"+TRANSFORM(i)+")=[���],RGB(255,0,0),RGB(0,0,0))"
		ENDIF 
		.AddProperty("�Ͽ�����",�Ͽ�����)
		.ADDPROPERTY("����",NVL(����,.f.))
		.ADDPROPERTY("�δ�",�δ�)
		.ADDPROPERTY("���",NVL(���,.f.))
		.AddProperty("��Ч",NVL(��Ч,.f.))
		.AddProperty("�Ͽ�ʱ��",ALLTRIM(NVL(�Ͽ�ʱ��,"")))
		.AddProperty("��ǩ��",NVL(��ʦǩ��,.f.))
		.Enabled=NVL(��Ч,.f.) and !NVL(���,.f.)
		IF EMPTY(ALLTRIM(NVL(�Ͽ�ʱ��,"")))
			.Enabled= .F.
		ENDIF 
	ENDWITH 
ENDSCAN 
=CloseAlias(cCursor)
this.grid1.Refresh

this.RefreshXSKQ(this.cXQ,this.cXN,this.cNJ,this.cKC,this.cBB,this.nYear,this.nMonth)

*����Ƿ����ɾ�������ſ�
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * 
			FROM �༶�ſα� with(nolock)
			WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>'
				and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>
				and not exists(select * from ѧ���γ̿δα� with(nolock) where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)
		)
		SELECT 1
	ELSE 
		SELECT 0
ENDTEXT 
IF GetValue(cSQL)=1
	this.oCmdDeleteClass.Enabled= .T.
ELSE 
	this.oCmdDeleteClass.Enabled= .F.
ENDIF 

*!*��ʾ����ͼƬ��Ϣ
this.RefreshImage

this.bSaved=.t.

thisform.LockScreen= .F.

this.RefreshClass(this.cXQ,this.cXN,this.cNJ,this.cKC,this.cBB)
ENDPROC
PROCEDURE refreshxskq
LPARAMETERS cXQ,cXN,cNJ,cKC,cBB,nYear,nMonth

IF VARTYPE(cXQ)<>"C" OR EMPTY(cXQ)
	cXQ=this.cXQ
ENDIF
IF VARTYPE(cXN)<>"C" OR EMPTY(cXN)
	cXN=this.cXN
ENDIF
IF VARTYPE(cNJ)<>"C" OR EMPTY(cNJ)
	cNJ=this.cNJ
ENDIF
IF VARTYPE(cKC)<>"C" OR EMPTY(cKC)
	cKC=this.cKC
ENDIF
IF VARTYPE(cBB)<>"C" OR EMPTY(cBB)
	cBB=this.cBB
ENDIF
IF VARTYPE(nYear)<>"N"
	nYear=this.nYear
ENDIF 
IF VARTYPE(nMonth)<>"N"
	nMonth=this.nMonth
ENDIF 

SELECT (thisform.cKQCursor)
ZAP 

*!*ˢ��ѧ������
LOCAL cFieldsList
cFieldsList="select a.ѧ�����,a.ѧ������"
FOR i=1 TO this.Grid1.ColumnCount-3
	LOCAL oColumn as Column
	oColumn=this.Grid1.Columns[3+i]
	LOCAL nKC
	nKC=oColumn.�δ�
	cFieldsList = cFieldsList + CHR(13) + CHR(10) + ",dbo.��ѯѧ����ʱ1(@У��,@ѧ��,@�꼶,@�γ�����,@���,"+TRANSFORM(nKC)+",a.ѧ�����) as I"+TRANSFORM(nKC)
ENDFOR 

LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int
SET @У��='<<cXQ>>'
SET @ѧ��='<<cXN>>'
SET @�꼶='<<cNJ>>'
SET @�γ�����='<<cKC>>'
SET @���='<<cBB>>'
SET @���=<<nYear>>
SET @�·�=<<nMonth>>

<<cFieldsList>>
from ��ѧ�ǼǱ� a with(nolock)
where a.ѧ����� in (select ѧ����� from ѧ���γ̿δα� a with(nolock) inner join �༶�ſα� b with(nolock) on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)
	or exists(select * from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)
order by (select ISNULL(���,0) from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���),
(select CreateTime from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)
,a.ѧ�����
ENDTEXT 

cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯѧ����Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 


LOCAL cFieldsExpr1,cFieldsExpr2,cFieldsExpr,cFilterExpr
cFilterExpr=""
cFieldsExpr1="ѧ��,ѧ�����,ѧ������"
cFieldsExpr2=".t.,ALLTRIM(ѧ�����),ALLTRIM(ѧ������)"
FOR i=1 TO this.Grid1.ColumnCount-3
	LOCAL oColumn as Column
	oColumn=this.Grid1.Columns[3+i]
	LOCAL nKC
	nKC=oColumn.�δ�
	cFieldsExpr1 = cFieldsExpr1 + ",I" + TRANSFORM(nKC)
	cFieldsExpr1 = cFieldsExpr1 + ",Q" + TRANSFORM(nKC)
	cFieldsExpr2 = cFieldsExpr2 + ",I" + TRANSFORM(nKC)
	cFieldsExpr2 = cFieldsExpr2 + ",I" + TRANSFORM(nKC)
	cFilterExpr = cFilterExpr + IIF(EMPTY(cFilterExpr),""," or ") + "VAL(I"+TRANSFORM(nKC)+")>0"
ENDFOR 
cFieldsExpr="INSERT INTO "+this.cKQCursor+"("+cFieldsExpr1+") select "+cFieldsExpr2+" from "+cCursor
&cFieldsExpr
this.cFilterExpr=cFilterExpr 
SELECT (thisform.cKQCursor)
SET FILTER TO 
IF this.bHideNoData
	SET FILTER TO &cFilterExpr 
ENDIF 
GOTO TOP 

=CloseAlias(cCursor)

 
*!*ˢ����������
LOCAL cFieldsList
cFieldsList="select c.ְԱ���,c.����"
FOR i=1 TO this.Grid1.ColumnCount-3
	LOCAL oColumn as Column
	oColumn=this.Grid1.Columns[3+i]
	LOCAL nKC
	nKC=oColumn.�δ�
	cFieldsList = cFieldsList + CHR(13) + CHR(10) + ",dbo.��ѯ���̿�ʱ1(@У��,@ѧ��,@�꼶,@�γ�����,@���,"+TRANSFORM(nKC)+",c.����) as I"+TRANSFORM(nKC)
ENDFOR
LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int
SET @У��='<<cXQ>>'
SET @ѧ��='<<cXN>>'
SET @�꼶='<<cNJ>>'
SET @�γ�����='<<cKC>>'
SET @���='<<cBB>>'
SET @���=<<nYear>>
SET @�·�=<<nMonth>>

<<cFieldsList>>
from ְԱ���� c
where c.���� in (select a.���� from ���̿��ڱ� a inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� 
where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)
order by c.����
ENDTEXT 

cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ������Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 


LOCAL cFieldsExpr1,cFieldsExpr2,cFieldsExpr
cFieldsExpr1="ѧ��,ѧ�����,ѧ������"
cFieldsExpr2=".f.,ְԱ���,����"
FOR i=1 TO this.Grid1.ColumnCount-3
	LOCAL oColumn as Column
	oColumn=this.Grid1.Columns[3+i]
	LOCAL nKC
	nKC=oColumn.�δ�
	cFieldsExpr1 = cFieldsExpr1 + ",I" + TRANSFORM(nKC)
	cFieldsExpr1 = cFieldsExpr1 + ",Q" + TRANSFORM(nKC)
	cFieldsExpr2 = cFieldsExpr2 + ",I" + TRANSFORM(nKC)
	cFieldsExpr2 = cFieldsExpr2 + ",I" + TRANSFORM(nKC)
ENDFOR 
cFieldsExpr="INSERT INTO "+this.cKQCursor+"("+cFieldsExpr1+") select "+cFieldsExpr2+" from "+cCursor
&cFieldsExpr
=CloseAlias(cCursor)
SELECT (thisform.cKQCursor)
GOTO TOP 


this.Grid1.Refresh
ENDPROC
PROCEDURE savedata
LOCAL cXQ,cXN,cNJ,cKC,cBB
cXQ=this.cXQ
cXN=this.cXN
cNJ=this.cNJ
cKC=this.cKC
cBB=this.cBB

LOCAL cSQL,cSQL1
cSQL=""

SELECT (thisform.cKQCursor)
SCAN
	FOR i=4 TO this.Grid1.ColumnCount
		LOCAL oColumn as Column
		oColumn=this.Grid1.Columns[i]
		
		IF !oColumn.Enabled
			LOOP 
		ENDIF 
		
		LOCAL cColumnName,cColumnNameQ	&&����ǰֵ
		cColumnName=oColumn.ControlSource
		cColumnNameQ=STRTRAN(cColumnName,"I","Q")
		
		IF ALLTRIM(NVL(&cColumnName,""))==ALLTRIM(NVL(&cColumnNameQ,""))
			LOOP 
		ENDIF 
		
		LOCAL nKC
		nKC=VAL(SUBSTR(oColumn.ControlSource,2))
		LOCAL a,b,c
		a=IIF(EMPTY(NVL(&cColumnName,"")),"0","1")
		b=IIF(ALLTRIM(NVL(&cColumnName,""))="���","1","0")
		c=IIF(INLIST(ALLTRIM(NVL(&cColumnName,"")),"","���"),"null",ALLTRIM(NVL(&cColumnName,"")))
		IF ѧ��
			TEXT TO cSQL1 NOSHOW TEXTMERGE 
IF exists(select * from ѧ���γ̿δα� where ѧ�����='<<ALLTRIM(ѧ�����)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>)
	UPDATE ѧ���γ̿δα�
	SET ��ǩ��=<<a>>
	,���=<<b>>
	,��ʱ��=<<c>>
	where ѧ�����='<<ALLTRIM(ѧ�����)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>
ELSE 
	INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�,��ǩ��,���,��ʱ��) VALUES ('<<ALLTRIM(ѧ�����)>>','<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>,<<a>>,<<b>>,<<c>>)
			ENDTEXT 
		ELSE 
			TEXT TO cSQL1 NOSHOW TEXTMERGE 
IF exists(select * from ���̿��ڱ� where ����='<<ALLTRIM(ѧ������)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>)
	UPDATE ���̿��ڱ�
	SET ��ʱ��=<<c>>
	where ����='<<ALLTRIM(ѧ������)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>
ELSE 
	INSERT INTO ���̿��ڱ�(����,У��,ѧ��,�꼶,�γ�����,���,�δ�,��ʱ��) VALUES ('<<ALLTRIM(ѧ������)>>','<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>,<<c>>)
			ENDTEXT 
		ENDIF 
		
		cSQL = cSQL + CHR(13) + CHR(10) + cSQL1
	ENDFOR 
ENDSCAN

IF !Execute(cSQL)
	MESSAGEBOX("��������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF

LOCAL cSQL2
cSQL2=""
FOR i=4 TO this.Grid1.ColumnCount
	LOCAL oColumn as Column
	oColumn=this.Grid1.Columns[i]
	LOCAL cColumnName
	cColumnName=oColumn.ControlSource
	LOCAL nKC
	nKC=VAL(SUBSTR(oColumn.ControlSource,2))
		
	cSQL2=	cSQL2 + CHR(13) + CHR(10) + TEXTMERGE("exec �����ſο�����Ϣ '<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>")
ENDFOR

IF !Execute(cSQL2)
	MESSAGEBOX("��������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("�������ݳɹ���",0+64,"ϵͳ��ʾ")
	this.RefreshKS

	this.bSaved=.t.
	this.RefreshClass(this.cXQ,this.cXN,this.cNJ,this.cKC,this.cBB)
	SELECT (this.cKQCursor)
	LOCAL cFieldsExpr
	cFieldsExpr=""
	FOR i=4 TO this.Grid1.ColumnCount
		LOCAL oColumn as Column,cField1,cField2
		oColumn=this.Grid1.Columns[i]
		IF !oColumn.Enabled
			LOOP 
		ENDIF 
		cField1=oColumn.ControlSource
		cField2=STRTRAN(cField1,"I","Q")
		cFieldsExpr = cFieldsExpr + IIF(EMPTY(cFieldsExpr),"",",") + cField2 + " with " + cField1
	ENDFOR 
	REPLACE &cFieldsExpr ALL 
	*this.RefreshKQ
ENDIF


ENDPROC
PROCEDURE onheadrightclick
IF this.bIsOk AND this.nVersion=2
	RETURN
ENDIF

=AEVENTS(arr,0)
LOCAL oHeader as Header
oHeader=arr[1]

LOCAL oColumn as Column
oColumn=oHeader.Parent

oColumn.SetFocus

LOCAL oCommandBar as XtremeCommandBars.ICommandBar
oCommandBar=this.oCommandBars.ContextMenus.Add(0,"��ݷ�ʽ")


oCommandBar.Controls.Add(1,1001,"����Ĭ��2Сʱ").Enabled=(!oColumn.���)
oCommandBar.Controls.Add(1,1002,"�����������").Enabled=(!oColumn.���)

IF this.nVersion<>2
	IF !oColumn.���
		WITH oCommandBar.Controls.Add(1,1003,"���") as XtremeCommandBars.ICommandBarControl
			.BeginGroup=.t.
			.Enabled=oColumn.Enabled
		ENDWITH
	ELSE 
		oCommandBar.Controls.Add(1,1004,"�����")
	ENDIF	
ENDIF
oCommandBar.Controls.Add(1,2001,"��������").Enabled=((!oColumn.���) and (!oColumn.��ǩ��))
oCommandBar.Controls.Add(1,2003,"������ʦ").Enabled=((!oColumn.���) and (!oColumn.��ǩ��))
oCommandBar.Controls.Add(1,2002,"ɾ�����ڿ�").Enabled=((!oColumn.���) and (!oColumn.��ǩ��))

LOCAL nResult
nResult=oCommandBar.ShowPopup(256)


LOCAL cControlSource
cControlSource=oColumn.ControlSource

LOCAL nKC
nKC=SUBSTR(oColumn.ControlSource,2)

DO CASE
	CASE nResult=2003	&&������ʦ
		IF !this.bSaved
			MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
			RETURN 
		ENDIF 
		LOCAL cTeacher
		DO FORM frm_f7 WITH null,"select ְԱ���,���� from ְԱ���� order by ����","����" TO cTeacher
		IF EMPTY(NVL(cTeacher,""))
			RETURN
		ENDIF
		LOCAL cSQL
		TEXT TO cSQL NOSHOW TEXTMERGE
update �༶�ſα� set �ο���ʦ='<<cTeacher>>'
where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>' and �δ�=<<nKC>>
	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)
		ENDTEXT
		IF Execute(cSQL)
			MESSAGEBOX("�����ο���ʦ�ɹ�(�����п��ڲ�����)��",0+64,"ϵͳ��ʾ")
			this.RefreshKQ
		ELSE
			MESSAGEBOX("�����ο���ʦʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF
	CASE nResult=2002	&&ɾ�����ڿ�
		IF !this.bSaved
			MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
			RETURN 
		ENDIF 
		IF MESSAGEBOX("�����Ҫɾ�����ڿ������п��ڲ�ɾ������",1+32,"ϵͳ��ʾ")<>1
			RETURN
		ENDIF
		LOCAL cSQL
		TEXT TO cSQL NOSHOW TEXTMERGE
DELETE FROM �༶�ſα�
WHERE У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND �꼶='<<this.cNJ>>' AND �γ�����='<<this.cKC>>' AND ���='<<this.cBB>>' AND �δ�=<<nKC>>
	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)
		ENDTEXT
		IF Execute(cSQL)
			MESSAGEBOX("ɾ���ɹ���",0+64,"ϵͳ��ʾ")
			this.RefreshKQ
		ELSE
			MESSAGEBOX("ɾ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF
	CASE nResult=2001	&&��������
		IF !this.bSaved
			MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
			RETURN 
		ENDIF 
		LOCAL cSKRQ
		cSKRQ=this.GetRQ()
		IF EMPTY(cSKRQ)
			RETURN
		ENDIF
		LOCAL cSQL
		TEXT TO cSQL NOSHOW TEXTMERGE
DECLARE @�Ͽ����� datetime
SET @�Ͽ�����=CAST('<<SUBSTR(cSKRQ,1,4)+"-"+SUBSTR(cSKRQ,5,2)+"-"+SUBSTR(cSKRQ,7,2)>>' as datetime)
update �༶�ſα� set �Ͽ�����=@�Ͽ�����
where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>' and �δ�=<<nKC>>
		ENDTEXT
		IF Execute(cSQL)
			MESSAGEBOX("�������ڳɹ���",0+64,"ϵͳ��ʾ")
			oColumn.�Ͽ�����=CTOD(SUBSTR(cSKRQ,1,4)+"-"+SUBSTR(cSKRQ,5,2)+"-"+SUBSTR(cSKRQ,7,2))
			this.SetColumn(oColumn)
		ELSE
			MESSAGEBOX("��������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF

	CASE nResult=1001
		SELECT (thisform.cKQCursor)
		REPLACE &cControlSource WITH TRANSFORM(thisform.nDCKS) ALL
		thisform.Grid1.Refresh
		thisform.bSaved=.f.
	CASE nResult=1002
		SELECT (thisform.cKQCursor)
		REPLACE &cControlSource WITH "" ALL
		thisform.Grid1.Refresh
		thisform.bSaved=.f.
	CASE nResult=1003
		IF !thisform.bSaved
			MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
			RETURN .f.
		ENDIF
		LOCAL cSQL
		cSQL="update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='"+this.cXQ+"' and ѧ��='"+this.cXN+"' and �꼶='"+this.cNJ+"' and �γ�����='"+this.cKC+"' and ���='"+this.cBB+"' and �δ�="+TRANSFORM(nKC)
		IF Execute(cSQL)
			oColumn.���=.t.
			this.SetColumn(oColumn)
		ELSE
			MESSAGEBOX("���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF
	CASE nResult=1004
		IF !thisform.bSaved
			MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
			RETURN .f.
		ENDIF
		LOCAL cSQL
		cSQL="update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='"+this.cXQ+"' and ѧ��='"+this.cXN+"' and �꼶='"+this.cNJ+"' and �γ�����='"+this.cKC+"' and ���='"+this.cBB+"' and �δ�="+TRANSFORM(nKC)
		IF Execute(cSQL)
			oColumn.���=.f.
			this.SetColumn(oColumn)
		ELSE
			MESSAGEBOX("�����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF
	OTHERWISE

ENDCASE

ENDPROC
PROCEDURE onvaluechange
this.bSaved=.f.
=AEVENTS(arr,0)
LOCAL o as ComboBox
o=arr[1]
LOCAL oCol as Column
oCol=o.Parent
IF oCol.����
	LOCAL cSQL
	
ENDIF 
ENDPROC
PROCEDURE bsaved_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bSaved = m.vNewVal
this.LabelUnsave.Visible=!m.vNewVal
this.oCmdSave.Enabled=!m.vNewVal
this.oCmdCancel.Enabled=!m.vNewVal
this.oCmdReOrder.Enabled=m.vNewVal
ENDPROC
PROCEDURE refreshclasses
FOR i=this.Container1.ControlCount TO 1 STEP -1
	LOCAL oControl as Control
	oControl=this.Container1.Controls[i]
	this.Container1.RemoveObject(oControl.Name)
ENDFOR 

LOCAL cSQL,cCursor
IF this.bHideNoData
	cSQL=TEXTMERGE("select * from dbo.��ʦ����('<<this.cXQ>>','<<this.cXN>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) where ǩ������>0 order by �꼶���,�γ�����,���")
ELSE
	cSQL=TEXTMERGE("select * from dbo.��ʦ����('<<this.cXQ>>','<<this.cXN>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) order by �꼶���,�γ�����,���")
ENDIF 
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ�༶��Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL oFirstBB as ��� OF "d:\wisemis3\��ά.vcx",oLastBB as ��� OF "d:\wisemis3\��ά.vcx"
LOCAL oSelectedBB as ��� OF "d:\wisemis3\��ά.vcx"

LOCAL m.nTop,nLeft,cLastNJ
cLastNJ=""
m.nTop=5
nLeft=5
LOCAL nAllHeight
nAllHeight=this.Container1.Height
SELECT (cCursor)
SCAN 
	LOCAL cName
	cName="_"+SYS(2007,(�꼶)+ALLTRIM(�γ�����)+ALLTRIM(���))
	this.Container1.AddObject(cName,"���")
	LOCAL oBB as ��� OF "d:\wisemis3\��ά.vcx"
	oBB=EVALUATE("this.Container1."+cName)
	
	IF EMPTY(cLastNJ)
		cLastNJ=ALLTRIM(�꼶)
	ENDIF 
	
	oBB.Left=nLeft
	oBB.Top=m.nTop
	
	cLastNJ=ALLTRIM(�꼶)
	
	IF oBB.Left+oBB.Width+5+oBB.Width+5>this.Container1.Width
		nLeft=5
		m.nTop = m.nTop + oBB.Height + 5
	ELSE 
		nLeft = nLeft + oBB.Width + 5
	ENDIF 
	
	oBB.cXQ=ALLTRIM(У��)
	oBB.cXN=ALLTRIM(ѧ��)
	oBB.cNJ=ALLTRIM(�꼶)
	oBB.cKC=ALLTRIM(�γ�����)
	oBB.cBB=ALLTRIM(���)
	oBB.bHasImage=NVL(HasImage,.f.)
	oBB.nYear=���
	oBB.nMonth=�·�
	oBB.nTotal=NVL(����,0)
	oBB.nTotal1=NVL(ǩ������,0)
	oBB.nTotal2=NVL(��˴���,0)
	oBB.nTotal3=NVL(ȷ�ϴ���,0)
	oBB.cBJLX=ALLTRIM(NVL(�༶����,"�а�"))
	oBB.cSKZQ=ALLTRIM(NVL(�Ͽ�����,"���"))
	oBB.cSKSJ=ALLTRIM(NVL(�Ͽ�ʱ��,"���"))
	oBB.bXYZJ=NVL(��Ҫ����,.f.)
	oBB.bBK=NVL(����,.f.)
		
	IF VARTYPE(oFirstBB)<>"O"
		oFirstBB=oBB
	ENDIF 
	
	IF this.cXQ=oBB.cXQ AND this.cXN=oBB.cXN AND this.cNJ=oBB.cNJ AND this.cKC=oBB.cKC AND this.cBB=oBB.cBB
		oBB.BorderColor=RGB(0,0,255)
		oBB.BorderWidth=3
		oSelectedBB=oBB
	ENDIF 
	
	oBB.ShowClass()
	
	=BINDEVENT(oBB,"Click",this,"OnBBClick")
	=BINDEVENT(oBB,"RightClick",this,"OnBBRightClick")
	
	oBB.Visible= .T.
	oLastBB=oBB
	
	IF oBB.Top+oBB.Height+5>nAllHeight
		nAllHeight=oBB.Top+oBB.Height+5
	ENDIF 
ENDSCAN 
=CloseAlias(cCursor)


LOCAL cSQL,cCursor
cCursor=SYS(2015)
TEXT TO cSQL NOSHOW TEXTMERGE 
select c.У��,c.ѧ��,c.�꼶
,c.�γ�����
,c.�ο���ʦ
,c.���
,c.�·�
,c.�༶����
,SUM(ǩ������) as ��ʱ
,(select sum(a.��ʱ��)/2.0
	from ѧ���γ̿δα� a 
		inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ�
		inner join �༶�γ̱� d on d.У��=b.У�� and d.ѧ��=b.ѧ�� and d.�꼶=b.�꼶 and d.�γ�����=b.�γ����� and d.���=b.���
	where a.У��=c.У�� and a.ѧ��=c.ѧ�� and a.�꼶=c.�꼶 and a.�γ�����=c.�γ����� and b.�ο���ʦ=c.�ο���ʦ and year(b.�Ͽ�����)=c.��� and month(b.�Ͽ�����)=c.�·� and d.�༶����=c.�༶����
		and ISNULL(a.��ʱ��,0)>0
		and a.�༶���� not in ('��ҵ��','���԰�')
) as �˴�
from �༶�·ݿ�����ͼ c
where c.У��='<<this.cXQ>>' and c.ѧ��='<<this.cXN>>' and c.�ο���ʦ='<<this.cTeacher>>' and c.���=<<this.nYear>> and c.�·�=<<this.nMonth>>
group by c.У��,c.ѧ��,c.�꼶,c.�γ�����,c.�ο���ʦ,c.���,c.�·�,c.�༶����
order by c.�꼶,c.�γ�����,c.�༶����
ENDTEXT

IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ������Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 


SELECT (thisform.cNJCursor)
ZAP 
INSERT INTO (thisform.cNJCursor)(�꼶,��Ŀ,�༶����,��ʱ,�˴�) SELECT �꼶,�γ�����,�༶����,��ʱ,�˴� FROM (cCursor)
=CloseAlias(cCursor)
SELECT (thisform.cNJCursor)
GOTO TOP 
this.Grid2.Refresh


LOCAL cSQL,cCursor
cCursor=SYS(2015)
TEXT TO cSQL NOSHOW TEXTMERGE 
select c.У��,c.ѧ��,c.�꼶
,c.�γ�����
,c.���
,c.�ο���ʦ
,c.���
,c.�·�
,ǩ������ as ��ʱ
,(select sum(a.��ʱ��)/2.0 
	from ѧ���γ̿δα� a 
		inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ�
	where a.У��=c.У�� and a.ѧ��=c.ѧ�� and a.�꼶=c.�꼶 and a.�γ�����=c.�γ����� and a.���=c.��� and b.�ο���ʦ=c.�ο���ʦ and year(b.�Ͽ�����)=c.��� and month(b.�Ͽ�����)=c.�·�
		and ISNULL(a.��ʱ��,0)>0
		and a.�༶���� not in ('��ҵ��','���԰�')
) as �˴�
from �༶�·ݿ�����ͼ c
where c.У��='<<this.cXQ>>' and c.ѧ��='<<this.cXN>>' and c.�ο���ʦ='<<this.cTeacher>>' and c.���=<<this.nYear>> and c.�·�=<<this.nMonth>>
order by c.�꼶,c.�γ�����,c.���
ENDTEXT
*[��ѯ���¿�ʱ2](@��� [int], @�·� [int], @У�� [varchar](50), @ѧ�� [varchar](50), @�꼶 [varchar](50), @�γ����� [varchar](50), @��� [varchar](50),@�ο���ʦ varchar(50))
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ������Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

SELECT (thisform.cBJCursor)
ZAP 
INSERT INTO (thisform.cBJCursor)(�꼶,��Ŀ,���,��ʱ,�˴�) SELECT �꼶,�γ�����,���,��ʱ,�˴� FROM (cCursor)
=CloseAlias(cCursor)
SELECT (thisform.cBJCursor)
GOTO TOP 
this.Grid3.RecordSource=thisform.cBJCursor
this.Grid3.Column1.Width=80
this.Grid3.Column2.Width=80
this.Grid3.Column3.Width=80
this.Grid3.Column4.Width=70
this.Grid3.Column5.Width=70
this.Grid3.Column1.ControlSource="�꼶"
this.Grid3.Column2.ControlSource="��Ŀ"
this.Grid3.Column3.ControlSource="���"
this.Grid3.Column4.ControlSource="��ʱ"
this.Grid3.Column5.ControlSource="�˴�"
this.Grid3.Refresh	

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * from �༶�ſα� where �ο���ʦ='<<this.cTeacher>>' AND У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND YEAR(�Ͽ�����)=<<this.nYear>> and MONTH(�Ͽ�����)=<<this.nMonth>> and ISNULL(ȷ��,0)=0)
	SELECT 1
ELSE 
	SELECT 0
ENDTEXT 
IF GetValue(cSQL)=1
	this.oBtnOK.Caption="ȷ��"
	this.oBtnOK.Enabled= .T.
	this.oBtnCancelOK.Enabled= .F.
ELSE 
	this.bIsOk=.t.
	this.oBtnOK.Caption="��ȷ��"
	this.oBtnOK.Enabled= .F.
	this.oBtnCancelOK.Enabled= .T.
	IF this.nVersion=2
		this.oCmdSave.Enabled= .F.
		this.oBtnDefault.Enabled= .F.
		this.oCmdClear.Enabled= .F.
		this.oCmdAuditAll.Enabled= .F.
		this.oCmdUnAuditAll.Enabled= .F.
		this.oCmdAuditAll2.Enabled= .F.
		this.oCmdUnAuditAll2.Enabled= .F.
	ENDIF 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * from �༶�ſα� where �ο���ʦ='<<this.cTeacher>>' AND У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND YEAR(�Ͽ�����)=<<this.nYear>> and MONTH(�Ͽ�����)=<<this.nMonth>> and ISNULL(���,0)=0)
	SELECT 1
ELSE 
	SELECT 0
ENDTEXT 
IF GetValue(cSQL)=1
	this.oBtnOK.Enabled= .F.
ENDIF 


IF VARTYPE(oSelectedBB)<>"O" AND VARTYPE(oFirstBB)="O"
	oSelectedBB=oFirstBB
ENDIF 
IF VARTYPE(oSelectedBB)="O"
	=RAISEEVENT(oSelectedBB,"Click")
ENDIF 

this.RefreshUpAndDown
ENDPROC
PROCEDURE onbbclick
IF !this.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

=AEVENTS(arr,0)
LOCAL oBB as ��� OF "d:\wisemis3\��ά.vcx"
oBB=arr[1]

this.Container1.SetAll("BorderWidth",1,"���")
this.Container1.SetAll("BorderColor",RGB(240,240,240),"���")
oBB.BorderWidth=2
oBB.BorderColor=RGB(0,0,255)

this.cXQ=oBB.cXQ
this.cXN=oBB.cXN
this.cNJ=oBB.cNJ
this.cKC=oBB.cKC
this.cBB=oBB.cBB
this.nYear=oBB.nYear
this.nMonth=oBB.nMonth
this.cBJLX=oBB.cBJLX
this.bXYZJ=oBB.bXYZJ
this.nDCKS=NVL(GetValue(TEXTMERGE("select ���ο�ʱ from �༶�γ̱� where У��='<<oBB.cXQ>>' and ѧ��='<<oBB.cXN>>' and �꼶='<<oBB.cNJ>>' and �γ�����='<<oBB.cKC>>' and ���='<<oBB.cBB>>'")),2)

this.RefreshKQ
ENDPROC
PROCEDURE cxq_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cXQ = m.vNewVal
this.LabelXQ.Caption=m.vNewVal
ENDPROC
PROCEDURE cxn_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cXN = m.vNewVal
this.LabelXN.Caption=m.vNewVal
ENDPROC
PROCEDURE cnj_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cNJ = m.vNewVal
this.LabelNJ.Caption=m.vNewVal
ENDPROC
PROCEDURE ckc_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cKC = m.vNewVal
this.LabelKC.Caption=m.vNewVal
ENDPROC
PROCEDURE cbb_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cBB = m.vNewVal
this.LabelBB.Caption=m.vNewVal
this.LabelBB.ToolTipText=m.vNewVal
ENDPROC
PROCEDURE cteacher_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cTeacher = m.vNewVal
this.oLabelTeacher.Caption=m.vNewVal
ENDPROC
PROCEDURE bshowsummary_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bShowSummary = m.vNewVal
this.Grid1.Anchor=0
this.ContainerReOrder.Anchor=0
IF m.vNewVal
	this.Grid1.Height = this.Grid1.Height - 228
	this.oCmdShowSummary.Caption="���ػ�����Ϣ"
ELSE 
	this.Grid1.Height = this.Grid1.Height + 228
	this.oCmdShowSummary.Caption="��ʾ������Ϣ"
ENDIF 
this.Grid1.Anchor=15
this.ContainerReOrder.Height=this.Grid1.Height
this.ContainerReOrder.Anchor=15
ENDPROC
PROCEDURE refreshgrid

this.Grid1.RecordSource=null
this.Grid1.ColumnCount=-1
this.Grid1.RecordSource=thisform.cKQCursor
this.Grid1.ColumnCount=23
FOR i=1 TO this.Grid1.ColumnCount
	WITH this.Grid1.Columns[i] as Column
		.Visible= .F.
	ENDWITH 
ENDFOR 

WITH this.Grid1.Columns[1] as Column
	.ControlSource="recno()"
	.Alignment= 2
	.Width=30
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	.DynamicBackColor="RGB(240,240,240)"
	WITH .Header1 as Header
		.Caption="���"
		.Alignment= 2
	ENDWITH 
ENDWITH 

WITH this.Grid1.Columns[2] as Column
	.ControlSource="ѧ�����"
	.Width=80
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	WITH .Header1 as Header
		.Caption="���"
		.Alignment= 2
	ENDWITH 
	.DynamicBackColor="iif(ѧ��,RGB(255,255,255),RGB(140,140,140))"
ENDWITH 

WITH this.Grid1.Columns[3] as Column
	.ControlSource="ѧ������"
	.Width=80
	.Visible= .T.
	.Enabled= .F.
	.ReadOnly= .T.
	WITH .Header1 as Header
		.Caption="ѧ�� or ����"
		.Alignment= 2
	ENDWITH 
	.DynamicBackColor="iif(ѧ��,RGB(255,255,255),RGB(140,140,140))"
ENDWITH 

FOR i=1 TO 20
	WITH this.Grid1.Columns[3+i] as Column
		.ControlSource="I"+TRANSFORM(i)
		.Width=80
		WITH .Header1 as Header
			.Alignment= 2
		ENDWITH 
		=BINDEVENT(.Header1,"RightClick",this,"OnHeadRightClick")
		LOCAL cTempName
		cTempName=SYS(2015)
		.AddObject(cTempName,"ComboBox_")
		WITH .Controls[3] as ComboBox
			.Style= 2
			.RowSourceType= 0
			.AddItem("2")
			.AddItem("1")
			.AddItem("")
			.Alignment= 2
			.Visible= .T.
		ENDWITH 
		=BINDEVENT(.Controls[3],"InteractiveChange",this,"OnValueChange")
		=BINDEVENT(.Controls[3],"When",this,"OnWhen")
		.CurrentControl=cTempName
		.Alignment= 2
		.DynamicBackColor="ICASE(ALLTRIM(I"+TRANSFORM(i)+")=[9],RGB(0,0,0),INLIST(ALLTRIM(I"+TRANSFORM(i)+"),[2],[2.00]),RGB(0,255,0),INLIST(ALLTRIM(I"+TRANSFORM(i)+"),[1],[1.00]),RGB(192,192,192),RGB(255,255,255))"
	ENDWITH 
ENDFOR 
ENDPROC
PROCEDURE onwhen
*!*	=AEVENTS(arr,0)
*!*	LOCAL oComboBox as ComboBox
*!*	oComboBox=arr[1]
*!*	LOCAL oColumn as Column
*!*	oColumn=oComboBox.Parent

*!*	SELECT (this.cKQCursor)
*!*	LOCAL cValue
*!*	cValue=EVALUATE(oComboBox.ControlSource)
*!*	oComboBox.Clear
*!*	oComboBox.AddItem("2")
*!*	oComboBox.AddItem("1")
*!*	oComboBox.AddItem("")
*!*	IF !oColumn.����
*!*		oComboBox.AddItem("���")
*!*	ENDIF 
ENDPROC
PROCEDURE getrq
LOCAL cRQ
LOCAL mm
IF thisform.nMonth<10
	mm="0"+TRANSFORM(thisform.nMonth)
ELSE 
	mm=TRANSFORM(thisform.nMonth)
ENDIF 
	

cRQ=INPUTBOX("����������(��ʽ��YYYYMMDD����"+DTOS(DATE())+")��","�趨����",TRANSFORM(thisform.nYear)+mm)
IF LEN(cRQ)<>8
	MESSAGEBOX("��������λ�����ԣ�",0+64,"ϵͳ��ʾ")
	RETURN ""
ENDIF 
IF VAL(LEFT(cRQ,4))<2015
	MESSAGEBOX("�������ڲ��Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN ""
ENDIF 
IF !BETWEEN(VAL(SUBSTR(cRQ,5,2)),1,12)
	MESSAGEBOX("�������ڲ��Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN ""
ENDIF 
IF !BETWEEN(VAL(SUBSTR(cRQ,7,2)),1,31)
	MESSAGEBOX("�������ڲ��Ϸ���",0+64,"ϵͳ��ʾ")
	RETURN ""
ENDIF

RETURN cRQ
ENDPROC
PROCEDURE bchecked_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bchecked = m.vNewVal

ENDPROC
PROCEDURE onafterrowcolchange
LPARAMETERS nColIndex
SELECT (thisform.cKQCursor)
thisform.oCmdDeleteLine.Enabled=!ѧ��
thisform.oCmdDeleteStudent.Enabled=ѧ��
ENDPROC
PROCEDURE bxyzj_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bXYZJ = m.vNewVal
this.oCmdNewZJ.Enabled=m.vNewVal
ENDPROC
PROCEDURE bshowalldays_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.bShowAllDays = m.vNewVal
this.RefreshKQ
ENDPROC
PROCEDURE refreshupanddown
this.oCmdUp.Enabled= .F.
this.oCmdDown.Enabled= .F.
IF this.Container1.ControlCount=0
	RETURN 
ENDIF 

LOCAL oFirstControl as Control,oLastControl as Control
oFirstControl=this.Container1.Controls[1]
oLastControl=this.Container1.Controls[this.Container1.ControlCount]

IF oFirstControl.Top<5
	this.oCmdUp.Enabled= .T.
ENDIF 

IF oLastControl.Top+oLastControl.Height>this.Container1.Height
	this.oCmdDown.Enabled= .T.
ENDIF 

ENDPROC
PROCEDURE setlessiontime
=AEVENTS(arr,0)
LOCAL oHeader as Header
oHeader=arr[1]
LOCAL oColumn as Column
oColumn=oHeader.Parent
LOCAL cSKSJ
cSKSJ=oColumn.�Ͽ�ʱ��
IF oColumn.���
	RETURN 
ENDIF 

LOCAL cSQL,cCursor
cSQL="select * from �Ͽ�ʱ��� where У��='"+this.cXQ+"' and ѧ��='"+this.cXN+"'"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ�Ͽ�ʱ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL oCommandBar as XtremeCommandBars.ICommandBar
oCommandBar=this.oCommandbars.ContextMenus.Add(0,"��ݷ�ʽ")
SELECT (cCursor)
IF RECCOUNT()=0
	MESSAGEBOX("û�ж�ȡ���Ͽ�ʱ�䣡",0+64,"ϵͳ��ʾ")
	=CloseAlias(cCursor)
	RETURN 
ENDIF 

LOCAL cSW1,cSW2,cXW1,cXW2,cWS
cSW1=ALLTRIM(����1)
cSW2=ALLTRIM(����2)
cXW1=ALLTRIM(����1)
cXW2=ALLTRIM(����2)
cWS=ALLTRIM(����)


oCommandBar.Controls.Add(8,1000,"�����Ͽ�ʱ��")
oCommandBar.Controls.Add(1,1001,cSW1).Checked=IIF(cSKSJ=cSW1,.t.,.f.)
oCommandBar.Controls.Add(1,1002,cSW2).Checked=IIF(cSKSJ=cSW2,.t.,.f.)
oCommandBar.Controls.Add(1,1003,cXW1).Checked=IIF(cSKSJ=cXW1,.t.,.f.)
oCommandBar.Controls.Add(1,1004,cXW2).Checked=IIF(cSKSJ=cXW2,.t.,.f.)
oCommandBar.Controls.Add(1,1005,cWS).Checked=IIF(cSKSJ=cWS,.t.,.f.)
oCommandBar.Controls.Add(1,2000,"�Զ���...")
LOCAL nResult
nResult=oCommandBar.ShowPopup(256)
LOCAL cSQL,cXQ,cXN,cNJ,cKC,cBB,nKC
cXQ=this.cXQ
cXN=this.cXN
cNJ=this.cNJ
cKC=this.cKC
cBB=this.cBB
nKC=oColumn.�δ�
DO CASE
CASE nResult=1001
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cSW1>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cSW1
CASE nResult=1002
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cSW2>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cSW2
CASE nResult=1003
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cXW1>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cXW1
CASE nResult=1004
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cXW2>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cXW2
CASE nResult=1005
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cWS>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cWS
CASE nResult=2000
	LOCAL cCustomSKSD
	cCustomSKSD=INPUTBOX("�������Ͽ�ʱ�Σ���ʽ��hh:mm-hh:mm����","�Զ���ʱ��","08:00-10:00")
	IF EMPTY(cCustomSKSD)
		RETURN 
	ENDIF 
	
	IF !ISDIGIT(SUBSTR(cCustomSKSD,1,2)) OR !BETWEEN(VAL(SUBSTR(cCustomSKSD,1,2)),6,24)
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF SUBSTR(cCustomSKSD,3,1)<>":"
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF !ISDIGIT(SUBSTR(cCustomSKSD,4,2)) OR !BETWEEN(VAL(SUBSTR(cCustomSKSD,4,2)),0,60)
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF SUBSTR(cCustomSKSD,6,1)<>"-"
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF !ISDIGIT(SUBSTR(cCustomSKSD,7,2)) OR !BETWEEN(VAL(SUBSTR(cCustomSKSD,7,2)),6,24)
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF SUBSTR(cCustomSKSD,9,1)<>":"
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF !ISDIGIT(SUBSTR(cCustomSKSD,10,2)) OR !BETWEEN(VAL(SUBSTR(cCustomSKSD,10,2)),0,60)
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	IF VAL(SUBSTR(cCustomSKSD,7,2))*60+VAL(SUBSTR(cCustomSKSD,10,2))-VAL(SUBSTR(cCustomSKSD,1,2))*60-VAL(SUBSTR(cCustomSKSD,4,2))<=0
		MESSAGEBOX("��ʽ���Ϸ���",0+64,"ϵͳ��ʾ")
		RETURN 
	ENDIF 
	cSQL=TEXTMERGE("update �༶�ſα� set �Ͽ�ʱ��='<<cCustomSKSD>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>")
	cSKSJ=cCustomSKSD
OTHERWISE
	RETURN 
ENDCASE

IF Execute(cSQL)
	oColumn.�Ͽ�ʱ��=cSKSJ
	this.SetColumn(oColumn)
ELSE 
	MESSAGEBOX("�����Ͽ�ʱ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
PROCEDURE addstudent
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int,@�꼶1 varchar(50),@�꼶2 varchar(50),@�꼶��� int
set @У��='<<thisform.cXQ>>'
set @ѧ��='<<thisform.cXN>>'
set @�꼶='<<thisform.cNJ>>'
set @�γ�����='<<thisform.cKC>>'
set @���='<<thisform.cBB>>'
set @���=<<thisform.nYear>>
set @�·�=<<thisform.nMonth>>

SET @�꼶���=(select ��� from �꼶�� where �꼶=@�꼶)
SET @�꼶1=(select top 1 �꼶 from �꼶�� where ���>@�꼶��� order by ���)
SET @�꼶2=(select top 1 �꼶 from �꼶�� where ���<@�꼶��� order by ��� desc)

declare @�༶���� varchar(50)
set @�༶����=(select �༶���� from �༶�γ̱� with(nolock) where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)

SELECT ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰
FROM ��ѧ�ǼǱ� a with(nolock)
WHERE (a.�꼶 in (@�꼶,@�꼶1,@�꼶2)
		or exists(select * from ѧ��������Ϣ with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and �༶����=@�༶����)
		or @�꼶='����'
	)
		and not exists(select * 
						from ѧ���γ̿δα� d with(nolock) inner join �༶�ſα� e with(nolock) on d.У��=e.У�� and d.ѧ��=e.ѧ�� and d.�꼶=e.�꼶 and d.�γ�����=e.�γ����� and d.���=e.��� and d.�δ�=e.�δ�
						where d.ѧ�����=a.ѧ�����
							and d.У��=@У�� and d.ѧ��=@ѧ�� and d.�꼶=@�꼶 and d.�γ�����=@�γ����� and d.���=@���
							and year(e.�Ͽ�����)=@��� and month(e.�Ͽ�����)=@�·�
						)
order by ѧ������
ENDTEXT 
LOCAL cXSBH,cXSXM
DO FORM frm_f7 WITH null,cSQL,"ѧ�����" TO cXSBH
IF EMPTY(NVL(cXSBH,""))
	RETURN .f.
ENDIF 

cXSXM=GetValue("select ѧ������ from ��ѧ�ǼǱ� with(nolock) where ѧ�����='"+cXSBH+"'")

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@ѧ����� varchar(50)
set @У��='<<thisform.cXQ>>'
set @ѧ��='<<thisform.cXN>>'
set @�꼶='<<thisform.cNJ>>'
set @�γ�����='<<thisform.cKC>>'
set @���='<<thisform.cBB>>'
SET @ѧ�����='<<cXSBH>>'

IF NOT exists(select * from ѧ���γ̱� where ѧ�����=@ѧ����� AND У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)
	INSERT INTO ѧ���γ̱�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���) VALUES (@ѧ�����,@У��,@ѧ��,@�꼶,@�γ�����,@���)
INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�)
	SELECT @ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�
	from �༶�ſα� a with(nolock)
	where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@��� and ISNULL(���,0)=0
		and not exists(select * from ѧ���γ̿δα� with(nolock) where ѧ�����=@ѧ����� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)
ENDTEXT 
IF Execute(cSQL)
	SELECT (this.cKQCursor)
	APPEND BLANK
	REPLACE ѧ�� WITH .t.,ѧ����� WITH cXSBH,ѧ������ WITH cXSXM
	this.Grid1.Refresh
	RETURN .t.
ELSE
	MESSAGEBOX("����ѧ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
ENDPROC
PROCEDURE setcolumn
LPARAMETERS oColumn as Column
IF VARTYPE(oColumn)<>"O"
	RETURN
ENDIF

WITH oColumn as Column
	WITH .Header1 as Header
		IF this.bShowAllDays
			.Caption=TRANSFORM(MONTH(oColumn.�Ͽ�����))+"��"+TRANSFORM(DAY(oColumn.�Ͽ�����))+"��"
		ELSE
			.Caption=TRANSFORM(DAY(oColumn.�Ͽ�����))+"��"
		ENDIF
		.Caption = .Caption + IIF(oColumn.����," ��","")+IIF(oColumn.���," ��","")
		IF !EMPTY(oColumn.�Ͽ�ʱ��)
			.Caption = .Caption + CHR(13) + CHR(10) + oColumn.�Ͽ�ʱ��
		ELSE
			.Caption = .Caption + CHR(13) + CHR(10) + "�����趨ʱ��"
		ENDIF
		.Forecolor=RGB(0,0,0)
		IF oColumn.����
			.Forecolor=RGB(0,0,255)
		ENDIF
		IF oColumn.���
			.Forecolor=RGB(255,0,0)
		ENDIF
	ENDWITH

	IF oColumn.����
		.DynamicForeColor="RGB(0,0,255)"
	ELSE
		.DynamicForeColor="ICASE(ALLTRIM(I"+TRANSFORM(oColumn.�δ�)+")=[���],RGB(255,0,0),RGB(0,0,0))"
	ENDIF
	.Enabled=oColumn.��Ч and !oColumn.��� and !EMPTY(oColumn.�Ͽ�ʱ��)
ENDWITH

ENDPROC
PROCEDURE refreshclass
LPARAMETERS cXQ,cXN,cNJ,cKC,cBB

LOCAL cSQL,cCursor
IF this.bHideNoData
	cSQL=TEXTMERGE("select * from dbo.�༶����('<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) where ǩ������>0 order by �꼶���,�γ�����,���")
ELSE
	cSQL=TEXTMERGE("select * from dbo.�༶����('<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) order by �꼶���,�γ�����,���")
ENDIF 
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ�༶��Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL oFirstBB as ��� OF "d:\wisemis3\��ά.vcx",oLastBB as ��� OF "d:\wisemis3\��ά.vcx"
LOCAL oSelectedBB as ��� OF "d:\wisemis3\��ά.vcx"

LOCAL m.nTop,nLeft,cLastNJ
cLastNJ=""
m.nTop=5
nLeft=5
LOCAL nAllHeight
nAllHeight=this.Container1.Height
SELECT (cCursor)
SCAN 
	LOCAL cName
	cName="_"+SYS(2007,(�꼶)+ALLTRIM(�γ�����)+ALLTRIM(���))
	IF TYPE("this.Container1."+cName)<>"O"
		=CloseAlias(cCursor)
		RETURN 
	ENDIF 
	
	LOCAL oBB as ��� OF "d:\wisemis3\��ά.vcx"
	oBB=EVALUATE("this.Container1."+cName)
	
	oBB.bHasImage=NVL(HasImage,.f.)
	
	oBB.nTotal=NVL(����,0)
	oBB.nTotal1=NVL(ǩ������,0)
	oBB.nTotal2=NVL(��˴���,0)
	oBB.nTotal3=NVL(ȷ�ϴ���,0)
	oBB.cBJLX=ALLTRIM(NVL(�༶����,"�а�"))
	oBB.cSKZQ=ALLTRIM(NVL(�Ͽ�����,"���"))
	oBB.cSKSJ=ALLTRIM(NVL(�Ͽ�ʱ��,"���"))
	oBB.bXYZJ=NVL(��Ҫ����,.f.)
	oBB.bBK=NVL(����,.f.)
	
	oBB.ShowClass()

ENDSCAN 
=CloseAlias(cCursor)
ENDPROC
PROCEDURE refreshimage

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * from ����ͼƬ�� with(nolock) WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>' AND ���=<<thisform.nYear>> and �·�=<<thisform.nMonth>>)
	SELECT 1
ELSE 
	SELECT 0
ENDTEXT 
IF GetValue(cSQL)=1
	this.LabelNoImage.Visible= .F.
ELSE 
	this.LabelNoImage.Visible= .T.
ENDIF 
ENDPROC
PROCEDURE onbbrightclick
IF !this.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

=AEVENTS(arr,0)
LOCAL oBB as ��� OF "d:\wisemis3\��ά.vcx"
oBB=arr[1]

IF !oBB.bBK
	RETURN 
ENDIF 

LOCAL oCommandBar as XtremeCommandBars.ICommandBar
oCommandBar=this.oCommandbars.ContextMenus.Add(0,"��ݷ�ʽ")
oCommandBar.Controls.Add(1,1001,"ɾ���༶")

LOCAL nResult
nResult=oCommandBar.ShowPopup(256)
DO CASE
CASE nResult=1001
	IF MESSAGEBOX("�����Ҫɾ���˰༶��",1+32,"ϵͳ��ʾ")<>1
		RETURN 
	ENDIF 
	LOCAL cSQL
	cSQL="delete from �༶�γ̱� where У��='"+oBB.cXQ+"' and ѧ��='"+oBB.cXN+"' and �꼶='"+oBB.cNJ+"' and �γ�����='"+oBB.cKC+"' and ���='"+oBB.cBB+"'"
	IF Execute(cSQL)
		MESSAGEBOX("ɾ���༶�ɹ���",0+64,"ϵͳ��ʾ")
		thisform.RefreshClasses
	ELSE
		MESSAGEBOX("ɾ���༶ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	ENDIF 
OTHERWISE

ENDCASE
ENDPROC
PROCEDURE refreshks
this.oLabelKS.Caption=TRANSFORM(NVL(GetValue(TEXTMERGE("select dbo.��ѯ���¿�ʱ2(<<this.nYear>>,<<this.nMonth>>,'<<this.cXQ>>','<<this.cXN>>','<<this.cNJ>>','<<this.cKC>>','<<this.cBB>>','<<this.cTeacher>>')")),"δ֪"))
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
select COUNT(*) 
from �༶�ſα� with(nolock)
where У��='<<this.cXQ>>' 
	and ѧ��='<<this.cXN>>' 
	and �꼶='<<this.cNJ>>' 
	and �γ�����='<<this.cKC>>' 
	and ���='<<this.cBB>>' 
	and �ο���ʦ='<<this.cTeacher>>' 
	and YEAR(�Ͽ�����)=<<this.nYear>> 
	and MONTH(�Ͽ�����)=<<this.nMonth>> 
	and ��ʦǩ��=1
ENDTEXT 
this.LabelKS1.Caption=TRANSFORM(NVL(GetValue(cSQL),"δ֪"))
ENDPROC
PROCEDURE Resize
this.RefreshUpAndDown
ENDPROC
PROCEDURE Unload

=CloseAlias(thisform.cKQCursor)
=CloseAlias(thisform.cNJCursor)
=CloseAlias(thisform.cBJCursor)
ENDPROC
PROCEDURE Init
LPARAMETERS cXQ,cXN,cTeacher,nYear,nMonth,nVersion,bHideNoData	&&0 ����Ա�棬1 ����棬2 ��ʦ��
*!*	SET CLASSLIB TO Addons\��ά����\��ά.vcx ADDITIVE 

this.Caption="�˹�����    "+cTeacher+"    "+TRANSFORM(nYear)+" �� "+TRANSFORM(nMonth)+" ��"
IF VARTYPE(nVersion)<>"N"
	nVersion=0
ENDIF 
this.nVersion=nVersion
DO CASE
CASE nVersion=1
	this.oBtnOK.Visible= .F.
	this.oBtnCancelOK.Visible= .T.
CASE nVersion=2
	this.oCmdAuditAll.Visible= .F.
	this.oCmdAuditAll2.Visible= .F.
	this.oCmdUnAuditAll.Visible= .F.
	this.oCmdUnAuditAll2.Visible= .F.
	this.oBtnCancelOK.Visible= .F.
OTHERWISE

ENDCASE
this.bHideNoData=bHideNoData
this.Check2.Value=bHideNoData
*=RegisterForm(this)


this.cXQ=cXQ
this.cXN=cXN
this.cTeacher=cTeacher
this.nYear=nYear
this.nMonth=nMonth

this.RefreshGrid

this.Grid2.RecordSource=thisform.cNJCursor
this.Grid2.Column1.Width=80
this.Grid2.Column2.Width=80
this.Grid2.Column3.Width=70
this.Grid2.Column4.Width=70
this.Grid2.Column5.Width=80
this.Grid2.Column1.ControlSource="�꼶"
this.Grid2.Column2.ControlSource="��Ŀ"
this.Grid2.Column3.ControlSource="��ʱ"
this.Grid2.Column4.ControlSource="�˴�"
this.Grid2.Column5.ControlSource="�༶����"


this.Grid3.RecordSource=thisform.cBJCursor
this.Grid3.Column1.Width=80
this.Grid3.Column2.Width=80
this.Grid3.Column3.Width=80
this.Grid3.Column4.Width=70
this.Grid3.Column5.Width=70
this.Grid3.Column1.ControlSource="�꼶"
this.Grid3.Column2.ControlSource="��Ŀ"
this.Grid3.Column3.ControlSource="���"
this.Grid3.Column4.ControlSource="��ʱ"
this.Grid3.Column5.ControlSource="�˴�"

this.RefreshClasses

*!*���ػ�����Ϣ
RAISEEVENT(this.oCmdShowSummary,"Click")

this.WindowState= 2

ENDPROC
PROCEDURE Load
this.cKQCursor=SYS(2015)
this.cBJCursor=SYS(2015)
this.cNJCursor=SYS(2015)
=CloseAlias(this.cKQCursor)
SELECT 0
LOCAL cFieldsExpr
cFieldsExpr="ѧ�� L null,ѧ����� C(50),ѧ������ C(50)"
FOR i=1 TO 20
	cFieldsExpr = cFieldsExpr + "," + "I" + TRANSFORM(i) + " C(4) null"
	cFieldsExpr = cFieldsExpr + "," + "Q" + TRANSFORM(i) + " C(4) null"
ENDFOR 

*CREATE CURSOR (thisform.cKQCursor)(ѧ�� L null,ѧ����� C(50),ѧ������ C(50),I1 C(4) null,I2 C(4) null,I3 C(4) null,I4 C(4) null,I5 C(4) null,I6 C(4) null,I7 C(4) null,I8 C(4) null,I9 C(4) null,I10 C(4) null,I11 C(4) null,I12 C(4) null,I13 C(4) null,I14 C(4) null,I15 C(4) null,I16 C(4) null,I17 C(4) null,I18 C(4) null,I19 C(4) null,I20 C(4) null)
CREATE CURSOR (thisform.cKQCursor)(&cFieldsExpr)
=CloseAlias(thisform.cBJCursor)
SELECT 0
CREATE CURSOR (thisform.cBJCursor)(�꼶 C(50),��Ŀ C(50),��� C(50),��ʱ I null,�˴� N(11,2) null)

=CloseAlias(thisform.cNJCursor)
SELECT 0
CREATE CURSOR (thisform.cNJCursor)(�꼶 C(50),��Ŀ C(50),�༶���� C(50),��ʱ I null,�˴� N(11,2) null)
ENDPROC
PROCEDURE Activate
this.RefreshUpAndDown
ENDPROC
     �����    ��  ��                        �(   %   �      !�  �  E�          �  U  �  ��  � � � �� � �1 T� ��$ select * from У���� order by ˳����� T� �C��]�� %�C �  � � 
��� �( ��C� ��ȡУ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�� � ��CC� ��  � � �� � ��C � � �� ��C�  � �
 �  �	 �� U  THIS OCOMBOXQ CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM У�����
 CLOSEALIAS	 REFRESHXN DISPLAYVALUEO ��  Q� STRING� %�C�  ��� C� C�  ���D � T�  �C� � � ��� � �� � � � �� � �Y T� ��! select * from ѧ��� where У��='C�  ��! ' order by ��ǰѧ�� desc,��ʼ������ T� �C��]�� %�C �  � � 
���( ��C� ��ȡ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�:� ��CC�
 �� � �	 �� � ��C � � �� U  CXQ THIS OCOMBOXQ DISPLAYVALUE OCOMBOXN CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM ѧ��
 CLOSEALIAS�  ��  � � � �� � �2 T� ��% select �꼶 from �꼶�� order by ����� T� �C��]�� %�C �  � � 
��� �( ��C� ��ȡ�꼶ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�� � ��CC� ��  � � �� � ��C � � �� ��CC�  � �
 ��  �	 �� U  THIS OCOMBONJ CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM �꼶
 CLOSEALIAS	 REFRESHKC DISPLAYVALUEB ��  Q� STRING� �� � � � �� � �
 M(� `�� � declare @�꼶 varchar(50)� � set @�꼶='<<cNJ>>'� �  �, �& create table #tb(�γ����� varchar(50))� �  �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and Ӣ��=1)�1 �+ 	insert into #tb(�γ�����) values ('Ӣ��') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ѧ=1)�1 �+ 	insert into #tb(�γ�����) values ('��ѧ') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)�1 �+ 	insert into #tb(�γ�����) values ('����') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ѧ=1)�1 �+ 	insert into #tb(�γ�����) values ('��ѧ') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)�1 �+ 	insert into #tb(�γ�����) values ('����') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)�1 �+ 	insert into #tb(�γ�����) values ('����') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ����=1)�1 �+ 	insert into #tb(�γ�����) values ('����') �I �C if exists(select * from �꼶�γ̶�Ӧ�� where �꼶=@�꼶 and ��ʷ=1)�1 �+ 	insert into #tb(�γ�����) values ('��ʷ') � � select * from #tb� � drop table #tb� � T� �C��]�� %�C �  � � 
����( ��C� ��ȡ�γ�ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�#� ��CC� �� � � �� � ��C � �	 ��
 �� �
 � U  CNJ THIS OCOMBOKC CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM �γ�����
 CLOSEALIAS	 REFRESHBB�; ��  Q� STRING� Q� STRING� Q� STRING� Q� STRING� %�C�  ��� C� C�  ���n � T�  �C� � � ��� � %�C� ��� C� C� ���� � T� �C� � � ��� � %�C� ��� C� C� ���� � T� �C� � � ��� � %�C� ��� C� C� ���� T� �C� �	 � ��� � �� �
 � � �� � �
 M(� `�� � select [���] as [���]� � from [�༶�γ̱�]�W �Q where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>'� � --order by ...� � T� �C��]�� %�C �  � � 
��2�( ��C� ��ȡ���ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�]� ��CC� �� �
 � �� � ��C � � �� T� �
 � ����
 �� � � U  CXQ CXN CNJ CKC THIS OCOMBOXQ DISPLAYVALUE OCOMBOXN OCOMBONJ OCOMBOKC OCOMBOBB CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM ���
 CLOSEALIAS VALUE	 REFRESHKQk T�  � �a�� T� � � ���� �� � � � � T� �� � �	 �� T� �� � �
 �� T� �� � � �� T� �� � � �� ��C� Grid1� � �� T� � � �-�� T� � � �-��� T� � �CCCٮ select ���������ʱ from �༶�γ̱� with(nolock) where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>'��� �  ��� %�C� � ����� T� � �� 2,1�� � T� � �� � � ,,�����
 �� � � �� � %�� � ����
 M(� `��� �� SELECT a.�Ͽ�����,a.�δ�,a.���,a.����,CAST((case when convert(varchar,a.�Ͽ�����,112)<=convert(varchar,getdate(),112) then 1 else 0 end) as bit) as ��Ч� � ,a.�Ͽ�ʱ���$ � FROM �༶�ſα� a with(nolock)�" � WHERE a.У��='<<this.cXQ>>' �! � 	AND a.ѧ��='<<this.cXN>>' �! � 	AND a.�꼶='<<this.cNJ>>' �% � 	AND a.�γ�����='<<this.cKC>>' �! � 	AND a.���='<<this.cBB>>' �) �# 	and a.�ο���ʦ='<<this.cTeacher>>'� � order by a.�Ͽ������ � ���
 M(� `��� �� SELECT a.�Ͽ�����,a.�δ�,a.���,a.�����,a.����,CAST((case when convert(varchar,a.�Ͽ�����,112)<=convert(varchar,getdate(),112) then 1 else 0 end) as bit) as ��Ч� � ,a.�Ͽ�ʱ��,a.��ʦǩ���$ � FROM �༶�ſα� a with(nolock)�" � WHERE a.У��='<<this.cXQ>>' �! � 	AND a.ѧ��='<<this.cXN>>' �! � 	AND a.�꼶='<<this.cNJ>>' �% � 	AND a.�γ�����='<<this.cKC>>' �! � 	AND a.���='<<this.cBB>>' �) �# 	and a.�ο���ʦ='<<this.cTeacher>>'�+ �% 	AND YEAR(a.�Ͽ�����)=<<this.nYear>> �, �& 	and MONTH(a.�Ͽ�����)=<<this.nMonth>>� � order by a.�Ͽ������ � � �� � T� �C��]�� %�C �  � � 
��W�, ��C� ��ѯ�ſ���Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �� �6 T� ��) ѧ�� L null,ѧ����� C(50),ѧ������ C(50)��
 F�� �� ~� �+ T� �� � ,� IC� _�
  C(4) null��+ T� �� � ,� QC� _�
  C(4) null�� � �� �0 T� �� CREATE CURSOR �  � � (� � )�� ��C� � � �� F�  � &cCursorExpr
 ��C� Grid1� Grid_� � ��< ��C� � � AfterRowColChange� � OnAfterRowColChange�� T� � �	 �� �� T� � �
 �� �� T� � � �� �� T� � � �� �� T� � � ���� T� � � �a�� T� � �  �-�� T� � �! �-�� T� � �" �� ΢���ź��� T� � �# ��
�� T� � �$ ��(�� T� � �% ���� T� � � ��  � �� T� � �& ��C� N�� T� � �' ����! ��C�� � �( �Q� COLUMN��	� T��) �� recno()�� T��* ���� T�� ���� T�� �a�� T�� �-�� T��+ �a�� T��, �� RGB(240,240,240)�� ����- �Q� HEADER��	� T��. �� ����� T��* ���� �� ����/ �Q� TEXTBOX��	� T��* ���� �� ��! ��C�� � �( �Q� COLUMN��
� T��) �� ѧ������� T�� ��P�� T�� �a�� T�� �-�� T��+ �a�� ����- �Q� HEADER��
� T��. �� ����� T��* ���� �� ����/ �Q� TEXTBOX��
� T��* ���� ��9 T��, ��+ iif(ѧ��,RGB(255,255,255),RGB(140,140,140))�� ��! ��C�� � �( �Q� COLUMN�� T��) �� ѧ�������� T�� ��P�� T�� �a�� T�� �-�� T��+ �a�� ����- �Q� HEADER��� T��. �� ѧ�� or ������ T��* ���� �� ����/ �Q� TEXTBOX��� T��* ���� ��9 T��, ��+ iif(ѧ��,RGB(255,255,255),RGB(140,140,140))�� ��
 F�� �� ~�
� ��0 � T�0 �� ��$ ��C�CO� � �( �Q� COLUMN�� T��) �� IC�0 _��= T��1 ��	 iif(VAL(IC�0 _� )<>VAL(QC�0 _�
 ),.t.,.f.)�� T�� ��Z�� ����- �Q� HEADER��� T��* ���� %�� � ���& T��. �CC�2 H_� ��CC�2 %_� ���� �+� T��. �CC�2 %_� ���� �C T��. ���. CC�3 -��	 �  ��� �  6CC�4 -�� �  C�5 �� �  6�� %�CCC�6 �  қ�
����& T��. ���. C� C�
 CC�6 �  қ�� ���+ T��. ���. C� C�
 � �����趨ʱ���� �, ��C��7 �- � Click� � SetLessionTime�� %�C�3 -���9� T��8 �C� � ���^�� � %�C�4 -���d� T��8 �C��� � �^�� �6 T��9 �� ��C� _� �ڿΣ�������ͷ�ɸ����Ͽ�ʱ���� T��: �a�� ��0 ��C��- �
 RightClick� � OnHeadRightClick�� ��; � T�; �C��]�� ��C �; �	 ComboBox_�� �� ��C���< �Q� COMBOBOX�u� T��= ���� T��> ���� T��? �� � �� T��* ���� T�� �a�� ��8 ��CC���< � InteractiveChange� � OnValueChange��$ ��CC���< � When� � OnWhen�� T��@ ��; �� T��* ����m T��, �� ICASE(VAL(IC�0 _� )=2,RGB(240,240,240),VAL(IC�0 _�& )=1,RGB(192,192,192),RGB(255,255,255))�� %�C�4 -����� T� � � �-�� T� � � �-�� � %�C�3 -����� T��A �� RGB(0,0,255)�� ��H T��A �� ICASE(ALLTRIM(IC�0 _�! )=[���],RGB(255,0,0),RGB(0,0,0))�� � ��C� �Ͽ����� �2 ��B �� ��C� ����C�3 -���B �� ��C� �δ� � ��B �� ��C� ���C�4 -���B �� ��C� ��ЧC�C -���B ��  ��C� �Ͽ�ʱ��CC�6 �  қ��B �� ��C� ��ǩ��C�D -���B �� T�� �C�C -�� C�4 -�
	�� %�CCC�6 �  қ���� T�� �-�� � �� � ��C � � �� �� � �E �7 ��C� �G � �H � �I � �J � �K � �L � �M � �F �� �� �
 M(� `�� � IF exists(select * �% � 			FROM �༶�ſα� with(nolock)�� �� 			WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>'�W �Q 				and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>�� �� 				and not exists(select * from ѧ���γ̿δα� with(nolock) where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)�	 � 		)� �
 		SELECT 1� � 	ELSE � �
 		SELECT 0� � %�C � � ����� T� �N � �a�� �� T� �N � �-�� �
 �� �O � T� �P �a�� T�  � �-��+ ��C� �G � �H � �I � �J � �K � �Q �� UR  THISFORM
 LOCKSCREEN THIS GRID1 RECORDSOURCE NLEFT NTOP NWIDTH NHEIGHT LEFT TOP WIDTH HEIGHT REMOVEOBJECT OCMDDELETELINE ENABLED OCMDDELETESTUDENT CKSLIST GETVALUE	 REFRESHKS CSQL BSHOWALLDAYS CCURSOR
 SELECTDATA CFIELDSLIST �δ� CCURSOREXPR	 CKQCURSOR
 CLOSEALIAS	 ADDOBJECT ANCHOR VISIBLE THEMES
 DELETEMARK FONTNAME FONTSIZE HEADERHEIGHT	 ROWHEIGHT COLUMNCOUNT LOCKCOLUMNS COLUMNS CONTROLSOURCE	 ALIGNMENT READONLY DYNAMICBACKCOLOR HEADER1 CAPTION TEXT1 I DYNAMICFONTBOLD �Ͽ����� ���� ��� ����� �Ͽ�ʱ�� PARENT	 FORECOLOR TOOLTIPTEXT WORDWRAP	 CTEMPNAME CONTROLS STYLE ROWSOURCETYPE	 ROWSOURCE CURRENTCONTROL DYNAMICFORECOLOR ADDPROPERTY ��Ч ��ʦǩ�� REFRESH REFRESHXSKQ CXQ CXN CNJ CKC CBB NYEAR NMONTH OCMDDELETECLASS REFRESHIMAGE BSAVED REFRESHCLASS" ��  � � � � � � � %�C�  ��� C� C�  ���M � T�  �� �  �� � %�C� ��� C� C� ��� � T� �� � �� � %�C� ��� C� C� ���� � T� �� � �� � %�C� ��� C� C� ���� � T� �� � �� � %�C� ��� C� C� ���� T� �� � �� � %�C� ��� N��>� T� �� � �� � %�C� ��� N��g� T� �� � �� � F�� �	 �� S� ��
 �) T�
 �� select a.ѧ�����,a.ѧ��������! �� ���(�� � � ����� �� Q� COLUMN� T� �C�� � � � �� �� � T� �� � ��s T�
 ��
 C� C�
 �5 ,dbo.��ѯѧ����ʱ1(@У��,@ѧ��,@�꼶,@�γ�����,@���,C� _� ,a.ѧ�����) as IC� _�� �� �� � �
 M(� `�� �y DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int� � SET @У��='<<cXQ>>'� � SET @ѧ��='<<cXN>>'� � SET @�꼶='<<cNJ>>'� � SET @�γ�����='<<cKC>>'� � SET @���='<<cBB>>'� � SET @���=<<nYear>>� � SET @�·�=<<nMonth>>� �  � � <<cFieldsList>>�$ � from ��ѧ�ǼǱ� a with(nolock)�|�vwhere a.ѧ����� in (select ѧ����� from ѧ���γ̿δα� a with(nolock) inner join �༶�ſα� b with(nolock) on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)�� �� 	or exists(select * from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)�� �� order by (select ISNULL(���,0) from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���),�� �� (select CreateTime from ѧ���γ̱� with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)� � ,a.ѧ������ � T� �C��]�� %�C �  � � 
����, ��C� ��ѯѧ����Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �� � � � � T� ��  ��# T� �� ѧ��,ѧ�����,ѧ��������4 T� ��' .t.,ALLTRIM(ѧ�����),ALLTRIM(ѧ������)��! �� ���(�� � � ���l	� �� Q� COLUMN� T� �C�� � � � �� �� � T� �� � �� T� �� � ,IC� _�� T� �� � ,QC� _�� T� �� � ,IC� _�� T� �� � ,IC� _��; T� �� CC� �� �  � �  or 6� VAL(IC� _� )>0�� ��H T� �� INSERT INTO � �	 � (� �	 ) select � �  from � �� &cFieldsExpr
 T� � �� �� F�� �	 �� G(� %�� � ��
� SET FILTER TO &cFilterExpr 
 � #)� ��C � � �� ��
 �% T�
 �� select c.ְԱ���,c.������! �� ���(�� � � ���0� �� Q� COLUMN� T� �C�� � � � �� �� � T� �� � ��o T�
 ��
 C� C�
 �5 ,dbo.��ѯ���̿�ʱ1(@У��,@ѧ��,@�꼶,@�γ�����,@���,C� _� ,c.����) as IC� _�� �� �� � �
 M(� `�� �y DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int� � SET @У��='<<cXQ>>'� � SET @ѧ��='<<cXN>>'� � SET @�꼶='<<cNJ>>'� � SET @�γ�����='<<cKC>>'� � SET @���='<<cBB>>'� � SET @���=<<nYear>>� � SET @�·�=<<nMonth>>� �  � � <<cFieldsList>>� � from ְԱ���� c�� �� where c.���� in (select a.���� from ���̿��ڱ� a inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� �� �� where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)� � order by c.����� � T� �C��]�� %�C �  � � 
��z�, ��C� ��ѯ������Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �� � � �# T� �� ѧ��,ѧ�����,ѧ�������� T� �� .f.,ְԱ���,������! �� ���(�� � � ����� �� Q� COLUMN� T� �C�� � � � �� �� � T� �� � �� T� �� � ,IC� _�� T� �� � ,QC� _�� T� �� � ,IC� _�� T� �� � ,IC� _�� ��H T� �� INSERT INTO � �	 � (� �	 ) select � �  from � �� &cFieldsExpr
 ��C � � �� F�� �	 �� #)� �� � � � U  CXQ CXN CNJ CKC CBB NYEAR NMONTH THIS THISFORM	 CKQCURSOR CFIELDSLIST I GRID1 COLUMNCOUNT OCOLUMN COLUMNS NKC �δ� CSQL CCURSOR
 SELECTDATA CFIELDSEXPR1 CFIELDSEXPR2 CFIELDSEXPR CFILTEREXPR BHIDENODATA
 CLOSEALIAS REFRESH�
 ��  � � � � � T�  �� �  �� T� �� � �� T� �� � �� T� �� � �� T� �� � �� �� � � T� ��  �� F�� �	 �� ~��� ��
 ���(�� � � ���� �� Q� COLUMN� T� �C �
 � � � �� %�� � 
��� � .� � �� � � T� �� � �� T� �C� � I� Q���H IF ALLTRIM(NVL(&cColumnName,""))==ALLTRIM(NVL(&cColumnNameQ,""))�q� .� � �� � T� �CC� � �\g�� �� � � �. a=IIF(EMPTY(NVL(&cColumnName,"")),"0","1")
7 b=IIF(ALLTRIM(NVL(&cColumnName,""))="���","1","0")
_ c=IIF(INLIST(ALLTRIM(NVL(&cColumnName,"")),"","���"),"null",ALLTRIM(NVL(&cColumnName,"")))
 %�� ���
 M(� `��� �� IF exists(select * from ѧ���γ̿δα� where ѧ�����='<<ALLTRIM(ѧ�����)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>)� � 	UPDATE ѧ���γ̿δα�� � 	SET ��ǩ��=<<a>>� � 	,���=<<b>>� � 	,��ʱ��=<<c>>�� �� 	where ѧ�����='<<ALLTRIM(ѧ�����)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>� � ELSE �� �� 	INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�,��ǩ��,���,��ʱ��) VALUES ('<<ALLTRIM(ѧ�����)>>','<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>,<<a>>,<<b>>,<<c>>)� � �u�
 M(� `��� �� IF exists(select * from ���̿��ڱ� where ����='<<ALLTRIM(ѧ������)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>)� � 	UPDATE ���̿��ڱ�� � 	SET ��ʱ��=<<c>>�� �� 	where ����='<<ALLTRIM(ѧ������)>>' AND У��='<<cXQ>>' AND ѧ��='<<cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>' AND �δ�=<<nKC>>� � ELSE �� �� 	INSERT INTO ���̿��ڱ�(����,У��,ѧ��,�꼶,�γ�����,���,�δ�,��ʱ��) VALUES ('<<ALLTRIM(ѧ������)>>','<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>,<<c>>)� � � T� �� C� C�
 � �� �� � %�C � � 
����( ��C� ��������ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �� � T� ��  �� ��
 ���(�� � � ���� �� Q� COLUMN� T� �C �
 � � � �� �� � T� �� � �� �� � T� �CC� � �\g��o T� �� C� C�
 C�O exec �����ſο�����Ϣ '<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>',<<nKC>>���� �� %�C � � 
��	�( ��C� ��������ʧ�ܣ��@� ϵͳ��ʾ�x�� ��
�( ��C� �������ݳɹ����@� ϵͳ��ʾ�x��
 �� � � T� � �a��+ ��C� �  � � � � � � � � � � �� F�� �	 �� �� � T� ��  �� ��
 ���(�� � � ��t
� �� Q� COLUMN� � � T� �C �
 � � � �� %�� � 
��
� .� � T� �� � �� T� �C� � I� Q���4 T� �� CC� �� �  � � ,6� �  with � �� �� REPLACE &cFieldsExpr ALL 
 � U   CXQ CXN CNJ CKC CBB THIS CSQL CSQL1 THISFORM	 CKQCURSOR I GRID1 COLUMNCOUNT OCOLUMN COLUMNS ENABLED CCOLUMNNAME CCOLUMNNAMEQ CONTROLSOURCE NKC A B C ѧ�� EXECUTE CSQL2	 REFRESHKS BSAVED REFRESHCLASS CFIELDSEXPR CFIELD1 CFIELD2 %��  � � �  � �	��" � B� � ��C�� � 	�� �� Q� HEADER� T� �C�� �� �� Q� COLUMN� T� �� � ��
 �� � �( �� Q� XTREMECOMMANDBARS.ICommandBar�% T� �C� � ��ݷ�ʽ�  �	 �
 � ��; T� � � ��������� ����Ĭ��2Сʱ�� �� � 
��: T� � � ��������� ������������� �� � 
�� %��  � ���� %�� � 
����J ��C���� ���� � � �Q�$ XTREMECOMMANDBARS.ICommandBarControl��� T�� �a�� T�� �� � �� �� ���  ��C���� ������ � � �� � �C T� � � ��������� ���������� �� � 
�	 � � 
	��C T� � � ��������� ������ʦ�� �� � 
�	 � � 
	��E T� � � ���������
 ɾ�����ڿ��� �� � 
�	 � � 
	�� �� � T� �C� � � �� �� � T� �� � �� �� � T� �C� � �\�� H�-�	� �� ����_� %��  � 
����6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � �� �V � frm_f7(� ������0 select ְԱ���,���� from ְԱ���� order by ������� ������ %�CC� �  ҡ��� B� � �� �
 M(� `��3 �- update �༶�ſα� set �ο���ʦ='<<cTeacher>>'�� �� where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>' and �δ�=<<nKC>>�� �� 	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)� � %�C � � ��'�> ��C�$ �����ο���ʦ�ɹ�(�����п��ڲ�����)���@� ϵͳ��ʾ�x��
 ��  � � �[�, ��C� �����ο���ʦʧ�ܣ��@� ϵͳ��ʾ�x�� � �� ����1	� %��  � 
����6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� �J %�C�( �����Ҫɾ�����ڿ������п��ڲ�ɾ�������!� ϵͳ��ʾ�x���� B� � �� �
 M(� `�� � DELETE FROM �༶�ſα��� �� WHERE У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND �꼶='<<this.cNJ>>' AND �γ�����='<<this.cKC>>' AND ���='<<this.cBB>>' AND �δ�=<<nKC>>�� �� 	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)� � %�C � � ��	�$ ��C�
 ɾ���ɹ����@� ϵͳ��ʾ�x��
 ��  � � �-	�$ ��C�
 ɾ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � �� ������ %��  � 
���	�6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � �� � T� �C�  � �� %�C� ����	� B� � �� �
 M(� `��  � DECLARE @�Ͽ����� datetime�i �c SET @�Ͽ�����=CAST('<<SUBSTR(cSKRQ,1,4)+"-"+SUBSTR(cSKRQ,5,2)+"-"+SUBSTR(cSKRQ,7,2)>>' as datetime)�. �( update �༶�ſα� set �Ͽ�����=@�Ͽ������� �� where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �γ�����='<<this.cKC>>' and ���='<<this.cBB>>' and �δ�=<<nKC>>� � %�C � � ����( ��C� �������ڳɹ����@� ϵͳ��ʾ�x��< T� � �CC� ��\� -C� ��\� -C� ��\#�� ��C � �  � �� ���( ��C� ��������ʧ�ܣ��@� ϵͳ��ʾ�x�� � �� ����T� F��  �! ��> REPLACE &cControlSource WITH TRANSFORM(thisform.nDCKS) ALL
 ��  �" �# � T�  � �-�� �� ������ F��  �! ��' REPLACE &cControlSource WITH "" ALL
 ��  �" �# � T�  � �-�� �� ����d� %��  � 
���6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� � �� �� T� ��Z update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='�  �$ � ' and ѧ��='�  �% � ' and �꼶='�  �& � ' and �γ�����='�  �' � ' and ���='�  �( � ' and �δ�=C� _�� %�C � � ��4� T� � �a�� ��C � �  � �� �`�$ ��C�
 ���ʧ�ܣ��@� ϵͳ��ʾ�x�� � �� ����� %��  � 
����6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� � �� �� T� ��F update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='�  �$ � ' and ѧ��='�  �% � ' and �꼶='�  �& � ' and �γ�����='�  �' � ' and ���='�  �( � ' and �δ�=C� _�� %�C � � ���� T� � �-�� ��C � �  � �� ���& ��C� �����ʧ�ܣ��@� ϵͳ��ʾ�x�� � 2�	� � U)  THIS BISOK NVERSION ARR OHEADER OCOLUMN PARENT SETFOCUS OCOMMANDBAR OCOMMANDBARS CONTEXTMENUS ADD CONTROLS ENABLED ���
 BEGINGROUP ��ǩ�� NRESULT	 SHOWPOPUP CCONTROLSOURCE CONTROLSOURCE NKC BSAVED CTEACHER FRM_F7 CSQL EXECUTE	 REFRESHKQ CSKRQ GETRQ �Ͽ�����	 SETCOLUMN THISFORM	 CKQCURSOR GRID1 REFRESH CXQ CXN CNJ CKC CBB�  T�  � �-�� ��C�� � 	�� �� Q� COMBOBOX� T� �C�� �� �� Q� COLUMN� T� �� � �� %�� � ��{ � �� � � U  THIS BSAVED ARR O OCOL PARENT ���� CSQLs  ��  � T� � ���  �� T� � � ���  
�� T� � � ���  
�� T� � � ���  
�� T� � � ���  �� U	  VNEWVAL THIS BSAVED LABELUNSAVE VISIBLE OCMDSAVE ENABLED
 OCMDCANCEL OCMDREORDER�$ ��  �� � � �(����������d � �� Q� CONTROL� T� �C �  � � � �� ��C� � � � � �� �� �� �	 � %�� �
 ��0�� T� �Cٝ select * from dbo.��ʦ����('<<this.cXQ>>','<<this.cXN>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) where ǩ������>0 order by �꼶���,�γ�����,������� ���� T� �Cٌ select * from dbo.��ʦ����('<<this.cXQ>>','<<this.cXN>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) order by �꼶���,�γ�����,������� � T�	 �C��]�� %�C �  �	 � 
��/�, ��C� ��ѯ�༶��Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� �O �� Q� ������ d:\wisemis3\��ά.vcx�� Q� ������ d:\wisemis3\��ά.vcx��) �� Q� ������ d:\wisemis3\��ά.vcx�� ��� � � � T� ��  �� T�� ���� T� ���� �� � T� �� � � ��
 F��	 �� ~�=� �� �% T� �� _C��� C� �C� �]�� ��C � � ���� � � ��) �� Q� ������ d:\wisemis3\��ά.vcx��# T� �C� this.Container1.� ��� %�C� ����� T� �C� ��� � T� � �� �� T� � ��� �� T� �C� ���0 %�� � � � �� � �� � � ��P� T� ���� T�� ��� � � ��� �p� T� �� � � ��� � T� � �C� ��� T� � �C�  ��� T� �! �C� ��� T� �" �C� ��� T� �# �C� ��� T� �$ �C�% -��� T� �& ��' �� T� �( ��) �� T� �* �C�+ � ��� T� �, �C�- � ��� T� �. �C�/ � ��� T� �0 �C�1 � ��� T� �2 �CC�3 � �а�қ�� T� �4 �CC�5 � ���қ�� T� �6 �CC�7 � ���қ�� T� �8 �C�9 -��� T� �: �C�; -��� %�C� ��� O���� T� �� �� �[ %�� � � � � � � � � 	� � �! � �! 	� � �" � �" 	� � �# � �# 	���� T� �< �C� � ���^�� T� �= ���� T� �� �� � ��C� �> ��# ��C� � Click� �	 OnBBClick��- ��C� �
 RightClick� � OnBBRightClick�� T� �? �a�� T� �� �� %�� � � � �� ��9� T� �� � � � ��� � � ��C �	 �@ �� �� �	 � T�	 �C��]��
 M(� `��! � select c.У��,c.ѧ��,c.�꼶� � ,c.�γ������ � ,c.�ο���ʦ� � ,c.���� � ,c.�·�� � ,c.�༶����� � ,SUM(ǩ������) as ��ʱ�  � ,(select sum(a.��ʱ��)/2.0� � 	from ѧ���γ̿δα� a �� �� 		inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ��� �z 		inner join �༶�γ̱� d on d.У��=b.У�� and d.ѧ��=b.ѧ�� and d.�꼶=b.�꼶 and d.�γ�����=b.�γ����� and d.���=b.����� �� 	where a.У��=c.У�� and a.ѧ��=c.ѧ�� and a.�꼶=c.�꼶 and a.�γ�����=c.�γ����� and b.�ο���ʦ=c.�ο���ʦ and year(b.�Ͽ�����)=c.��� and month(b.�Ͽ�����)=c.�·� and d.�༶����=c.�༶�����  � 		and ISNULL(a.��ʱ��,0)>0�1 �+ 		and a.�༶���� not in ('��ҵ��','���԰�')� �	 ) as �˴�� � from �༶�·ݿ�����ͼ c�� �� where c.У��='<<this.cXQ>>' and c.ѧ��='<<this.cXN>>' and c.�ο���ʦ='<<this.cTeacher>>' and c.���=<<this.nYear>> and c.�·�=<<this.nMonth>>�R �L group by c.У��,c.ѧ��,c.�꼶,c.�γ�����,c.�ο���ʦ,c.���,c.�·�,c.�༶�����+ �% order by c.�꼶,c.�γ�����,c.�༶����� � %�C �  �	 � 
����, ��C� ��ѯ������Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F��A �B �� S�H r���A �B �� �C �3 �D �E o��	 ��� ��� ���3 ���D ���E �� ��C �	 �@ �� F��A �B �� #)� �� �F �G � �� �	 � T�	 �C��]��
 M(� `��! � select c.У��,c.ѧ��,c.�꼶� � ,c.�γ������ � ,c.���� � ,c.�ο���ʦ� � ,c.���� � ,c.�·�� � ,ǩ������ as ��ʱ�! � ,(select sum(a.��ʱ��)/2.0 � � 	from ѧ���γ̿δα� a �� �� 		inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ��� �� 	where a.У��=c.У�� and a.ѧ��=c.ѧ�� and a.�꼶=c.�꼶 and a.�γ�����=c.�γ����� and a.���=c.��� and b.�ο���ʦ=c.�ο���ʦ and year(b.�Ͽ�����)=c.��� and month(b.�Ͽ�����)=c.�·��  � 		and ISNULL(a.��ʱ��,0)>0�1 �+ 		and a.�༶���� not in ('��ҵ��','���԰�')� �	 ) as �˴�� � from �༶�·ݿ�����ͼ c�� �� where c.У��='<<this.cXQ>>' and c.ѧ��='<<this.cXN>>' and c.�ο���ʦ='<<this.cTeacher>>' and c.���=<<this.nYear>> and c.�·�=<<this.nMonth>>�' �! order by c.�꼶,c.�γ�����,c.���� � %�C �  �	 � 
��)�, ��C� ��ѯ������Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F��A �H �� S�H r���A �H �� �C � �D �E o��	 ��� ��� ��� ���D ���E �� ��C �	 �@ �� F��A �H �� #)� T� �I �J ��A �H �� T� �I �K � ��P�� T� �I �L � ��P�� T� �I �M � ��P�� T� �I �N � ��F�� T� �I �O � ��F�� T� �I �K �P �� �꼶�� T� �I �L �P �� ��Ŀ�� T� �I �M �P �� ����� T� �I �N �P �� ��ʱ�� T� �I �O �P �� �˴��� �� �I �G � �� �
 M(� `��� �� IF exists(select * from �༶�ſα� where �ο���ʦ='<<this.cTeacher>>' AND У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND YEAR(�Ͽ�����)=<<this.nYear>> and MONTH(�Ͽ�����)=<<this.nMonth>> and ISNULL(ȷ��,0)=0)� �	 	SELECT 1� � ELSE � �	 	SELECT 0� � %�C � �Q ���� T� �R �S �� ȷ���� T� �R �T �a�� T� �U �T �-�� ��� T� �V �a�� T� �R �S �� ��ȷ���� T� �R �T �-�� T� �U �T �a�� %�� �W ����� T� �X �T �-�� T� �Y �T �-�� T� �Z �T �-�� T� �[ �T �-�� T� �\ �T �-�� T� �] �T �-�� T� �^ �T �-�� � � �� �
 M(� `��� �� IF exists(select * from �༶�ſα� where �ο���ʦ='<<this.cTeacher>>' AND У��='<<this.cXQ>>' AND ѧ��='<<this.cXN>>' AND YEAR(�Ͽ�����)=<<this.nYear>> and MONTH(�Ͽ�����)=<<this.nMonth>> and ISNULL(���,0)=0)� �	 	SELECT 1� � ELSE � �	 	SELECT 0� � %�C � �Q ���=� T� �R �T �-�� �$ %�C� ��� O� C� ��� O	��r� T� �� �� � %�C� ��� O���� ��C� � Click�� �
 �� �_ � U`  I THIS
 CONTAINER1 CONTROLCOUNT OCONTROL CONTROLS REMOVEOBJECT NAME CSQL CCURSOR BHIDENODATA
 SELECTDATA OFIRSTBB OLASTBB OSELECTEDBB NTOP NLEFT CLASTNJ
 NALLHEIGHT HEIGHT CNAME �꼶 �γ����� ���	 ADDOBJECT OBB LEFT TOP WIDTH CXQ У�� CXN ѧ�� CNJ CKC CBB	 BHASIMAGE HASIMAGE NYEAR ��� NMONTH �·� NTOTAL ���� NTOTAL1 ǩ������ NTOTAL2 ��˴��� NTOTAL3 ȷ�ϴ��� CBJLX �༶���� CSKZQ �Ͽ����� CSKSJ �Ͽ�ʱ�� BXYZJ ��Ҫ���� BBK ���� BORDERCOLOR BORDERWIDTH	 SHOWCLASS VISIBLE
 CLOSEALIAS THISFORM	 CNJCURSOR ��Ŀ ��ʱ �˴� GRID2 REFRESH	 CBJCURSOR GRID3 RECORDSOURCE COLUMN1 COLUMN2 COLUMN3 COLUMN4 COLUMN5 CONTROLSOURCE GETVALUE OBTNOK CAPTION ENABLED OBTNCANCELOK BISOK NVERSION OCMDSAVE OBTNDEFAULT	 OCMDCLEAR OCMDAUDITALL OCMDUNAUDITALL OCMDAUDITALL2 OCMDUNAUDITALL2 REFRESHUPANDDOWN� %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � ��C�� � 	��) �� Q� ������ d:\wisemis3\��ά.vcx�� T� �C�� ��( ��C� BorderWidth�� ����  � � ��1 ��C� BorderColorC�������^� ����  � � �� T� � ���� T� � �C� � ���^�� T�  � �� � �� T�  �	 �� �	 �� T�  �
 �� �
 �� T�  � �� � �� T�  � �� � �� T�  � �� � �� T�  � �� � �� T�  � �� � �� T�  � �� � ��� T�  � �CCC٘ select ���ο�ʱ from �༶�γ̱� where У��='<<oBB.cXQ>>' and ѧ��='<<oBB.cXN>>' and �꼶='<<oBB.cNJ>>' and �γ�����='<<oBB.cKC>>' and ���='<<oBB.cBB>>'��� ����
 ��  � � U  THIS BSAVED ARR OBB
 CONTAINER1 SETALL BORDERWIDTH BORDERCOLOR CXQ CXN CNJ CKC CBB NYEAR NMONTH CBJLX BXYZJ NDCKS GETVALUE	 REFRESHKQ1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS CXQ LABELXQ CAPTION1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS CXN LABELXN CAPTION1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS CNJ LABELNJ CAPTION1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS CKC LABELKC CAPTIONF  ��  � T� � ���  �� T� � � ���  �� T� � � ���  �� U  VNEWVAL THIS CBB LABELBB CAPTION TOOLTIPTEXT1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS CTEACHER OLABELTEACHER CAPTION ��  � T� � ���  �� T� � � �� �� T� � � �� �� %���  ��� � T� � � �� � � ���� T� � � �� ���ػ�����Ϣ�� �� � T� � � �� � � ���� T� � � �� ��ʾ������Ϣ�� � T� � � ���� T� � � �� � � �� T� � � ���� U	  VNEWVAL THIS BSHOWSUMMARY GRID1 ANCHOR CONTAINERREORDER HEIGHT OCMDSHOWSUMMARY CAPTION� T�  � � ���� T�  � � ������ T�  � � �� � �� T�  � � ���� �� ���(��  � � ��� �" ��C � �  � � �Q� COLUMN�� � T�� �-�� �� ��! ��C��  � � �Q� COLUMN�q� T��	 �� recno()�� T��
 ���� T�� ���� T�� �a�� T�� �-�� T�� �a�� T�� �� RGB(240,240,240)�� ���� �Q� HEADER�m� T�� �� ����� T��
 ���� �� ��! ��C��  � � �Q� COLUMN�S� T��	 �� ѧ������� T�� ��P�� T�� �a�� T�� �-�� T�� �a�� ���� �Q� HEADER�� T�� �� ����� T��
 ���� ��9 T�� ��+ iif(ѧ��,RGB(255,255,255),RGB(140,140,140))�� ��! ��C��  � � �Q� COLUMN�=� T��	 �� ѧ�������� T�� ��P�� T�� �a�� T�� �-�� T�� �a�� ���� �Q� HEADER� � T�� �� ѧ�� or ������ T��
 ���� ��9 T�� ��+ iif(ѧ��,RGB(255,255,255),RGB(140,140,140))�� �� �� ���(������% ��C�� �  � � �Q� COLUMN��� T��	 �� IC� _�� T�� ��P�� ���� �Q� HEADER��� T��
 ���� ��0 ��C�� �
 RightClick�  � OnHeadRightClick�� �� � T� �C��]�� ��C � �	 ComboBox_�� �� ��C��� �Q� COMBOBOX��� T�� ���� T�� �� �� ��C� 2�� �� ��C� 1�� �� ��C�  �� �� T��
 ���� T�� �a�� ��8 ��CC��� � InteractiveChange�  � OnValueChange��$ ��CC��� � When�  � OnWhen�� T�� �� �� T��
 ����� T�� �� ICASE(ALLTRIM(IC� _�! )=[9],RGB(0,0,0),INLIST(ALLTRIM(IC� _�+ ),[2],[2.00]),RGB(0,255,0),INLIST(ALLTRIM(IC� _�0 ),[1],[1.00]),RGB(192,192,192),RGB(255,255,255))�� �� �� U  THIS GRID1 RECORDSOURCE COLUMNCOUNT THISFORM	 CKQCURSOR I COLUMNS VISIBLE CONTROLSOURCE	 ALIGNMENT WIDTH ENABLED READONLY DYNAMICBACKCOLOR HEADER1 CAPTION	 CTEMPNAME	 ADDOBJECT CONTROLS STYLE ROWSOURCETYPE ADDITEM CURRENTCONTROL  U  � ��  � �� � %�� � �
��9 � T� �� 0C� � _�� �S � T� �C� � _�� �P T�  �C� ����������(��ʽ��YYYYMMDD����CC$�� )��� �趨����C� � _� ���� %�C�  >���� �, ��C� ��������λ�����ԣ��@� ϵͳ��ʾ�x��	 B��  �� � %�CC�  �=g����?�* ��C� �������ڲ��Ϸ����@� ϵͳ��ʾ�x��	 B��  �� �  %�CCC�  ��\g���
����* ��C� �������ڲ��Ϸ����@� ϵͳ��ʾ�x��	 B��  �� �  %�CCC�  ��\g���
����* ��C� �������ڲ��Ϸ����@� ϵͳ��ʾ�x��	 B��  �� �	 B��  �� U  CRQ MM THISFORM NMONTH NYEAR  ��  � T� � ���  �� U  VNEWVAL THIS BCHECKED>  ��  � F�� � �� T� � � �� 
�� T� � � �� �� U 	 NCOLINDEX THISFORM	 CKQCURSOR OCMDDELETELINE ENABLED ѧ�� OCMDDELETESTUDENT1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS BXYZJ	 OCMDNEWZJ ENABLED&  ��  � T� � ���  ��
 �� � � U  VNEWVAL THIS BSHOWALLDAYS	 REFRESHKQ�  T�  � � �-�� T�  � � �-�� %��  � � � ��= � B� �! �� Q� CONTROL� Q� CONTROL� T� �C��  � � �� T� �C�  � � �  � � �� %�� �	 ���� � T�  � � �a�� �! %�� �	 � �
 �  � �
 ��� � T�  � � �a�� � U  THIS OCMDUP ENABLED OCMDDOWN
 CONTAINER1 CONTROLCOUNT OFIRSTCONTROL OLASTCONTROL CONTROLS TOP HEIGHT� ��C��  � 	�� �� Q� HEADER� T� �C��  �� �� Q� COLUMN� T� �� � �� �� � T� �� � �� %�� � �� � B� � �� � �U T� ��% select * from �Ͽ�ʱ��� where У��='�	 �
 � ' and ѧ��='�	 � � '�� T� �C��]�� %�C �  � � 
��:�, ��C� ��ȡ�Ͽ�ʱ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B� �( �� Q� XTREMECOMMANDBARS.ICommandBar�% T� �C� � ��ݷ�ʽ�	 � � � ��
 F�� �� %�CN� ����. ��C� û�ж�ȡ���Ͽ�ʱ�䣡�@� ϵͳ��ʾ�x�� ��C � � �� B� � �� � � � � � T� �C� ��� T� �C� ��� T� �C� ��� T� �C� ��� T� �C� ���& ��C���� �����Ͽ�ʱ��� � � ��7 T� � � ��������� �� �C� � � a� -6��7 T� � � ��������� �� �C� � � a� -6��7 T� � � ��������� �� �C� � � a� -6��7 T� � � ��������� �� �C� � � a� -6��7 T� � � ��������� �� �C� � � a� -6��# ��C����	 �Զ���...� � � �� �� � T� �C� � � �� �� �
 � �  �! �" �# � T�
 ��	 �
 �� T� ��	 � �� T�  ��	 �  �� T�! ��	 �! �� T�" ��	 �" �� T�# �� �$ �� H�O�v� �� ������ T� �Cٟ update �༶�ſα� set �Ͽ�ʱ��='<<cSW1>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� �� �� �� ������� T� �Cٟ update �༶�ſα� set �Ͽ�ʱ��='<<cSW2>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� �� �� �� ������� T� �Cٟ update �༶�ſα� set �Ͽ�ʱ��='<<cXW1>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� �� �� �� ������� T� �Cٟ update �༶�ſα� set �Ͽ�ʱ��='<<cXW2>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� �� �� �� ����T�� T� �Cٞ update �༶�ſα� set �Ͽ�ʱ��='<<cWS>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� �� �� �� ����j� ��% �P T�% �C�% �������Ͽ�ʱ�Σ���ʽ��hh:mm-hh:mm�����
 �Զ���ʱ��� 08:00-10:00���� %�C�% ����� B� �2 %�CC�% ��\�
� CCC�% ��\g���
��0	�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� � %�C�% ��\� :��x	�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �2 %�CC�% ��\�
� CCC�% ��\g� �<�
���	�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� � %�C�% ��\� -�� 
�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �2 %�CC�% ��\�
� CCC�% ��\g���
���
�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� � %�C�% �	�\� :���
�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �2 %�CC�% �
�\�
� CCC�% �
�\g� �<�
��(�& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �M %�CC�% ��\g�<CC�% �
�\gCC�% ��\g�<CC�% ��\g� ����& ��C� ��ʽ���Ϸ����@� ϵͳ��ʾ�x�� B� �� T� �C٦ update �༶�ſα� set �Ͽ�ʱ��='<<cCustomSKSD>>' where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and �δ�=<<nKC>>���� T� ��% �� 2�v� B� � %�C � �& ���� T� � �� �� ��C � �	 �' �� ���, ��C� �����Ͽ�ʱ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U(  ARR OHEADER OCOLUMN PARENT CSKSJ �Ͽ�ʱ�� ��� CSQL CCURSOR THIS CXQ CXN
 SELECTDATA OCOMMANDBAR OCOMMANDBARS CONTEXTMENUS ADD
 CLOSEALIAS CSW1 CSW2 CXW1 CXW2 CWS ����1 ����2 ����1 ����2 ���� CONTROLS CHECKED NRESULT	 SHOWPOPUP CNJ CKC CBB NKC �δ� CCUSTOMSKSD EXECUTE	 SETCOLUMN� %��  � 
��N �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� � �� �
 M(� `��� �� declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int,@�꼶1 varchar(50),@�꼶2 varchar(50),@�꼶��� int�" � set @У��='<<thisform.cXQ>>'�" � set @ѧ��='<<thisform.cXN>>'�" � set @�꼶='<<thisform.cNJ>>'�& �  set @�γ�����='<<thisform.cKC>>'�" � set @���='<<thisform.cBB>>'�" � set @���=<<thisform.nYear>>�# � set @�·�=<<thisform.nMonth>>� �  �> �8 SET @�꼶���=(select ��� from �꼶�� where �꼶=@�꼶)�S �M SET @�꼶1=(select top 1 �꼶 from �꼶�� where ���>@�꼶��� order by ���)�X �R SET @�꼶2=(select top 1 �꼶 from �꼶�� where ���<@�꼶��� order by ��� desc)� �  �# � declare @�༶���� varchar(50)�� �� set @�༶����=(select �༶���� from �༶�γ̱� with(nolock) where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)� �  �> �8 SELECT ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰�$ � FROM ��ѧ�ǼǱ� a with(nolock)�, �& WHERE (a.�꼶 in (@�꼶,@�꼶1,@�꼶2)�� �� 		or exists(select * from ѧ��������Ϣ with(nolock) where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and �༶����=@�༶����)� � 		or @�꼶='����'� � 	)�  � 		and not exists(select * �� �� 						from ѧ���γ̿δα� d with(nolock) inner join �༶�ſα� e with(nolock) on d.У��=e.У�� and d.ѧ��=e.ѧ�� and d.�꼶=e.�꼶 and d.�γ�����=e.�γ����� and d.���=e.��� and d.�δ�=e.�δ��' �! 						where d.ѧ�����=a.ѧ������i �c 							and d.У��=@У�� and d.ѧ��=@ѧ�� and d.�꼶=@�꼶 and d.�γ�����=@�γ����� and d.���=@����C �= 							and year(e.�Ͽ�����)=@��� and month(e.�Ͽ�����)=@�·�� � 						)� � order by ѧ������� � �� � �( � frm_f7(� ����� �� ѧ������� %�CC� �  ҡ��I� B�-�� �W T� �C�= select ѧ������ from ��ѧ�ǼǱ� with(nolock) where ѧ�����='� � '� �� �� �
 M(� `��� �{ declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@ѧ����� varchar(50)�" � set @У��='<<thisform.cXQ>>'�" � set @ѧ��='<<thisform.cXN>>'�" � set @�꼶='<<thisform.cNJ>>'�& �  set @�γ�����='<<thisform.cKC>>'�" � set @���='<<thisform.cBB>>'� � SET @ѧ�����='<<cXSBH>>'� �  �� �� IF NOT exists(select * from ѧ���γ̱� where ѧ�����=@ѧ����� AND У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)�y �s 	INSERT INTO ѧ���γ̱�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���) VALUES (@ѧ�����,@У��,@ѧ��,@�꼶,@�γ�����,@���)�L �F INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�)�9 �3 	SELECT @ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ��% � 	from �༶�ſα� a with(nolock)�p �j 	where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@��� and ISNULL(���,0)=0�� �� 		and not exists(select * from ѧ���γ̿δα� with(nolock) where ѧ�����=@ѧ����� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)� � %�C � � ��R� F�� �	 �� � >�
 ��a�� ��� �� ��� �� �� � � � B�a�� ���( ��C� ����ѧ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� � U  THISFORM BSAVED CSQL CXSBH CXSXM FRM_F7 GETVALUE EXECUTE THIS	 CKQCURSOR ѧ�� ѧ����� ѧ������ GRID1 REFRESH� ��  Q� COLUMN� %�C�  ��� O��* � B� � ���  �Q� COLUMN��� ���� �Q� HEADER��� %�� � ��� �, T�� �CC�  � H_� ��CC�  � %_� ���� �� � T�� �CC�  � %_� ���� �? T�� ��� C�  � �	 �  ��� �  6C�  � �	 �  ��� �  6�� %�C�  � �
��4�" T�� ��� C� C�
 �  � �� �g�+ T�� ��� C� C�
 � �����趨ʱ���� � T��	 �C� � � �^�� %��  � ���� T��	 �C� � ���^�� � %��  � ���� T��	 �C��� � �^�� � �� %��  � ��� T��
 �� RGB(0,0,255)�� �Y�K T��
 �� ICASE(ALLTRIM(IC�  � _�! )=[���],RGB(255,0,0),RGB(0,0,0))�� �) T�� ��  � � �  � 
	�
 C�  � �
	�� �� U  OCOLUMN HEADER1 THIS BSHOWALLDAYS CAPTION �Ͽ����� ���� ��� �Ͽ�ʱ��	 FORECOLOR DYNAMICFORECOLOR �δ� ENABLED ��Ч� ��  � � � � � �� � � %�� � ��� �� T� �Cٱ select * from dbo.�༶����('<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) where ǩ������>0 order by �꼶���,�γ�����,������� ���� T� �C٠ select * from dbo.�༶����('<<cXQ>>','<<cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<this.cTeacher>>',<<this.nYear>>,<<this.nMonth>>) order by �꼶���,�γ�����,������� � T� �C��]�� %�C �  � �	 
���, ��C� ��ѯ�༶��Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� �O ��
 Q� ������ d:\wisemis3\��ά.vcx�� Q� ������ d:\wisemis3\��ά.vcx��) �� Q� ������ d:\wisemis3\��ά.vcx�� ��� � � � T� ��  �� T�� ���� T� ���� �� � T� �� � � ��
 F�� �� ~��� �� �% T� �� _C��� C� �C� �]��( %�C� this.Container1.� b� O��N� ��C � � �� B� �) �� Q� ������ d:\wisemis3\��ά.vcx��# T� �C� this.Container1.� ��� T� � �C� -��� T� � �C� � ��� T� � �C� � ��� T� � �C�  � ��� T� �! �C�" � ��� T� �# �CC�$ � �а�қ�� T� �% �CC�& � ���қ�� T� �' �CC�( � ���қ�� T� �) �C�* -��� T� �+ �C�, -��� ��C� �- �� � ��C � � �� U.  CXQ CXN CNJ CKC CBB CSQL CCURSOR THIS BHIDENODATA
 SELECTDATA OFIRSTBB OLASTBB OSELECTEDBB NTOP NLEFT CLASTNJ
 NALLHEIGHT
 CONTAINER1 HEIGHT CNAME �꼶 �γ����� ���
 CLOSEALIAS OBB	 BHASIMAGE HASIMAGE NTOTAL ���� NTOTAL1 ǩ������ NTOTAL2 ��˴��� NTOTAL3 ȷ�ϴ��� CBJLX �༶���� CSKZQ �Ͽ����� CSKSJ �Ͽ�ʱ�� BXYZJ ��Ҫ���� BBK ����	 SHOWCLASS� ��  �
 M(�  `���� IF exists(select * from ����ͼƬ�� with(nolock) WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>' AND ���=<<thisform.nYear>> and �·�=<<thisform.nMonth>>)� �	 	SELECT 1� � ELSE � �	 	SELECT 0� � %�C �  � ���f� T� � � �-�� �� T� � � �a�� � U  CSQL GETVALUE THIS LABELNOIMAGE VISIBLE� %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � ��C�� � 	��) �� Q� ������ d:\wisemis3\��ά.vcx�� T� �C�� �� %�� � 
��� � B� �( �� Q� XTREMECOMMANDBARS.ICommandBar�% T� �C� � ��ݷ�ʽ�  � � � ��" ��C���� ɾ���༶� �	 � �� ��
 � T�
 �C� � � �� H�K��� ��
 ������8 %�C� �����Ҫɾ���˰༶���!� ϵͳ��ʾ�x����� B� � �� �� T� ��# delete from �༶�γ̱� where У��='� � � ' and ѧ��='� � � ' and �꼶='� � � ' and �γ�����='� � � ' and ���='� � � '�� %�C � � ����( ��C� ɾ���༶�ɹ����@� ϵͳ��ʾ�x��
 �� � � ���( ��C� ɾ���༶ʧ�ܣ��@� ϵͳ��ʾ�x�� � 2��� � U  THIS BSAVED ARR OBB BBK OCOMMANDBAR OCOMMANDBARS CONTEXTMENUS ADD CONTROLS NRESULT	 SHOWPOPUP CSQL CXQ CXN CNJ CKC CBB EXECUTE THISFORM REFRESHCLASSES`� T�  � � �CCCCٗ select dbo.��ѯ���¿�ʱ2(<<this.nYear>>,<<this.nMonth>>,'<<this.cXQ>>','<<this.cXN>>','<<this.cNJ>>','<<this.cKC>>','<<this.cBB>>','<<this.cTeacher>>')��� � δ֪�_�� �� �
 M(� `�� � select COUNT(*) �" � from �༶�ſα� with(nolock)�  � where У��='<<this.cXQ>>' � � 	and ѧ��='<<this.cXN>>' � � 	and �꼶='<<this.cNJ>>' �# � 	and �γ�����='<<this.cKC>>' � � 	and ���='<<this.cBB>>' �( �" 	and �ο���ʦ='<<this.cTeacher>>' �) �# 	and YEAR(�Ͽ�����)=<<this.nYear>> �+ �% 	and MONTH(�Ͽ�����)=<<this.nMonth>> � � 	and ��ʦǩ��=1� �# T�  � � �CCC � � � δ֪�_�� U  THIS OLABELKS CAPTION GETVALUE CSQL LABELKS1 
 ��  � � U  THIS REFRESHUPANDDOWN3  ��C� � �  �� ��C� � �  �� ��C� � �  �� U 
 CLOSEALIAS THISFORM	 CKQCURSOR	 CNJCURSOR	 CBJCURSOR ��  � � � � � � �C T� � �� �˹�����    � �     C� _�  �� C� _�  ���� %�C� ��� N��� � T� �� �� � T� � �� �� H�� �F� �� ���� � T� �	 �
 �-�� T� � �
 �a�� �� ���>� T� � �
 �-�� T� � �
 �-�� T� � �
 �-�� T� � �
 �-�� T� � �
 �-�� 2�F� � T� � �� �� T� � � �� �� T� �  ��  �� T� � �� �� T� � �� �� T� � �� �� T� � �� ��
 �� � � T� � � �� � �� T� � � � ��P�� T� � � � ��P�� T� � � � ��F�� T� � � � ��F�� T� � � � ��P�� T� � � � �� �꼶�� T� � � � �� ��Ŀ�� T� � � � �� ��ʱ�� T� � � � �� �˴��� T� � � � �� �༶������ T� � � �� � �� T� � � � ��P�� T� � � � ��P�� T� � � � ��P�� T� � � � ��F�� T� � � � ��F�� T� � � � �� �꼶�� T� � � � �� ��Ŀ�� T� � � � �� ����� T� � � � �� ��ʱ�� T� � � � �� �˴���
 �� �  � ��C� �! � Click�� T� �" ���� U#  CXQ CXN CTEACHER NYEAR NMONTH NVERSION BHIDENODATA THIS CAPTION OBTNOK VISIBLE OBTNCANCELOK OCMDAUDITALL OCMDAUDITALL2 OCMDUNAUDITALL OCMDUNAUDITALL2 CHECK2 VALUE REFRESHGRID GRID2 RECORDSOURCE THISFORM	 CNJCURSOR COLUMN1 WIDTH COLUMN2 COLUMN3 COLUMN4 COLUMN5 CONTROLSOURCE GRID3	 CBJCURSOR REFRESHCLASSES OCMDSHOWSUMMARY WINDOWSTATE T�  � �C��]�� T�  � �C��]�� T�  � �C��]�� ��C�  � � �� F�  � �� �6 T� ��) ѧ�� L null,ѧ����� C(50),ѧ������ C(50)�� �� ���(����� �+ T� �� � ,� IC� _�
  C(4) null��+ T� �� � ,� QC� _�
  C(4) null�� ��4 CREATE CURSOR (thisform.cKQCursor)(&cFieldsExpr)
 ��C� � � �� F�  �[ h��� � �� � C��2��	 � C��2��
 � C��2�� � I�� � N�������� ��C� � � �� F�  �[ h��� � �� � C��2��	 � C��2�� � C��2�� � I�� � N�������� U  THIS	 CKQCURSOR	 CBJCURSOR	 CNJCURSOR
 CLOSEALIAS CFIELDSEXPR I THISFORM �꼶 ��Ŀ ��� ��ʱ �˴� �༶���� 
 ��  � � U  THIS REFRESHUPANDDOWN	 refreshxq,     ��	 refreshxn�    ��	 refreshnjL    ��	 refreshkc�    ��	 refreshbbU
    ��	 refreshkq�    �� refreshxskq>&    �� savedata[7    �� onheadrightclick�B    �� onvaluechangexT    �� bsaved_assign.U    �� refreshclasses�U    ��	 onbbclicko    ��
 cxq_assign?r    ��
 cxn_assign�r    ��
 cnj_assign�r    ��
 ckc_assignPs    ��
 cbb_assign�s    �� cteacher_assign(t    �� bshowsummary_assign�t    �� refreshgridv    �� onwhen�|    �� getrq�|    �� bchecked_assign    �� onafterrowcolchangeP    �� bxyzj_assign�    �� bshowalldays_assignC�    �� refreshupanddown��    �� setlessiontime �    ��
 addstudent(�    ��	 setcolumn8�    �� refreshclassJ�    �� refreshimagem�    �� onbbrightclick$�    ��	 refreshks��    �� Resize1�    �� UnloadZ�    �� InitȮ    �� LoadF�    �� Activate۶    ��1 � � q�q A � � QA � b4 �QA � � �q�q A � � QA � 2 � � !q�q A � � QA � �2 � � � ��a �a ��������qAA q�q A � � QA � � 2 ��QA �QA �QA �QA � � � �qqAA q�q A � � QA � 1� 2 � 21111Q�!1A �� s � �	A!Q��A � � �
�A!Q����A A q q�A A t a� � ��A q � ��11111�111a�1Q� � � � � ��!� A �� A A a� � � � �!� A �� A �A a� � � � ��� A �� A �A � � q � AQ�� �� a� �A 1qa� �A �qA qA a� A q ��� � � � A �A� � �A �� �A ��a����a� A A A � � rs � �Q�	q�� � A a� A � � � �2 ��A �A �A �A �A QA QA � A s ��q 1A � � ��������a QA�A
1
A q�A A 3� 1A�q �����A �� a �A Q � t Q�q �A � � ��������a QQ!�	QA q�A A � 1��q ����A �� � Q � 2 q� � � � ��A A � q�A A r q� �q�� � ��q!A
� �A � � �q�	� �
A A �A A 2�A A r � ��q q q�A 2�� �� � �� q � ���A A qAA �B 4 �A A � �Q��B�� A � A A 11Qr Qs r Q� !aA A q aAA A q � 1A	�A !�� � �A !aA A �A A q � �A	�A !A� � AA !aA A q � A A q � ��A	A !��� �A "� �� � !� q� � !aq A q 1!� � AA !aq A q �!� � aA � B 3 � 1q B 2 q "aaaQ2 A!�aA � �
� �	A q�A A ��� � � q 1� � q Q��1� � A !� � �� �A "!!!!1QQQQ���11R� A ��� A � 2�� � ��A A � � � � � ��!	Q� �1	!�A r�A A � A �� � Q � � � � � � q�!	�� �1	qA r�A A � A �� � Q aaaaaa������ r � q� � � A aq� � �AA A r � q� � � A aA C� A QAA � 2 aA A ���211111111A� 2 q "Q2 q "Q2 q "Q2 q "Q2 q "QQ2 q "Q2 q "11� ��� ��A 1�12 Aa1�!� A A Q� � � � � ��!� A A a� � � � �!� A �A a� � � � ��� A �A rQQ� �� A q ��� � � � � � � A �A� � qA A 2 1 q q Aq� !A 1�� A ��� A �� A �� A � 2 q "3 q � A12 q "Q2 q "� 2 qA A q�BA A 3 q A A � Qq�A A �Q� �� A A r� � � � � cqqqqq1q Q�� !�
� !�
� !�
� !�
� !�
� !q � A A "aA A �aA A !aA A �aA A !aA A �aA A !aA A �aA A a� � A A "� �A 2 aq A r � 1!!!a!!1a �1�a 1q	a �A��
q� aq�1� qA � �Aq A rr � !!!a!�a �	���Q!A !� Q �� q � �q A 2 QA A r��� �A �1!� �A qqA qA A �� �A �A 3 q� � A q�A A ��� � � q 1� � q Q�� A A �12RQQQ���11� B � 2 r � � � � A a� A 2 aA A �A A �Q!r Q� !�A A q �	!�� � �A � B 2 �q � a!��1����QA 12 � 2 2 �3Q� A � � B 1� baaaaa�����caaaaa������ s3 111� q aq��A C� �� �2 � 1                       �        �  �     "   �    -   1   4  �
  A   Y   �
  A  o   {   a  O*  �   X  q*  )>  �  �  H>  7K  &  7  ^K  p_  �  �  �_  `  *  �  B`  0a  6  �  Ua  �|  ?  �  �|  �  #  �  �   �  ?  �  A�  ��  E  �  ހ  Z�  K  �  {�  ��  Q  �  �  ��  W  �  ނ  e�  ^  �  ��  e�  d  �  ��  �  u  "  5�  Î  �  $  ߎ  h�  �  >  ��  �  �  A  �  ��  �  F  ��  @�    J  j�  ߓ    N  �  ��    ]  �  	�  !  �  *�  ݲ  �    ��  ��  �  6  ܶ  ü  
  b  �  ��  ?  o  ��  )�  N  �  I�  ��  s  �  ��  �  �  �  #�  ��  �  �  ��  W�  �  �  r�  ��  �  �  ��  ��  �   )   ��                       �_memberdata XML Metadata for customizable properties
ckqcursor
bsaved �Ƿ��ѱ���
nkc �δ�
cxq У��
cxn ѧ��
cteacher �ο���ʦ
nyear ���
nmonth �·�
cnj �꼶
ckc �γ�����
cbb ���
obb ������
bisok �Ƿ���ȷ��
nversion �汾��0 ����Ա�棬1 ����棬2 ��ʦ��
bshowsummary ��ʾ�����ػ�����Ϣ
cbjcursor �༶�����α�
cnjcursor �꼶�����α�
cbjlx �༶����
bxyzj ��Ҫ����
bchecked ��˷�
bshowalldays ��ʾ��������
bhidenodata �����޿��ڰ༶
ndcks ���ο�ʱ
ckslist ������ʱ�б�
cfilterexpr ���˱���ʽ
*refreshxq ˢ��У��
*refreshxn ˢ��ѧ��
*refreshnj ˢ���꼶
*refreshkc ˢ�¿γ�
*refreshbb ˢ�°��
*refreshkq ˢ�¿�����Ϣ
*refreshxskq ˢ��ѧ������
*savedata ��������
*onheadrightclick �����Ҽ����
*onvaluechange 
*bsaved_assign 
*refreshclasses ˢ�°��
*onbbclick ������
*cxq_assign 
*cxn_assign 
*cnj_assign 
*ckc_assign 
*cbb_assign 
*cteacher_assign 
*bshowsummary_assign 
*refreshgrid ˢ�±�����
*onwhen 
*getrq ȡ����
*bchecked_assign 
*onafterrowcolchange 
*bxyzj_assign 
*bshowalldays_assign 
*refreshupanddown ˢ���������°�ť
*setlessiontime �趨�Ͽ�ʱ��
*addstudent ����ѧ��
*setcolumn ����������
*refreshclass ˢ�µ����༶
*refreshimage ˢ�¿���ͼƬ
*onbbrightclick �༶�Ҽ��¼�
*refreshks ˢ�¿�ʱ��Ϣ
      label      label      Label6      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "��ʦ��"
Height = 21
Left = 566
Top = 47
Width = 41
Name = "Label6"
      label      label      oLabelTeacher      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 608
Top = 47
Width = 74
ForeColor = 0,0,255
Name = "oLabelTeacher"
      commandbutton      commandbutton      	oCmdClose      Form1      �Top = 12
Left = 1188
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
Cancel = .T.
Caption = "�ر�"
Name = "oCmdClose"
      �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF 

thisform.Release
ENDPROC
     &���                               �   %   �       �      �           �  U  \  %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� �
 ��  � � U  THISFORM BSAVED RELEASE Click,     ��1 aA A � 1                       �       )                           commandbutton      commandbutton      oCmdSave      Form1      |Top = 11
Left = 1019
Height = 43
Width = 144
FontName = "΢���ź�"
FontSize = 10
Caption = "����"
Name = "oCmdSave"
      /PROCEDURE Click
thisform.SaveData()
ENDPROC
      ����    �   �                         j8   %   T       i      c           �  U    ��C�  � �� U  THISFORM SAVEDATA Click,     ��1 � 1                       $       )   �                         commandbutton      commandbutton      oBtnDefault      Form1      [Top = 77
Left = 899
Height = 27
Width = 84
Caption = "Ĭ�Ͽ�ʱ"
Name = "oBtnDefault"
     �PROCEDURE Click
SELECT (thisform.cKQCursor)
FOR i=4 TO thisform.Grid1.ColumnCount
	LOCAL oColumn as Column
	oColumn=thisform.Grid1.Columns[i]
	LOCAL cColumnName
	cColumnName=oColumn.ControlSource
	IF oColumn.Enabled AND oColumn.Visible
		REPLACE &cColumnName WITH TRANSFORM(thisform.nDCKS) ALL 
		thisform.bSaved=.f.
	ENDIF 
ENDFOR 
GOTO TOP 
thisform.Grid1.Refresh


ENDPROC
     '���                              +   %   �      �     �          �  U  �  F��  � �� �� ���(��  � � ��� � �� Q� COLUMN� T� �C � �  � � �� �� � T� �� � �� %�� �	 � � �
 	��� �< REPLACE &cColumnName WITH TRANSFORM(thisform.nDCKS) ALL 
 T�  � �-�� � �� #)� ��  � � � U  THISFORM	 CKQCURSOR I GRID1 COLUMNCOUNT OCOLUMN COLUMNS CCOLUMNNAME CONTROLSOURCE ENABLED VISIBLE BSAVED REFRESH Click,     ��1 � ��q ��� A A Q � 3                       ~      )                           label      label      Label10      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "�˴Σ�"
Height = 21
Left = 811
Top = 47
Width = 41
Name = "Label10"
      label      label      oLabelKS      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 853
Top = 47
Width = 74
ForeColor = 0,0,255
Name = "oLabelKS"
      commandbutton      commandbutton      	oCmdClear      Form1      ZTop = 108
Left = 899
Height = 27
Width = 84
Caption = "��տ�ʱ"
Name = "oCmdClear"
     rPROCEDURE Click
SELECT (thisform.cKQCursor)
FOR i=4 TO thisform.Grid1.ColumnCount
	LOCAL oColumn as Column
	oColumn=thisform.Grid1.Columns[i]
	LOCAL cColumnName
	cColumnName=oColumn.ControlSource
	IF oColumn.Enabled AND oColumn.Visible
		REPLACE &cColumnName WITH "" ALL 
		thisform.bSaved=.f.
	ENDIF 
ENDFOR 
GOTO TOP 
thisform.Grid1.Refresh


ENDPROC
     ���    �  �                        ��   %   �      �     �          �  U  �  F��  � �� �� ���(��  � � ��� � �� Q� COLUMN� T� �C � �  � � �� �� � T� �� � �� %�� �	 � � �
 	��� �% REPLACE &cColumnName WITH "" ALL 
 T�  � �-�� � �� #)� ��  � � � U  THISFORM	 CKQCURSOR I GRID1 COLUMNCOUNT OCOLUMN COLUMNS CCOLUMNNAME CONTROLSOURCE ENABLED VISIBLE BSAVED REFRESH Click,     ��1 � ��q �Q� A A Q � 3                       g      )   �                        
olecontrol      
olecontrol      oCommandBars      Form1      HTop = 48
Left = 757
Height = 100
Width = 100
Name = "oCommandBars"
      )PROCEDURE Init
this.DeleteAll
ENDPROC
      ����    �   �                         �   %   N       b      \           �  U   
 ��  � � U  THIS	 DELETEALL Init,     ��1 � 1                              )   �                        
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               �ج`�l�   �       O l e O b j e c t D a t a                                            ����                                        *        A c c e s s O b j S i t e D a t a                             &  ������������                                       �        C h a n g e d P r o p s                                         ������������                                       !       ����         �����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������^�fl� O���}�|Es   {  {                                     �                          �   8                       CommandBars Control Copyright (c) 2003-2008 Codejock Software
PRODUCT-ID: Codejock.CommandBars.ActiveX.v12.0
VALIDATE-CODE: QQS-PNF-OJV-VBX                                                             �   VisualTheme 	   I
                                                                                                                                                                           BOLEObject = C:\Windows\SysWOW64\Codejock.CommandBars.v12.0.1.ocx
      commandbutton      commandbutton      
oCmdCancel      Form1      �Top = 58
Left = 1019
Height = 27
Width = 144
FontName = "΢���ź�"
FontSize = 10
Caption = "��������"
Name = "oCmdCancel"
     �PROCEDURE Click
thisform.bSaved=.t.
SELECT (thisform.cKQCursor)
LOCAL cFieldsExpr
cFieldsExpr=""
FOR i=4 TO thisform.Grid1.ColumnCount
	LOCAL oColumn as Column,cField1,cField2
	oColumn=thisform.Grid1.Columns[i]
	IF !oColumn.Enabled
		LOOP
	ENDIF
	cField1=oColumn.ControlSource
	cField2=STRTRAN(cField1,"I","Q")
	cFieldsExpr = cFieldsExpr + IIF(EMPTY(cFieldsExpr),"",",") + cField1 + " with " + cField2
ENDFOR
REPLACE &cFieldsExpr ALL
*thisform.RefreshKQ

ENDPROC
     T���    ;  ;                        6   %   �      �     �          �  U   T�  � �a�� F��  � �� �� � T� ��  �� �� ���(��  � � ��� � �� Q� COLUMN� �	 � T� �C � �  � �
 �� %�� � 
��� � .� � T� �� � �� T�	 �C� � I� Q���4 T� �� CC� �� �  � � ,6� �  with �	 �� �� REPLACE &cFieldsExpr ALL
 U  THISFORM BSAVED	 CKQCURSOR CFIELDSEXPR I GRID1 COLUMNCOUNT OCOLUMN CFIELD1 CFIELD2 COLUMNS ENABLED CONTROLSOURCE Click,     ��1 � � q � ���A A qAA �3                       �      )   ;                        label      label      LabelUnsave      Form1      �FontName = "΢���ź�"
FontSize = 10
Anchor = 9
BackStyle = 0
Caption = "δ����"
Height = 17
Left = 1212
Top = 84
Visible = .F.
Width = 40
ForeColor = 255,0,0
Name = "LabelUnsave"
      label      label      Label9      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "��ʱ��"
Height = 21
Left = 692
Top = 47
Width = 41
Name = "Label9"
      label      label      LabelKS1      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 733
Top = 47
Width = 74
ForeColor = 0,0,255
Name = "LabelKS1"
      commandbutton      commandbutton      oCmdAuditAll      Form1      �Top = 132
Left = 1188
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
Caption = "��˱���"
Name = "oCmdAuditAll"
     cPROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF

LOCAL cSQL
cSQL="update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='"+thisform.cXQ+"' and ѧ��='"+thisform.cXN+"' and �꼶='"+thisform.cNJ+"' and �γ�����='"+thisform.cKC+"' and ���='"+thisform.cBB+"' and YEAR(�Ͽ�����)="+TRANSFORM(thisform.nYear)+" and MONTH(�Ͽ�����)="+TRANSFORM(thisform.nMonth)
IF Execute(cSQL)
	thisform.RefreshKQ
	MESSAGEBOX("��˳ɹ���",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF

ENDPROC
     ����    �  �                        
a   %   b      �     q          �  U  � %��  � 
��N �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� � �� �T� ��Z update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='�  � � ' and ѧ��='�  � � ' and �꼶='�  � � ' and �γ�����='�  � � ' and ���='�  � � ' and YEAR(�Ͽ�����)=C�  � _�  and MONTH(�Ͽ�����)=C�  �	 _�� %�C � �
 ����
 ��  � �$ ��C�
 ��˳ɹ����@� ϵͳ��ʾ�x�� ���$ ��C�
 ���ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM BSAVED CSQL CXQ CXN CNJ CKC CBB NYEAR NMONTH EXECUTE	 REFRESHKQ Click,     ��1 aq A r !!� A� AA 2                       X      )   �                        commandbutton      commandbutton      oCmdUnAuditAll      Form1      �Top = 167
Left = 1188
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
Caption = "���󱾰�"
Name = "oCmdUnAuditAll"
     SPROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF

LOCAL cSQL
cSQL="update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='"+thisform.cXQ+"' and ѧ��='"+thisform.cXN+"' and �꼶='"+thisform.cNJ+"' and �γ�����='"+thisform.cKC+"' and ���='"+thisform.cBB+"' and YEAR(�Ͽ�����)="+TRANSFORM(thisform.nYear)+" and MONTH(�Ͽ�����)="+TRANSFORM(thisform.nMonth)
IF Execute(cSQL)
	thisform.RefreshKQ
	MESSAGEBOX("����˳ɹ���",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("�����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF

ENDPROC
     ����    �  �                        [H   %   R      }     a          �  U  � %��  � 
��N �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� � �� �� T� ��F update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='�  � � ' and ѧ��='�  � � ' and �꼶='�  � � ' and �γ�����='�  � � ' and ���='�  � � ' and YEAR(�Ͽ�����)=C�  � _�  and MONTH(�Ͽ�����)=C�  �	 _�� %�C � �
 ����
 ��  � �& ��C� ����˳ɹ����@� ϵͳ��ʾ�x�� ���& ��C� �����ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM BSAVED CSQL CXQ CXN CNJ CKC CBB NYEAR NMONTH EXECUTE	 REFRESHKQ Click,     ��1 aq A r �!� a� aA 2                       H      )   �                        	container      	container      
Container1      Form1      jAnchor = 7
Top = 36
Left = 12
Width = 369
Height = 552
BackColor = 192,192,192
Name = "Container1"
      label      label      Label2      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "У����"
Height = 21
Left = 410
Top = 10
Width = 41
Name = "Label2"
      label      label      LabelXQ      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 457
Top = 10
Width = 104
ForeColor = 0,0,255
Name = "LabelXQ"
      label      label      Label4      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "���ȣ�"
Height = 21
Left = 566
Top = 10
Width = 41
Name = "Label4"
      label      label      LabelXN      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 608
Top = 10
Width = 74
ForeColor = 0,0,255
Name = "LabelXN"
      label      label      Label3      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "�꼶��"
Height = 21
Left = 692
Top = 10
Width = 41
Name = "Label3"
      label      label      LabelNJ      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 733
Top = 10
Width = 74
ForeColor = 0,0,255
Name = "LabelNJ"
      label      label      Label5      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "��Ŀ��"
Height = 21
Left = 811
Top = 12
Width = 41
Name = "Label5"
      label      label      LabelKC      Form1      �FontName = "΢���ź�"
BackStyle = 0
Caption = "δ֪"
Height = 21
Left = 853
Top = 12
Width = 74
ForeColor = 0,0,255
Name = "LabelKC"
      label      label      Label8      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "�༶��"
Height = 21
Left = 410
Top = 48
Width = 41
Name = "Label8"
      label      label      LabelBB      Form1      �FontName = "΢���ź�"
WordWrap = .T.
BackStyle = 0
Caption = "δ֪"
Height = 31
Left = 457
Top = 48
Width = 104
ForeColor = 0,0,255
Name = "LabelBB"
      commandbutton      commandbutton      oBtnOK      Form1      �Top = 384
Left = 1176
Height = 39
Width = 108
FontName = "΢���ź�"
FontSize = 10
Anchor = 12
Caption = "ȷ��"
Name = "oBtnOK"
     DPROCEDURE Click
IF MESSAGEBOX("�����Ҫȷ�ϱ���������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
UPDATE �༶�ſα� SET ȷ��=1,ȷ����=dbo.WiseMis_UserName(),ȷ��ʱ��=getdate() where �ο���ʦ='<<thisform.cTeacher>>' AND У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>> and ISNULL(ȷ��,0)=0
ENDTEXT 
IF Execute(cSQL)
	thisform.RefreshClasses
	MESSAGEBOX("ȷ�ϳɹ���",0+64,"ϵͳ��ʾ")
ELSE 
	MESSAGEBOX("ȷ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ����    �  �                        #   %   8      e     G          �  U  �: %�C� �����Ҫȷ�ϱ����������!� ϵͳ��ʾ�x���> � B� � ��  �
 M(�  `���UPDATE �༶�ſα� SET ȷ��=1,ȷ����=dbo.WiseMis_UserName(),ȷ��ʱ��=getdate() where �ο���ʦ='<<thisform.cTeacher>>' AND У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>> and ISNULL(ȷ��,0)=0� � %�C �  � ����
 �� � �$ ��C�
 ȷ�ϳɹ����@� ϵͳ��ʾ�x�� ���$ ��C�
 ȷ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  CSQL EXECUTE THISFORM REFRESHCLASSES Click,     ��1 �A A r � QA !� A� AA 1                       9      )   �                        line      line      Line1      Form1      dAnchor = 14
Height = 0
Left = 396
Top = 372
Width = 767
BorderColor = 0,0,255
Name = "Line1"
      label      label      Label7      Form1      �AutoSize = .T.
FontSize = 10
Anchor = 6
Caption = "������Ϣ"
Height = 18
Left = 412
Top = 364
Width = 66
ForeColor = 0,0,255
Name = "Label7"
      grid      grid      Grid2      Form1     eColumnCount = 5
FontName = "΢���ź�"
FontSize = 10
Anchor = 6
DeleteMark = .F.
HeaderHeight = 22
Height = 204
Left = 396
Panel = 1
RecordSource = "�꼶����"
RowHeight = 22
SplitBar = .F.
Top = 384
Width = 420
AllowCellSelection = .F.
Name = "Grid2"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.ControlSource = "�꼶"
Column1.Name = "Column1"
Column2.FontName = "΢���ź�"
Column2.FontSize = 10
Column2.ControlSource = "��Ŀ"
Column2.Name = "Column2"
Column3.FontName = "΢���ź�"
Column3.FontSize = 10
Column3.ColumnOrder = 4
Column3.ControlSource = "��ʱ"
Column3.Name = "Column3"
Column4.FontName = "΢���ź�"
Column4.FontSize = 10
Column4.ColumnOrder = 5
Column4.ControlSource = "�˴�"
Column4.Name = "Column4"
Column5.FontName = "΢���ź�"
Column5.FontSize = 10
Column5.ColumnOrder = 3
Column5.Name = "Column5"
      header      header      Header1      Form1.Grid2.Column1      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�꼶"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.Column1      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.Column2      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��Ŀ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.Column2      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.Column3      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.Column3      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.Column4      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�˴�"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.Column4      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.Column5      ]FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�༶����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.Column5      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      grid      grid      Grid3      Form1     �ColumnCount = 5
FontName = "΢���ź�"
FontSize = 10
Anchor = 14
DeleteMark = .F.
HeaderHeight = 22
Height = 204
Left = 828
Panel = 1
RecordSource = "�꼶����"
RowHeight = 22
SplitBar = .F.
Top = 384
Width = 336
AllowCellSelection = .F.
Name = "Grid3"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.ControlSource = "�꼶"
Column1.Name = "Column1"
Column2.FontName = "΢���ź�"
Column2.FontSize = 10
Column2.ControlSource = "��Ŀ"
Column2.Name = "Column2"
Column3.FontName = "΢���ź�"
Column3.FontSize = 10
Column3.ColumnOrder = 4
Column3.ControlSource = "��ʱ"
Column3.Name = "Column4"
Column4.FontName = "΢���ź�"
Column4.FontSize = 10
Column4.ColumnOrder = 5
Column4.ControlSource = "�˴�"
Column4.Name = "Column5"
Column5.FontName = "΢���ź�"
Column5.FontSize = 10
Column5.ColumnOrder = 3
Column5.ControlSource = "���"
Column5.Name = "Column3"
      header      header      Header1      Form1.Grid3.Column1      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�꼶"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid3.Column1      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid3.Column2      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��Ŀ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid3.Column2      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid3.Column4      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "��ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid3.Column4      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid3.Column5      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "�˴�"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid3.Column5      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid3.Column3      YFontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "���"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid3.Column3      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      commandbutton      commandbutton      oCmdAuditAll2      Form1      �Top = 6
Left = 215
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
Caption = "���ȫ��"
Name = "oCmdAuditAll2"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF

IF MESSAGEBOX("�����Ҫ��˱���������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 


LOCAL cSQL
cSQL="update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='"+thisform.cXQ+"' and ѧ��='"+thisform.cXN+"' and �ο���ʦ='"+thisform.cTeacher+"' and YEAR(�Ͽ�����)="+TRANSFORM(thisform.nYear)+" and MONTH(�Ͽ�����)="+TRANSFORM(thisform.nMonth)
IF Execute(cSQL)
	thisform.RefreshClasses
	MESSAGEBOX("��˳ɹ���",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("���ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF

ENDPROC
     	���    �  �                        �Z   %   v      �     �          �  U  � %��  � 
��N �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� �: %�C� �����Ҫ��˱����������!� ϵͳ��ʾ�x���� � B� � �� �� T� ��Z update �༶�ſα� set ���=1,�����=dbo.WiseMis_UserName(),���ʱ��=getdate() where У��='�  � � ' and ѧ��='�  � � ' and �ο���ʦ='�  � � ' and YEAR(�Ͽ�����)=C�  � _�  and MONTH(�Ͽ�����)=C�  � _�� %�C � � ����
 ��  �	 �$ ��C�
 ��˳ɹ����@� ϵͳ��ʾ�x�� ���$ ��C�
 ���ʧ�ܣ��@� ϵͳ��ʾ�x�� � U
  THISFORM BSAVED CSQL CXQ CXN CTEACHER NYEAR NMONTH EXECUTE REFRESHCLASSES Click,     ��1 aq A �A A s A!� A� AA 2                       ~      )   �                        commandbutton      commandbutton      oCmdUnAuditAll2      Form1      �Top = 6
Left = 299
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
Caption = "����ȫ��"
Name = "oCmdUnAuditAll2"
     yPROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF

IF MESSAGEBOX("�����Ҫ����˱���������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
cSQL="update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='"+thisform.cXQ+"' and ѧ��='"+thisform.cXN+"' and �ο���ʦ='"+thisform.cTeacher+"' and YEAR(�Ͽ�����)="+TRANSFORM(thisform.nYear)+" and MONTH(�Ͽ�����)="+TRANSFORM(thisform.nMonth)
IF Execute(cSQL)
	thisform.RefreshClasses
	MESSAGEBOX("����˳ɹ���",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("�����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF

ENDPROC
     ����    �  �                        �T   %   h      �     w          �  U  � %��  � 
��N �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B�-�� �< %�C� �����Ҫ����˱����������!� ϵͳ��ʾ�x���� � B� � �� �� T� ��F update �༶�ſα� set ���=null,�����=null,���ʱ��=null where У��='�  � � ' and ѧ��='�  � � ' and �ο���ʦ='�  � � ' and YEAR(�Ͽ�����)=C�  � _�  and MONTH(�Ͽ�����)=C�  � _�� %�C � � ����
 ��  �	 �& ��C� ����˳ɹ����@� ϵͳ��ʾ�x�� ���& ��C� �����ʧ�ܣ��@� ϵͳ��ʾ�x�� � U
  THISFORM BSAVED CSQL CXQ CXN CTEACHER NYEAR NMONTH EXECUTE REFRESHCLASSES Click,     ��1 aq A �A A r !� a� aA 2                       n      )   �                        commandbutton      commandbutton      oCmdShowSummary      Form1      �Top = 563
Left = 1176
Height = 27
Width = 108
FontName = "΢���ź�"
FontSize = 10
Anchor = 12
Caption = "���ػ�����Ϣ"
Name = "oCmdShowSummary"
      HPROCEDURE Click
thisform.bShowSummary=!thisform.bShowSummary
ENDPROC
      ����    �   �                         7�   %   _       t      n           �  U    T�  � ��  � 
�� U  THISFORM BSHOWSUMMARY Click,     ��1 A1                       =       )   �                         grid      grid      Grid1      Form1     �ColumnCount = 2
FontName = "΢���ź�"
FontSize = 10
Anchor = 15
DeleteMark = .F.
HeaderHeight = 40
Height = 216
Left = 396
Panel = 1
RowHeight = 28
SplitBar = .F.
Top = 144
Width = 768
Themes = .F.
Name = "Grid1"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.ControlSource = "ѧ�����"
Column1.Width = 88
Column1.Name = "Column1"
Column2.FontName = "΢���ź�"
Column2.FontSize = 10
Column2.ControlSource = "ѧ������"
Column2.Width = 104
Column2.Name = "Column2"
      �PROCEDURE AfterRowColChange
LPARAMETERS nColIndex
SELECT (thisform.cKQCursor)
thisform.oCmdDeleteLine.Enabled=!ѧ��
thisform.oCmdDeleteStudent.Enabled=ѧ��
ENDPROC
     I���    0  0                        �5   %   �       �      �           �  U  >  ��  � F�� � �� T� � � �� 
�� T� � � �� �� U 	 NCOLINDEX THISFORM	 CKQCURSOR OCMDDELETELINE ENABLED ѧ�� OCMDDELETESTUDENT AfterRowColChange,     ��1 q � A11                       �       )   0                        header      header      Header1      Form1.Grid1.Column1      ]FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = "ѧ�����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column1      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.Column2      7Alignment = 2
Caption = "ѧ������"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column2      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      commandbutton      commandbutton      oCmdDeleteLine      Form1      vTop = 107
Left = 503
Height = 27
Width = 97
FontName = "΢���ź�"
Caption = "ɾ������"
Name = "oCmdDeleteLine"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

IF MESSAGEBOX("�����Ҫɾ��ѡ�������𣿣�ע�����п��ڲ�ɾ����",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

SELECT (thisform.cKQCursor)
LOCAL cSQL
IF ѧ��
	RETURN 
ENDIF 

TEXT TO cSQL NOSHOW TEXTMERGE 
delete 
from ���̿��ڱ�
where ����='<<ALLTRIM(ѧ������)>>' 
	and У��='<<thisform.cXQ>>' 
	and ѧ��='<<thisform.cXN>>' 
	and �꼶='<<thisform.cNJ>>' 
	and �γ�����='<<thisform.cKC>>' 
	and ���='<<thisform.cBB>>'
	and ISNULL(��ʱ��,0)=0
ENDTEXT 

IF !Execute(cSQL)
	MESSAGEBOX("ɾ������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("ɾ�����̳ɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshXSKQ
ENDIF 
ENDPROC
     ����    k  k                        N�   %   �      "     �          �  U  f %��  � 
��= �( ��C� ���ȱ������ݣ��@� ϵͳ��ʾ�x�� B� �P %�C�. �����Ҫɾ��ѡ�������𣿣�ע�����п��ڲ�ɾ�����!� ϵͳ��ʾ�x���� � B� � F��  � �� �� � %�� ��� � B� �
 M(� `�� � delete � � from ���̿��ڱ��) �# where ����='<<ALLTRIM(ѧ������)>>' �# � 	and У��='<<thisform.cXQ>>' �# � 	and ѧ��='<<thisform.cXN>>' �# � 	and �꼶='<<thisform.cNJ>>' �' �! 	and �γ�����='<<thisform.cKC>>' �" � 	and ���='<<thisform.cBB>>'� � 	and ISNULL(��ʱ��,0)=0� � %�C � � 
��%�( ��C� ɾ������ʧ�ܣ��@� ϵͳ��ʾ�x�� �_�( ��C� ɾ�����̳ɹ����@� ϵͳ��ʾ�x��
 ��  � � � U  THISFORM BSAVED	 CKQCURSOR CSQL ѧ�� EXECUTE REFRESHXSKQ Click,     ��1 �A A A A � q � A A � � Q�111q!�A 2�� �� A 1                       �      )   k                        commandbutton      commandbutton      Command1      Form1      �Top = 108
Left = 744
Height = 27
Width = 138
FontName = "΢���ź�"
Anchor = 3
Caption = "�����հ�ǩ����"
Name = "Command1"
     	4PROCEDURE Click
LOCAL cXQ,cXN,cNJ,cKC,cBB,nYear,nMonth

cXQ=thisform.cXQ
cXN=thisform.cXN
cNJ=thisform.cNJ
cKC=thisform.cKC
cBB=thisform.cBB
nYear=thisform.nYear
nMonth=thisform.nMonth

*!*	this.nKC=GetValue(TEXTMERGE("select �δ� from �༶�ſα� where У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>' and convert(varchar,�Ͽ�����,112)=convert(varchar,CAST('<<cRQ>>' as datetime),112)"))
*!*ˢ��ѧ������
LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int
SET @У��='<<cXQ>>'
SET @ѧ��='<<cXN>>'
SET @�꼶='<<cNJ>>'
SET @�γ�����='<<cKC>>'
SET @���='<<cBB>>'
SET @���=<<nYear>>
SET @�·�=<<nMonth>>
DECLARE @�Ͽ�ʱ�� varchar(50)
SELECT @�Ͽ�ʱ��=�Ͽ�ʱ�� FROM �༶�γ̱� with(nolock) WHERE У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���


select '��ά����'+@ѧ��+@�꼶+CAST(@�·� as varchar(2))+'�·� '+@�γ�����+@���+' ѧԱǩ��ǩ�˱�  �Ͽ�ʱ�䣺��'+@�Ͽ�ʱ��+'��' as ����
,a.ѧ�����
,a.ѧ������
,a.�Ͷ�ѧУ
,a.���õ绰
from ��ѧ�ǼǱ� a
where a.ѧ����� in (select ѧ����� from ѧ���γ̿δα� a inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)
	or exists(select * from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)
order by (select ISNULL(���,0) from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���),
(select CreateTime from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)
,a.ѧ�����
ENDTEXT 
cCursor="A1"
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯѧ������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

SELECT (cCursor)
LOCAL cOutput
cOutput=PUTFILE("����","ǩ����","xls")
IF !EMPTY(cOutput)
	=ToExcel(ParsePath("{app}\��������.xls"),cOutput,.f.,.f.,.f.)
	IF FILE(cOutput)
		=RunFile(cOutput)
	ENDIF 
ENDIF 
=CloseAlias("A1")
ENDPROC
     	J���    1	  1	                        �   %   s      �  3   �          �  U  � ��  � � � � � � � T�  �� �  �� T� �� � �� T� �� � �� T� �� � �� T� �� � �� T� �� � �� T� �� � �� �� �	 �
 M(� `�� �y DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int� � SET @У��='<<cXQ>>'� � SET @ѧ��='<<cXN>>'� � SET @�꼶='<<cNJ>>'� � SET @�γ�����='<<cKC>>'� � SET @���='<<cBB>>'� � SET @���=<<nYear>>� � SET @�·�=<<nMonth>>�# � DECLARE @�Ͽ�ʱ�� varchar(50)�� �� SELECT @�Ͽ�ʱ��=�Ͽ�ʱ�� FROM �༶�γ̱� with(nolock) WHERE У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���� �  � �  �� �� select '��ά����'+@ѧ��+@�꼶+CAST(@�·� as varchar(2))+'�·� '+@�γ�����+@���+' ѧԱǩ��ǩ�˱�  �Ͽ�ʱ�䣺��'+@�Ͽ�ʱ��+'��' as ����� � ,a.ѧ������ � ,a.ѧ������� � ,a.�Ͷ�ѧУ� � ,a.���õ绰� � from ��ѧ�ǼǱ� a�b�\where a.ѧ����� in (select ѧ����� from ѧ���γ̿δα� a inner join �༶�ſα� b on a.У��=b.У�� and a.ѧ��=b.ѧ�� and a.�꼶=b.�꼶 and a.�γ�����=b.�γ����� and a.���=b.��� and a.�δ�=b.�δ� where a.У��=@У�� and a.ѧ��=@ѧ�� and a.�꼶=@�꼶 and a.�γ�����=@�γ����� and a.���=@��� and YEAR(b.�Ͽ�����)=@��� and MONTH(b.�Ͽ�����)=@�·�)�� �� 	or exists(select * from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)�� �� order by (select ISNULL(���,0) from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���),�� �� (select CreateTime from ѧ���γ̱� where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)� � ,a.ѧ������ � T�	 �� A1�� %�C �  �	 �
 
���, ��C� ��ѯѧ������ʧ�ܣ��@� ϵͳ��ʾ�x�� B� �
 F��	 �� �� �" T� �C� ����� ǩ����� xls��� %�C� �
����* ��CC� {app}\��������.xls�  � ---� �� %�C� 0���� ��C � � �� � � ��C� A1� �� U  CXQ CXN CNJ CKC CBB NYEAR NMONTH THISFORM CSQL CCURSOR
 SELECTDATA COUTPUT TOEXCEL	 PARSEPATH RUNFILE
 CLOSEALIAS Click,     ��1 �� � ��������1	a a �q!q	A
a	A � q�A A � q !�� � A A � 1                       )	      )   1	                        commandbutton      commandbutton      oCmdDeleteStudent      Form1      yTop = 77
Left = 612
Height = 27
Width = 108
FontName = "΢���ź�"
Caption = "ɾ��ѧ��"
Name = "oCmdDeleteStudent"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

IF MESSAGEBOX("�����Ҫɾ��ѡ��ѧ���𣿣�ע�����п��ڲ�ɾ����",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

SELECT (thisform.cKQCursor)
LOCAL cSQL
IF !ѧ��
	RETURN 
ENDIF 

TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @ѧ����� varchar(50),@У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50)
SET @ѧ�����='<<ALLTRIM(ѧ�����)>>' 
SET @У��='<<thisform.cXQ>>' 
SET @ѧ��='<<thisform.cXN>>' 
SET @�꼶='<<thisform.cNJ>>'
SET @�γ�����='<<thisform.cKC>>' 
SET @���='<<thisform.cBB>>'

DELETE FROM ѧ���γ̱� WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���
delete 
from ѧ���γ̿δα�
where ѧ�����=@ѧ�����
	and У��=@У��
	and ѧ��=@ѧ��
	and �꼶=@�꼶
	and �γ�����=@�γ�����
	and ���=@���
	and ISNULL(��ʱ��,0)=0
					
ENDTEXT 

IF !Execute(cSQL)
	MESSAGEBOX("ɾ��ѧ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("ɾ��ѧ���ɹ���",0+64,"ϵͳ��ʾ")
	SELECT (thisform.cKQCursor)
	DELETE
	thisform.Grid1.Refresh
	*thisform.RefreshXSKQ
ENDIF 
ENDPROC
     c���    J  J                        4�   %   �        +   �          �  U  * %��  � 
��= �( ��C� ���ȱ������ݣ��@� ϵͳ��ʾ�x�� B� �P %�C�. �����Ҫɾ��ѡ��ѧ���𣿣�ע�����п��ڲ�ɾ�����!� ϵͳ��ʾ�x���� � B� � F��  � �� �� � %�� 
��� � B� �
 M(� `��� �{ DECLARE @ѧ����� varchar(50),@У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50)�, �& SET @ѧ�����='<<ALLTRIM(ѧ�����)>>' �# � SET @У��='<<thisform.cXQ>>' �# � SET @ѧ��='<<thisform.cXN>>' �" � SET @�꼶='<<thisform.cNJ>>'�' �! SET @�γ�����='<<thisform.cKC>>' �" � SET @���='<<thisform.cBB>>'� �  �� �� DELETE FROM ѧ���γ̱� WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���� � delete � � from ѧ���γ̿δα�� � where ѧ�����=@ѧ������ � 	and У��=@У��� � 	and ѧ��=@ѧ��� � 	and �꼶=@�꼶� � 	and �γ�����=@�γ������ � 	and ���=@���� � 	and ISNULL(��ʱ��,0)=0� � 					� � %�C � � 
����( ��C� ɾ��ѧ��ʧ�ܣ��@� ϵͳ��ʾ�x�� �#�( ��C� ɾ��ѧ���ɹ����@� ϵͳ��ʾ�x�� F��  � �� � ��  � � � � U  THISFORM BSAVED	 CKQCURSOR CSQL ѧ�� EXECUTE GRID1 REFRESH Click,     ��1 �A A A A � q � A A � �11!q!a �� ��QQQ�Q�� A 2�� �� A � B 1                       �      )   J                        commandbutton      commandbutton      Command4      Form1      �Top = 77
Left = 396
Height = 27
Width = 94
FontName = "΢���ź�"
Caption = "����ѧ��(����)"
ToolTipText = "������ת��"
Name = "Command4"
      �PROCEDURE Click
DO WHILE .t.
	IF thisform.AddStudent()
		IF MESSAGEBOX("����ѧ���ɹ����Ƿ�������ӣ�",1+32,"����ѧ��")<>1
			EXIT  
		ENDIF 
	ELSE
		EXIT  
	ENDIF 
ENDDO
ENDPROC
     G���    .  .                        �   %   �       �      �           �  U  z  +�a��s � %�C�  � ��c �> %�C� ����ѧ���ɹ����Ƿ�������ӣ��!� ����ѧ���x���_ � !� � �o � !� � � U  THISFORM
 ADDSTUDENT Click,     ��1 � �A A � A A A 1                       �       )   .                        commandbutton      commandbutton      	oCmdNewZJ      Form1      qTop = 107
Left = 396
Height = 27
Width = 94
FontName = "΢���ź�"
Caption = "��������"
Name = "oCmdNewZJ"
     PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ�",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF

LOCAL cZJ
DO FORM frm_f7 WITH null,"select ְԱ���,���� from ְԱ���� with(nolock) where У��='"+thisform.cXQ+"'","����" TO cZJ
IF EMPTY(NVL(cZJ,""))
	RETURN
ENDIF
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE
DECLARE @���� varchar(50)
SET @����='<<cZJ>>'

INSERT INTO ���̿��ڱ�(У��,ѧ��,�꼶,�γ�����,���,�δ�,����)
	SELECT У��,ѧ��,�꼶,�γ�����,���,�δ�,@����
	from �༶�ſα� a with(nolock)
	where not exists(select * from ���̿��ڱ� with(nolock) where ����=@���� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)
		and ISNULL(a.���,0)=0
		and a.У��='<<thisform.cXQ>>' and a.ѧ��='<<thisform.cXN>>' and a.�꼶='<<thisform.cNJ>>' and a.�γ�����='<<thisform.cKC>>' and a.���='<<thisform.cBB>>'
ENDTEXT
IF Execute(cSQL)
	MESSAGEBOX("�������̳ɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshXSKQ
ELSE
	MESSAGEBOX("��������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF

ENDPROC
     ����    �  �                        ��   %   $      m     3          �  U  � %��  � 
��= �( ��C� ���ȱ������ݣ��@� ϵͳ��ʾ�x�� B� � �� �n � frm_f7(� ������< select ְԱ���,���� from ְԱ���� with(nolock) where У��='�  � � '��� ������ %�CC� �  ҡ��� � B� � �� �
 M(� `�� � DECLARE @���� varchar(50)� � SET @����='<<cZJ>>'� �  �D �> INSERT INTO ���̿��ڱ�(У��,ѧ��,�꼶,�γ�����,���,�δ�,����)�5 �/ 	SELECT У��,ѧ��,�꼶,�γ�����,���,�δ�,@�����% � 	from �༶�ſα� a with(nolock)�� �� 	where not exists(select * from ���̿��ڱ� with(nolock) where ����=@���� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)� � 		and ISNULL(a.���,0)=0�� �� 		and a.У��='<<thisform.cXQ>>' and a.ѧ��='<<thisform.cXN>>' and a.�꼶='<<thisform.cNJ>>' and a.�γ�����='<<thisform.cKC>>' and a.���='<<thisform.cBB>>'� � %�C � � ��}�( ��C� �������̳ɹ����@� ϵͳ��ʾ�x��
 ��  � � ���( ��C� ��������ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM BSAVED CZJ FRM_F7 CXQ CSQL EXECUTE REFRESHXSKQ Click,     ��1 �A A r �AA A q � ��a AQQq�
A !�� � �A 2                             )   �                        checkbox      checkbox      Check1      Form1      �Top = 312
Left = 1188
Height = 21
Width = 97
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "��ʾ��������"
Value = .F.
Visible = .F.
Name = "Check1"
      HPROCEDURE InteractiveChange
thisform.bShowAllDays=this.Value
ENDPROC
      ����    �   �                         i�   %   k       �      �           �  U    T�  � �� � �� U  THISFORM BSHOWALLDAYS THIS VALUE InteractiveChange,     ��1 11                       =       )   �                         commandbutton      commandbutton      oBtnCancelOK      Form1      �Top = 431
Left = 1176
Height = 32
Width = 108
FontName = "΢���ź�"
FontSize = 10
Anchor = 12
Caption = "ȡ��ȷ��"
Name = "oBtnCancelOK"
     PROCEDURE Click
IF MESSAGEBOX("�����Ҫ��ȷ�ϱ���������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
UPDATE �༶�ſα� SET ȷ��=null,ȷ����=null,ȷ��ʱ��=null where �ο���ʦ='<<thisform.cTeacher>>' AND У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>
ENDTEXT 
IF Execute(cSQL)
	thisform.RefreshClasses
	MESSAGEBOX("ȷ�ϳɹ���",0+64,"ϵͳ��ʾ")
ELSE 
	MESSAGEBOX("ȷ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ����    �  �                        ��   %         >                �  U  �< %�C� �����Ҫ��ȷ�ϱ����������!� ϵͳ��ʾ�x���@ � B� � ��  �
 M(�  `��� �� UPDATE �༶�ſα� SET ȷ��=null,ȷ����=null,ȷ��ʱ��=null where �ο���ʦ='<<thisform.cTeacher>>' AND У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>� � %�C �  � ����
 �� � �$ ��C�
 ȷ�ϳɹ����@� ϵͳ��ʾ�x�� ���$ ��C�
 ȷ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  CSQL EXECUTE THISFORM REFRESHCLASSES Click,     ��1 �A A r � �A !� A� AA 1                             )   �                        commandbutton      commandbutton      Command5      Form1      pTop = 77
Left = 744
Height = 27
Width = 138
FontName = "΢���ź�"
Caption = "��������"
Name = "Command5"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF 

LOCAL cBKRQ
cBKRQ=thisform.GetRQ()
IF EMPTY(cBKRQ)
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@�ο���ʦ varchar(50),@�Ͽ����� datetime,@���� bit,@�Ͽ�ʱ�� char(11)
SET @У��='<<thisform.cXQ>>'
SET @ѧ��='<<thisform.cXN>>'
SET @�꼶='<<thisform.cNJ>>'
SET @�γ�����='<<thisform.cKC>>'
SET @���='<<thisform.cBB>>'
SET @�ο���ʦ='<<thisform.cTeacher>>'
SET @�Ͽ�����=CAST('<<SUBSTR(cBKRQ,1,4)+"-"+SUBSTR(cBKRQ,5,2)+"-"+SUBSTR(cBKRQ,7,2)>>' as datetime)
SET @����=(select ���� from �༶�γ̱� where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)
SET @�Ͽ�ʱ��=(select �Ͽ�ʱ�� from �༶�γ̱� with(nolock) where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)

DECLARE @�δ� int
SET @�δ�=ISNULL((select top 1 �δ� from �༶�ſα� with(nolock) where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@��� order by �δ� desc),0)+1

INSERT INTO �༶�ſα�(У��,ѧ��,�꼶,�γ�����,���,�δ�,�ο���ʦ,�Ͽ�����,����,�Ͽ�ʱ��) VALUES (@У��,@ѧ��,@�꼶,@�γ�����,@���,@�δ�,@�ο���ʦ,@�Ͽ�����,@����,@�Ͽ�ʱ��)
ENDTEXT 

IF Execute(cSQL)
	MESSAGEBOX("�����Ͽ����ڳɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshKQ
ELSE 
	MESSAGEBOX("�����Ͽ�����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ����    �  �                        �s   %         l  #   &          �  U  � %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � �� � T� �C�  � �� %�C� ���z � B� � �� �
 M(� `��� �� DECLARE @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@�ο���ʦ varchar(50),@�Ͽ����� datetime,@���� bit,@�Ͽ�ʱ�� char(11)�" � SET @У��='<<thisform.cXQ>>'�" � SET @ѧ��='<<thisform.cXN>>'�" � SET @�꼶='<<thisform.cNJ>>'�& �  SET @�γ�����='<<thisform.cKC>>'�" � SET @���='<<thisform.cBB>>'�+ �% SET @�ο���ʦ='<<thisform.cTeacher>>'�i �c SET @�Ͽ�����=CAST('<<SUBSTR(cBKRQ,1,4)+"-"+SUBSTR(cBKRQ,5,2)+"-"+SUBSTR(cBKRQ,7,2)>>' as datetime)�� �| SET @����=(select ���� from �༶�γ̱� where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)�� �� SET @�Ͽ�ʱ��=(select �Ͽ�ʱ�� from �༶�γ̱� with(nolock) where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@���)� �  � � DECLARE @�δ� int�� �� SET @�δ�=ISNULL((select top 1 �δ� from �༶�ſα� with(nolock) where У��=@У�� AND ѧ��=@ѧ�� AND �꼶=@�꼶 AND �γ�����=@�γ����� AND ���=@��� order by �δ� desc),0)+1� �  �� �� INSERT INTO �༶�ſα�(У��,ѧ��,�꼶,�γ�����,���,�δ�,�ο���ʦ,�Ͽ�����,����,�Ͽ�ʱ��) VALUES (@У��,@ѧ��,@�꼶,@�γ�����,@���,@�δ�,@�ο���ʦ,@�Ͽ�����,@����,@�Ͽ�ʱ��)� � %�C � � ��r�, ��C� �����Ͽ����ڳɹ����@� ϵͳ��ʾ�x��
 ��  � � ���, ��C� �����Ͽ�����ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM BSAVED CBKRQ GETRQ CSQL EXECUTE	 REFRESHKQ Click,     ��1 aA A r � A A r � !!!a!��!q	a qAa AA "�� � �A 1                       �      )   �                        commandbutton      commandbutton      oCmdUp      Form1      �Top = 35
Left = 381
Height = 27
Width = 15
FontBold = .T.
FontName = "΢���ź�"
FontSize = 12
Anchor = 3
Caption = "��"
ToolTipText = "���Ϲ���"
Name = "oCmdUp"
     KPROCEDURE Click

LOCAL oControl as Control
oControl=thisform.Container1.Controls[1]
LOCAL nMove
nMove=oControl.Height+5


FOR i=1 TO thisform.Container1.ControlCount
	LOCAL oControl as Control
	oControl=thisform.Container1.Controls[i]
	oControl.Top = oControl.Top + nMove
ENDFOR 

thisform.RefreshUpAndDown
ENDPROC
     ����    �  �                        u!   %   D      k     S          �  U  �  ��  Q� CONTROL� T�  �C�� � � �� �� � T� ��  � ��� �� ���(�� � � ��� � ��  Q� CONTROL� T�  �C � � � � �� T�  � ��  � � �� ��
 �� �	 � U
  OCONTROL THISFORM
 CONTAINER1 CONTROLS NMOVE HEIGHT I CONTROLCOUNT TOP REFRESHUPANDDOWN Click,     ��1 "qq A�!�qA � 1                       @      )   �                        commandbutton      commandbutton      oCmdDown      Form1      �Top = 64
Left = 381
Height = 27
Width = 15
FontBold = .T.
FontName = "΢���ź�"
FontSize = 12
Anchor = 3
Caption = "��"
ToolTipText = "���¹���"
Name = "oCmdDown"
     �PROCEDURE Click
*!*	IF thisform.Container1.ControlCount=0
*!*		RETURN 
*!*	ENDIF 

LOCAL oControl as Control
oControl=thisform.Container1.Controls[1]
LOCAL nMove
nMove=oControl.Height+5
*!*	IF oControl.Top-5<=0
*!*		RETURN 
*!*	ENDIF 
*!*	IF oControl.Top-5<thisform.Container1.Height AND oControl.Top>5
*!*		nMove=thisform.Container1.Height-oControl.Top+5
*!*	ENDIF 
*!*	IF oControl.Top-5>thisform.Container1.Height
*!*		nMove=thisform.Container1.Height
*!*	ENDIF 

FOR i=1 TO thisform.Container1.ControlCount
	LOCAL oControl as Control
	oControl=thisform.Container1.Controls[i]
	oControl.Top = oControl.Top - nMove
ENDFOR 

thisform.RefreshUpAndDown
ENDPROC
     ����    �  �                        u!   %   D      k     S          �  U  �  ��  Q� CONTROL� T�  �C�� � � �� �� � T� ��  � ��� �� ���(�� � � ��� � ��  Q� CONTROL� T�  �C � � � � �� T�  � ��  � � �� ��
 �� �	 � U
  OCONTROL THISFORM
 CONTAINER1 CONTROLS NMOVE HEIGHT I CONTROLCOUNT TOP REFRESHUPANDDOWN Click,     ��1 %qq A�!�qA � 1                       �      )   �                        commandbutton      commandbutton      Command6      Form1      �Top = 77
Left = 503
Height = 27
Width = 97
FontName = "΢���ź�"
Caption = "����ѧ��(��ʱ)"
Enabled = .F.
ToolTipText = "��ʱ���Σ������õ���"
Visible = .F.
Name = "Command6"
     
�PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN
ENDIF 


LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int
set @У��='<<thisform.cXQ>>'
set @ѧ��='<<thisform.cXN>>'
set @�꼶='<<thisform.cNJ>>'
set @�γ�����='<<thisform.cKC>>'
set @���='<<thisform.cBB>>'
set @���=<<thisform.nYear>>
set @�·�=<<thisform.nMonth>>

declare @�༶���� varchar(50)
set @�༶����=(select �༶���� from �༶�γ̱� where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)

SELECT ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰
FROM ��ѧ�ǼǱ� a
WHERE (exists(select * from ѧ���γ̱� a1 inner join �༶�γ̱� a2 on a1.У��=a2.У�� and a1.ѧ��=a2.ѧ�� and a1.�꼶=a2.�꼶 and a1.�γ�����=a2.�γ����� and a1.���=a2.��� where a1.ѧ�����=a.ѧ����� and a1.У��=@У�� and a1.ѧ��=@ѧ�� and a1.�꼶=@�꼶 and a1.�γ�����=@�γ����� and a2.�༶����=@�༶����) 
	or exists(select * from ѧ��������Ϣ where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and �༶����=@�༶����))
		and not exists(select * 
						from ѧ���γ̿δα� d inner join �༶�ſα� e on d.У��=e.У�� and d.ѧ��=e.ѧ�� and d.�꼶=e.�꼶 and d.�γ�����=e.�γ����� and d.���=e.��� and d.�δ�=e.�δ�
						where d.ѧ�����=a.ѧ�����
							and d.У��=@У�� and d.ѧ��=@ѧ�� and d.�꼶=@�꼶 and d.�γ�����=@�γ����� and d.���=@���
							and year(e.�Ͽ�����)=@��� and month(e.�Ͽ�����)=@�·�
						)
order by ѧ������
ENDTEXT 
LOCAL cXSBH
DO FORM frm_f7 WITH null,cSQL,"ѧ�����" TO cXSBH
IF EMPTY(NVL(cXSBH,""))
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@ѧ����� varchar(50)
set @У��='<<thisform.cXQ>>'
set @ѧ��='<<thisform.cXN>>'
set @�꼶='<<thisform.cNJ>>'
set @�γ�����='<<thisform.cKC>>'
set @���='<<thisform.cBB>>'
SET @ѧ�����='<<cXSBH>>'

INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�)
	SELECT @ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�
	from �༶�ſα� a
	where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@��� and ISNULL(���,0)=0 and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>
		and not exists(select * from ѧ���γ̿δα� where ѧ�����=@ѧ����� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)
ENDTEXT 
IF Execute(cSQL)
	MESSAGEBOX("����ѧ���ɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshXSKQ
ELSE
	MESSAGEBOX("����ѧ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ���    �  �                        �   %   1      �  ;   @          �  U  �
 %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � �� �
 M(� `�� �y declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@��� int,@�·� int�" � set @У��='<<thisform.cXQ>>'�" � set @ѧ��='<<thisform.cXN>>'�" � set @�꼶='<<thisform.cNJ>>'�& �  set @�γ�����='<<thisform.cKC>>'�" � set @���='<<thisform.cBB>>'�" � set @���=<<thisform.nYear>>�# � set @�·�=<<thisform.nMonth>>� �  �# � declare @�༶���� varchar(50)�� �� set @�༶����=(select �༶���� from �༶�γ̱� where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@���)� �  �> �8 SELECT ѧ�����,ѧ������,�꼶,ĸ�׵绰,���׵绰,���õ绰� � FROM ��ѧ�ǼǱ� a�<�6WHERE (exists(select * from ѧ���γ̱� a1 inner join �༶�γ̱� a2 on a1.У��=a2.У�� and a1.ѧ��=a2.ѧ�� and a1.�꼶=a2.�꼶 and a1.�γ�����=a2.�γ����� and a1.���=a2.��� where a1.ѧ�����=a.ѧ����� and a1.У��=@У�� and a1.ѧ��=@ѧ�� and a1.�꼶=@�꼶 and a1.�γ�����=@�γ����� and a2.�༶����=@�༶����) �� �� 	or exists(select * from ѧ��������Ϣ where ѧ�����=a.ѧ����� and У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and �༶����=@�༶����))�  � 		and not exists(select * �� �� 						from ѧ���γ̿δα� d inner join �༶�ſα� e on d.У��=e.У�� and d.ѧ��=e.ѧ�� and d.�꼶=e.�꼶 and d.�γ�����=e.�γ����� and d.���=e.��� and d.�δ�=e.�δ��' �! 						where d.ѧ�����=a.ѧ������i �c 							and d.У��=@У�� and d.ѧ��=@ѧ�� and d.�꼶=@�꼶 and d.�γ�����=@�γ����� and d.���=@����C �= 							and year(e.�Ͽ�����)=@��� and month(e.�Ͽ�����)=@�·�� � 						)� � order by ѧ������� � �� �( � frm_f7(� ����� �� ѧ������� %�CC� �  ҡ���� B� � �� �
 M(� `��� �{ declare @У�� varchar(50),@ѧ�� varchar(50),@�꼶 varchar(50),@�γ����� varchar(50),@��� varchar(50),@ѧ����� varchar(50)�" � set @У��='<<thisform.cXQ>>'�" � set @ѧ��='<<thisform.cXN>>'�" � set @�꼶='<<thisform.cNJ>>'�& �  set @�γ�����='<<thisform.cKC>>'�" � set @���='<<thisform.cBB>>'� � SET @ѧ�����='<<cXSBH>>'� �  �L �F INSERT INTO ѧ���γ̿δα�(ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�)�9 �3 	SELECT @ѧ�����,У��,ѧ��,�꼶,�γ�����,���,�δ�� � 	from �༶�ſα� a�� �� 	where У��=@У�� and ѧ��=@ѧ�� and �꼶=@�꼶 and �γ�����=@�γ����� and ���=@��� and ISNULL(���,0)=0 and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>�� �� 		and not exists(select * from ѧ���γ̿δα� where ѧ�����=@ѧ����� and У��=a.У�� and ѧ��=a.ѧ�� and �꼶=a.�꼶 and �γ�����=a.�γ����� and ���=a.��� and �δ�=a.�δ�)� � %�C � � ���
�( ��C� ����ѧ���ɹ����@� ϵͳ��ʾ�x��
 ��  � � ��
�( ��C� ����ѧ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  THISFORM BSAVED CSQL CXSBH FRM_F7 EXECUTE REFRESHXSKQ Click,     ��1 aA A s � �!!!a!!1a 1�a �q�!
�
q�1� qA q �AA A r � !!!a!�a ����QA !�� � �A 1                       �
      )   �                        commandbutton      commandbutton      oCmdDeleteClass      Form1      �Top = 108
Left = 612
Height = 27
Width = 108
FontName = "΢���ź�"
Caption = "ɾ���༶�����£�"
Name = "oCmdDeleteClass"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

IF MESSAGEBOX("�����Ҫɾ�����൱���ſ��𣿣�ע�����п��ڲ�ɾ����",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
DELETE 
FROM �༶�ſα� 
WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>'
	and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>
	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)
ENDTEXT 

IF !Execute(cSQL)
	MESSAGEBOX("ɾ���༶�ſ�ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ELSE
	MESSAGEBOX("ɾ���༶�ſγɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshKQ
ENDIF 
ENDPROC
     )���                              ��   %   �      �     �          �  U  . %��  � 
��= �( ��C� ���ȱ������ݣ��@� ϵͳ��ʾ�x�� B� �T %�C�2 �����Ҫɾ�����൱���ſ��𣿣�ע�����п��ڲ�ɾ�����!� ϵͳ��ʾ�x���� � B� � �� �
 M(� `�� � DELETE � � FROM �༶�ſα� �� �� WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>'�T �N 	and YEAR(�Ͽ�����)=<<thisform.nYear>> and MONTH(�Ͽ�����)=<<thisform.nMonth>>�� �� 	and not exists(select * from ѧ���γ̿δα� where У��=�༶�ſα�.У�� and ѧ��=�༶�ſα�.ѧ�� and �꼶=�༶�ſα�.�꼶 and �γ�����=�༶�ſα�.�γ����� and ���=�༶�ſα�.��� and �δ�=�༶�ſα�.�δ� and ISNULL(��ʱ��,0)>0)� � %�C � � 
����, ��C� ɾ���༶�ſ�ʧ�ܣ��@� ϵͳ��ʾ�x�� �'�, ��C� ɾ���༶�ſγɹ����@� ϵͳ��ʾ�x��
 ��  � � � U  THISFORM BSAVED CSQL EXECUTE	 REFRESHKQ Click,     ��1 �A A BA A r � � aq	A�A 2�� �� A 1                       �      )                           commandbutton      commandbutton      Command7      Form1      qTop = 108
Left = 1020
Height = 27
Width = 72
FontName = "΢���ź�"
Caption = "����ͼƬ"
Name = "Command7"
     (PROCEDURE Click
LOCAL oCommandBar as XtremeCommandBars.ICommandBar
oCommandBar=thisform.oCommandbars.ContextMenus.Add(0,"��ݷ�ʽ")
oCommandBar.Controls.Add(1,1001,"�ϴ�ͼƬ")

LOCAL cSQL,cCursor
TEXT TO cSQL NOSHOW TEXTMERGE 
select * 
from ����ͼƬ�� with(nolock)
WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>' AND ���=<<thisform.nYear>> and �·�=<<thisform.nMonth>>
order by CreateTime desc
ENDTEXT 

cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ��Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
SELECT (cCursor)
IF RECCOUNT()>0
	oCommandBar.Controls.Add(8,1002,"��ʾͼƬ")
	SCAN 
		LOCAL oImageTool as XtremeCommandBars.ICommandBarControl
		oImageTool=oCommandBar.Controls.Add(2,2000+RECNO(),ALLTRIM(CreateUser)+" �� "+TRANSFORM(CreateTime)+"�ϴ�")&&.Parameter=ALLTRIM(ͼƬ)
		oImageTool.CommandBar.Controls.Add(1,3000+RECNO(),"�鿴ͼƬ").Parameter="<Action>View</Action><Image>"+ALLTRIM(ͼƬ)+"</Image>"
		oImageTool.CommandBar.Controls.Add(1,4000+RECNO(),"ɾ��ͼƬ").Parameter="<Action>Delete</Action><Id>"+TRANSFORM(id)+"</Id><Image>"+ALLTRIM(ͼƬ)+"</Image>"
	ENDSCAN 
ENDIF 
=CloseAlias(cCursor)

LOCAL nResult
nResult=oCommandBar.ShowPopup(256)

DO CASE
CASE nResult=1001
	LOCAL cFile
	cFile=GETPICT()
	IF FILE(cFile)
		LOCAL cGuid
		cGuid=""
		IF SaveFileToDB(cFile,@cGuid)
			LOCAL cSQL
			TEXT TO cSQL NOSHOW TEXTMERGE 
			INSERT INTO ����ͼƬ��(У��,ѧ��,�꼶,�γ�����,���,���,�·�,ͼƬ) VALUES ('<<thisform.cXQ>>','<<thisform.cXN>>','<<thisform.cNJ>>','<<thisform.cKC>>','<<thisform.cBB>>',<<thisform.nYear>>,<<thisform.nMonth>>,'<<cGuid>>')
			ENDTEXT 
			IF Execute(cSQL)
				MESSAGEBOX("�ϴ�����ͼƬ�ɹ���",0+64,"ϵͳ��ʾ")
				thisform.LabelNoImage.Visible= .F.
				thisform.RefreshClass(thisform.cXQ,thisform.cXN,thisform.cNJ,thisform.cKC,thisform.cBB)
			ELSE 
				MESSAGEBOX("�ϴ�����ͼƬʧ�ܣ�",0+64,"ϵͳ��ʾ")
			ENDIF 
		ELSE 
			MESSAGEBOX("���濼��ͼƬʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF 
	ENDIF 

CASE nResult>2000
	LOCAL oTool as XtremeCommandBars.ICommandBarControl
	oTool=oCommandBar.FindControl(1,nResult,.t.,.t.)
	LOCAL cParameter
	cParameter=oTool.Parameter
	LOCAL cAction
	cAction=STREXTRACT(cParameter,"<Action>","</Action>")
	DO CASE
	CASE cAction=="View"
		LOCAL cImage
		cImage=STREXTRACT(cParameter,"<Image>","</Image>")
		IF EMPTY(cImage)
			RETURN 
		ENDIF 
		LOCAL cFileName,cExtName,cFileStream
		STORE "" TO cFileName,cExtName,cFileStream
		IF GetFileFromDB(cImage,@cFileName,@cExtName,@cFileStream)
			LOCAL cFile
			cFile=ADDBS(ParsePath("{app}\Files"))+cFileName+"."+cExtName
			*cFile=PUTFILE("�����ļ�",cFileName,cExtName)
			IF !EMPTY(cFile)
				=STRTOFILE(cFileStream,cFile)
				IF FILE(cFile)
					=ShellExecute(0,"open",cFile,"","",5)
					*=RunFile(cFile)
				ENDIF 
			ENDIF 
		ELSE
			MESSAGEBOX("��ȡͼƬʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF 
	CASE cAction=="Delete"
		LOCAL nId
		nId=VAL(STREXTRACT(cParameter,"<Id>","</Id>"))
		IF MESSAGEBOX("�����Ҫɾ����ͼƬ��",1+32,"ϵͳ��ʾ")<>1
			RETURN 
		ENDIF 
		IF !Execute("delete from ����ͼƬ�� where id="+TRANSFORM(nId))
			MESSAGEBOX("ɾ��ͼƬʧ�ܣ�",0+64,"ϵͳ��ʾ")
			RETURN 
		ENDIF 
		LOCAL cImage
		cImage=STREXTRACT(cParameter,"<Image>","</Image>")
		=DeleteFileFromDB(cImage)
		MESSAGEBOX("ɾ��ͼƬ�ɹ���",0+64,"ϵͳ��ʾ")
		thisform.RefreshImage
		thisform.RefreshClass(thisform.cXQ,thisform.cXN,thisform.cNJ,thisform.cKC,thisform.cBB)
	OTHERWISE

	ENDCASE
OTHERWISE

ENDCASE
ENDPROC
     ����    �  �                        �   %   �      }  e   �          �  U  �	( ��  Q� XTREMECOMMANDBARS.ICommandBar�% T�  �C� � ��ݷ�ʽ� � � � ��" ��C���� �ϴ�ͼƬ�  � � �� �� � �
 M(� `�� �	 select * �" � from ����ͼƬ�� with(nolock)�� �� WHERE У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<thisform.cNJ>>' AND �γ�����='<<thisform.cKC>>' AND ���='<<thisform.cBB>>' AND ���=<<thisform.nYear>> and �·�=<<thisform.nMonth>>� � order by CreateTime desc� � T� �C��]�� %�C �  � � 
����( ��C� ��ȡ��Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� �
 F�� �� %�CN� ����" ��C���� ��ʾͼƬ�  � � �� ~���/ ��	 Q�$ XTREMECOMMANDBARS.ICommandBarControl�9 T�	 �C���COC�
 ��  �� C� _� �ϴ��  � � ��e T�	 � � � ������CO��� �鿴ͼƬ�� �� <Action>View</Action><Image>C� �� </Image>��z T�	 � � � ������CO��� ɾ��ͼƬ�� �� <Action>Delete</Action><Id>C� _� </Id><Image>C� �� </Image>�� � � ��C � � �� �� � T� �C� �  � �� H����	� �� ����� �� � T� �C��� %�C� 0��� �� � T� ��  �� %�C � � � ���� �� �
 M(� `��� �� 			INSERT INTO ����ͼƬ��(У��,ѧ��,�꼶,�γ�����,���,���,�·�,ͼƬ) VALUES ('<<thisform.cXQ>>','<<thisform.cXN>>','<<thisform.cNJ>>','<<thisform.cKC>>','<<thisform.cBB>>',<<thisform.nYear>>,<<thisform.nMonth>>,'<<cGuid>>')� � %�C � � ����, ��C� �ϴ�����ͼƬ�ɹ����@� ϵͳ��ʾ�x�� T� � � �-��+ ��C� � � � � � � � � � � � �� ���, ��C� �ϴ�����ͼƬʧ�ܣ��@� ϵͳ��ʾ�x�� � �	�, ��C� ���濼��ͼƬʧ�ܣ��@� ϵͳ��ʾ�x�� � � �� �����	�/ �� Q�$ XTREMECOMMANDBARS.ICommandBarControl� T� �C� � aa�  �  �� ��! � T�! �� � �� ��" �' T�" �C�! � <Action>�	 </Action>���� H����	� ��" � View��� ��# �% T�# �C�! � <Image>� </Image>���� %�C�# ���� B� � ��$ �% �& � J��  �(�$ �% �& � %�C �# �$ �% �& �' ���� �� �, T� �CC� {app}\Files�( ���$ � .�% �� %�C� �
���� ��C�& � ���� %�C� 0����! ��C� � open � �  �  ��) �� � � ��( ��C� ��ȡͼƬʧ�ܣ��@� ϵͳ��ʾ�x�� � ��" � Delete���	� ��* �! T�* �CC�! � <Id>� </Id>��g��8 %�C� �����Ҫɾ����ͼƬ���!� ϵͳ��ʾ�x����� B� �8 %�C�  delete from ����ͼƬ�� where id=C�* _� 
����( ��C� ɾ��ͼƬʧ�ܣ��@� ϵͳ��ʾ�x�� B� � ��# �% T�# �C�! � <Image>� </Image>���� ��C �# �+ ��( ��C� ɾ��ͼƬ�ɹ����@� ϵͳ��ʾ�x��
 �� �, �+ ��C� � � � � � � � � � � � �� 2��	� � 2��	� � U-  OCOMMANDBAR THISFORM OCOMMANDBARS CONTEXTMENUS ADD CONTROLS CSQL CCURSOR
 SELECTDATA
 OIMAGETOOL
 CREATEUSER
 CREATETIME
 COMMANDBAR	 PARAMETER ͼƬ ID
 CLOSEALIAS NRESULT	 SHOWPOPUP CFILE CGUID SAVEFILETODB EXECUTE LABELNOIMAGE VISIBLE REFRESHCLASS CXQ CXN CNJ CKC CBB OTOOL FINDCONTROL
 CPARAMETER CACTION CIMAGE	 CFILENAME CEXTNAME CFILESTREAM GETFILEFROMDB	 PARSEPATH SHELLEXECUTE NID DELETEFILEFROMDB REFRESHIMAGE Click,     ��1 �Q!� � � !�A q�A A � !� ��Q�A A � r Q� !q � � q � aq � qA !��� �A � �A A "��q q q� Qq Q� A A � Q�q �� � B A � �A qq �A A ��A A q Q� �� �� B � B 1                             )   �                        label      label      LabelNoImage      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "���ϴ�ͼƬ��"
Height = 21
Left = 1096
Top = 110
Visible = .F.
Width = 80
ForeColor = 255,0,0
Name = "LabelNoImage"
      commandbutton      commandbutton      	Command10      Form1      }Top = 6
Left = 11
Height = 27
Width = 91
FontName = "΢���ź�"
FontSize = 10
Caption = "ˢ�°༶"
Name = "Command10"
      3PROCEDURE Click
thisform.RefreshClasses
ENDPROC
      ����    �   �                         �B   %   W       l      f           �  U   
 ��  � � U  THISFORM REFRESHCLASSES Click,     ��1 � 1                       (       )   �                         commandbutton      commandbutton      Command3      Form1      }Top = 6
Left = 108
Height = 27
Width = 91
FontName = "΢���ź�"
FontSize = 10
Caption = "�����ΰ�"
Name = "Command3"
     �PROCEDURE Click
LOCAL cSQL
LOCAL cNJ
TEXT TO cSQL NOSHOW TEXTMERGE 
select distinct a.�꼶,b.���
from �༶�γ̱� a inner join �꼶�� b on a.�꼶=b.�꼶 
where a.У��='<<thisform.cXQ>>' and a.ѧ��='<<thisform.cXN>>' --and a.�ο���ʦ='<<thisform.cTeacher>>'
order by b.���
ENDTEXT 

DO FORM frm_f7 WITH null,cSQL,"�꼶" TO cNJ
IF EMPTY(NVL(cNJ,""))
	RETURN 
ENDIF 

LOCAL cKC
TEXT TO cSQL NOSHOW TEXTMERGE 
SELECT distinct �γ�����
from �༶�γ̱�
where У��='<<thisform.cXQ>>' and ѧ��='<<thisform.cXN>>' and �꼶='<<cNJ>>' --and �ο���ʦ='<<thisform.cTeacher>>'
ENDTEXT 

DO FORM frm_f7 WITH null,cSQL,"�γ�����" TO cKC
IF EMPTY(NVL(cKC,""))
	RETURN 
ENDIF 

LOCAL cBJLX
LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
SELECT �༶����
from �γ��շѱ�
where У��='<<thisform.cXQ>>' and ѧ��='<<thisform.cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>'
order by ���
ENDTEXT 
DO FORM frm_f7 WITH null,cSQL TO cBJLX

IF EMPTY(NVL(cBJLX,""))
	MESSAGEBOX("��δ�������γ��շѱ�׼��",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cBB
cBB=INPUTBOX("����༶������֣�","�������ΰ�","")
IF EMPTY(cBB)
	RETURN 
ENDIF 
TEXT TO cSQL NOSHOW TEXTMERGE 
IF exists(select * from �༶�γ̱� where У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>')
	SELECT 0
ELSE 
	SELECT 1
ENDTEXT 
IF GetValue(cSQL)=0
	MESSAGEBOX("������ͬ���ֵİ༶��",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

*!*�����༶
TEXT TO cSQL NOSHOW TEXTMERGE 
INSERT INTO �༶�γ̱�(У��,ѧ��,�꼶,�γ�����,���,�ο���ʦ,����,�༶����) VALUES ('<<thisform.cXQ>>','<<thisform.cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<thisform.cTeacher>>',1,'<<cBJLX>>')
ENDTEXT 
IF Execute(cSQL)
	MESSAGEBOX("�������ΰ�ɹ���",0+64,"ϵͳ��ʾ")
	thisform.cNJ=cNJ
	thisform.cKC=cKC
	thisform.cBB=cBB
	thisform.RefreshClasses
ELSE
	MESSAGEBOX("�������ΰ�ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 

ENDPROC
     ����    �  �                        I�   %   �      p  @   �          �  U  ` ��  � �� �
 M(�  `��# � select distinct a.�꼶,b.����= �7 from �༶�γ̱� a inner join �꼶�� b on a.�꼶=b.�꼶 �l �f where a.У��='<<thisform.cXQ>>' and a.ѧ��='<<thisform.cXN>>' --and a.�ο���ʦ='<<thisform.cTeacher>>'� � order by b.���� �$ � frm_f7(� �����  �� �꼶�� %�CC� �  ҡ��9� B� � �� �
 M(�  `�� � SELECT distinct �γ������ � from �༶�γ̱��y �s where У��='<<thisform.cXQ>>' and ѧ��='<<thisform.cXN>>' and �꼶='<<cNJ>>' --and �ο���ʦ='<<thisform.cTeacher>>'� �( � frm_f7(� �����  �� �γ������� %�CC� �  ҡ��>� B� � �� � ��  �
 M(�  `�� � SELECT �༶����� � from �γ��շѱ��i �c where У��='<<thisform.cXQ>>' and ѧ��='<<thisform.cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>'� � order by ���� � � frm_f7(� �����  � %�CC� �  ҡ��h�2 ��C� ��δ�������γ��շѱ�׼���@� ϵͳ��ʾ�x�� B� � �� �2 T� �C� ����༶������֣��
 �������ΰ��  ���� %�C� ����� B� �
 M(�  `��� �� IF exists(select * from �༶�γ̱� where У��='<<thisform.cXQ>>' AND ѧ��='<<thisform.cXN>>' AND �꼶='<<cNJ>>' AND �γ�����='<<cKC>>' AND ���='<<cBB>>')� �	 	SELECT 0� � ELSE � �	 	SELECT 1� � %�C �  � � ����. ��C� ������ͬ���ֵİ༶���@� ϵͳ��ʾ�x�� B� �
 M(�  `��� �� INSERT INTO �༶�γ̱�(У��,ѧ��,�꼶,�γ�����,���,�ο���ʦ,����,�༶����) VALUES ('<<thisform.cXQ>>','<<thisform.cXN>>','<<cNJ>>','<<cKC>>','<<cBB>>','<<thisform.cTeacher>>',1,'<<cBJLX>>')� � %�C �  � ��'�* ��C� �������ΰ�ɹ����@� ϵͳ��ʾ�x�� T� � �� �� T� � �� �� T� � �� ��
 �� �	 � �Y�* ��C� �������ΰ�ʧ�ܣ��@� ϵͳ��ʾ�x�� � U
  CSQL CNJ FRM_F7 CKC CBJLX CBB GETVALUE EXECUTE THISFORM REFRESHCLASSES Click,     ��1 q q � 1��QA BAA A r � �Q�A �AA A r q � QQ�1A �B!A A r !� A A � 
� � � A a�A A � AA !�� � �A 2                       �      )   �                        	container      	container      ContainerReOrder      Form1      iAnchor = 15
Top = 144
Left = 396
Width = 769
Height = 217
Visible = .F.
Name = "ContainerReOrder"
      listbox      listbox      List1      Form1.ContainerReOrder      �FontName = "΢���ź�"
Anchor = 7
ColumnCount = 2
ColumnWidths = "80,160"
Height = 215
Left = 1
MoverBars = .T.
Top = 1
Width = 240
Name = "List1"
      commandbutton      commandbutton      Command1      Form1.ContainerReOrder      kTop = 12
Left = 252
Height = 27
Width = 84
FontName = "΢���ź�"
Caption = "���"
Name = "Command1"
     �PROCEDURE Click
LOCAL cSQL
cSQL=""
LOCAL cXQ,cXN,cNJ,cKC,cBB
cXQ=thisform.cXQ
cXN=thisform.cXN
cNJ=thisform.cNJ
cKC=thisform.cKC
cBB=thisform.cBB
FOR i=1 TO this.Parent.List1.ListCount
	LOCAL cXSBH
	cXSBH=this.Parent.list1.List[i,1]
	cSQL = cSQL + CHR(13) + CHR(10) + TEXTMERGE("update ѧ���γ̱� set ���="+TRANSFORM(i)+" where ѧ�����='<<cXSBH>>' and У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>'")
ENDFOR 

IF Execute(cSQL)
	MESSAGEBOX("����˳��ɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshXSKQ
	this.Parent.Visible= .F.
ELSE
	MESSAGEBOX("����˳��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     X���    ?  ?                        3   %   �      �     �          �  U   ��  � T�  ��  �� �� � � � � � T� �� � �� T� �� � �� T� �� � �� T� �� � �� T� �� � ��  �� ���(�� �	 �
 � ���� �� � T� �C � �� �	 �
 � ��� T�  ��  C� C�
 C� update ѧ���γ̱� set ���=C� _�~  where ѧ�����='<<cXSBH>>' and У��='<<cXQ>>' and ѧ��='<<cXN>>' and �꼶='<<cNJ>>' and �γ�����='<<cKC>>' and ���='<<cBB>>'���� �� %�C �  � ����( ��C� ����˳��ɹ����@� ϵͳ��ʾ�x��
 �� � � T� �	 � �-�� ��( ��C� ����˳��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  CSQL CXQ CXN CNJ CKC CBB THISFORM I THIS PARENT LIST1	 LISTCOUNT CXSBH LIST EXECUTE REFRESHXSKQ VISIBLE Click,     ��1 q � qq �1A "�� � �A 1                       �      )   ?                        commandbutton      commandbutton      Command2      Form1.ContainerReOrder      kTop = 48
Left = 252
Height = 27
Width = 84
FontName = "΢���ź�"
Caption = "ȡ��"
Name = "Command2"
      4PROCEDURE Click
this.Parent.Visible= .F.
ENDPROC
      ����    �   �                         k�   %   [       p      j           �  U    T�  � � �-�� U  THIS PARENT VISIBLE Click,     ��1 1                       )       )   �                         commandbutton      commandbutton      oCmdReOrder      Form1      �Top = 216
Left = 1188
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
Caption = "����˳��"
Name = "oCmdReOrder"
     �PROCEDURE Click
IF !thisform.bSaved
	MESSAGEBOX("���ȱ������ݣ����߷������棡",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

thisform.ContainerReOrder.Visible= .T.
thisform.ContainerReOrder.ZOrder()

thisform.ContainerReOrder.List1.Clear

SELECT (thisform.cKQCursor)
SCAN FOR ѧ��
	WITH thisform.ContainerReOrder.List1 as ListBox
		.AddItem(ALLTRIM(ѧ�����))
		.List[.NewIndex,2]=ALLTRIM(ѧ������)
	ENDWITH 
ENDSCAN 
ENDPROC
     3���                              L   %   �      �     �          �  U  �  %��  � 
��K �6 ��C� ���ȱ������ݣ����߷������棡�@� ϵͳ��ʾ�x�� B� � T�  � � �a�� ��C�  � � �� ��  � � � � F��  � �� ~�� ��� � ���  � � �Q� LISTBOX�� � ��CC�
 ���	 �� T�� ��� �����C� ��� �� � U  THISFORM BSAVED CONTAINERREORDER VISIBLE ZORDER LIST1 CLEAR	 CKQCURSOR ѧ�� ADDITEM ѧ����� LIST NEWINDEX ѧ������ Click,     ��1 aA A � � ��A A 1                       �      )                           checkbox      checkbox      Check2      Form1      �Top = 276
Left = 1188
Height = 21
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "�����޿���"
Value = .F.
Name = "Check2"
      �PROCEDURE InteractiveChange
thisform.bHideNoData=this.Value
SELECT (thisform.cKQCursor)
SET FILTER TO 
LOCAL cFilterExpr
cFilterExpr=thisform.cFilterExpr
IF this.Value
	SET FILTER TO &cFilterExpr
ENDIF 
thisform.Grid1.Refresh
ENDPROC
     ����    u  u                        �   %   �       ,               �  U    T�  � �� � �� F��  � �� G(� �� � T� ��  � �� %�� � ��k � SET FILTER TO &cFilterExpr
 � ��  � � � U  THISFORM BHIDENODATA THIS VALUE	 CKQCURSOR CFILTEREXPR GRID1 REFRESH InteractiveChange,     ��1 1� a q �A � 1                       �       )   u                        �Arial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 0, 9, 6, 17, 13, 17, 4, 0
΢���ź�, 1, 12, 8, 22, 17, 23, 5, 0
0	   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _48V0PBGNL1168072215      /  F      ]                          �      �                       WINDOWS _48V0PBGNM1195273186�      �  �      �        6                   �8                           WINDOWS _48V0PBGNL1168072215�9      �9  �9  :  :                                                           WINDOWS _4940OZY0H1183939238�:      �:  �:  �:  ;      �;  �;                                               WINDOWS _4940OZY0I1177193017�<      �<  �<  =  =                                                           WINDOWS _48V0PBGNL1168072215�=      �=  �=  �=  >                                                           WINDOWS _4940OZY0K1177193017�>      �>  �>  �>  �>                                                           WINDOWS _48V0PBGNL1168072215x?      �?  �?  �?  �?                                                           WINDOWS _4940OZY0M1177193017�@      �@  �@  �@  �@                                                           WINDOWS _4940SY4YX1182240000gA      |A  �A  �A  �A      B  KB                                               WINDOWS _497112MMS1191754418C      +C  <C  NC  [C                                                           WINDOWS _49711D92Y1185956975�C      �C  �C  �C  �C      hD  �D                                               WINDOWS _48V0PBGNL1191753260�E      �E  �E  �E  �E                                                           WINDOWS _48V0PBGNL1191753260�F      �F  �F  �F  G                                                           WINDOWS _48V0PBGNL1191753260�G      �G  �G  H  H                                                           WINDOWS _4B711V4K91185956975�H      �H  �H  I  I                                                           WINDOWS _48V0PBGNL1182383943�I      J  J  .J  ;J      �e  �e                                               WINDOWS _4B91F1T9T1182383651�f      �f  �f  �f  �f                                                           WINDOWS _4BJ0OT2Y81183079577�g      �g  �g  �g  �g      �h  i                                               WINDOWS _48V0PBGNL1191753260rj      �j  �j  �j  �j                                                           WINDOWS _4F11CX0U31191753260vk      �k  �k  �k  �k      �l  �l                                               WINDOWS _4F11E2GHX1191754466�m      �m  �m  n  n      �n  0p                                               WINDOWS _4F11E2GHY1191754466r      r  /r  ?r  Lr      s  �u                                               COMMENT RESERVED                                �w                                                            x5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     Top = 0
Left = 0
Height = 541
Width = 1269
ShowWindow = 2
DoCreate = .T.
Comment = ""
Caption = "�˹���������"
WindowState = 2
_memberdata =      577<VFPData><memberdata name="refreshxq" type="method" display="RefreshXQ"/><memberdata name="refreshxn" type="method" display="RefreshXN"/><memberdata name="refreshteacher" type="method" display="RefreshTeacher"/><memberdata name="relayout" type="method" display="ReLayout"/><memberdata name="onteacherselect" type="method" display="OnTeacherSelect"/><memberdata name="onteacherclick" type="method" display="OnTeacherClick"/><memberdata name="nversion" type="property" display="nVersion"/><memberdata name="refreshupanddown" type="method" display="RefreshUpAndDown"/></VFPData>

nversion = 0
Name = "Form1"
     ,PROCEDURE refreshxq

*!*��ʼ��У��
this.oComboXQ.Clear
LOCAL cSQL,cCursor
cSQL="select * from У���� where ISNULL(����,0)=0 order by ˳���"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡУ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboXQ.AddItem(ALLTRIM(У�����))
ENDSCAN 
=CloseAlias(cCursor)

this.RefreshXN(this.oComboXQ.DisplayValue)
ENDPROC
PROCEDURE refreshxn
LPARAMETERS cXQ as String


IF VARTYPE(cXQ)<>"C" OR EMPTY(cXQ)
	cXQ=ALLTRIM(this.oComboXQ.DisplayValue)
ENDIF 

this.oComboXN.Clear
*!*��ʼ��ѧ��
LOCAL cSQL,cCursor
cSQL="select * from ѧ��� where У��='"+ALLTRIM(cXQ)+"' and ISNULL(����,0)=0 order by ��ǰ���� desc,��ʼ����"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.oComboXN.AddItem(ALLTRIM(ѧ��))
ENDSCAN 
=CloseAlias(cCursor)
ENDPROC
PROCEDURE refreshteacher
FOR i=this.Container1.ControlCount TO 1 STEP -1
	LOCAL oControl as Control
	oControl=this.Container1.Controls[i]
	this.Container1.RemoveObject(oControl.Name)
ENDFOR 

LOCAL cXQ,cXN,nYear,nMonth
cXQ=ALLTRIM(this.oComboXQ.DisplayValue)
IF this.oCheckJD.Value
	cXN=""
ELSE 
	cXN=ALLTRIM(this.oComboXN.DisplayValue)
ENDIF 
nYear=this.oYear.Value
nMonth=this.oMonth.Value

LOCAL cBM
cBM="''"
IF this.CheckXXB.Value
	cBM = cBM + "," + "'Сѧ��'"
ENDIF 
IF this.CheckCZB.Value
	cBM = cBM + "," + "'���в�'"
ENDIF 
IF this.CheckGZB.Value
	cBM = cBM + "," + "'���в�'"
ENDIF 
IF this.CheckBX.Value
	cBM = cBM + "," + "'����'"
ENDIF 

LOCAL cSQL,cCursor
IF this.nVersion=2
	IF this.CheckHideNothing.Value
		cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE �ο���ʦ='<<_screen.cUserName>>' and ISNULL(ǩ������,0)>0 order BY �ο���ʦ")
	ELSE 
		cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE �ο���ʦ='<<_screen.cUserName>>' order BY �ο���ʦ")
	ENDIF 
ELSE 
	IF this.CheckHideNothing.Value
		IF this.CheckBX.Value
			cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) where ISNULL(ǩ������,0)>0 order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ")
		ELSE 
			cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE ISNULL(ǩ������,0)>0 and ���� in (<<cBM>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ")
		ENDIF 
	ELSE 
		IF this.CheckBX.Value
			cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ")
		ELSE 
			cSQL=TEXTMERGE("select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE ���� in (<<cBM>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ")
		ENDIF 
	ENDIF 
ENDIF 

cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("ˢ�½�ʦ��Ϣʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

SELECT (cCursor)

SCAN 
	LOCAL oTeacher as ��ʦ OF "d:\wisemis3\��ά.vcx"
	LOCAL cName
	cName=SYS(2015)
	this.Container1.AddObject(cName,"��ʦ")
	oTeacher=EVALUATE("this.Container1."+cName)
	
	oTeacher.cXQ=ALLTRIM(У��)
	oTeacher.cXN=ALLTRIM(ѧ��)
	oTeacher.cXNJC=ALLTRIM(���)
	oTeacher.nYear=nYear
	oTeacher.nMonth=nMonth
	oTeacher.cTeacher=ALLTRIM(�ο���ʦ)
	oTeacher.nTotal=NVL(����,0)
	oTeacher.nTotal1=NVL(ǩ������,0)
	oTeacher.nTotal2=NVL(��˴���,0)
	oTeacher.nTotal3=NVL(ȷ�ϴ���,0)
	oTeacher.cBM=ALLTRIM(NVL(����,""))
	
	oTeacher.ShowTeacher()
	
	=BINDEVENT(oTeacher,"DblClick",this,"OnTeacherSelect")
	=BINDEVENT(oTeacher,"Click",this,"OnTeacherClick")
	
	oTeacher.Visible= .T.
ENDSCAN 

=CloseAlias(cCursor)

this.ReLayout
ENDPROC
PROCEDURE relayout
LOCAL nTop,nLeft,cLastBM
STORE 5 TO nTop,nLeft
cLastBM=""
FOR i=1 TO this.Container1.ControlCount
	LOCAL oControl as ��ʦ
	oControl=this.Container1.Controls[i]
	IF this.Optiongroup1.Value=1
		oControl.Visible= .T.
	ELSE 
		WITH this.Optiongroup1.Buttons[this.Optiongroup1.Value] as OptionButton
			IF LEFT(ToPY(oControl.cTeacher),1)==.Caption
				oControl.Visible= .T.
			ELSE 
				oControl.Visible= .F.
			ENDIF 
		ENDWITH 
	ENDIF 
	
	IF EMPTY(cLastBM)
		cLastBM=oControl.cBM
	ENDIF 
	
	IF ALLTRIM(cLastBM)<>ALLTRIM(oControl.cBM)
		nLeft = 5
		nTop = nTop + oControl.Height + 20
	ENDIF 
	
	oControl.Left=nLeft
	oControl.Top=nTop
	
	
	
	nLeft = nLeft + oControl.Width + 5
	IF nLeft + oControl.Width + 5 > this.Container1.Width
		nLeft = 5
		nTop = nTop + oControl.Height + 5
	ENDIF 
	
	cLastBM=oControl.cBM
ENDFOR 

this.RefreshUpAndDown
ENDPROC
PROCEDURE onteacherselect
=AEVENTS(arr,0)
LOCAL oTeacher as ��ʦ OF "d:\wisemis3\��ά.vcx"
oTeacher=arr[1]

DO FORM Addons\��ά����\���� WITH oTeacher.cXQ,oTeacher.cXN,oTeacher.cTeacher,oTeacher.nYear,oTeacher.nMonth,this.nVersion,this.CheckHideNothing.Value
ENDPROC
PROCEDURE onteacherclick
=AEVENTS(arr,0)
LOCAL oTeacher as ��ʦ OF "d:\wisemis3\��ά.vcx"
oTeacher=arr[1]

this.Container1.SetAll("BorderWidth",1)
this.Container1.SetAll("BorderColor",RGB(240,240,240))
oTeacher.BorderWidth=2
oTeacher.BorderColor=RGB(0,0,255)
ENDPROC
PROCEDURE refreshupanddown
this.oCmdUp.Enabled= .F.
this.oCmdDown.Enabled= .F.
IF this.Container1.ControlCount=0
	RETURN 
ENDIF 

LOCAL oFirstControl as Control,oLastControl as Control
oFirstControl=this.Container1.Controls[1]
oLastControl=this.Container1.Controls[this.Container1.ControlCount]

IF oFirstControl.Top<5
	this.oCmdUp.Enabled= .T.
ENDIF 

IF oLastControl.Top+oLastControl.Height>this.Container1.Height
	this.oCmdDown.Enabled= .T.
ENDIF 

ENDPROC
PROCEDURE Init
LPARAMETERS nVersion && 0 ����Ա�棬1 ����棬2 ��ʦ��
IF VARTYPE(nVersion)<>"N"
	nVersion=0
ENDIF 
this.nVersion=nVersion 

*!*ˢ��У��
this.RefreshXQ

*!*	SET CLASSLIB TO ��ά ADDITIVE 
SET CLASSLIB TO Addons\��ά����\��ά.vcx ADDITIVE 
ENDPROC
PROCEDURE Resize
this.ReLayout
ENDPROC
     ����    �  �                        ��	   %   �      �  �   A          �  U   ��  � � � �� � �H T� ��; select * from У���� where ISNULL(����,0)=0 order by ˳����� T� �C��]�� %�C �  � � 
��� �( ��C� ��ȡУ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�� � ��CC� ��  � � �� � ��C � � �� ��C�  � �
 �  �	 �� U  THIS OCOMBOXQ CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM У�����
 CLOSEALIAS	 REFRESHXN DISPLAYVALUEd ��  Q� STRING� %�C�  ��� C� C�  ���D � T�  �C� � � ��� � �� � � � �� � �n T� ��! select * from ѧ��� where У��='C�  ��6 ' and ISNULL(����,0)=0 order by ��ǰ���� desc,��ʼ������ T� �C��]�� %�C �  � � 
��$�( ��C� ��ȡ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�O� ��CC�
 �� � �	 �� � ��C � � �� U  CXQ THIS OCOMBOXQ DISPLAYVALUE OCOMBOXN CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM ѧ��
 CLOSEALIAS1	$ ��  �� � � �(����������d � �� Q� CONTROL� T� �C �  � � � �� ��C� � � � � �� �� �� �	 �
 � � T� �C� � � ��� %�� � � ��� � T�	 ��  �� �� � T�	 �C� � � ��� � T�
 �� � � �� T� �� � � �� �� � T� �� ''�� %�� � � ��>� T� �� � ,� 'Сѧ��'�� � %�� � � ��s� T� �� � ,� '���в�'�� � %�� � � ���� T� �� � ,� '���в�'�� � %�� � � ���� T� �� � ,� '����'�� � �� � � %�� � ���X� %�� � � ����� T� �Cٚ select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE �ο���ʦ='<<_screen.cUserName>>' and ISNULL(ǩ������,0)>0 order BY �ο���ʦ���� �T�� T� �Cف select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE �ο���ʦ='<<_screen.cUserName>>' order BY �ο���ʦ���� � ��� %�� � � ��>� %�� � � ��Q�� T� �Cٻ select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) where ISNULL(ǩ������,0)>0 order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ���� �:�� T� �C�� select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE ISNULL(ǩ������,0)>0 and ���� in (<<cBM>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ���� � ��� %�� � � ��	�� T� �C٠ select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ���� ���� T� �Cٸ select * from dbo.������ʦ����('<<cXQ>>','<<cXN>>',<<nYear>>,<<nMonth>>) WHERE ���� in (<<cBM>>) order BY (case when ����='���в�' then 1 when ����='���в�' then 2 else 3 end),�ο���ʦ���� � � � T� �C��]�� %�C �  � � 
��<�, ��C� ˢ�½�ʦ��Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� �
 F�� �� ~�	�) �� Q� ��ʦ��� d:\wisemis3\��ά.vcx�� �� � T� �C��]�� ��C � � ��ʦ� � � ��# T� �C� this.Container1.� ��� T� � �C�  ��� T� �	 �C�! ��� T� �" �C�# ��� T� �
 ��
 �� T� � �� �� T� �$ �C�% ��� T� �& �C�' � ��� T� �( �C�) � ��� T� �* �C�+ � ��� T� �, �C�- � ��� T� � �CC�. �  қ�� ��C� �/ ��, ��C� � DblClick� � OnTeacherSelect��( ��C� � Click� � OnTeacherClick�� T� �0 �a�� � ��C � �1 ��
 �� �2 � U3  I THIS
 CONTAINER1 CONTROLCOUNT OCONTROL CONTROLS REMOVEOBJECT NAME CXQ CXN NYEAR NMONTH OCOMBOXQ DISPLAYVALUE OCHECKJD VALUE OCOMBOXN OYEAR OMONTH CBM CHECKXXB CHECKCZB CHECKGZB CHECKBX CSQL CCURSOR NVERSION CHECKHIDENOTHING
 SELECTDATA OTEACHER CNAME	 ADDOBJECT У�� ѧ�� CXNJC ��� CTEACHER �ο���ʦ NTOTAL ���� NTOTAL1 ǩ������ NTOTAL2 ��˴��� NTOTAL3 ȷ�ϴ��� ���� SHOWTEACHER VISIBLE
 CLOSEALIAS RELAYOUT! ��  � � � J���(�  � � T� ��  �� �� ���(�� � � ��� �� Q� ��ʦ� T� �C � � � � �� %�� �	 �
 ���� � T� � �a�� ��- ��C� �	 �
 � �	 � �Q� OPTIONBUTTON�� %�CC� � � �=�� ��� � T� � �a�� �� T� � �-�� � �� � %�C� ���8� T� �� � �� � %�C� �C� � ���y� T� ���� T�  ��  � � ��� � T� � �� �� T� � ��  �� T� �� � � ���" %�� � � �� � � ���� T� ���� T�  ��  � � ��� � T� �� � �� ��
 �� � � U  NTOP NLEFT CLASTBM I THIS
 CONTAINER1 CONTROLCOUNT OCONTROL CONTROLS OPTIONGROUP1 VALUE VISIBLE BUTTONS TOPY CTEACHER CAPTION CBM HEIGHT LEFT TOP WIDTH REFRESHUPANDDOWN�  ��C��  � 	��) �� Q� ��ʦ��� d:\wisemis3\��ά.vcx�� T� �C��  ��P � Addons\��ά����\������ � � � � � � � � � � �	 � �
 � � U  ARR OTEACHER ADDONS CXQ CXN CTEACHER NYEAR NMONTH THIS NVERSION CHECKHIDENOTHING VALUE�  ��C��  � 	��) �� Q� ��ʦ��� d:\wisemis3\��ά.vcx�� T� �C��  ��! ��C� BorderWidth�� � � ��* ��C� BorderColorC�������^� � � �� T� � ���� T� � �C� � ���^�� U  ARR OTEACHER THIS
 CONTAINER1 SETALL BORDERWIDTH BORDERCOLOR�  T�  � � �-�� T�  � � �-�� %��  � � � ��= � B� �! �� Q� CONTROL� Q� CONTROL� T� �C��  � � �� T� �C�  � � �  � � �� %�� �	 ���� � T�  � � �a�� �! %�� �	 � �
 �  � �
 ��� � T�  � � �a�� � U  THIS OCMDUP ENABLED OCMDDOWN
 CONTAINER1 CONTROLCOUNT OFIRSTCONTROL OLASTCONTROL CONTROLS TOP HEIGHTl  ��  � %�C�  ��� N��) � T�  �� �� � T� �  ��  ��
 �� � �" G~(� Addons\��ά����\��ά.vcx� U  NVERSION THIS	 REFRESHXQ ADDONS 
 ��  � � U  THIS RELAYOUT	 refreshxq,     ��	 refreshxn�    �� refreshteacherx    �� relayoutx    �� onteacherselect[    �� onteacherclick`    �� refreshupanddowni    �� Init�    �� Resizeg    ��1 � � �q�q A � � QA � b2 �QA � � �q�q A � � QA � 2 A!�aA 2Q1� � QA 11r � 1�A 1�A 1�A 1�A � A1�
� 	A � 11�� A � 1� �A A A q�A A � � �q �1"!!!QQQQq� ��� A � � 2 � � �� �q� � ��� � � A A A � A �� �A �!� �A A � 2 �2 ���2 qA A q�BA A 3 q Q� A � #2 � 1                       �        �  �     "   �  P  +   s   o  �  �   �     �  �   �       �   �   +  �  �   �   �  �  �   �     !  �    )   �                       _memberdata XML Metadata for customizable properties
nversion �汾��0 ����Ա�汾��1 ����汾��2 ��ʦ�汾
*refreshxq ˢ��У��
*refreshxn ˢ��ѧ��
*refreshteacher ˢ����ʦ
*relayout ���²���
*onteacherselect ѡ����ʦ
*onteacherclick 
*refreshupanddown 
      label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "У����"
Height = 21
Left = 11
Top = 13
Width = 41
Name = "Label1"
      combobox      combobox      oComboXQ      Form1      �FontName = "΢���ź�"
FontSize = 10
Anchor = 3
Value = 1
Height = 26
Left = 59
Style = 2
Top = 11
Width = 100
Name = "oComboXQ"
      MPROCEDURE InteractiveChange
thisform.RefreshXN(this.DisplayValue)
ENDPROC
      ����    �   �                         �g   %   o       �      �           �  U    ��C� � �  � �� U  THISFORM	 REFRESHXN THIS DISPLAYVALUE InteractiveChange,     ��1 11                       B       )   �                         label      label      Label2      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "���ȣ�"
Height = 21
Left = 179
Top = 13
Width = 41
Name = "Label2"
      combobox      combobox      oComboXN      Form1      �FontName = "΢���ź�"
FontSize = 10
Anchor = 3
Value = 1
Height = 26
Left = 227
Style = 2
Top = 11
Width = 100
Name = "oComboXN"
      label      label      Label7      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "��ݣ�"
Height = 21
Left = 352
Top = 12
Width = 41
Name = "Label7"
      spinner      spinner      oYear      Form1      �Anchor = 3
Height = 24
KeyboardHighValue = 2100
KeyboardLowValue = 2014
Left = 400
SpinnerHighValue = 2100.00
SpinnerLowValue = 2014.00
Top = 12
Width = 72
Value = (year(date()))
Name = "oYear"
      label      label      Label8      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "�·ݣ�"
Height = 21
Left = 484
Top = 12
Width = 41
Name = "Label8"
      commandbutton      commandbutton      Command1      Form1      aTop = 12
Left = 1177
Height = 27
Width = 84
Anchor = 9
Caption = "�ر�"
Name = "Command1"
      ,PROCEDURE Click
thisform.Release
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       !       )   �                         	container      	container      
Container1      Form1      SAnchor = 15
Top = 72
Left = 12
Width = 1232
Height = 457
Name = "Container1"
      commandbutton      commandbutton      	oBtnQuery      Form1      bTop = 12
Left = 1035
Height = 27
Width = 84
Anchor = 3
Caption = "��ѯ"
Name = "oBtnQuery"
      RPROCEDURE Click
thisform.Optiongroup1.Value=1
thisform.RefreshTeacher
ENDPROC
      ����    �   �                         �   %          �      �           �  U     T�  � � ����
 ��  � � U  THISFORM OPTIONGROUP1 VALUE REFRESHTEACHER Click,     ��1 1� 1                       G       )   �                         checkbox      checkbox      CheckXXB      Form1      �Top = 4
Left = 600
Height = 21
Width = 58
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "Сѧ��"
Value = .T.
Name = "CheckXXB"
      checkbox      checkbox      CheckCZB      Form1      �Top = 18
Left = 600
Height = 21
Width = 58
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "���в�"
Value = .T.
Name = "CheckCZB"
      checkbox      checkbox      CheckGZB      Form1      �Top = 4
Left = 672
Height = 21
Width = 58
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "���в�"
Value = .T.
Name = "CheckGZB"
      checkbox      checkbox      CheckHideNothing      Form1      �Top = 12
Left = 926
Height = 21
Width = 84
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "�����޿���"
Value = .F.
Name = "CheckHideNothing"
      optiongroup      optiongroup      Optiongroup1      Form1     @ButtonCount = 27
Value = 1
Height = 27
Left = 60
Top = 43
Width = 840
Name = "Optiongroup1"
Option1.FontName = "΢���ź�"
Option1.Caption = "ȫ��"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.SpecialEffect = 2
Option1.Style = 1
Option1.Top = 4
Option1.Width = 42
Option1.AutoSize = .F.
Option1.Themes = .F.
Option1.Name = "Option1"
Option2.Caption = "A"
Option2.Height = 17
Option2.Left = 67
Option2.SpecialEffect = 2
Option2.Style = 1
Option2.Top = 5
Option2.Width = 25
Option2.AutoSize = .F.
Option2.ForeColor = 0,0,128
Option2.Themes = .F.
Option2.Name = "Option2"
Option3.Caption = "B"
Option3.Height = 17
Option3.Left = 93
Option3.SpecialEffect = 2
Option3.Style = 1
Option3.Top = 5
Option3.Width = 25
Option3.AutoSize = .F.
Option3.ForeColor = 0,0,128
Option3.Themes = .F.
Option3.Name = "Option3"
Option4.Caption = "C"
Option4.Height = 17
Option4.Left = 120
Option4.SpecialEffect = 2
Option4.Style = 1
Option4.Top = 5
Option4.Width = 25
Option4.AutoSize = .F.
Option4.ForeColor = 0,0,128
Option4.Themes = .F.
Option4.Name = "Option4"
Option5.Caption = "D"
Option5.Height = 17
Option5.Left = 147
Option5.SpecialEffect = 2
Option5.Style = 1
Option5.Top = 5
Option5.Width = 25
Option5.AutoSize = .F.
Option5.ForeColor = 0,0,128
Option5.Themes = .F.
Option5.Name = "Option5"
Option6.Caption = "E"
Option6.Height = 17
Option6.Left = 174
Option6.SpecialEffect = 2
Option6.Style = 1
Option6.Top = 5
Option6.Width = 25
Option6.AutoSize = .F.
Option6.ForeColor = 0,0,128
Option6.Themes = .F.
Option6.Name = "Option6"
Option7.Caption = "F"
Option7.Height = 17
Option7.Left = 201
Option7.SpecialEffect = 2
Option7.Style = 1
Option7.Top = 5
Option7.Width = 25
Option7.AutoSize = .F.
Option7.ForeColor = 0,0,128
Option7.Themes = .F.
Option7.Name = "Option7"
Option8.Caption = "G"
Option8.Height = 17
Option8.Left = 228
Option8.SpecialEffect = 2
Option8.Style = 1
Option8.Top = 5
Option8.Width = 25
Option8.AutoSize = .F.
Option8.ForeColor = 0,0,128
Option8.Themes = .F.
Option8.Name = "Option8"
Option9.Caption = "H"
Option9.Height = 17
Option9.Left = 272
Option9.SpecialEffect = 2
Option9.Style = 1
Option9.Top = 5
Option9.Width = 25
Option9.AutoSize = .F.
Option9.ForeColor = 0,0,255
Option9.Themes = .F.
Option9.Name = "Option9"
Option10.Caption = "I"
Option10.Height = 17
Option10.Left = 299
Option10.SpecialEffect = 2
Option10.Style = 1
Option10.Top = 5
Option10.Width = 25
Option10.AutoSize = .F.
Option10.ForeColor = 0,0,255
Option10.Themes = .F.
Option10.Name = "Option10"
Option11.Caption = "J"
Option11.Height = 17
Option11.Left = 327
Option11.SpecialEffect = 2
Option11.Style = 1
Option11.Top = 5
Option11.Width = 25
Option11.AutoSize = .F.
Option11.ForeColor = 0,0,255
Option11.Themes = .F.
Option11.Name = "Option11"
Option12.Caption = "K"
Option12.Height = 17
Option12.Left = 355
Option12.SpecialEffect = 2
Option12.Style = 1
Option12.Top = 5
Option12.Width = 25
Option12.AutoSize = .F.
Option12.ForeColor = 0,0,255
Option12.Themes = .F.
Option12.Name = "Option12"
Option13.Caption = "L"
Option13.Height = 17
Option13.Left = 383
Option13.SpecialEffect = 2
Option13.Style = 1
Option13.Top = 5
Option13.Width = 25
Option13.AutoSize = .F.
Option13.ForeColor = 0,0,255
Option13.Themes = .F.
Option13.Name = "Option13"
Option14.Caption = "M"
Option14.Height = 17
Option14.Left = 411
Option14.SpecialEffect = 2
Option14.Style = 1
Option14.Top = 5
Option14.Width = 25
Option14.AutoSize = .F.
Option14.ForeColor = 0,0,255
Option14.Themes = .F.
Option14.Name = "Option14"
Option15.Caption = "N"
Option15.Height = 17
Option15.Left = 439
Option15.SpecialEffect = 2
Option15.Style = 1
Option15.Top = 5
Option15.Width = 25
Option15.AutoSize = .F.
Option15.ForeColor = 0,0,255
Option15.Themes = .F.
Option15.Name = "Option15"
Option16.Alignment = 2
Option16.Caption = "O"
Option16.Height = 17
Option16.Left = 484
Option16.SpecialEffect = 2
Option16.Style = 1
Option16.Top = 5
Option16.Width = 25
Option16.AutoSize = .F.
Option16.ForeColor = 0,0,128
Option16.Themes = .F.
Option16.Name = "Option16"
Option17.Alignment = 2
Option17.Caption = "P"
Option17.Height = 17
Option17.Left = 511
Option17.SpecialEffect = 2
Option17.Style = 1
Option17.Top = 5
Option17.Width = 25
Option17.AutoSize = .F.
Option17.ForeColor = 0,0,128
Option17.Themes = .F.
Option17.Name = "Option17"
Option18.Alignment = 2
Option18.Caption = "Q"
Option18.Height = 17
Option18.Left = 538
Option18.SpecialEffect = 2
Option18.Style = 1
Option18.Top = 5
Option18.Width = 25
Option18.AutoSize = .F.
Option18.ForeColor = 0,0,128
Option18.Themes = .F.
Option18.Name = "Option18"
Option19.Alignment = 2
Option19.Caption = "R"
Option19.Height = 17
Option19.Left = 565
Option19.SpecialEffect = 2
Option19.Style = 1
Option19.Top = 5
Option19.Width = 25
Option19.AutoSize = .F.
Option19.ForeColor = 0,0,128
Option19.Themes = .F.
Option19.Name = "Option19"
Option20.Alignment = 2
Option20.Caption = "S"
Option20.Height = 17
Option20.Left = 593
Option20.SpecialEffect = 2
Option20.Style = 1
Option20.Top = 5
Option20.Width = 25
Option20.AutoSize = .F.
Option20.ForeColor = 0,0,128
Option20.Themes = .F.
Option20.Name = "Option20"
Option21.Caption = "T"
Option21.Height = 17
Option21.Left = 621
Option21.SpecialEffect = 2
Option21.Style = 1
Option21.Top = 5
Option21.Width = 25
Option21.ForeColor = 0,0,128
Option21.Themes = .F.
Option21.Name = "Option21"
Option22.Caption = "U"
Option22.Height = 17
Option22.Left = 666
Option22.SpecialEffect = 2
Option22.Style = 1
Option22.Top = 5
Option22.Width = 25
Option22.ForeColor = 0,0,255
Option22.Themes = .F.
Option22.Name = "Option22"
Option23.Caption = "V"
Option23.Height = 17
Option23.Left = 693
Option23.SpecialEffect = 2
Option23.Style = 1
Option23.Top = 5
Option23.Width = 25
Option23.ForeColor = 0,0,255
Option23.Themes = .F.
Option23.Name = "Option23"
Option24.Caption = "W"
Option24.Height = 17
Option24.Left = 720
Option24.SpecialEffect = 2
Option24.Style = 1
Option24.Top = 5
Option24.Width = 25
Option24.ForeColor = 0,0,255
Option24.Themes = .F.
Option24.Name = "Option24"
Option25.Caption = "X"
Option25.Height = 17
Option25.Left = 747
Option25.SpecialEffect = 2
Option25.Style = 1
Option25.Top = 5
Option25.Width = 25
Option25.ForeColor = 0,0,255
Option25.Themes = .F.
Option25.Name = "Option25"
Option26.Caption = "Y"
Option26.Height = 17
Option26.Left = 774
Option26.SpecialEffect = 2
Option26.Style = 1
Option26.Top = 5
Option26.Width = 25
Option26.ForeColor = 0,0,255
Option26.Themes = .F.
Option26.Name = "Option26"
Option27.Caption = "Z"
Option27.Height = 17
Option27.Left = 801
Option27.SpecialEffect = 2
Option27.Style = 1
Option27.Top = 5
Option27.Width = 25
Option27.ForeColor = 0,0,255
Option27.Themes = .F.
Option27.Name = "Option27"
      9PROCEDURE InteractiveChange
thisform.ReLayout
ENDPROC
      ����    �   �                         E�   %   Q       r      l           �  U   
 ��  � � U  THISFORM RELAYOUT InteractiveChange,     ��1 � 1                       .       )   �                         label      label      Label3      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "���ˣ�"
Height = 21
Left = 12
Top = 44
Width = 41
Name = "Label3"
      spinner      spinner      oMonth      Form1      �Anchor = 3
Height = 24
KeyboardHighValue = 12
KeyboardLowValue = 1
Left = 525
SpinnerHighValue =  13.00
SpinnerLowValue =   0.00
Top = 12
Width = 52
Value = (month(date()))
Name = "oMonth"
      �PROCEDURE DownClick
IF this.Value=0
	this.Value=12
ENDIF 
ENDPROC
PROCEDURE UpClick
IF this.Value=13
	this.Value=1
ENDIF 
ENDPROC
     L���    3  3                        9   %   �       �   	   �           �  U  +  %��  � � ��$ � T�  � ���� � U  THIS VALUE+  %��  � ���$ � T�  � ���� � U  THIS VALUE	 DownClick,     �� UpClickh     ��1 AA 2 AA 1                       <         Z   �       )   3                        checkbox      checkbox      CheckBX      Form1      �Top = 18
Left = 672
Height = 21
Width = 45
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "����"
Value = .T.
Name = "CheckBX"
      checkbox      checkbox      oCheckJD      Form1      �Top = 12
Left = 756
Height = 21
Width = 71
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "���޼���"
Value = .F.
Name = "oCheckJD"
      MPROCEDURE InteractiveChange
thisform.oComboXN.Enabled=!this.Value
ENDPROC
      ����    �   �                         h   %   t       �      �           �  U    T�  � � �� � 
�� U  THISFORM OCOMBOXN ENABLED THIS VALUE InteractiveChange,     ��1 q1                       B       )   �                         commandbutton      commandbutton      oCmdUp      Form1      �Top = 71
Left = 1247
Height = 27
Width = 15
FontBold = .T.
FontName = "΢���ź�"
FontSize = 12
Anchor = 9
Caption = "��"
Enabled = .F.
ToolTipText = "���Ϲ���"
Name = "oCmdUp"
     KPROCEDURE Click

LOCAL oControl as Control
oControl=thisform.Container1.Controls[1]
LOCAL nMove
nMove=oControl.Height+5


FOR i=1 TO thisform.Container1.ControlCount
	LOCAL oControl as Control
	oControl=thisform.Container1.Controls[i]
	oControl.Top = oControl.Top + nMove
ENDFOR 

thisform.RefreshUpAndDown
ENDPROC
     ����    �  �                        u!   %   D      k     S          �  U  �  ��  Q� CONTROL� T�  �C�� � � �� �� � T� ��  � ��� �� ���(�� � � ��� � ��  Q� CONTROL� T�  �C � � � � �� T�  � ��  � � �� ��
 �� �	 � U
  OCONTROL THISFORM
 CONTAINER1 CONTROLS NMOVE HEIGHT I CONTROLCOUNT TOP REFRESHUPANDDOWN Click,     ��1 "qq A�!�qA � 1                       @      )   �                        commandbutton      commandbutton      oCmdDown      Form1      �Top = 100
Left = 1247
Height = 27
Width = 15
FontBold = .T.
FontName = "΢���ź�"
FontSize = 12
Anchor = 9
Caption = "��"
Enabled = .F.
ToolTipText = "���¹���"
Name = "oCmdDown"
     �PROCEDURE Click
*!*	IF thisform.Container1.ControlCount=0
*!*		RETURN 
*!*	ENDIF 

LOCAL oControl as Control
oControl=thisform.Container1.Controls[1]
LOCAL nMove
nMove=oControl.Height+5
*!*	IF oControl.Top-5<=0
*!*		RETURN 
*!*	ENDIF 
*!*	IF oControl.Top-5<thisform.Container1.Height AND oControl.Top>5
*!*		nMove=thisform.Container1.Height-oControl.Top+5
*!*	ENDIF 
*!*	IF oControl.Top-5>thisform.Container1.Height
*!*		nMove=thisform.Container1.Height
*!*	ENDIF 

FOR i=1 TO thisform.Container1.ControlCount
	LOCAL oControl as Control
	oControl=thisform.Container1.Controls[i]
	oControl.Top = oControl.Top - nMove
ENDFOR 

thisform.RefreshUpAndDown
ENDPROC
     ����    �  �                        u!   %   D      k     S          �  U  �  ��  Q� CONTROL� T�  �C�� � � �� �� � T� ��  � ��� �� ���(�� � � ��� � ��  Q� CONTROL� T�  �C � � � � �� T�  � ��  � � �� ��
 �� �	 � U
  OCONTROL THISFORM
 CONTAINER1 CONTROLS NMOVE HEIGHT I CONTROLCOUNT TOP REFRESHUPANDDOWN Click,     ��1 %qq A�!�qA � 1                       �      )   �                        �Arial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 0, 9, 6, 17, 13, 17, 4, 0
΢���ź�, 1, 12, 8, 22, 17, 23, 5, 0
0-   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _4B40Y9ZIW1182039931      �        �      �  *          .  ['              ;               COMMENT RESERVED                        I      Z                                                           WINDOWS _4BH10IBT91182959685�'      (  �'      �'                      �'  �'              �'               COMMENT RESERVED                        �'      d'                                                           WINDOWS _4940Y9PPS1197889220n       o  }       u7      /G  6=          W   d   ~          I                WINDOWS _4991CWFAT1177335323p      |  �  "  �                                                           WINDOWS _4B40Y9ZIW1191754091�      �  �  �  �*                                                           WINDOWS _4940Y9PPS1177195814�      	      $   5*                                                           WINDOWS _4940YPZ0U11771958140       (*  *  *  �)                                                           WINDOWS RESERVED  1177195814�)      �)  �)  {)  )                                                           WINDOWS _4940Y9PPS1177195769)      )  �(  �(  �(                                                           WINDOWS _4971403MJ1177195769�(      �(  y(  m(  &(                                                           WINDOWS _4971403MK1177195769N'      A'  3'  ''  �&                                                           WINDOWS _4940Y9PPS1177195769�&      �&  �&  �&  e&                                                           WINDOWS _4940YPZ0U1177261184X&      K&  =&  1&  �%                                                           WINDOWS _4971403ML1177261184�%      �%  �%  �%  =%                                                           WINDOWS _4971403MM11771957690%      #%  %  %  �$                                                           WINDOWS _4F11DPA811193636762�$      �$  �$  �$  �#                                                           WINDOWS _4HJ0MYE1Y1197889220�#      �#  �#  {#  �"                                                           WINDOWS _4940Y9PPS1191754091�"      �"  y"  m"  "      �!  �                                                COMMENT RESERVED                        =                                                                    WINDOWS _4940Y9PPS1198500820I      `  X      �      ]Q  @+          2  ?  I          $               WINDOWS _4940Y9PPS1177335416=      1  $    �                                                           WINDOWS _4940Y9PPS1177377913�      �  �  �  ]                                                           WINDOWS _4B512TIOQ1182246032Q      E  8  ,  �                                                           WINDOWS _4B71866TC1198422609�      �  �  �  �                                                           WINDOWS _4B40Y9ZIW1198422609�      �  �  �  �                                                           WINDOWS _4B40Y9ZIW1198422609�      |  m  a  �                                                           WINDOWS _4940Y9PPS1182246032�      |  n  b                                                             WINDOWS _4940YPZ0U1182246032�      �  �  �  q                                                           WINDOWS RESERVED  1182246032d      W  I  =  �                                                           WINDOWS _4940Y9PPS1182246032�      �  �  �  c                                                           WINDOWS _4971403MJ1182246032V      I  ;  /  �                                                           WINDOWS _4971403MK1182246032�      �  �  �  m                                                           WINDOWS _4940Y9PPS1182246032`      S  E  9  �
                                                           WINDOWS _4940YPZ0U1182246032�
      �
  �
  �
  ^
                                                           WINDOWS _4971403ML1182246032Q
      D
  6
  *
  �	                                                           WINDOWS _4971403MM1182246032�	      �	  �	  �	  L	                                                           WINDOWS _4940Y9PPS1182251086?	      2	  #	  	  M                                                           WINDOWS _4940Y9PPS1182251086@      3  $    M                                                           WINDOWS _4HI19RWWB1197888997@      3      H                                                           WINDOWS _4HR0WT8YF1198423012;      .                                                                 WINDOWS _49912S09R1198422609        �  �        �  d                                               COMMENT RESERVED                                                                                            ^3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      ���      Pixels      Class      22      control      ���     t���    [  [                        gj   %   �       �      �           �  U    ��  � � � U  THIS PARENT
 RIGHTCLICK  ��  � � � U  THIS PARENT CLICK  ��  � � � U  THIS PARENT DBLCLICK
 RightClick,     �� ClickZ     �� DblClick�     ��1 � 2 � 2 � 1                       ,         H   Y         x   �       )   [                        �PROCEDURE RightClick
this.Parent.RightClick
ENDPROC
PROCEDURE Click
this.Parent.Click
ENDPROC
PROCEDURE DblClick
this.Parent.DblClick
ENDPROC
      `Top = 0
Left = 0
Height = 100
Width = 113
BackStyle = 0
BorderStyle = 0
Name = "Shape11"
      ���      Shape11      shape      shape      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
BackStyle = 0
BorderStyle = 1
Caption = ""
Height = 22
Left = 90
Top = 49
Width = 22
ForeColor = 100,100,100
Rotation = 360
Name = "LabelImage"
      ���      
LabelImage      label      label      �FontName = "΢���ź�"
FontSize = 11
Caption = "��δ�ſ�"
Height = 25
Left = 2
Top = 74
Width = 109
ForeColor = 0,0,128
BackColor = 192,192,192
Rotation = 360
Name = "LabelNoLession"
      ���      LabelNoLession      label      label      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
BackStyle = 1
BorderStyle = 0
Caption = "��Ŀ"
Height = 23
Left = 55
Top = 2
Width = 56
Name = "LabelKC"
      ���      LabelKC      label      label      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
BackStyle = 1
BorderStyle = 0
Caption = "�꼶"
Height = 23
Left = 2
Top = 2
Width = 53
Name = "LabelNJ"
      ���      LabelNJ      label      label      ATop = 74
Left = 101
Height = 25
Width = 10
Name = "Shape10"
      ���      Shape10      shape      shape      XTop = 74
Left = 90
Height = 25
Width = 10
BackColor = 128,128,255
Name = "Shape9"
      ���      Shape9      shape      shape      XTop = 74
Left = 79
Height = 25
Width = 10
BackColor = 128,128,255
Name = "Shape8"
      ���      Shape8      shape      shape      ?Top = 74
Left = 68
Height = 25
Width = 10
Name = "Shape7"
      ���      Shape7      shape      shape      ?Top = 74
Left = 57
Height = 25
Width = 10
Name = "Shape6"
      ���      Shape6      shape      shape      ?Top = 74
Left = 46
Height = 25
Width = 10
Name = "Shape5"
      ���      Shape5      shape      shape      ?Top = 74
Left = 35
Height = 25
Width = 10
Name = "Shape4"
      ���      Shape4      shape      shape      WTop = 74
Left = 24
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape3"
      ���      Shape3      shape      shape      WTop = 74
Left = 13
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape2"
      ���      Shape2      shape      shape      VTop = 74
Left = 2
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape1"
      ���      Shape1      shape      shape      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
BackStyle = 1
BorderStyle = 0
Caption = "�༶"
Height = 22
Left = 2
Top = 26
Width = 88
Name = "LabelBB"
      ���      LabelBB      label      label      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
BorderStyle = 1
Caption = "��"
Height = 22
Left = 90
Top = 26
Width = 22
ForeColor = 0,0,128
BackColor = 192,192,192
Rotation = 360
Name = "LabelBJLX"
      ���      	LabelBJLX      label      label      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 8
Anchor = 11
Alignment = 2
BackStyle = 1
BorderStyle = 0
Caption = "����,10:00-12:00"
Height = 22
Left = 2
Top = 49
Width = 88
Rotation = 360
Name = "LabelSKSJ"
      ���      	LabelSKSJ      label      label      =Height = 0
Left = 0
Top = 71
Width = 113
Name = "Line2"
      ���      Line2      line      line      =Height = 0
Left = 0
Top = 48
Width = 113
Name = "Line3"
      ���      Line3      line      line      =Height = 0
Left = 0
Top = 25
Width = 113
Name = "Line1"
      ���      Line1      line      line     ;cnj �꼶
_memberdata XML Metadata for customizable properties
ntotal ����
ntotal1 ǩ������
ntotal2 �������
ckc �γ�
cbb ���
cxq У��
cxn ѧ��
nyear ���
nmonth �·�
ntotal3 ȷ�ϴ���
bbk �Ƿ񲹿�
cbjlx �༶����
cskzq �Ͽ�����
csksj �Ͽ�ʱ��
bxyzj ��Ҫ����
bhasimage �Ƿ���ͼ
*showclass ��ʾ�༶
     �Width = 113
Height = 103
BackColor = 192,192,192
cnj = 
_memberdata =     1203<VFPData><memberdata name="cteacher" type="property" display="cTeacher"/><memberdata name="showteacher" type="method" display="ShowTeacher"/><memberdata name="ntotal" type="property" display="nTotal"/><memberdata name="ntotal1" type="property" display="nTotal1"/><memberdata name="ntotal2" type="property" display="nTotal2"/><memberdata name="cbb" type="property" display="cBB"/><memberdata name="ckc" type="property" display="cKC"/><memberdata name="cnj" type="property" display="cNJ"/><memberdata name="cxn" type="property" display="cXN"/><memberdata name="cxq" type="property" display="cXQ"/><memberdata name="nmonth" type="property" display="nMonth"/><memberdata name="nyear" type="property" display="nYear"/><memberdata name="showclass" type="method" display="ShowClass"/><memberdata name="ntotal3" type="property" display="nTotal3"/><memberdata name="bbk" type="property" display="bBK"/><memberdata name="cbjlx" type="property" display="cBJLX"/><memberdata name="csksj" type="property" display="cSKSJ"/><memberdata name="cskzq" type="property" display="cSKZQ"/><memberdata name="bxyzj" type="property" display="bXYZJ"/><memberdata name="bhasimage" type="property" display="bHasImage"/></VFPData>

ntotal = 0
ntotal1 = 0
ntotal2 = 0
ckc = 
cbb = 
cxq = 
cxn = 
nyear = 0
nmonth = 0
ntotal3 = 0
bbk = .F.
cbjlx = 
cskzq = 
csksj = 
bxyzj = .F.
bhasimage = .F.
Name = "���"
      control      control      �cteacher ��ʦ����
_memberdata XML Metadata for customizable properties
ntotal ����
ntotal1 ǩ������
ntotal2 �������
cxq У��
cxn ѧ��
nyear ���
nmonth �·�
ntotal3 ȷ�ϴ���
cbm ����
cxnjc ѧ����
*showteacher ��ʾ��ʦ
      line      line      Line1      combobox      .Height = 24
Width = 100
Name = "combobox_"
      GPROCEDURE When
*nothing
ENDPROC
PROCEDURE Valid
*nothing
ENDPROC
      ����    �   �                         6v   %   :       ]      W           �  U    U    U   When,     �� Valid3     ��1 3 2                                4   <       )   �                         	combobox_      combobox      ��ʦ      Class      Pixels      	combobox_      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      =Height = 0
Left = 0
Top = 23
Width = 113
Name = "Line1"
      label      label      Label1      ��ʦ      shape      shape      Shape1      ��ʦ      shape      ��ʦ      Pixels      Class      16      control      ��ʦ     ���                              �   %   �       �      �           �  U    ��  � � � U  THIS PARENT DBLCLICK  ��  � � � U  THIS PARENT CLICK DblClick,     �� ClickX     ��1 � 2 � 1                       (         D   U       )                           `PROCEDURE DblClick
this.Parent.DblClick
ENDPROC
PROCEDURE Click
this.Parent.Click
ENDPROC
      NTop = 0
Left = 0
Height = 52
Width = 113
BackStyle = 0
Name = "Shape11"
      ��ʦ      Shape11      shape      shape      �FontBold = .T.
FontName = "΢���ź�"
FontSize = 10
Caption = "��δ�ſ�"
Height = 26
Left = 2
Top = 24
Width = 109
ForeColor = 0,0,128
BackColor = 192,192,192
Rotation = 360
Name = "LabelNoLession"
      ��ʦ      LabelNoLession      label      label      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
Caption = ""
Height = 20
Left = 90
Top = 2
Width = 21
ForeColor = 0,0,255
BackColor = 192,192,192
Name = "Label2"
      ��ʦ      Label2      label      label      ATop = 25
Left = 101
Height = 25
Width = 10
Name = "Shape10"
      ��ʦ      Shape10      shape      shape      XTop = 25
Left = 90
Height = 25
Width = 10
BackColor = 128,128,255
Name = "Shape9"
      ��ʦ      Shape9      shape      shape      XTop = 25
Left = 79
Height = 25
Width = 10
BackColor = 128,128,255
Name = "Shape8"
      ��ʦ      Shape8      shape      shape      ?Top = 25
Left = 68
Height = 25
Width = 10
Name = "Shape7"
      ��ʦ      Shape7      shape      shape      ?Top = 25
Left = 57
Height = 25
Width = 10
Name = "Shape6"
      ��ʦ      Shape6      shape      shape      1      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      grid_      Pixels      Class      1      grid      grid_      ;Height = 200
SplitBar = .F.
Width = 320
Name = "grid_"
      grid      ?Top = 25
Left = 46
Height = 25
Width = 10
Name = "Shape5"
      ��ʦ      Shape5      shape      shape      ?Top = 25
Left = 35
Height = 25
Width = 10
Name = "Shape4"
      ��ʦ      Shape4      shape      shape      WTop = 25
Left = 24
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape3"
      ��ʦ      Shape3      shape      shape      WTop = 25
Left = 13
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape2"
      ��ʦ      Shape2      shape      VTop = 25
Left = 2
Height = 25
Width = 10
BackColor = 64,128,128
Name = "Shape1"
      �AutoSize = .F.
FontName = "΢���ź�"
FontSize = 12
Anchor = 11
Alignment = 2
Caption = "��ʦ����"
Height = 20
Left = 2
Top = 2
Width = 88
Name = "Label1"
     -���                              �;   %   �
      �  i   �
          �  U  �	 T�  � � ��  � �� T�  � � ��  � �� T�  � � ��  � ��/ T�  � � �C�  �	 � � ��� C�  �
 ��6��( T�  � � �C�  � ��� ,�  � ��& T�  � � �C�  � � � ͼ� �  6��6 T�  � � �C�  � � C� � ���^� C�d�d�d�^6�� T�  � � �C�������^��# %��  � �  � ��������?��P� T�  � � �C�@�����^�� �# %��  � �  � ��������?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � ��������?���� T�  � � �C�@�����^�� �# %��  � �  � ��������?��5� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � �333333�?���� T�  � � �C�@�����^�� �# %��  � �  � �333333�?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � ��������?��6� T�  � � �C�@�����^�� �# %��  � �  � ��������?��y� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � �      �?���� T�  � � �C�@�����^�� �# %��  � �  � �      �?��� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � �333333�?��z� T�  � � �C�@�����^�� �# %��  � �  � �333333�?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � �ffffff�?��� T�  � � �C�@�����^�� �# %��  � �  � �ffffff�?��_� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � ��������?���� T�  � � �C�@�����^�� �# %��  � �  � ��������?��� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � ��������?��`� T�  � � �C�@�����^�� �# %��  � �  � ��������?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  � �  � �      �?��� T�  � � �C�@�����^�� �# %��  � �  � �      �?��E� T�  � � �C�������^�� �% %��  � �  � � �  � � ���� T�  � � �C� � � �^�� T�  � � �C� � � �^�� T�  � � �C� � � �^�� T�  � � �C�������^�� T�  � � �C�������^�� T�  � � �C�������^�� %��  �	 ���� T�  � � �C� � ���^�� T�  � � �C� � ���^�� T�  � � �C� � ���^�� T�  � � �C� � ���^�� � �J	� T�  � � �C�������^�� T�  � � �C�������^�� T�  � � �C�������^�� T�  � � �C� � ���^�� T�  � � �C� � ���^�� T�  � � �C� � ���^�� � %��  � � ��s	� T�  �  �! �a�� ��	� T�  �  �! �-�� � U"  THIS LABELNJ CAPTION CNJ LABELKC CKC LABELBB CBB	 LABELBJLX BBK CBJLX	 LABELSKSJ CSKZQ CSKSJ
 LABELIMAGE	 BHASIMAGE	 FORECOLOR SHAPE1	 BACKCOLOR NTOTAL1 NTOTAL NTOTAL2 SHAPE2 SHAPE3 SHAPE4 SHAPE5 SHAPE6 SHAPE7 SHAPE8 SHAPE9 SHAPE10 NTOTAL3 LABELNOLESSION VISIBLE	 showclass,     ��1 aaa��aa�1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A R����������A � ������A B� A 1                       �      )                          �Width = 113
Height = 52
BackColor = 192,192,192
cteacher = 
_memberdata =      737<VFPData><memberdata name="cteacher" type="property" display="cTeacher"/><memberdata name="showteacher" type="method" display="ShowTeacher"/><memberdata name="ntotal" type="property" display="nTotal"/><memberdata name="ntotal1" type="property" display="nTotal1"/><memberdata name="ntotal2" type="property" display="nTotal2"/><memberdata name="cxn" type="property" display="cXN"/><memberdata name="cxq" type="property" display="cXQ"/><memberdata name="nmonth" type="property" display="nMonth"/><memberdata name="nyear" type="property" display="nYear"/><memberdata name="ntotal3" type="property" display="nTotal3"/><memberdata name="cbm" type="property" display="cBM"/><memberdata name="cxnjc" type="property" display="cXNJC"/></VFPData>

ntotal = 0
ntotal1 = 0
ntotal2 = 0
cxq = 
cxn = 
nyear = 0
nmonth = 0
ntotal3 = 0
cbm = 
cxnjc = 
Name = "��ʦ"
     	����    �	  �	                        |�   %   �      �	  Y   �          �  U  � T�  � � ��  � �� T�  � � �C�  � ��� T�  � � �C�������^��# %��  �	 �  �
 ��������?��� � T�  � � �C�@�����^�� �# %��  � �  �
 ��������?��� � T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 ��������?��+� T�  � � �C�@�����^�� �# %��  � �  �
 ��������?��n� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 �333333�?���� T�  � � �C�@�����^�� �# %��  � �  �
 �333333�?��� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 ��������?��o� T�  � � �C�@�����^�� �# %��  � �  �
 ��������?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 �      �?��� T�  � � �C�@�����^�� �# %��  � �  �
 �      �?��T� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 �333333�?���� T�  � � �C�@�����^�� �# %��  � �  �
 �333333�?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 �ffffff�?��U� T�  � � �C�@�����^�� �# %��  � �  �
 �ffffff�?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 ��������?���� T�  � � �C�@�����^�� �# %��  � �  �
 ��������?��:� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 ��������?���� T�  � � �C�@�����^�� �# %��  � �  �
 ��������?���� T�  � � �C�������^�� � T�  � � �C�������^��# %��  �	 �  �
 �      �?��;� T�  � � �C�@�����^�� �# %��  � �  �
 �      �?��~� T�  � � �C�������^�� �% %��  � �  �
 � �  �
 � ���� T�  � � �C�������^�� T�  � � �C� � � �^�� T�  � � �-�� �A� T�  � � �C� �����^�� T�  � � �C�������^�� T�  � � �a�� � %��  �
 � ��j� T�  � � �a�� ��� T�  � � �-�� � T�  � � ��  � �� U  THIS LABEL1 CAPTION CTEACHER SHAPE11 TOOLTIPTEXT CBM SHAPE1	 BACKCOLOR NTOTAL1 NTOTAL NTOTAL2 SHAPE2 SHAPE3 SHAPE4 SHAPE5 SHAPE6 SHAPE7 SHAPE8 SHAPE9 SHAPE10 NTOTAL3	 FORECOLOR FONTBOLD LABELNOLESSION VISIBLE LABEL2 CXNJC showteacher,     ��1 a��1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A �1�A 1�A R��� ��A B� A b1                       
      )   �	                       
&PROCEDURE showteacher
this.Label1.Caption=this.cTeacher
this.shape11.ToolTipText=ALLTRIM(this.cBM)

this.Shape1.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.1
	this.Shape1.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.1
	this.Shape1.BackColor=RGB(128,128,255)
ENDIF 

this.Shape2.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.2
	this.Shape2.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.2
	this.Shape2.BackColor=RGB(128,128,255)
ENDIF 

this.Shape3.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.3
	this.Shape3.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.3
	this.Shape3.BackColor=RGB(128,128,255)
ENDIF 

this.Shape4.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.4
	this.Shape4.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.4
	this.Shape4.BackColor=RGB(128,128,255)
ENDIF 

this.Shape5.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.5
	this.Shape5.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.5
	this.Shape5.BackColor=RGB(128,128,255)
ENDIF 

this.Shape6.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.6
	this.Shape6.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.6
	this.Shape6.BackColor=RGB(128,128,255)
ENDIF 

this.Shape7.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.7
	this.Shape7.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.7
	this.Shape7.BackColor=RGB(128,128,255)
ENDIF 

this.Shape8.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.8
	this.Shape8.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.8
	this.Shape8.BackColor=RGB(128,128,255)
ENDIF 

this.Shape9.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.9
	this.Shape9.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.9
	this.Shape9.BackColor=RGB(128,128,255)
ENDIF 

this.Shape10.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*1.0
	this.Shape10.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*1.0
	this.Shape10.BackColor=RGB(128,128,255)
ENDIF 

IF this.nTotal3<this.nTotal OR this.nTotal=0
	this.Label1.BackColor=RGB(240,240,240)
	this.Label1.ForeColor=RGB(0,0,0)
	this.Label1.FontBold= .F.
ELSE 
	this.Label1.BackColor= RGB(0,128,255)
	this.Label1.ForeColor=RGB(255,255,255)
	this.Label1.FontBold= .T.
ENDIF 

IF this.nTotal=0
	this.LabelNoLession.Visible= .T.
ELSE
	this.LabelNoLession.Visible= .F.
ENDIF 

this.Label2.Caption=this.cXNJC
ENDPROC
     �PROCEDURE showclass
this.LabelNJ.Caption=this.cNJ
this.LabelKC.Caption=this.cKC
this.LabelBB.Caption=this.cBB
this.LabelBJLX.Caption=IIF(this.bBK,"��",LEFTC(this.cBJLX,1))
this.LabelSKSJ.Caption=LEFTC(this.cSKZQ,2)+","+this.cSKSJ
this.LabelImage.Caption=IIF(this.bHasImage,"ͼ","")
this.LabelImage.ForeColor=IIF(this.bHasImage,RGB(0,0,128),RGB(100,100,100))



this.Shape1.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.1
	this.Shape1.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.1
	this.Shape1.BackColor=RGB(128,128,255)
ENDIF 

this.Shape2.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.2
	this.Shape2.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.2
	this.Shape2.BackColor=RGB(128,128,255)
ENDIF 

this.Shape3.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.3
	this.Shape3.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.3
	this.Shape3.BackColor=RGB(128,128,255)
ENDIF 

this.Shape4.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.4
	this.Shape4.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.4
	this.Shape4.BackColor=RGB(128,128,255)
ENDIF 

this.Shape5.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.5
	this.Shape5.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.5
	this.Shape5.BackColor=RGB(128,128,255)
ENDIF 

this.Shape6.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.6
	this.Shape6.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.6
	this.Shape6.BackColor=RGB(128,128,255)
ENDIF 

this.Shape7.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.7
	this.Shape7.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.7
	this.Shape7.BackColor=RGB(128,128,255)
ENDIF 

this.Shape8.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.8
	this.Shape8.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.8
	this.Shape8.BackColor=RGB(128,128,255)
ENDIF 

this.Shape9.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*0.9
	this.Shape9.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*0.9
	this.Shape9.BackColor=RGB(128,128,255)
ENDIF 

this.Shape10.BackColor=RGB(240,240,240)
IF this.nTotal1>=this.nTotal*1.0
	this.Shape10.BackColor=RGB(64,128,128)
ENDIF 
IF this.nTotal2>=this.nTotal*1.0
	this.Shape10.BackColor=RGB(128,128,255)
ENDIF 

IF this.nTotal3<this.nTotal OR this.nTotal=0
	this.labelNJ.ForeColor=RGB(0,0,0)
	this.LabelKC.ForeColor=RGB(0,0,0)
	this.LabelNJ.ForeColor=RGB(0,0,0)
	this.LabelNJ.BackColor=RGB(240,240,240)
	this.LabelKC.BackColor=RGB(240,240,240)
	this.LabelBB.BackColor=RGB(240,240,240)
	
	IF this.bBK
		this.LabelNJ.ForeColor=RGB(0,0,255)
		this.LabelKC.ForeColor=RGB(0,0,255)
		this.LabelBB.ForeColor=RGB(0,0,255)
		this.LabelBJLX.ForeColor=RGB(0,0,255)
	ENDIF 
ELSE 
	this.labelNJ.ForeColor= RGB(255,255,255)
	this.LabelKC.ForeColor=RGB(255,255,255)
	this.LabelBB.ForeColor=RGB(255,255,255)
	this.LabelNJ.BackColor=RGB(0,0,128)
	this.LabelKC.BackColor=RGB(0,0,128)
	this.LabelBB.BackColor=RGB(0,0,128)
ENDIF 

IF this.nTotal=0
	this.LabelNoLession.Visible= .T.
ELSE
	this.LabelNoLession.Visible= .F.
ENDIF 
ENDPROC
    %           �     j  �|�H�   �� ��  � � � � � � � %�C�  ��� C��; � B�-�� � %�C� ��� N��a � T� �� �� � H�r ��� �� � ��� � DO FORM &cFormName
 �� ���� �# DO FORM &cFormName WITH vParam1
 �� ���	�+ DO FORM &cFormName WITH vParam1,vParam2
 �� ���M�3 DO FORM &cFormName WITH vParam1,vParam2,vParam3
 �� �����; DO FORM &cFormName WITH vParam1,vParam2,vParam3,vParam4
 �� �����C DO FORM &cFormName WITH vParam1,vParam2,vParam3,vParam4,vParam5
 2��� � U 	 CFORMNAME NPARAMCOUNT VPARAM1 VPARAM2 VPARAM3 VPARAM4 VPARAM5�Qq A Q� A � a1�1�1� B 1                 BM6      6   (                  �  �          ���������������������������������������[?bD�Ż������������������������������������cF)�_D�w=e���������������������������������!mO6�kR���Ų%oR������������������������������+xYE�yc���ɸ5~a��������������Ά��``````�����Θ��V��t���ͽ=�h������������������������lll}}}���E�o���������������������������������������mmm�����������������ȓ����������������������������������������������������������������������������֎��������������vvv������������������������������zzz������������~~~�����������������������������킂���������������������������������������������ܠ����������������ֱ�������������������������󦦦��������������������������������������������Ǿ����������������������������������������߸����������������������������������߷�����������������������������������0>   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _RFH0TO4SH 864327697a      m  y      �      � ��         �  �              �             COMMENT RESERVED                        	                                                                   WINDOWS _RFH0TRAT8 864327719	      +	  8	      F	      k
 r�         �	  �	              �	  �	           COMMENT RESERVED                        �                                                                   WINDOWS _1OP0LYOA4 865096155�      �  �      �                        #              ,               COMMENT RESERVED                        :                                                                   WINDOWS _1U30RYFM2 886728787I  Z  k  w      �                              s          �s               WINDOWS _1U30RYFNH 886728787�s      �s  �s  �s  -t                                                           WINDOWS _1U30RYFNI 886728787t      �t  �t  �t  �t                                                           WINDOWS _1U30RYFNJ 886728787Fu      Tu  bu  qu  �u                                                           WINDOWS _1U30RYFNL 886728787�u      v  v  v  Lv                                                           WINDOWS _1U30RYFNM 886728787�v      �v  �v  �v  w                                                           WINDOWS _1U30RYFNN 886728787hw      ww  �w  �w  �w                                                           WINDOWS _1U30RYFNP 8867287870x      >x  Lx  [x  �x                                                           WINDOWS _1U30RYFNQ 886728787�x      �x  �x  y  6y                                                           WINDOWS _1U30RYFNR 886728787�y  �y  �y  �y  �y                                                               WINDOWS _1U30TYZ2U 8867305932z  Cz  Tz  `z      rz                              ��          ��               WINDOWS _1U30TYZ47 886730593��      ��  ��  ��  ��                                                           WINDOWS _1U30TYZ4A 886730593y�  ��  ��  ��  ��                                                               WINDOWS _RFH0TQPLW 951481206�      �  (�      :�      o� b�         ��  ��              ��  ��           COMMENT RESERVED                        %�                                                                   WINDOWS _1VF0Q5GAZ 959513142�     2�  �     �     Y�  ��          9  f�              (              COMMENT RESERVED                        ��      W                                                          WINDOWS _RFH0TNO1H 961705756.�      !�  �      �	      ~          /�  ��  D�          �  ��           COMMENT RESERVED                        �                                                                   WINDOWS _RFH0TL694 963611933�      �  �      ��      ��  [         ;�  "�              ��  ��           COMMENT RESERVED                        �                                                                   WINDOWS _2OH0XOAQJ 987085000l�      Z�  E�                                                                   WINDOWS _RFH0TJIMM 988235859�      ��  �      /�      �� �         �  	  q          ��  ��           COMMENT RESERVED                        �      ��                                                           WINDOWS _RFH0TOFY3 995518690��      ��  ��      �-     �U �         �  O  <�          ��  ��           COMMENT RESERVED                        V�      i�                                                           WINDOWS _RFH0TRNAK 988841411o�      ~�  ��      k�      N �          ��  �              ��  ��           COMMENT RESERVED                        ��      ��                                                           WINDOWS _RFH0TNH5N 995518893i      �  v      $�      �) R�         S  `              &  4           COMMENT RESERVED                                                                                           WINDOWS _RFH0TM5BE 995519538��       �  �      o�      � �1         ��  ��  =�          ��  �          COMMENT RESERVED                        ��      /�                                                           WINDOWS _RFH0TJUI11013233133�      X�  h�      �     tN G7         �  X  ��          �  s�           COMMENT RESERVED                        �      ��                                                           WINDOWS _RFH0TK41Y1013693386      <  0      F      � ��                         �  �           COMMENT RESERVED                        �      �                                                           WINDOWS _1Y80IX40F1013953704 �  ��  ��  ��      ��      <�  �          0�  �    �  �  ~�               COMMENT RESERVED                        �      �                                                           WINDOWS _16S0Z01291049185626��      ��  $�      !      9�  �          ��  �              ��               COMMENT RESERVED                        �      V�                                                           WINDOWS _RFH0TN1LS1056735097��      `�  ��      ��      �G ��         ��  �  ��          m�  {�           COMMENT RESERVED                        `�      7�                                                           WINDOWS _1SY0S1UTF1063946080v�  +�  y�  ��      &�     V� �2         i�    ��          [�               COMMENT RESERVED                        J�                                                                   WINDOWS _2N41AS0FX1064008901�      �	  �      ��      #         �  �  �          �               COMMENT RESERVED                        }      Q                                                           WINDOWS _1H80LENEL1064391371d      �  r      `�     e 3�         N  [  6         @               COMMENT RESERVED                        -                                                                   WINDOWS _RFH0TMEE81064462994�      ��  �      1�     �� [         �  �            �  l           WINDOWS _1H80LGO8V 846614553�   �  H�  ��  =�  �                                                           WINDOWS _2IE0L17Q91064462994��      +�  �     ��      ��  �  Q ��                                       WINDOWS _2J618I3NS1064462994��        �  �  ��      s l�  lD �                                       COMMENT RESERVED                        �      C                                                           WINDOWS _3D9173VVD1064870107�      �  �      	              d: �
  w  F              i               COMMENT RESERVED                        T                                                                   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      _image      Pixels      Foundation Image class.      Class      1      image      _image      image      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      _commandbutton      Pixels      Foundation CommandButton class.      Class      1      commandbutton      _commandbutton      �Height = 26
Width = 84
FontBold = .F.
FontItalic = .F.
FontUnderline = .F.
Caption = "running~"
MousePointer = 0
ToolTipText = ""
SpecialEffect = 2
PicturePosition = 0
ForeColor = 0,0,255
Themes = .T.
Name = "_commandbutton"
      commandbutton      $΢���ź�, 1, 9, 6, 17, 13, 17, 4, 0
      _textbox      Pixels      1      Class      1      textbox      _textbox      Xenablef7 ֧��F7����
bf7mode
creturnfield
sqlstring
*enablef7_assign 
*self_check 
      Class      1      1      1      line      line      _line      QBorderStyle = 1
Height = 68
Width = 68
BorderColor = 0,0,128
Name = "_line"
      Class      1      Pixels      Foundation Line class.     +Height = 26
Width = 84
Picture = exit.bmp
Cancel = .T.
Caption = "�ر�"
StatusBarText = "�رյ�ǰ����"
Style = 0
ToolTipText = "�رյ�ǰ����"
SpecialEffect = 2
PicturePosition = 0
PictureMargin = 0
PictureSpacing = 0
ForeColor = 0,0,128
BackColor = 236,233,216
Name = "_cancelbutton"
      my_datepicker      Pixels      Class      
olecontrol      _form      panehelp.bmp      checkbox      1      my_datepicker      
olecontrol      Pixels      1      [__chelpstring ������Ϣ
_memberdata XML Metadata for customizable properties
__citemname
      6_memberdata XML Metadata for customizable properties
      	_checkbox      	_cmd_help      Class      1      panehelp.bmp      Class      1      _line      shape      shape      _shape      [Height = 2
Width = 576
BackStyle = 0
FillStyle = 1
SpecialEffect = 0
Name = "_shape"
      Class      1      Pixels      Foundation Shape class.      textbox      �AutoSize = .T.
FontName = "Arial"
FontSize = 9
FontCharSet = 0
WordWrap = .F.
BackStyle = 0
Caption = "Label1"
Height = 17
Width = 40
ForeColor = 0,0,160
_memberdata = 
isinit = .T.
Name = "_label"
      +OLEObject = D:\WISEMIS3\Libs\CODEJO~2.OCX
      2Height = 27
Width = 100
Name = "my_datepicker"
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Foundation Form class.      Class      4      form      _form      +OLEObject = D:\WISEMIS3\Libs\CODEJO~1.OCX
      _form      oImageManager      
olecontrol      _form      base_method      Pixels      Class      1      custom      base_method      custom      _label      	container      	container      _shape      custom      custom      _custom      Name = "_custom"
      Class      1      Pixels      _custom      	base_form      	_base.vcx      form      	base_form     evHeight = 643
Width = 878
DoCreate = .T.
ShowTips = .T.
Caption = "�ڲ��ֻ����� - WiseMisӦ�÷���"
Visible = .T.
sql_cmd =      298IF NOT exists(select * from sysobjects where id=object_id('WiseMis_Favorite') AND ObjectProperty(id,'isUserTable')=1)
  SELECT -1
ELSE
  BEGIN
    IF exists(select * from WiseMis_Favorite where UserID=system_user AND AppName='A01.�ڲ��ֻ�����')
      SELECT 1
    ELSE
      SELECT 0
  END 
cappobjname = ("")
cversion = ("03")
cursor_name = _1U30RYCIU
sql_handle = -1
cindextable = ("")
cdetailtable = AppConfigDetail
crelationtable = AppRelation
cquerytable = general_query
cursor_index = WiseMis942160347
cursor_detail = WiseMis1220026119
cursor_info = WiseMis1466700491
cursor_relation = ("")
cursor_task = WiseMis2409226707
mextrasearchexp = ("")
cextrasearchexp = ("")
mshare = .T.
mallowrun = .T.
mcreator = DGWISECHAMP\tangxuke
chelptext = ("")
mbasetable = [hr_tel_exts]
cbasetable = ("")
mappname = WiseMis_�ڲ��ֻ�����_1u30ryc7q
mappnameex = ("")
mallowkeyempty = .F.
mfieldslist = �ֻ���,������λ,�ֻ��û�,��������
mkeyfieldslist = �ֻ���
minsertfieldslist = 
mupdatefieldslist = 
mpresearchfieldslist = �ֻ���,�ֻ��û�,��������
mallowquery = .T.
mselectfieldsexp = �ֻ��� as [�ֻ���],������λ as [������λ],�ֻ��û� as [�ֻ��û�],�������� as [��������]
mselectwithmemofieldsexp = ("")
morderexp = ("")
ncontrolslength = 147
cruntimeselectfieldslist = ("")
cnewruntimeselectfieldslist = ("")
mselectallfieldsexp = ("")
mtempfields = �ֻ���,������λ,�ֻ��û�,��������
_wisemis_�ֻ��� = 
_wisemis_�ֻ���_oldvalue = .F.
_wisemis_������λ = �ݲ�
_wisemis_������λ_oldvalue = .F.
_wisemis_�ֻ��û� = 
_wisemis_�ֻ��û�_oldvalue = .F.
_wisemis_�������� = 
_wisemis_��������_oldvalue = .F.
binit = .T.
bnew = .F.
bedit = .F.
bdelete = .F.
mpresearchexp = ("")
omypageframe = Object
Name = "base_form"
_base.Name = "_base"
o_statusbar1.Top = 620
o_statusbar1.Left = 0
o_statusbar1.Height = 23
o_statusbar1.Width = 878
o_statusbar1.Name = "o_statusbar1"
_pageframe1.ErasePage = .T.
_pageframe1.Page1._grid1.MemberClassLibrary = myheader.prg
_pageframe1.Page1._grid1.MemberClass = "myCol"
_pageframe1.Page1._grid1.ColumnCount = 4
_pageframe1.Page1._grid1.Column1.ControlSource = "�ֻ���"
_pageframe1.Page1._grid1.Column1.Width = 50
_pageframe1.Page1._grid1.Column1.BackColor = 255,255,255
_pageframe1.Page1._grid1.Column1.Name = "Column1"
_pageframe1.Page1._grid1.Column2.ControlSource = "������λ"
_pageframe1.Page1._grid1.Column2.Width = 62
_pageframe1.Page1._grid1.Column2.BackColor = 236,233,216
_pageframe1.Page1._grid1.Column2.Name = "Column2"
_pageframe1.Page1._grid1.Column3.ControlSource = "�ֻ��û�"
_pageframe1.Page1._grid1.Column3.Width = 98
_pageframe1.Page1._grid1.Column3.BackColor = 255,255,255
_pageframe1.Page1._grid1.Column3.Name = "Column3"
_pageframe1.Page1._grid1.Column4.ControlSource = "��������"
_pageframe1.Page1._grid1.Column4.Width = 78
_pageframe1.Page1._grid1.Column4.BackColor = 236,233,216
_pageframe1.Page1._grid1.Column4.Name = "Column4"
_pageframe1.Page1._grid1.Height = 414
_pageframe1.Page1._grid1.Left = 403
_pageframe1.Page1._grid1.RecordSource = "WiseMis_�ڲ��ֻ�����_1u30ryc7q"
_pageframe1.Page1._grid1.RecordSourceType = 1
_pageframe1.Page1._grid1.Top = 7
_pageframe1.Page1._grid1.Width = 452
_pageframe1.Page1._grid1.LockColumns = 0
_pageframe1.Page1._grid1.LockColumnsLeft = 0
_pageframe1.Page1._grid1.AllowCellSelection = .F.
_pageframe1.Page1._grid1.Name = "_grid1"
_pageframe1.Page1.Pageframe1.ErasePage = .T.
_pageframe1.Page1.Pageframe1._wisemis_������Ϣ.Caption = "������Ϣ"
_pageframe1.Page1.Pageframe1._wisemis_������Ϣ.ForeColor = 0,0,255
_pageframe1.Page1.Pageframe1._wisemis_������Ϣ.Name = "_wisemis_������Ϣ"
_pageframe1.Page1.Pageframe1.Name = "Pageframe1"
_pageframe1.Page1.cmd_script1.Top = 523
_pageframe1.Page1.cmd_script1.Left = 102
_pageframe1.Page1.cmd_script1.Height = 22
_pageframe1.Page1.cmd_script1.Width = 75
_pageframe1.Page1.cmd_script1.BackColor = 236,233,216
_pageframe1.Page1.cmd_script1.Name = "cmd_script1"
_pageframe1.Page1.cmd_script2.Top = 523
_pageframe1.Page1.cmd_script2.Left = 177
_pageframe1.Page1.cmd_script2.Height = 22
_pageframe1.Page1.cmd_script2.Width = 75
_pageframe1.Page1.cmd_script2.BackColor = 236,233,216
_pageframe1.Page1.cmd_script2.Name = "cmd_script2"
_pageframe1.Page1.cmd_script3.Top = 523
_pageframe1.Page1.cmd_script3.Left = 252
_pageframe1.Page1.cmd_script3.Height = 22
_pageframe1.Page1.cmd_script3.Width = 75
_pageframe1.Page1.cmd_script3.BackColor = 236,233,216
_pageframe1.Page1.cmd_script3.Name = "cmd_script3"
_pageframe1.Page1.cmd_script4.Top = 523
_pageframe1.Page1.cmd_script4.Left = 327
_pageframe1.Page1.cmd_script4.Height = 22
_pageframe1.Page1.cmd_script4.Width = 75
_pageframe1.Page1.cmd_script4.BackColor = 236,233,216
_pageframe1.Page1.cmd_script4.Name = "cmd_script4"
_pageframe1.Page1.cmd_script5.Top = 523
_pageframe1.Page1.cmd_script5.Left = 402
_pageframe1.Page1.cmd_script5.Height = 22
_pageframe1.Page1.cmd_script5.Width = 75
_pageframe1.Page1.cmd_script5.BackColor = 236,233,216
_pageframe1.Page1.cmd_script5.Name = "cmd_script5"
_pageframe1.Page1.cmd_script6.Top = 523
_pageframe1.Page1.cmd_script6.Left = 477
_pageframe1.Page1.cmd_script6.Height = 22
_pageframe1.Page1.cmd_script6.Width = 75
_pageframe1.Page1.cmd_script6.BackColor = 236,233,216
_pageframe1.Page1.cmd_script6.Name = "cmd_script6"
_pageframe1.Page1.cmd_script7.Top = 523
_pageframe1.Page1.cmd_script7.Left = 552
_pageframe1.Page1.cmd_script7.Height = 22
_pageframe1.Page1.cmd_script7.Width = 75
_pageframe1.Page1.cmd_script7.BackColor = 236,233,216
_pageframe1.Page1.cmd_script7.Name = "cmd_script7"
_pageframe1.Page1.cmd_script8.Top = 523
_pageframe1.Page1.cmd_script8.Left = 627
_pageframe1.Page1.cmd_script8.Height = 22
_pageframe1.Page1.cmd_script8.Width = 75
_pageframe1.Page1.cmd_script8.BackColor = 236,233,216
_pageframe1.Page1.cmd_script8.Name = "cmd_script8"
_pageframe1.Page1.cmd_script9.Top = 523
_pageframe1.Page1.cmd_script9.Left = 702
_pageframe1.Page1.cmd_script9.Height = 22
_pageframe1.Page1.cmd_script9.Width = 75
_pageframe1.Page1.cmd_script9.BackColor = 236,233,216
_pageframe1.Page1.cmd_script9.Name = "cmd_script9"
_pageframe1.Page1._cSearch.Top = 473
_pageframe1.Page1._cSearch.Left = 406
_pageframe1.Page1._cSearch.Height = 17
_pageframe1.Page1._cSearch.Width = 66
_pageframe1.Page1._cSearch.Alignment = 0
_pageframe1.Page1._cSearch.Name = "_cSearch"
_pageframe1.Page1._cClearRefresh.Top = 473
_pageframe1.Page1._cClearRefresh.Left = 477
_pageframe1.Page1._cClearRefresh.Height = 17
_pageframe1.Page1._cClearRefresh.Width = 78
_pageframe1.Page1._cClearRefresh.Alignment = 0
_pageframe1.Page1._cClearRefresh.Name = "_cClearRefresh"
_pageframe1.Page1.cmd_update.Top = 472
_pageframe1.Page1.cmd_update.Left = 695
_pageframe1.Page1.cmd_update.Height = 22
_pageframe1.Page1.cmd_update.Width = 59
_pageframe1.Page1.cmd_update.Enabled = .T.
_pageframe1.Page1.cmd_update.BackColor = 236,233,216
_pageframe1.Page1.cmd_update.Name = "cmd_update"
_pageframe1.Page1._checkbox1.Top = 490
_pageframe1.Page1._checkbox1.Left = 477
_pageframe1.Page1._checkbox1.Height = 17
_pageframe1.Page1._checkbox1.Width = 42
_pageframe1.Page1._checkbox1.Alignment = 0
_pageframe1.Page1._checkbox1.Name = "_checkbox1"
_pageframe1.Page1.cmd_lockcol.Top = 472
_pageframe1.Page1.cmd_lockcol.Left = 652
_pageframe1.Page1.cmd_lockcol.Height = 22
_pageframe1.Page1.cmd_lockcol.Width = 43
_pageframe1.Page1.cmd_lockcol.BackColor = 236,233,216
_pageframe1.Page1.cmd_lockcol.Name = "cmd_lockcol"
_pageframe1.Page1.cmd_self_query.Top = 472
_pageframe1.Page1.cmd_self_query.Left = 755
_pageframe1.Page1.cmd_self_query.Height = 22
_pageframe1.Page1.cmd_self_query.Width = 71
_pageframe1.Page1.cmd_self_query.BackColor = 236,233,216
_pageframe1.Page1.cmd_self_query.Name = "cmd_self_query"
_pageframe1.Page1._cForbidSearch.Top = 508
_pageframe1.Page1._cForbidSearch.Left = 406
_pageframe1.Page1._cForbidSearch.Height = 17
_pageframe1.Page1._cForbidSearch.Width = 66
_pageframe1.Page1._cForbidSearch.Alignment = 0
_pageframe1.Page1._cForbidSearch.Name = "_cForbidSearch"
_pageframe1.Page1._cSelectMode.Top = 474
_pageframe1.Page1._cSelectMode.Left = 561
_pageframe1.Page1._cSelectMode.Height = 17
_pageframe1.Page1._cSelectMode.Width = 66
_pageframe1.Page1._cSelectMode.Alignment = 0
_pageframe1.Page1._cSelectMode.Value = .F.
_pageframe1.Page1._cSelectMode.Name = "_cSelectMode"
_pageframe1.Page1._comQuery.Enabled = .F.
_pageframe1.Page1._comQuery.Height = 24
_pageframe1.Page1._comQuery.Left = 653
_pageframe1.Page1._comQuery.Top = 496
_pageframe1.Page1._comQuery.Width = 101
_pageframe1.Page1._comQuery.Name = "_comQuery"
_pageframe1.Page1.cmd_browse.Top = 497
_pageframe1.Page1.cmd_browse.Left = 757
_pageframe1.Page1.cmd_browse.Height = 22
_pageframe1.Page1.cmd_browse.Width = 70
_pageframe1.Page1.cmd_browse.Enabled = .F.
_pageframe1.Page1.cmd_browse.BackColor = 236,233,216
_pageframe1.Page1.cmd_browse.Name = "cmd_browse"
_pageframe1.Page1._cEnterLineMode.Top = 508
_pageframe1.Page1._cEnterLineMode.Left = 477
_pageframe1.Page1._cEnterLineMode.Height = 17
_pageframe1.Page1._cEnterLineMode.Width = 66
_pageframe1.Page1._cEnterLineMode.Alignment = 0
_pageframe1.Page1._cEnterLineMode.Name = "_cEnterLineMode"
_pageframe1.Page1.cmd_WorkFlow.Top = 523
_pageframe1.Page1.cmd_WorkFlow.Left = 2
_pageframe1.Page1.cmd_WorkFlow.Height = 22
_pageframe1.Page1.cmd_WorkFlow.Width = 78
_pageframe1.Page1.cmd_WorkFlow.BackColor = 236,233,216
_pageframe1.Page1.cmd_WorkFlow.Name = "cmd_WorkFlow"
_pageframe1.Page1.cmd_taskmenu.Top = 523
_pageframe1.Page1.cmd_taskmenu.Left = 79
_pageframe1.Page1.cmd_taskmenu.Height = 22
_pageframe1.Page1.cmd_taskmenu.Width = 19
_pageframe1.Page1.cmd_taskmenu.BackColor = 236,233,216
_pageframe1.Page1.cmd_taskmenu.Name = "cmd_taskmenu"
_pageframe1.Page1.cmd_other.Top = 523
_pageframe1.Page1.cmd_other.Left = 779
_pageframe1.Page1.cmd_other.Height = 22
_pageframe1.Page1.cmd_other.Width = 49
_pageframe1.Page1.cmd_other.BackColor = 236,233,216
_pageframe1.Page1.cmd_other.Name = "cmd_other"
_pageframe1.Page1.chkPassiveRefresh.Top = 490
_pageframe1.Page1.chkPassiveRefresh.Left = 406
_pageframe1.Page1.chkPassiveRefresh.Height = 17
_pageframe1.Page1.chkPassiveRefresh.Width = 66
_pageframe1.Page1.chkPassiveRefresh.Alignment = 0
_pageframe1.Page1.chkPassiveRefresh.Value = .T.
_pageframe1.Page1.chkPassiveRefresh.Name = "chkPassiveRefresh"
_pageframe1.Page1.chkWarning.Top = 491
_pageframe1.Page1.chkWarning.Left = 561
_pageframe1.Page1.chkWarning.Height = 17
_pageframe1.Page1.chkWarning.Width = 78
_pageframe1.Page1.chkWarning.Alignment = 0
_pageframe1.Page1.chkWarning.Name = "chkWarning"
_pageframe1.Page1.conChildAppsBar.Top = 423
_pageframe1.Page1.conChildAppsBar.Left = 405
_pageframe1.Page1.conChildAppsBar.Width = 450
_pageframe1.Page1.conChildAppsBar.Height = 49
_pageframe1.Page1.conChildAppsBar.Name = "conChildAppsBar"
_pageframe1.Page1._weblabel1.Height = 17
_pageframe1.Page1._weblabel1.Left = 560
_pageframe1.Page1._weblabel1.Top = 510
_pageframe1.Page1._weblabel1.Width = 80
_pageframe1.Page1._weblabel1.BackColor = 236,233,216
_pageframe1.Page1._weblabel1.Name = "_weblabel1"
_pageframe1.Page1.Name = "Page1"
_pageframe1.Page2._query1._label1.Height = 17
_pageframe1.Page2._query1._label1.Left = 0
_pageframe1.Page2._query1._label1.Top = 513
_pageframe1.Page2._query1._label1.Width = 54
_pageframe1.Page2._query1._label1.BackColor = 236,233,216
_pageframe1.Page2._query1._label1.Name = "_label1"
_pageframe1.Page2._query1._TEXTBOX1.BackStyle = 1
_pageframe1.Page2._query1._TEXTBOX1.Height = 22
_pageframe1.Page2._query1._TEXTBOX1.Left = 61
_pageframe1.Page2._query1._TEXTBOX1.ToolTipText = "��F7��������Ҽ��Ի�ø������ݣ�����"
_pageframe1.Page2._query1._TEXTBOX1.Top = 508
_pageframe1.Page2._query1._TEXTBOX1.Width = 100
_pageframe1.Page2._query1._TEXTBOX1.BackColor = 199,214,148
_pageframe1.Page2._query1._TEXTBOX1.sqlstring = ("")
_pageframe1.Page2._query1._TEXTBOX1.creturnfield = ("")
_pageframe1.Page2._query1._TEXTBOX1.Name = "_TEXTBOX1"
_pageframe1.Page2._query1._commandbutton1.Top = 508
_pageframe1.Page2._query1._commandbutton1.Left = 162
_pageframe1.Page2._query1._commandbutton1.Height = 22
_pageframe1.Page2._query1._commandbutton1.Width = 59
_pageframe1.Page2._query1._commandbutton1.BackColor = 236,233,216
_pageframe1.Page2._query1._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page2._query1._commandbutton2.Top = 508
_pageframe1.Page2._query1._commandbutton2.Left = 288
_pageframe1.Page2._query1._commandbutton2.Height = 22
_pageframe1.Page2._query1._commandbutton2.Width = 61
_pageframe1.Page2._query1._commandbutton2.BackColor = 236,233,216
_pageframe1.Page2._query1._commandbutton2.Name = "_commandbutton2"
_pageframe1.Page2._query1._combobox1.Height = 24
_pageframe1.Page2._query1._combobox1.Left = 353
_pageframe1.Page2._query1._combobox1.Top = 506
_pageframe1.Page2._query1._combobox1.Width = 100
_pageframe1.Page2._query1._combobox1.Name = "_combobox1"
_pageframe1.Page2._query1._textbox2.Height = 21
_pageframe1.Page2._query1._textbox2.Left = 457
_pageframe1.Page2._query1._textbox2.Top = 507
_pageframe1.Page2._query1._textbox2.Width = 95
_pageframe1.Page2._query1._textbox2.Name = "_textbox2"
_pageframe1.Page2._query1._grid1.MemberClassLibrary = myheader.prg
_pageframe1.Page2._query1._grid1.MemberClass = "myCol"
_pageframe1.Page2._query1._grid1.Height = 497
_pageframe1.Page2._query1._grid1.Left = 2
_pageframe1.Page2._query1._grid1.Top = 2
_pageframe1.Page2._query1._grid1.Width = 806
_pageframe1.Page2._query1._grid1.LockColumns = 0
_pageframe1.Page2._query1._grid1.LockColumnsLeft = 0
_pageframe1.Page2._query1._grid1.Name = "_grid1"
_pageframe1.Page2._query1._commandbutton3.Top = 508
_pageframe1.Page2._query1._commandbutton3.Left = 225
_pageframe1.Page2._query1._commandbutton3.Height = 22
_pageframe1.Page2._query1._commandbutton3.Width = 59
_pageframe1.Page2._query1._commandbutton3.Name = "_commandbutton3"
_pageframe1.Page2._query1.Anchor = 15
_pageframe1.Page2._query1.Top = 8
_pageframe1.Page2._query1.Left = 11
_pageframe1.Page2._query1.Width = 820
_pageframe1.Page2._query1.Height = 535
_pageframe1.Page2._query1.sql_string = 
_pageframe1.Page2._query1._cursor = _1U30RYC3W�ڲ��ֻ�����
_pageframe1.Page2._query1._table = hr_tel_exts
_pageframe1.Page2._query1.query_table = general_query
_pageframe1.Page2._query1.Name = "_query1"
_pageframe1.Page2.Enabled = .T.
_pageframe1.Page2.Name = "Page2"
_pageframe1.Page4._label1.BackColor = 236,233,216
_pageframe1.Page4._label1.Name = "_label1"
_pageframe1.Page4._label2.BackColor = 236,233,216
_pageframe1.Page4._label2.Name = "_label2"
_pageframe1.Page4._listbox1.Name = "_listbox1"
_pageframe1.Page4._listbox2.Name = "_listbox2"
_pageframe1.Page4.cmd_add.BackColor = 236,233,216
_pageframe1.Page4.cmd_add.Name = "cmd_add"
_pageframe1.Page4.cmd_remove.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove.Name = "cmd_remove"
_pageframe1.Page4.cmd_rebuilt.BackColor = 236,233,216
_pageframe1.Page4.cmd_rebuilt.Name = "cmd_rebuilt"
_pageframe1.Page4._label3.BackColor = 236,233,216
_pageframe1.Page4._label3.Name = "_label3"
_pageframe1.Page4.RuntimeList.Name = "RuntimeList"
_pageframe1.Page4._label4.BackColor = 236,233,216
_pageframe1.Page4._label4.Name = "_label4"
_pageframe1.Page4.DelayList.Name = "DelayList"
_pageframe1.Page4.cmd_runtime2delay.BackColor = 236,233,216
_pageframe1.Page4.cmd_runtime2delay.Name = "cmd_runtime2delay"
_pageframe1.Page4.cmd_delay2runtime.BackColor = 236,233,216
_pageframe1.Page4.cmd_delay2runtime.Name = "cmd_delay2runtime"
_pageframe1.Page4.cmd_remove_runtime.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove_runtime.Name = "cmd_remove_runtime"
_pageframe1.Page4.cmd_remove_delay.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove_delay.Name = "cmd_remove_delay"
_pageframe1.Page4._commandbutton5.BackColor = 236,233,216
_pageframe1.Page4._commandbutton5.Name = "_commandbutton5"
_pageframe1.Page4._commandbutton6.BackColor = 236,233,216
_pageframe1.Page4._commandbutton6.Name = "_commandbutton6"
_pageframe1.Page4._shape1.Name = "_shape1"
_pageframe1.Page4._label5.BackColor = 236,233,216
_pageframe1.Page4._label5.Name = "_label5"
_pageframe1.Page4.ExtraSearch.Name = "ExtraSearch"
_pageframe1.Page4.cmd_reset_extrasearch.Enabled = .T.
_pageframe1.Page4.cmd_reset_extrasearch.BackColor = 236,233,216
_pageframe1.Page4.cmd_reset_extrasearch.Name = "cmd_reset_extrasearch"
_pageframe1.Page4._commandbutton2.BackColor = 236,233,216
_pageframe1.Page4._commandbutton2.Name = "_commandbutton2"
_pageframe1.Page4._label6.BackColor = 236,233,216
_pageframe1.Page4._label6.Name = "_label6"
_pageframe1.Page4.FieldList.Name = "FieldList"
_pageframe1.Page4._label7.BackColor = 236,233,216
_pageframe1.Page4._label7.Name = "_label7"
_pageframe1.Page4._commandbutton1.BackColor = 236,233,216
_pageframe1.Page4._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page4._commandbutton3.BackColor = 236,233,216
_pageframe1.Page4._commandbutton3.Name = "_commandbutton3"
_pageframe1.Page4.cmd_rewrite_dict.BackColor = 236,233,216
_pageframe1.Page4.cmd_rewrite_dict.Name = "cmd_rewrite_dict"
_pageframe1.Page4.Name = "Page4"
_pageframe1.Page3._label2.Height = 17
_pageframe1.Page3._label2.Left = 588
_pageframe1.Page3._label2.Top = 17
_pageframe1.Page3._label2.Width = 93
_pageframe1.Page3._label2.BackColor = 236,233,216
_pageframe1.Page3._label2.Name = "_label2"
_pageframe1.Page3._label3.Height = 17
_pageframe1.Page3._label3.Left = 640
_pageframe1.Page3._label3.Top = 40
_pageframe1.Page3._label3.Width = 41
_pageframe1.Page3._label3.BackColor = 236,233,216
_pageframe1.Page3._label3.Name = "_label3"
_pageframe1.Page3.l_Author.Caption = "DGWISECHAMP\tangxuke"
_pageframe1.Page3.l_Author.Height = 17
_pageframe1.Page3.l_Author.Left = 685
_pageframe1.Page3.l_Author.Top = 41
_pageframe1.Page3.l_Author.Width = 142
_pageframe1.Page3.l_Author.BackColor = 236,233,216
_pageframe1.Page3.l_Author.Name = "l_Author"
_pageframe1.Page3._label1.Height = 17
_pageframe1.Page3._label1.Left = 614
_pageframe1.Page3._label1.Top = 63
_pageframe1.Page3._label1.Width = 67
_pageframe1.Page3._label1.BackColor = 236,233,216
_pageframe1.Page3._label1.Name = "_label1"
_pageframe1.Page3.l_BaseTable.Caption = "[hr_tel_exts]"
_pageframe1.Page3.l_BaseTable.Height = 17
_pageframe1.Page3.l_BaseTable.Left = 687
_pageframe1.Page3.l_BaseTable.Top = 63
_pageframe1.Page3.l_BaseTable.Width = 93
_pageframe1.Page3.l_BaseTable.BackColor = 236,233,216
_pageframe1.Page3.l_BaseTable.Name = "l_BaseTable"
_pageframe1.Page3._line1.Height = 0
_pageframe1.Page3._line1.Left = 580
_pageframe1.Page3._line1.Top = 107
_pageframe1.Page3._line1.Width = 271
_pageframe1.Page3._line1.Name = "_line1"
_pageframe1.Page3._label4.Height = 17
_pageframe1.Page3._label4.Left = 628
_pageframe1.Page3._label4.Top = 121
_pageframe1.Page3._label4.Width = 54
_pageframe1.Page3._label4.BackColor = 236,233,216
_pageframe1.Page3._label4.Name = "_label4"
_pageframe1.Page3._label5.Height = 17
_pageframe1.Page3._label5.Left = 700
_pageframe1.Page3._label5.Top = 121
_pageframe1.Page3._label5.Width = 108
_pageframe1.Page3._label5.BackColor = 236,233,216
_pageframe1.Page3._label5.Name = "_label5"
_pageframe1.Page3._label6.Height = 17
_pageframe1.Page3._label6.Left = 700
_pageframe1.Page3._label6.Top = 157
_pageframe1.Page3._label6.Width = 56
_pageframe1.Page3._label6.BackColor = 236,233,216
_pageframe1.Page3._label6.Name = "_label6"
_pageframe1.Page3._label7.Height = 17
_pageframe1.Page3._label7.Left = 700
_pageframe1.Page3._label7.Top = 193
_pageframe1.Page3._label7.Width = 69
_pageframe1.Page3._label7.BackColor = 236,233,216
_pageframe1.Page3._label7.Name = "_label7"
_pageframe1.Page3._label8.Height = 17
_pageframe1.Page3._label8.Left = 700
_pageframe1.Page3._label8.Top = 229
_pageframe1.Page3._label8.Width = 82
_pageframe1.Page3._label8.BackColor = 236,233,216
_pageframe1.Page3._label8.Name = "_label8"
_pageframe1.Page3._label9.Height = 17
_pageframe1.Page3._label9.Left = 700
_pageframe1.Page3._label9.Top = 265
_pageframe1.Page3._label9.Width = 108
_pageframe1.Page3._label9.BackColor = 236,233,216
_pageframe1.Page3._label9.Name = "_label9"
_pageframe1.Page3._label10.Height = 17
_pageframe1.Page3._label10.Left = 700
_pageframe1.Page3._label10.Top = 292
_pageframe1.Page3._label10.Width = 56
_pageframe1.Page3._label10.BackColor = 236,233,216
_pageframe1.Page3._label10.Name = "_label10"
_pageframe1.Page3._line2.Height = 0
_pageframe1.Page3._line2.Left = 580
_pageframe1.Page3._line2.Top = 362
_pageframe1.Page3._line2.Width = 271
_pageframe1.Page3._line2.Name = "_line2"
_pageframe1.Page3._label11.Height = 17
_pageframe1.Page3._label11.Left = 595
_pageframe1.Page3._label11.Top = 376
_pageframe1.Page3._label11.Width = 93
_pageframe1.Page3._label11.BackColor = 236,233,216
_pageframe1.Page3._label11.Name = "_label11"
_pageframe1.Page3.com_Fields.Height = 24
_pageframe1.Page3.com_Fields.Left = 691
_pageframe1.Page3.com_Fields.Top = 370
_pageframe1.Page3.com_Fields.Width = 156
_pageframe1.Page3.com_Fields.Name = "com_Fields"
_pageframe1.Page3.edt_Text.Height = 531
_pageframe1.Page3.edt_Text.Left = 7
_pageframe1.Page3.edt_Text.Top = 6
_pageframe1.Page3.edt_Text.Width = 564
_pageframe1.Page3.edt_Text.Value = 
_pageframe1.Page3.edt_Text.Name = "edt_Text"
_pageframe1.Page3.edt_FieldText.Height = 126
_pageframe1.Page3.edt_FieldText.Left = 583
_pageframe1.Page3.edt_FieldText.Top = 400
_pageframe1.Page3.edt_FieldText.Width = 264
_pageframe1.Page3.edt_FieldText.Value = 
_pageframe1.Page3.edt_FieldText.Name = "edt_FieldText"
_pageframe1.Page3.cmd_AddFavorite.Top = 326
_pageframe1.Page3.cmd_AddFavorite.Left = 579
_pageframe1.Page3.cmd_AddFavorite.Height = 22
_pageframe1.Page3.cmd_AddFavorite.Width = 84
_pageframe1.Page3.cmd_AddFavorite.Enabled = .F.
_pageframe1.Page3.cmd_AddFavorite.BackColor = 236,233,216
_pageframe1.Page3.cmd_AddFavorite.Name = "cmd_AddFavorite"
_pageframe1.Page3.cmd_RemoveFavorite.Top = 326
_pageframe1.Page3.cmd_RemoveFavorite.Left = 671
_pageframe1.Page3.cmd_RemoveFavorite.Height = 22
_pageframe1.Page3.cmd_RemoveFavorite.Width = 84
_pageframe1.Page3.cmd_RemoveFavorite.Enabled = .T.
_pageframe1.Page3.cmd_RemoveFavorite.BackColor = 236,233,216
_pageframe1.Page3.cmd_RemoveFavorite.Name = "cmd_RemoveFavorite"
_pageframe1.Page3.l_AppName.Caption = "�ڲ��ֻ�����"
_pageframe1.Page3.l_AppName.Height = 17
_pageframe1.Page3.l_AppName.Left = 685
_pageframe1.Page3.l_AppName.Top = 16
_pageframe1.Page3.l_AppName.Width = 80
_pageframe1.Page3.l_AppName.BackColor = 236,233,216
_pageframe1.Page3.l_AppName.Name = "l_AppName"
_pageframe1.Page3._label12.Height = 17
_pageframe1.Page3._label12.Left = 608
_pageframe1.Page3._label12.Top = 87
_pageframe1.Page3._label12.Visible = .F.
_pageframe1.Page3._label12.Width = 240
_pageframe1.Page3._label12.Name = "_label12"
_pageframe1.Page3._commandbutton1.Top = 326
_pageframe1.Page3._commandbutton1.Left = 768
_pageframe1.Page3._commandbutton1.Height = 22
_pageframe1.Page3._commandbutton1.Width = 84
_pageframe1.Page3._commandbutton1.ToolTipText = "�������"
_pageframe1.Page3._commandbutton1.BackColor = 236,233,216
_pageframe1.Page3._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page3.Name = "Page3"
_pageframe1.Name = "_pageframe1"
cmd_close.Top = 589
cmd_close.Left = 756
cmd_close.Height = 22
cmd_close.Width = 86
cmd_close.Name = "cmd_close"
cmd_new.Top = 593
cmd_new.Left = 9
cmd_new.Height = 22
cmd_new.Width = 51
cmd_new.Enabled = .F.
cmd_new.BackColor = 236,233,216
cmd_new.Name = "cmd_new"
cmd_edit.Top = 593
cmd_edit.Left = 63
cmd_edit.Height = 22
cmd_edit.Width = 50
cmd_edit.Enabled = .F.
cmd_edit.BackColor = 236,233,216
cmd_edit.Name = "cmd_edit"
cmd_delete.Top = 593
cmd_delete.Left = 116
cmd_delete.Height = 22
cmd_delete.Width = 50
cmd_delete.Enabled = .F.
cmd_delete.BackColor = 236,233,216
cmd_delete.Name = "cmd_delete"
cmd_clear.Top = 593
cmd_clear.Left = 175
cmd_clear.Height = 22
cmd_clear.Width = 50
cmd_clear.BackColor = 236,233,216
cmd_clear.Name = "cmd_clear"
_conChildApp._label1.Enabled = .F.
_conChildApp._label1.BackColor = 236,233,216
_conChildApp._label1.Name = "_label1"
_conChildApp._ChildAppList.Enabled = .F.
_conChildApp._ChildAppList.Name = "_ChildAppList"
_conChildApp.cmdRun.Enabled = .F.
_conChildApp.cmdRun.BackColor = 236,233,216
_conChildApp.cmdRun.Name = "cmdRun"
_conChildApp.Top = 587
_conChildApp.Left = 284
_conChildApp.Width = 262
_conChildApp.Height = 31
_conChildApp.Name = "_conChildApp"
cmd_refresh.Top = 593
cmd_refresh.Left = 226
cmd_refresh.Height = 22
cmd_refresh.Width = 50
cmd_refresh.BackColor = 236,233,216
cmd_refresh.Name = "cmd_refresh"
_label1.Height = 17
_label1.Left = 549
_label1.Top = 597
_label1.Width = 93
_label1.BackColor = 236,233,216
_label1.Name = "_label1"
com_taskfilter.Height = 24
com_taskfilter.Left = 636
com_taskfilter.Top = 589
com_taskfilter.Width = 108
com_taskfilter.Name = "com_taskfilter"
oMenu.conselection = 
oMenu.Name = "oMenu"
      �_wisemis_�ֻ���
_wisemis_�ֻ���_oldvalue
_wisemis_������λ
_wisemis_������λ_oldvalue
_wisemis_�ֻ��û�
_wisemis_�ֻ��û�_oldvalue
_wisemis_��������
_wisemis_��������_oldvalue
      Pixels      header      header      HEADER1      &_test._pageframe1.Page1._grid1.Column1      JAlignment = 2
Caption = "�ֻ���"
ForeColor = 0,0,255
Name = "HEADER1"
      textbox      textbox      Text1      &_test._pageframe1.Page1._grid1.Column1      fBorderStyle = 0
Value = 100
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      HEADER1      &_test._pageframe1.Page1._grid1.Column2      LAlignment = 2
Caption = "������λ"
ForeColor = 0,0,255
Name = "HEADER1"
      textbox      textbox      Text1      &_test._pageframe1.Page1._grid1.Column2      gBorderStyle = 0
Value = �ݲ�
Margin = 0
ForeColor = 0,0,0
BackColor = 236,233,216
Name = "Text1"
      header      header      HEADER1      &_test._pageframe1.Page1._grid1.Column3      LAlignment = 2
Caption = "�ֻ��û�"
ForeColor = 0,0,255
Name = "HEADER1"
      textbox      textbox      Text1      &_test._pageframe1.Page1._grid1.Column3      gBorderStyle = 0
Value = �ܻ�
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      HEADER1      &_test._pageframe1.Page1._grid1.Column4      LAlignment = 2
Caption = "��������"
ForeColor = 0,0,255
Name = "HEADER1"
      textbox      textbox      Text1      &_test._pageframe1.Page1._grid1.Column4      iBorderStyle = 0
Value = ������
Margin = 0
ForeColor = 0,0,0
BackColor = 236,233,216
Name = "Text1"
      data_container      	_base.vcx      	container      _wisemis_�ֻ���      4_test._pageframe1.Page1.Pageframe1._wisemis_������Ϣ      	base_form      	_base.vcx      form      
Base_form1     c-Height = 643
Width = 878
DoCreate = .T.
ShowTips = .T.
Caption = "�������� - WiseMisӦ�÷���"
Visible = .T.
sql_cmd =      294IF NOT exists(select * from sysobjects where id=object_id('WiseMis_Favorite') AND ObjectProperty(id,'isUserTable')=1)
  SELECT -1
ELSE
  BEGIN
    IF exists(select * from WiseMis_Favorite where UserID=system_user AND AppName='A01.��������')
      SELECT 1
    ELSE
      SELECT 0
  END 
cappobjname = ("")
cversion = ("03")
cursor_name = _1U30TYWPW
sql_handle = -1
cindextable = ("")
cdetailtable = AppConfigDetail
crelationtable = AppRelation
cquerytable = general_query
cursor_index = WiseMis1634571868
cursor_detail = WiseMis993872939
cursor_info = WiseMis1504086865
cursor_relation = ("")
cursor_task = WiseMis3174172771
mextrasearchexp = ("")
cextrasearchexp = ("")
mshare = .T.
mallowrun = .T.
mcreator = ������
chelptext = ("")
mbasetable = [cp_capacity]
cbasetable = ("")
mappname = WiseMis_��������_1u30tywfi
mappnameex = ("")
mallowkeyempty = .F.
mfieldslist = CPBH,��Ʒ����,���,������ʱ,��ˮ�ٶ�,�˾�ָ��,��������,����˵��,revno,issueby,revdate
mkeyfieldslist = CPBH,���
minsertfieldslist = CPBH,���,������ʱ,��ˮ�ٶ�,�˾�ָ��,��������,����˵��
mupdatefieldslist = ������ʱ,��ˮ�ٶ�,�˾�ָ��,��������,����˵��
mpresearchfieldslist = CPBH
mallowquery = .T.
mselectfieldsexp = CPBH as [��Ʒ���],��� as [���],������ʱ as [������ʱ],��ˮ�ٶ� as [��ˮ�ٶ�],�˾�ָ�� as [�˾�ָ��],�������� as [��������],����˵�� as [����˵��],revno as [������],issueby as [������],convert(varchar,revdate,102) as [��������]
mselectwithmemofieldsexp = ("")
morderexp = ("")
ncontrolslength = 373
cruntimeselectfieldslist = ("")
cnewruntimeselectfieldslist = ("")
mselectallfieldsexp = ("")
mmemofields = ("")
cdelayselectfieldslist = ("")
cnewdelayselectfieldslist = ("")
mtempfields = CPBH,��Ʒ����,���,������ʱ,��ˮ�ٶ�,�˾�ָ��,��������,����˵��,revno,issueby,revdate
_wisemis_cpbh = .F.
_wisemis_cpbh_oldvalue = .F.
_wisemis_��Ʒ���� = .F.
_wisemis_��Ʒ����_oldvalue = .F.
_wisemis_��� = .F.
_wisemis_���_oldvalue = .F.
_wisemis_������ʱ = .F.
_wisemis_������ʱ_oldvalue = .F.
_wisemis_��ˮ�ٶ� = .F.
_wisemis_��ˮ�ٶ�_oldvalue = .F.
_wisemis_�˾�ָ�� = .F.
_wisemis_�˾�ָ��_oldvalue = .F.
_wisemis_�������� = .F.
_wisemis_��������_oldvalue = .F.
_wisemis_����˵�� = .F.
_wisemis_����˵��_oldvalue = .F.
_wisemis_revno = .F.
_wisemis_revno_oldvalue = .F.
_wisemis_issueby = .F.
_wisemis_issueby_oldvalue = .F.
_wisemis_revdate = .F.
_wisemis_revdate_oldvalue = .F.
binit = .T.
bnew = .T.
bedit = .T.
bdelete = .T.
omypageframe = Object
Name = "Base_form1"
_base.Name = "_base"
o_statusbar1.Top = 620
o_statusbar1.Left = 0
o_statusbar1.Height = 23
o_statusbar1.Width = 878
o_statusbar1.Name = "o_statusbar1"
_pageframe1.ErasePage = .T.
_pageframe1.Page1._grid1.MemberClassLibrary = myheader.prg
_pageframe1.Page1._grid1.MemberClass = "myCol"
_pageframe1.Page1._grid1.Height = 414
_pageframe1.Page1._grid1.Left = 403
_pageframe1.Page1._grid1.Top = 7
_pageframe1.Page1._grid1.Width = 452
_pageframe1.Page1._grid1.Name = "_grid1"
_pageframe1.Page1.Pageframe1.ErasePage = .T.
_pageframe1.Page1.Pageframe1._wisemis_��Ʒ��׼��ʱ.Caption = "��Ʒ��׼��ʱ"
_pageframe1.Page1.Pageframe1._wisemis_��Ʒ��׼��ʱ.ForeColor = 0,0,255
_pageframe1.Page1.Pageframe1._wisemis_��Ʒ��׼��ʱ.Name = "_wisemis_��Ʒ��׼��ʱ"
_pageframe1.Page1.Pageframe1.Name = "Pageframe1"
_pageframe1.Page1.cmd_script1.Top = 523
_pageframe1.Page1.cmd_script1.Left = 102
_pageframe1.Page1.cmd_script1.Height = 22
_pageframe1.Page1.cmd_script1.Width = 75
_pageframe1.Page1.cmd_script1.BackColor = 236,233,216
_pageframe1.Page1.cmd_script1.Name = "cmd_script1"
_pageframe1.Page1.cmd_script2.Top = 523
_pageframe1.Page1.cmd_script2.Left = 177
_pageframe1.Page1.cmd_script2.Height = 22
_pageframe1.Page1.cmd_script2.Width = 75
_pageframe1.Page1.cmd_script2.BackColor = 236,233,216
_pageframe1.Page1.cmd_script2.Name = "cmd_script2"
_pageframe1.Page1.cmd_script3.Top = 523
_pageframe1.Page1.cmd_script3.Left = 252
_pageframe1.Page1.cmd_script3.Height = 22
_pageframe1.Page1.cmd_script3.Width = 75
_pageframe1.Page1.cmd_script3.BackColor = 236,233,216
_pageframe1.Page1.cmd_script3.Name = "cmd_script3"
_pageframe1.Page1.cmd_script4.Top = 523
_pageframe1.Page1.cmd_script4.Left = 327
_pageframe1.Page1.cmd_script4.Height = 22
_pageframe1.Page1.cmd_script4.Width = 75
_pageframe1.Page1.cmd_script4.BackColor = 236,233,216
_pageframe1.Page1.cmd_script4.Name = "cmd_script4"
_pageframe1.Page1.cmd_script5.Top = 523
_pageframe1.Page1.cmd_script5.Left = 402
_pageframe1.Page1.cmd_script5.Height = 22
_pageframe1.Page1.cmd_script5.Width = 75
_pageframe1.Page1.cmd_script5.BackColor = 236,233,216
_pageframe1.Page1.cmd_script5.Name = "cmd_script5"
_pageframe1.Page1.cmd_script6.Top = 523
_pageframe1.Page1.cmd_script6.Left = 477
_pageframe1.Page1.cmd_script6.Height = 22
_pageframe1.Page1.cmd_script6.Width = 75
_pageframe1.Page1.cmd_script6.BackColor = 236,233,216
_pageframe1.Page1.cmd_script6.Name = "cmd_script6"
_pageframe1.Page1.cmd_script7.Top = 523
_pageframe1.Page1.cmd_script7.Left = 552
_pageframe1.Page1.cmd_script7.Height = 22
_pageframe1.Page1.cmd_script7.Width = 75
_pageframe1.Page1.cmd_script7.BackColor = 236,233,216
_pageframe1.Page1.cmd_script7.Name = "cmd_script7"
_pageframe1.Page1.cmd_script8.Top = 523
_pageframe1.Page1.cmd_script8.Left = 627
_pageframe1.Page1.cmd_script8.Height = 22
_pageframe1.Page1.cmd_script8.Width = 75
_pageframe1.Page1.cmd_script8.BackColor = 236,233,216
_pageframe1.Page1.cmd_script8.Name = "cmd_script8"
_pageframe1.Page1.cmd_script9.Top = 523
_pageframe1.Page1.cmd_script9.Left = 702
_pageframe1.Page1.cmd_script9.Height = 22
_pageframe1.Page1.cmd_script9.Width = 75
_pageframe1.Page1.cmd_script9.BackColor = 236,233,216
_pageframe1.Page1.cmd_script9.Name = "cmd_script9"
_pageframe1.Page1._cSearch.Top = 473
_pageframe1.Page1._cSearch.Left = 406
_pageframe1.Page1._cSearch.Height = 17
_pageframe1.Page1._cSearch.Width = 66
_pageframe1.Page1._cSearch.Alignment = 0
_pageframe1.Page1._cSearch.Name = "_cSearch"
_pageframe1.Page1._cClearRefresh.Top = 473
_pageframe1.Page1._cClearRefresh.Left = 477
_pageframe1.Page1._cClearRefresh.Height = 17
_pageframe1.Page1._cClearRefresh.Width = 78
_pageframe1.Page1._cClearRefresh.Alignment = 0
_pageframe1.Page1._cClearRefresh.Name = "_cClearRefresh"
_pageframe1.Page1.cmd_update.Top = 472
_pageframe1.Page1.cmd_update.Left = 695
_pageframe1.Page1.cmd_update.Height = 22
_pageframe1.Page1.cmd_update.Width = 59
_pageframe1.Page1.cmd_update.Enabled = .T.
_pageframe1.Page1.cmd_update.BackColor = 236,233,216
_pageframe1.Page1.cmd_update.Name = "cmd_update"
_pageframe1.Page1._checkbox1.Top = 490
_pageframe1.Page1._checkbox1.Left = 477
_pageframe1.Page1._checkbox1.Height = 17
_pageframe1.Page1._checkbox1.Width = 42
_pageframe1.Page1._checkbox1.Alignment = 0
_pageframe1.Page1._checkbox1.Name = "_checkbox1"
_pageframe1.Page1.cmd_lockcol.Top = 472
_pageframe1.Page1.cmd_lockcol.Left = 652
_pageframe1.Page1.cmd_lockcol.Height = 22
_pageframe1.Page1.cmd_lockcol.Width = 43
_pageframe1.Page1.cmd_lockcol.BackColor = 236,233,216
_pageframe1.Page1.cmd_lockcol.Name = "cmd_lockcol"
_pageframe1.Page1.cmd_self_query.Top = 472
_pageframe1.Page1.cmd_self_query.Left = 755
_pageframe1.Page1.cmd_self_query.Height = 22
_pageframe1.Page1.cmd_self_query.Width = 71
_pageframe1.Page1.cmd_self_query.BackColor = 236,233,216
_pageframe1.Page1.cmd_self_query.Name = "cmd_self_query"
_pageframe1.Page1._cForbidSearch.Top = 508
_pageframe1.Page1._cForbidSearch.Left = 406
_pageframe1.Page1._cForbidSearch.Height = 17
_pageframe1.Page1._cForbidSearch.Width = 66
_pageframe1.Page1._cForbidSearch.Alignment = 0
_pageframe1.Page1._cForbidSearch.Name = "_cForbidSearch"
_pageframe1.Page1._cSelectMode.Top = 474
_pageframe1.Page1._cSelectMode.Left = 561
_pageframe1.Page1._cSelectMode.Height = 17
_pageframe1.Page1._cSelectMode.Width = 66
_pageframe1.Page1._cSelectMode.Alignment = 0
_pageframe1.Page1._cSelectMode.Name = "_cSelectMode"
_pageframe1.Page1._comQuery.Height = 24
_pageframe1.Page1._comQuery.Left = 653
_pageframe1.Page1._comQuery.Top = 496
_pageframe1.Page1._comQuery.Width = 101
_pageframe1.Page1._comQuery.Name = "_comQuery"
_pageframe1.Page1.cmd_browse.Top = 497
_pageframe1.Page1.cmd_browse.Left = 757
_pageframe1.Page1.cmd_browse.Height = 22
_pageframe1.Page1.cmd_browse.Width = 70
_pageframe1.Page1.cmd_browse.BackColor = 236,233,216
_pageframe1.Page1.cmd_browse.Name = "cmd_browse"
_pageframe1.Page1._cEnterLineMode.Top = 508
_pageframe1.Page1._cEnterLineMode.Left = 477
_pageframe1.Page1._cEnterLineMode.Height = 17
_pageframe1.Page1._cEnterLineMode.Width = 66
_pageframe1.Page1._cEnterLineMode.Alignment = 0
_pageframe1.Page1._cEnterLineMode.Name = "_cEnterLineMode"
_pageframe1.Page1.cmd_WorkFlow.Top = 523
_pageframe1.Page1.cmd_WorkFlow.Left = 2
_pageframe1.Page1.cmd_WorkFlow.Height = 22
_pageframe1.Page1.cmd_WorkFlow.Width = 78
_pageframe1.Page1.cmd_WorkFlow.BackColor = 236,233,216
_pageframe1.Page1.cmd_WorkFlow.Name = "cmd_WorkFlow"
_pageframe1.Page1.cmd_taskmenu.Top = 523
_pageframe1.Page1.cmd_taskmenu.Left = 79
_pageframe1.Page1.cmd_taskmenu.Height = 22
_pageframe1.Page1.cmd_taskmenu.Width = 19
_pageframe1.Page1.cmd_taskmenu.BackColor = 236,233,216
_pageframe1.Page1.cmd_taskmenu.Name = "cmd_taskmenu"
_pageframe1.Page1.cmd_other.Top = 523
_pageframe1.Page1.cmd_other.Left = 779
_pageframe1.Page1.cmd_other.Height = 22
_pageframe1.Page1.cmd_other.Width = 49
_pageframe1.Page1.cmd_other.BackColor = 236,233,216
_pageframe1.Page1.cmd_other.Name = "cmd_other"
_pageframe1.Page1.chkPassiveRefresh.Top = 490
_pageframe1.Page1.chkPassiveRefresh.Left = 406
_pageframe1.Page1.chkPassiveRefresh.Height = 17
_pageframe1.Page1.chkPassiveRefresh.Width = 66
_pageframe1.Page1.chkPassiveRefresh.Alignment = 0
_pageframe1.Page1.chkPassiveRefresh.Value = .T.
_pageframe1.Page1.chkPassiveRefresh.Name = "chkPassiveRefresh"
_pageframe1.Page1.chkWarning.Top = 491
_pageframe1.Page1.chkWarning.Left = 561
_pageframe1.Page1.chkWarning.Height = 17
_pageframe1.Page1.chkWarning.Width = 78
_pageframe1.Page1.chkWarning.Alignment = 0
_pageframe1.Page1.chkWarning.Name = "chkWarning"
_pageframe1.Page1.conChildAppsBar.Top = 423
_pageframe1.Page1.conChildAppsBar.Left = 405
_pageframe1.Page1.conChildAppsBar.Width = 450
_pageframe1.Page1.conChildAppsBar.Height = 49
_pageframe1.Page1.conChildAppsBar.Name = "conChildAppsBar"
_pageframe1.Page1._weblabel1.Height = 17
_pageframe1.Page1._weblabel1.Left = 560
_pageframe1.Page1._weblabel1.Top = 510
_pageframe1.Page1._weblabel1.Width = 80
_pageframe1.Page1._weblabel1.BackColor = 236,233,216
_pageframe1.Page1._weblabel1.Name = "_weblabel1"
_pageframe1.Page1.Name = "Page1"
_pageframe1.Page2._query1._label1.Height = 17
_pageframe1.Page2._query1._label1.Left = 0
_pageframe1.Page2._query1._label1.Top = 513
_pageframe1.Page2._query1._label1.Width = 54
_pageframe1.Page2._query1._label1.BackColor = 236,233,216
_pageframe1.Page2._query1._label1.Name = "_label1"
_pageframe1.Page2._query1._TEXTBOX1.BackStyle = 1
_pageframe1.Page2._query1._TEXTBOX1.Height = 22
_pageframe1.Page2._query1._TEXTBOX1.Left = 61
_pageframe1.Page2._query1._TEXTBOX1.ToolTipText = "��F7��������Ҽ��Ի�ø������ݣ�����"
_pageframe1.Page2._query1._TEXTBOX1.Top = 508
_pageframe1.Page2._query1._TEXTBOX1.Width = 100
_pageframe1.Page2._query1._TEXTBOX1.BackColor = 199,214,148
_pageframe1.Page2._query1._TEXTBOX1.sqlstring = ("")
_pageframe1.Page2._query1._TEXTBOX1.creturnfield = ("")
_pageframe1.Page2._query1._TEXTBOX1.Name = "_TEXTBOX1"
_pageframe1.Page2._query1._commandbutton1.Top = 508
_pageframe1.Page2._query1._commandbutton1.Left = 162
_pageframe1.Page2._query1._commandbutton1.Height = 22
_pageframe1.Page2._query1._commandbutton1.Width = 59
_pageframe1.Page2._query1._commandbutton1.BackColor = 236,233,216
_pageframe1.Page2._query1._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page2._query1._commandbutton2.Top = 508
_pageframe1.Page2._query1._commandbutton2.Left = 288
_pageframe1.Page2._query1._commandbutton2.Height = 22
_pageframe1.Page2._query1._commandbutton2.Width = 61
_pageframe1.Page2._query1._commandbutton2.BackColor = 236,233,216
_pageframe1.Page2._query1._commandbutton2.Name = "_commandbutton2"
_pageframe1.Page2._query1._combobox1.Height = 24
_pageframe1.Page2._query1._combobox1.Left = 353
_pageframe1.Page2._query1._combobox1.Top = 506
_pageframe1.Page2._query1._combobox1.Width = 100
_pageframe1.Page2._query1._combobox1.Name = "_combobox1"
_pageframe1.Page2._query1._textbox2.Height = 21
_pageframe1.Page2._query1._textbox2.Left = 457
_pageframe1.Page2._query1._textbox2.Top = 507
_pageframe1.Page2._query1._textbox2.Width = 95
_pageframe1.Page2._query1._textbox2.Name = "_textbox2"
_pageframe1.Page2._query1._grid1.MemberClassLibrary = myheader.prg
_pageframe1.Page2._query1._grid1.MemberClass = "myCol"
_pageframe1.Page2._query1._grid1.Height = 497
_pageframe1.Page2._query1._grid1.Left = 2
_pageframe1.Page2._query1._grid1.Top = 2
_pageframe1.Page2._query1._grid1.Width = 806
_pageframe1.Page2._query1._grid1.Name = "_grid1"
_pageframe1.Page2._query1._commandbutton3.Top = 508
_pageframe1.Page2._query1._commandbutton3.Left = 225
_pageframe1.Page2._query1._commandbutton3.Height = 22
_pageframe1.Page2._query1._commandbutton3.Width = 59
_pageframe1.Page2._query1._commandbutton3.Name = "_commandbutton3"
_pageframe1.Page2._query1.Anchor = 15
_pageframe1.Page2._query1.Top = 8
_pageframe1.Page2._query1.Left = 11
_pageframe1.Page2._query1.Width = 820
_pageframe1.Page2._query1.Height = 535
_pageframe1.Page2._query1.sql_string = 
_pageframe1.Page2._query1._cursor = _1U30TYWAX��������
_pageframe1.Page2._query1._table = cp_capacity
_pageframe1.Page2._query1.query_table = general_query
_pageframe1.Page2._query1.Name = "_query1"
_pageframe1.Page2.Enabled = .T.
_pageframe1.Page2.Name = "Page2"
_pageframe1.Page4._label1.BackColor = 236,233,216
_pageframe1.Page4._label1.Name = "_label1"
_pageframe1.Page4._label2.BackColor = 236,233,216
_pageframe1.Page4._label2.Name = "_label2"
_pageframe1.Page4._listbox1.Name = "_listbox1"
_pageframe1.Page4._listbox2.Name = "_listbox2"
_pageframe1.Page4.cmd_add.BackColor = 236,233,216
_pageframe1.Page4.cmd_add.Name = "cmd_add"
_pageframe1.Page4.cmd_remove.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove.Name = "cmd_remove"
_pageframe1.Page4.cmd_rebuilt.BackColor = 236,233,216
_pageframe1.Page4.cmd_rebuilt.Name = "cmd_rebuilt"
_pageframe1.Page4._label3.BackColor = 236,233,216
_pageframe1.Page4._label3.Name = "_label3"
_pageframe1.Page4.RuntimeList.Name = "RuntimeList"
_pageframe1.Page4._label4.BackColor = 236,233,216
_pageframe1.Page4._label4.Name = "_label4"
_pageframe1.Page4.DelayList.Name = "DelayList"
_pageframe1.Page4.cmd_runtime2delay.BackColor = 236,233,216
_pageframe1.Page4.cmd_runtime2delay.Name = "cmd_runtime2delay"
_pageframe1.Page4.cmd_delay2runtime.BackColor = 236,233,216
_pageframe1.Page4.cmd_delay2runtime.Name = "cmd_delay2runtime"
_pageframe1.Page4.cmd_remove_runtime.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove_runtime.Name = "cmd_remove_runtime"
_pageframe1.Page4.cmd_remove_delay.BackColor = 236,233,216
_pageframe1.Page4.cmd_remove_delay.Name = "cmd_remove_delay"
_pageframe1.Page4._commandbutton5.BackColor = 236,233,216
_pageframe1.Page4._commandbutton5.Name = "_commandbutton5"
_pageframe1.Page4._commandbutton6.BackColor = 236,233,216
_pageframe1.Page4._commandbutton6.Name = "_commandbutton6"
_pageframe1.Page4._shape1.Name = "_shape1"
_pageframe1.Page4._label5.BackColor = 236,233,216
_pageframe1.Page4._label5.Name = "_label5"
_pageframe1.Page4.ExtraSearch.Name = "ExtraSearch"
_pageframe1.Page4.cmd_reset_extrasearch.Enabled = .T.
_pageframe1.Page4.cmd_reset_extrasearch.BackColor = 236,233,216
_pageframe1.Page4.cmd_reset_extrasearch.Name = "cmd_reset_extrasearch"
_pageframe1.Page4._commandbutton2.BackColor = 236,233,216
_pageframe1.Page4._commandbutton2.Name = "_commandbutton2"
_pageframe1.Page4._label6.BackColor = 236,233,216
_pageframe1.Page4._label6.Name = "_label6"
_pageframe1.Page4.FieldList.Name = "FieldList"
_pageframe1.Page4._label7.BackColor = 236,233,216
_pageframe1.Page4._label7.Name = "_label7"
_pageframe1.Page4._commandbutton1.BackColor = 236,233,216
_pageframe1.Page4._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page4._commandbutton3.BackColor = 236,233,216
_pageframe1.Page4._commandbutton3.Name = "_commandbutton3"
_pageframe1.Page4.cmd_rewrite_dict.BackColor = 236,233,216
_pageframe1.Page4.cmd_rewrite_dict.Name = "cmd_rewrite_dict"
_pageframe1.Page4.Name = "Page4"
_pageframe1.Page3._label2.Height = 17
_pageframe1.Page3._label2.Left = 588
_pageframe1.Page3._label2.Top = 17
_pageframe1.Page3._label2.Width = 93
_pageframe1.Page3._label2.BackColor = 236,233,216
_pageframe1.Page3._label2.Name = "_label2"
_pageframe1.Page3._label3.Height = 17
_pageframe1.Page3._label3.Left = 640
_pageframe1.Page3._label3.Top = 40
_pageframe1.Page3._label3.Width = 41
_pageframe1.Page3._label3.BackColor = 236,233,216
_pageframe1.Page3._label3.Name = "_label3"
_pageframe1.Page3.l_Author.Caption = "������"
_pageframe1.Page3.l_Author.Height = 17
_pageframe1.Page3.l_Author.Left = 685
_pageframe1.Page3.l_Author.Top = 41
_pageframe1.Page3.l_Author.Width = 41
_pageframe1.Page3.l_Author.BackColor = 236,233,216
_pageframe1.Page3.l_Author.Name = "l_Author"
_pageframe1.Page3._label1.Height = 17
_pageframe1.Page3._label1.Left = 614
_pageframe1.Page3._label1.Top = 63
_pageframe1.Page3._label1.Width = 67
_pageframe1.Page3._label1.BackColor = 236,233,216
_pageframe1.Page3._label1.Name = "_label1"
_pageframe1.Page3.l_BaseTable.Caption = "[cp_capacity]"
_pageframe1.Page3.l_BaseTable.Height = 17
_pageframe1.Page3.l_BaseTable.Left = 687
_pageframe1.Page3.l_BaseTable.Top = 63
_pageframe1.Page3.l_BaseTable.Width = 93
_pageframe1.Page3.l_BaseTable.BackColor = 236,233,216
_pageframe1.Page3.l_BaseTable.Name = "l_BaseTable"
_pageframe1.Page3._line1.Height = 0
_pageframe1.Page3._line1.Left = 580
_pageframe1.Page3._line1.Top = 107
_pageframe1.Page3._line1.Width = 271
_pageframe1.Page3._line1.Name = "_line1"
_pageframe1.Page3._label4.Height = 17
_pageframe1.Page3._label4.Left = 628
_pageframe1.Page3._label4.Top = 121
_pageframe1.Page3._label4.Width = 54
_pageframe1.Page3._label4.BackColor = 236,233,216
_pageframe1.Page3._label4.Name = "_label4"
_pageframe1.Page3._label5.Height = 17
_pageframe1.Page3._label5.Left = 700
_pageframe1.Page3._label5.Top = 121
_pageframe1.Page3._label5.Width = 108
_pageframe1.Page3._label5.BackColor = 236,233,216
_pageframe1.Page3._label5.Name = "_label5"
_pageframe1.Page3._label6.Height = 17
_pageframe1.Page3._label6.Left = 700
_pageframe1.Page3._label6.Top = 157
_pageframe1.Page3._label6.Width = 56
_pageframe1.Page3._label6.BackColor = 236,233,216
_pageframe1.Page3._label6.Name = "_label6"
_pageframe1.Page3._label7.Height = 17
_pageframe1.Page3._label7.Left = 700
_pageframe1.Page3._label7.Top = 193
_pageframe1.Page3._label7.Width = 69
_pageframe1.Page3._label7.BackColor = 236,233,216
_pageframe1.Page3._label7.Name = "_label7"
_pageframe1.Page3._label8.Height = 17
_pageframe1.Page3._label8.Left = 700
_pageframe1.Page3._label8.Top = 229
_pageframe1.Page3._label8.Width = 82
_pageframe1.Page3._label8.BackColor = 236,233,216
_pageframe1.Page3._label8.Name = "_label8"
_pageframe1.Page3._label9.Height = 17
_pageframe1.Page3._label9.Left = 700
_pageframe1.Page3._label9.Top = 265
_pageframe1.Page3._label9.Width = 108
_pageframe1.Page3._label9.BackColor = 236,233,216
_pageframe1.Page3._label9.Name = "_label9"
_pageframe1.Page3._label10.Height = 17
_pageframe1.Page3._label10.Left = 700
_pageframe1.Page3._label10.Top = 292
_pageframe1.Page3._label10.Width = 56
_pageframe1.Page3._label10.BackColor = 236,233,216
_pageframe1.Page3._label10.Name = "_label10"
_pageframe1.Page3._line2.Height = 0
_pageframe1.Page3._line2.Left = 580
_pageframe1.Page3._line2.Top = 362
_pageframe1.Page3._line2.Width = 271
_pageframe1.Page3._line2.Name = "_line2"
_pageframe1.Page3._label11.Height = 17
_pageframe1.Page3._label11.Left = 595
_pageframe1.Page3._label11.Top = 376
_pageframe1.Page3._label11.Width = 93
_pageframe1.Page3._label11.BackColor = 236,233,216
_pageframe1.Page3._label11.Name = "_label11"
_pageframe1.Page3.com_Fields.Height = 24
_pageframe1.Page3.com_Fields.Left = 691
_pageframe1.Page3.com_Fields.Top = 370
_pageframe1.Page3.com_Fields.Width = 156
_pageframe1.Page3.com_Fields.Name = "com_Fields"
_pageframe1.Page3.edt_Text.Height = 531
_pageframe1.Page3.edt_Text.Left = 7
_pageframe1.Page3.edt_Text.Top = 6
_pageframe1.Page3.edt_Text.Width = 564
_pageframe1.Page3.edt_Text.Value = 
_pageframe1.Page3.edt_Text.Name = "edt_Text"
_pageframe1.Page3.edt_FieldText.Height = 126
_pageframe1.Page3.edt_FieldText.Left = 583
_pageframe1.Page3.edt_FieldText.Top = 400
_pageframe1.Page3.edt_FieldText.Width = 264
_pageframe1.Page3.edt_FieldText.Value = 
_pageframe1.Page3.edt_FieldText.Name = "edt_FieldText"
_pageframe1.Page3.cmd_AddFavorite.Top = 326
_pageframe1.Page3.cmd_AddFavorite.Left = 579
_pageframe1.Page3.cmd_AddFavorite.Height = 22
_pageframe1.Page3.cmd_AddFavorite.Width = 84
_pageframe1.Page3.cmd_AddFavorite.Enabled = .F.
_pageframe1.Page3.cmd_AddFavorite.BackColor = 236,233,216
_pageframe1.Page3.cmd_AddFavorite.Name = "cmd_AddFavorite"
_pageframe1.Page3.cmd_RemoveFavorite.Top = 326
_pageframe1.Page3.cmd_RemoveFavorite.Left = 671
_pageframe1.Page3.cmd_RemoveFavorite.Height = 22
_pageframe1.Page3.cmd_RemoveFavorite.Width = 84
_pageframe1.Page3.cmd_RemoveFavorite.Enabled = .T.
_pageframe1.Page3.cmd_RemoveFavorite.BackColor = 236,233,216
_pageframe1.Page3.cmd_RemoveFavorite.Name = "cmd_RemoveFavorite"
_pageframe1.Page3.l_AppName.Caption = "��������"
_pageframe1.Page3.l_AppName.Height = 17
_pageframe1.Page3.l_AppName.Left = 685
_pageframe1.Page3.l_AppName.Top = 16
_pageframe1.Page3.l_AppName.Width = 54
_pageframe1.Page3.l_AppName.BackColor = 236,233,216
_pageframe1.Page3.l_AppName.Name = "l_AppName"
_pageframe1.Page3._label12.Height = 17
_pageframe1.Page3._label12.Left = 608
_pageframe1.Page3._label12.Top = 87
_pageframe1.Page3._label12.Visible = .F.
_pageframe1.Page3._label12.Width = 240
_pageframe1.Page3._label12.Name = "_label12"
_pageframe1.Page3._commandbutton1.Top = 326
_pageframe1.Page3._commandbutton1.Left = 768
_pageframe1.Page3._commandbutton1.Height = 22
_pageframe1.Page3._commandbutton1.Width = 84
_pageframe1.Page3._commandbutton1.ToolTipText = "�������"
_pageframe1.Page3._commandbutton1.BackColor = 236,233,216
_pageframe1.Page3._commandbutton1.Name = "_commandbutton1"
_pageframe1.Page3.Name = "Page3"
_pageframe1.Name = "_pageframe1"
cmd_close.Top = 589
cmd_close.Left = 756
cmd_close.Height = 22
cmd_close.Width = 86
cmd_close.Name = "cmd_close"
cmd_new.Top = 593
cmd_new.Left = 9
cmd_new.Height = 22
cmd_new.Width = 51
cmd_new.Enabled = .T.
cmd_new.BackColor = 236,233,216
cmd_new.Name = "cmd_new"
cmd_edit.Top = 593
cmd_edit.Left = 63
cmd_edit.Height = 22
cmd_edit.Width = 50
cmd_edit.Enabled = .T.
cmd_edit.BackColor = 236,233,216
cmd_edit.Name = "cmd_edit"
cmd_delete.Top = 593
cmd_delete.Left = 116
cmd_delete.Height = 22
cmd_delete.Width = 50
cmd_delete.Enabled = .T.
cmd_delete.BackColor = 236,233,216
cmd_delete.Name = "cmd_delete"
cmd_clear.Top = 593
cmd_clear.Left = 175
cmd_clear.Height = 22
cmd_clear.Width = 50
cmd_clear.BackColor = 236,233,216
cmd_clear.Name = "cmd_clear"
_conChildApp._label1.Enabled = .F.
_conChildApp._label1.BackColor = 236,233,216
_conChildApp._label1.Name = "_label1"
_conChildApp._ChildAppList.Enabled = .F.
_conChildApp._ChildAppList.Name = "_ChildAppList"
_conChildApp.cmdRun.Enabled = .F.
_conChildApp.cmdRun.ToolTipText = "��һ��(\<N)"
_conChildApp.cmdRun.BackColor = 236,233,216
_conChildApp.cmdRun.Name = "cmdRun"
_conChildApp.Top = 587
_conChildApp.Left = 284
_conChildApp.Width = 262
_conChildApp.Height = 31
_conChildApp.Name = "_conChildApp"
cmd_refresh.Top = 593
cmd_refresh.Left = 226
cmd_refresh.Height = 22
cmd_refresh.Width = 50
cmd_refresh.BackColor = 236,233,216
cmd_refresh.Name = "cmd_refresh"
_label1.Height = 17
_label1.Left = 549
_label1.Top = 597
_label1.Width = 93
_label1.BackColor = 236,233,216
_label1.Name = "_label1"
com_taskfilter.Height = 24
com_taskfilter.Left = 636
com_taskfilter.Top = 589
com_taskfilter.Width = 108
com_taskfilter.Name = "com_taskfilter"
oMenu.conselection = 
oMenu.Name = "oMenu"
     �_wisemis_cpbh
_wisemis_cpbh_oldvalue
_wisemis_��Ʒ����
_wisemis_��Ʒ����_oldvalue
_wisemis_���
_wisemis_���_oldvalue
_wisemis_������ʱ
_wisemis_������ʱ_oldvalue
_wisemis_��ˮ�ٶ�
_wisemis_��ˮ�ٶ�_oldvalue
_wisemis_�˾�ָ��
_wisemis_�˾�ָ��_oldvalue
_wisemis_��������
_wisemis_��������_oldvalue
_wisemis_����˵��
_wisemis_����˵��_oldvalue
_wisemis_revno
_wisemis_revno_oldvalue
_wisemis_issueby
_wisemis_issueby_oldvalue
_wisemis_revdate
_wisemis_revdate_oldvalue
      Pixels      dataenvironment      dataenvironment      DataEnvironment      _test      wTop = 0
Left = 0
Width = 0
Height = 0
Visible = .F.
TabStop = .F.
DataSource = .NULL.
Name = "DataEnvironment"
      data_container      	_base.vcx      	container      _wisemis_CPBH      8_test._pageframe1.Page1.Pageframe1._wisemis_��Ʒ��׼��ʱ      	pageframe      	pageframe      
_pageframe      ErasePage = .T.
PageCount = 1
Width = 241
Height = 169
Name = "_pageframe"
Page1.Caption = "Page1"
Page1.Name = "Page1"
      Class      1      Pixels      Foundation PageFrame class.     ���                              '   %   �       �      �           �  U    T�  � ��  � � �� U  THIS	 BACKCOLOR PARENT 
 ��  � � U  THISFORM RELEASE Init,     �� Clickb     ��1 a2 � 1                       7         S   c       )                           �Height = 17
Width = 60
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "Check1"
SpecialEffect = 2
ForeColor = 0,0,128
_memberdata = 
Name = "_checkbox"
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Class      *self_check �ռ��
      K
PROCEDURE Init
 THIS.BACKCOLOR = THIS.PARENT.BACKCOLOR
ENDPROC
*------      listbox      listbox      _listbox      Foundation Listbox class.      checkbox      1      	_checkbox      
_pageframe      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      _grid      Pixels      Foundation Grid class.      Class      grid      _grid      �naddlen �����Զ����������ӵĿ���
nrecno
*reset_grid ���µ����������
*do_filter ���ٹ�������
*reset_color ���ñ�����ɫ
*allowcellselection_assign 
      grid     ���    �   �                         ��   %   �       �      �           �  U  A . ��  Q�# XTREMECOMMANDBARS.ImageManagerIcons� T�  �� � �� U  OIMAGEMANAGERICONS THIS ICONS Init,     ��1 �� 1                       �      )   �                         JTop = 204
Left = 264
Height = 100
Width = 100
Name = "oImageManager"
      
olecontrol      +OLEObject = D:\WISEMIS3\Libs\CODEJO~1.OCX
      oCommandBars      
olecontrol      _form      	_weblabel      Pixels      Class      _label      	_weblabel      url
actioncode
      JWidth = 200
Height = 109
BackStyle = 0
Style = 3
Name = "_container"
      _commandbutton     K���    2  2                        �   %   �       �      �           �  U  p  %�C�  � >����8 �! ��C�  � �@�  � �  �����x�� �i �) � frm_text��  � ��  � �  ������ � U  THIS __CHELPSTRING __CITEMNAME FRM_TEXT Click,     ��1 q� �A 1                       �       )   2                        "Arial, 0, 10, 6, 16, 13, 35, 3, 0
      Foundation Spinner class.      Foundation CheckBox class.      Pixels      Pixels     �PROCEDURE Init
  THIS.DELETEALL()
 LOCAL OSTATUSPANE AS XTREMECOMMANDBARS.StatusBarPane
 OSTATUSPANE = THIS.STATUSBAR.ADDPANE(1)
 OSTATUSPANE.TEXT = '׼������'
 OSTATUSPANE.STYLE = 134217728
 THIS.STATUSBAR.VISIBLE = THISFORm.SHOWSTATUSBAR
 IF TYPE('this.Parent.oImageManager.Icons') = 'O'
 THIS.ICONS = THIS.PARENT.OIMAGEMANAGER.ICONS
 ENDIF 
 THISFORm.OSTATUSBARPANE = OSTATUSPANE
ENDPROC
      1      Foundation Container class.      	_cmd_help      commandbutton      	_base.vcx      Foundation Label class.      Pixels      
_container      Class      �busealias
_memberdata XML Metadata for customizable properties
calias
*finditem ����Ƿ��Ѿ�����ָ����Ŀ
*self_check 
*removeall ɾ������Ԫ��
*addfromcursor 
*addfromlistbox 
      !Arial, 1, 9, 6, 15, 12, 32, 3, 0
      *Height = 68
Width = 68
Name = "_image"
      _listbox      1      spinner      spinner      _spinner      Class      _spinner      Pixels      Class      _editbox      Pixels      editbox      _label      _editbox      editbox      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      combobox      	_combobox      label      _base      ����    �   �                         �   %   b       v      p           �  U    T�  � ��  � � �� U  THIS	 BACKCOLOR PARENT Init,     ��2 a2                       9       )   �                         Foundation ComboBox class.      1      [benabledf7 ֧��F7����
cselectsql ��ѯ���
creturnfield �����ֶ�
*self_check �����ռ��
      combobox      	_combobox      1      	_base.vcx      �PROCEDURE Click
 IF LEN(THIS.__CHELPSTRING) < 1000
     MESSAGEBOX(THIS.__CHELPSTRING,64,THIS.__CITEMNAME + ' ����')
 ELSE 
    DO FORM frm_text WITH THIS.__CHELPSTRING , THIS.__CITEMNAME + ' ����'
 ENDIF 
ENDPROC
      label      label      Class      custom      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      _cancelbutton      Pixels      Class      commandbutton      "Arial, 0, 10, 6, 16, 13, 35, 3, 0
      
olecontrol      	_base.vcx      base_method      _cancelbutton      nPROCEDURE Init
 THIS.BACKCOLOR = THIS.PARENT.BACKCOLOR
ENDPROC
PROCEDURE Click
thisform.Release
ENDPROC
      commandbutton      form     lMemberClassLibrary = myheader.prg
MemberClass = "myCol"
DeleteMark = .F.
GridLines = 2
Height = 327
RecordSource = "null"
SplitBar = .F.
View = 0
Width = 527
ForeColor = 0,0,128
GridLineColor = 0,0,128
HighlightBackColor = 44,228,154
HighlightForeColor = 0,0,255
HighlightStyle = 2
AllowCellSelection = .T.
naddlen = 10
nrecno = 0
Name = "_grid"
      >_memberdata XML Metadata for customizable properties
isinit
      _optiongroup      Pixels     �Height = 22
Width = 26
Picture = panehelp.bmp
Caption = "����"
PicturePosition = 14
PictureMargin = 3
PictureSpacing = 3
ForeColor = 0,0,128
__chelpstring = ("")
_memberdata =      199<VFPData><memberdata name="__chelpstring" type="property" display="__cHelpString" favorites="True"/><memberdata name="__citemname" type="property" display="__cItemName" favorites="True"/></VFPData>

__citemname = ("")
Name = "_cmd_help"
     ?FontBold = .T.
BorderStyle = 1
Height = 24
Increment =   1.00
KeyboardHighValue = 2147483647
KeyboardLowValue = -2147483647
SelectOnEntry = .T.
SpecialEffect = 1
SpinnerHighValue = 2147483647.00
SpinnerLowValue = -2147483647.00
Width = 120
ForeColor = 0,0,0
Value = 0
NullDisplay = "0"
Name = "_spinner"
      ITop = 300
Left = 252
Height = 100
Width = 100
Name = "oCommandBars"
      'Top = 264
Left = 120
Name = "_base"
      optiongroup      my_datepicker      
olecontrol      
olecontrol      Pixels     �
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     OLEDragMode = 1
OLEDropMode = 1
DragIcon = dragmove.cur
BackStyle = 0
Height = 66
MaxLength = 0
SpecialEffect = 1
Width = 478
EnableHyperlinks = .T.
ForeColor = 0,0,128
BorderColor = 0,0,128
IntegralHeight = .T.
OLEDropTextInsertion = 1
Name = "_editbox"
      Class      
_container      Pixels     9���                                f�   %   �      �     �          �  U  �  ��C�  � ��* �� Q� XTREMECOMMANDBARS.StatusBarPane� T� �C��  � � �� T� � �� ׼�������� T� � ��	   �� T�  � � �� �	 ��3 %�C� this.Parent.oImageManager.Iconsb� O��� � T�  �
 ��  � � �
 �� � T� � �� �� U  THIS	 DELETEALL OSTATUSPANE	 STATUSBAR ADDPANE TEXT STYLE VISIBLE THISFORM SHOWSTATUSBAR ICONS PARENT OIMAGEMANAGER OSTATUSBARPANE Init,     ��1 � �q�1a1�A 1                       �      )                           .FontSize = 10
MaxLength = 200
RowSourceType = 0
Value = 1
Height = 24
SpecialEffect = 1
Style = 2
Width = 100
ForeColor = 0,0,255
BackColor = 225,241,169
ItemForeColor = 0,0,0
ItemBackColor = 225,241,169
ItemTips = .T.
benabledf7 = .F.
cselectsql = 
creturnfield = 
Name = "_combobox"
      Pixels     _memberdata XML Metadata for customizable properties
*open_form �򿪱���
*run_file ���ض�������ļ�
*createapplication �������ý������ݿ�Ӧ�ó���
*select_data ��ѯ����
*open_form_with_result �򿪱��������ؽ��
*format_aerror ��ʽ��Aerror������Ϣ
*do_cmd ִ�г����Զ����������жϴ�������
*do_sys ִ��Ԥ�������
*check_system ��鵱ǰ���ݿ��Ƿ������ȷ�����л���
*select_value ���ص������
*createdetailapplication 
*getimagestreamfilename 
*open_form_ex ��ͬ��Open_Form_With_Result
*importfromexcelmodal 
*locksystem 
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Foundation EditBox class.      _optiongroup      optiongroup     �ButtonCount = 2
BackStyle = 0
Value = 1
Height = 46
Width = 71
Name = "_optiongroup"
Option1.BackStyle = 0
Option1.Caption = "Option1"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 61
Option1.Name = "Option1"
Option2.BackStyle = 0
Option2.Caption = "Option2"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 61
Option2.Name = "Option2"
     �PROCEDURE Init

Local OIMAGEMANAGERICONS As XTREMECOMMANDBARS.ImageManagerIcons
OIMAGEMANAGERICONS = This.ICONS
*!*	OIMAGEMANAGERICONS.LOADBITMAP('searchc.bmp',1,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('SProc.bmp',2,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('checkbox.bmp',3,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('form.bmp',4,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('report.bmp',5,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('save.bmp',6,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('PreView.bmp',7,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('Printer.bmp',8,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('New.bmp',1001,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('Edit.bmp',1002,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('wzdelete.bmp',1003,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('Exit.bmp',1006,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('Save.bmp',2001,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('close.bmp',2002,0)
*!*	OIMAGEMANAGERICONS.LOADBITMAP('tables.bmp',2003,0)
ENDPROC
     �sql_cmd
cursor_name
isinit
ostatusbarpane ״̬����һ������
showstatusbar �Ƿ���ʾ״̬��
_memberdata XML Metadata for customizable properties
ctempobject
issaved
showformintabcontrol ��Tab����ʾ����
*select_data ִ��SQL��ѯ
*wait_message ��ʾWait��ʾ��
*close_alias �رձ�
*refresh_data ˢ������
*write_config д���������
*get_config ��ȡ��������
*get_form_info 
*update_form_info 
*check_empty ������Ŀ
*fill_data_listitem ������ݵ��б��Ϳؼ�������Ͽ��б����
*sql_cmd_assign 
*add_to_string ׷�ӵ��ַ�����ר���������������ַ�����
*toexcel ����Excelģ�浼������
*toexcel2 
*exec_sql 
*parsesql 
*transform_sql 
*clear_form_info 
*set_unsavemark 
*clear_unsavemark 
*windowstate_assign 
      PROCEDURE MouseLeave
 LPARAMETER NBUTTON , NSHIFT , NXCOORD , NYCOORD
ENDPROC
PROCEDURE MouseEnter
 LPARAMETER NBUTTON , NSHIFT , NXCOORD , NYCOORD
 IF EMPTY(THIS.TOOLTIPTEXT) AND THIS.PICTUREPOSITION <> 14
    THIS.TOOLTIPTEXT = THIS.CAPTION
 ENDIF 
ENDPROC
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
PROCEDURE Init
 THIS.BACKCOLOR = THIS.PARENT.BACKCOLOR
ENDPROC
     	����    �	  �	                        px   %   �      	  R   z          �  U  �  ��  � T� � ���  �� %��  ��� � T� � �a��4 T� � ��$ ��F7��������Ҽ��Ի�ø������ݣ������� T� � ���� T� � �C�������^�� T� � �C�@� ���^�� � U	  VNEWVAL THIS ENABLEF7 THISFORM SHOWTIPS TOOLTIPTEXT	 BACKSTYLE	 BACKCOLOR	 FORECOLOR�  4�  Q� STRING�  �� Q� STRING� Q� BOOLEAN� T� �C�
 this.Valueb�� T� �-�� H�b �� � �� � C��� � T� �CC� � ���� 2�� � T� �-�� � %�� ��� �. ��C� �������  � �������@� ϵͳ��ʾ�x�� ��C� � �� �
 B�� 
�� U  CMESSAGE CTYPE BVALUE BRETURN THIS VALUE SETFOCUS 
 ��  � � U  THIS INTERACTIVECHANGEJ %��  � ��$ � ��C���� �  � �� �C� s�� �C���C���W�6 s��;��� "��	 ����(\<U)��� ������һ������������ s����� "�� \-��c s��>��� "��	 ����(\<T)��� ��ȥѡ�����ݲ�����������������9� � � � � C�9� � � �
��_ s��?��� "��	 ����(\<C)��� ��ѡ�����ݸ��Ƶ�������������9� � � � � C�9� � � �
��< s��@��� "��	 ճ��(\<P)��� ճ���������ϵ��������C����Y s��B��� "��	 ɾ��(\<D)���$ ��ȥѡ�����ݣ����Ҳ�����ŵ�������������9� � � � �� s����� "�� \-��B s��I��� "��	 ȫѡ(\<A)���  ѡ����ǰ�����е������ı����������� t�� � � U  THIS ENABLEF7 KEYPRESS EDTSHORT
 ACTIVEFORM ACTIVECONTROL	 SELLENGTH PASSWORDCHAR� ��  � � H� ��� ��  ������ � T� � �a�� %�� � ��� � �� �& � frm_get_data(� �� � � � � %�C� �
��� � T� �	 �� �� � � T� � �-�� ��  ���� � %�C� �	 ���� � �� � ��  ������� T� � �a�� �� � T� �C� �	 �
 � � �� H�$��� �C� �	 ���F� T� �	 �� �� �C� �	 ��� C��p� T� �	 �C� _�� 2���0 T� �	 �C� CAST(oValue AS C� �	 ��� )��� � T� � �-�� 2��� � U  NKEYCODE NSHIFTALTCTRL THIS BF7MODE ENABLEF7 OVALUE FRM_GET_DATA	 SQLSTRING CRETURNFIELD VALUE THISFORM _BASE CACL  ��C���� �  � �� U  THIS KEYPRESS  %��  � �� � B� � U  THIS BF7MODE enablef7_assign,     ��
 self_check<    �� ProgrammaticChangeq    ��
 RightClick�    �� KeyPressA    �� DblClick�    ��	 LostFocus�    ��1 q !� � A��A 2 �� � !A� � A � �� A � 2 � 2 A� Aaa4���a"� A 2 � � !� q aA A � !A A !� q �� !�!� A � � A 2 A2 A A 1                               @  �        �  �        
  �      ,   	  ;  :   L   Z  o  [   N   �  �  ^    )   �	                       �PROCEDURE enablef7_assign
 LPARAMETER VNEWVAL
 THIS.ENABLEF7 = M.VNEWVAL
 IF VNEWVAL
    THISFORM.SHOWTIPS = .T.
    THIS.TOOLTIPTEXT = '��F7��������Ҽ��Ի�ø������ݣ�����'
    THIS.BACKSTYLE = 1
    THIS.BACKCOLOR = RGB(225,241,169)
    THIS.FORECOLOR = RGB(64,0,128)
 ENDIF 
ENDPROC
PROCEDURE self_check
 PARAMETER CMESSAGE AS STRING
 LOCAL CTYPE AS STRING , BVALUE AS BOOLEAN
 CTYPE = TYPE('this.Value')
 BRETURN = .F.
 DO CASE 
 CASE CTYPE = 'C'
    BVALUE = EMPTY(ALLTRIM(THIS.VALUE))
 OTHERWISE 
    BVALUE = .F.
 ENDCASE 
 IF BVALUE
     MESSAGEBOX('������' + CMESSAGE + '������',64,'ϵͳ��ʾ')
     THIS.SETFOCUS()
 ENDIF 
 RETURN  .NOT. BVALUE
ENDPROC
PROCEDURE ProgrammaticChange
  THIS.INTERACTIVECHANGE
ENDPROC
PROCEDURE RightClick
 IF THIS.ENABLEF7
     THIS.KEYPRESS(-6,0)
 ELSE 
    DEFINE POPUP EDTSHORT FROM MROW() , MCOL() RELATIVE SHORT
    DEFINE BAR _MED_REDO OF EDTSHORT PROMPT '����(\<U)' MESSAGE '������һ����������'
    DEFINE BAR 3 OF EDTSHORT PROMPT '\-'
    DEFINE BAR _MED_COPY OF EDTSHORT PROMPT '����(\<T)' MESSAGE  ;
         '��ȥѡ�����ݲ�������������' SKIP FOR  ;
         _SCREEN.ACTIVEFORM.ACTIVECONTROL.SELLENGTH = 0 .OR.  ;
    .NOT. EMPTY(_SCREEN.ACTIVEFORM.ACTIVECONTROL.PASSWORDCHAR)
    DEFINE BAR _MED_PASTE OF EDTSHORT PROMPT '����(\<C)' MESSAGE '��ѡ�����ݸ��Ƶ���������'  ;
         SKIP FOR  ;
         _SCREEN.ACTIVEFORM.ACTIVECONTROL.SELLENGTH = 0 .OR.  ;
    .NOT. EMPTY(_SCREEN.ACTIVEFORM.ACTIVECONTROL.PASSWORDCHAR)
    DEFINE BAR _MED_PSTLK OF EDTSHORT PROMPT 'ճ��(\<P)' MESSAGE 'ճ���������ϵ�����' SKIP  ;
         FOR EMPTY(_CLIPTEXT)
    DEFINE BAR _MED_SP200 OF EDTSHORT PROMPT 'ɾ��(\<D)' MESSAGE  ;
         '��ȥѡ�����ݣ����Ҳ�����ŵ���������' SKIP FOR  ;
         _SCREEN.ACTIVEFORM.ACTIVECONTROL.SELLENGTH = 0
    DEFINE BAR 8 OF EDTSHORT PROMPT '\-'
    DEFINE BAR _MED_SP400 OF EDTSHORT PROMPT 'ȫѡ(\<A)' MESSAGE  ;
         'ѡ����ǰ�����е������ı���������'
    ACTIVATE POPUP EDTSHORT
 ENDIF 
ENDPROC
PROCEDURE KeyPress
 LPARAMETER NKEYCODE , NSHIFTALTCTRL
 DO CASE 
 CASE NKEYCODE = -6
    THIS.BF7MODE = .T.
    IF THIS.ENABLEF7
       LOCAL OVALUE
       DO FORM frm_get_data TO OVALUE WITH THIS.SQLSTRING , THIS.CRETURNFIELD
       IF  .NOT. ISNULL(OVALUE)
          THIS.VALUE = OVALUE
       ENDIF 
    ENDIF 
    THIS.BF7MODE = .F.
 CASE NKEYCODE = 127
    IF EMPTY(THIS.VALUE)
       NODEFAULT 
    ENDIF 
 CASE NKEYCODE = -3
    THIS.BF7MODE = .T.
    LOCAL OVALUE
    OVALUE = THISFORM._BASE.CACL(THIS.VALUE)
    DO CASE 
    CASE ISNULL(THIS.VALUE)
       THIS.VALUE = OVALUE
    CASE VARTYPE(THIS.VALUE) = 'C'
       THIS.VALUE = TRANSFORM(OVALUE)
    OTHERWISE 
       THIS.VALUE = EVALUATE('CAST(oValue AS ' + VARTYPE(THIS.VALUE) + ')')
    ENDCASE 
    THIS.BF7MODE = .F.
 OTHERWISE 
 ENDCASE 
ENDPROC
PROCEDURE DblClick
  THIS.KEYPRESS(-6,0)
ENDPROC
PROCEDURE LostFocus
 IF THIS.BF7MODE
    RETURN 
 ENDIF 
ENDPROC
     �PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
     HDragMode = 0
DragIcon = 
FontSize = 10
Height = 170
MoverBars = .F.
MultiSelect = .F.
SpecialEffect = 1
ToolTipText = "˫��������Ŀ"
Width = 100
ItemForeColor = 0,0,255
ItemBackColor = 225,241,169
SelectedItemForeColor = 255,255,255
SelectedItemBackColor = 173,103,165
ItemTips = .T.
AutoHideScrollbar = 0
busealias = .F.
_memberdata =      443<VFPData><memberdata name="busealias" type="property" display="bUseAlias"/><memberdata name="calias" type="property" display="cAlias"/><memberdata name="removeall" type="method" display="RemoveAll"/><memberdata name="addfromcursor" type="method" display="AddFromCursor"/><memberdata name="addfromlistbox" type="method" display="AddFromListbox"/><memberdata name="addfromlistboxcursor" type="method" display="AddFromListboxCursor"/></VFPData>

calias = 
Name = "_listbox"
     C���    *  *                        �   %   N      �     �          �  U  M  ��  � � � � T� � �a�� T� � �C� � ���^�� ��C� � � �� U	  NBUTTON NSHIFT NXCOORD NYCOORD THIS FONTUNDERLINE	 FORECOLOR SETSTATUSTEXT URL�  ��  � � � � T� � �-�� T� � �C��� � �^�� %�C� � ��
 C� � �
	��i � ��C� � �	 �� �� � ��C� � �	 �� � U
  NBUTTON NSHIFT NXCOORD NYCOORD THIS FONTUNDERLINE	 FORECOLOR URL TOOLTIPTEXT SETSTATUSTEXT %�C�  � �
��� %�C�  � �=� APP://��� � �� � T� �C�  � �\��. �� Q�	 BASE_FORM��C�Q� ..\ffc\_base.vcx�� T� �� �� T� � � � �� �� �� � � �	 � �� ��
 Q�	 HYPERLINK� T�
 �C�	 HyperLink�N�� ��C�  � �  � _blank�
 � �� � � U  THIS URL CAPPNAME OFORM THISFORM _CONCHILDAPP _CHILDAPPLIST DISPLAYVALUE CMDRUN CLICK
 OHYPERLINK
 NAVIGATETO
 MouseLeave,     ��
 MouseEnter�     �� Click�    ��1 1� �2 1� ��� A 2 1�q Q�� a� A��A A 1                       �         �   �        �  �      )   *                       ���    �  �                        >�   %   I      �     k          �  U  t  ��  Q� STRING� %�C� � ���^ �* ��C� �������  � ���@� ϵͳ��ʾ�x��
 �� � � B�-�� �m � B�a�� � U  CMSG THIS DISPLAYVALUE SETFOCUS %��  � ��� � F�  � �� Q� _FORM��	 _base.vcx� T� �C� _form���� T� � �C��]�� T� � ��  � �� %�C� � 
��� �( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �� � F�� � �� ~�� � ��CC�  �
 ��  �	 �� � ��C� � � � �� � � U  THIS
 BENABLEDF7 OFORM _BASE VCX CURSOR_NAME SQL_CMD
 CSELECTSQL SELECT_DATA ADDITEM CRETURNFIELD CLOSE_ALIAS
 self_check,     �� Init�     ��1 !�� q � q A 2 � �Q11!�q � � � QA 1A A 1                       �      
   �   �      )   �                       
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               �l����   �       O l e O b j e c t D a t a                                            ����                                        a        A c c e s s O b j S i t e D a t a                             &  ������������                                       �        C h a n g e d P r o p s                                         ������������                                                       ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������f����M�m�h�5   V
  �  D    R������ � K�Q   ��_ Aria�                          �   8                       Suite Controls Copyright (c) 2003-2008 Codejock Software
PRODUCT-ID: Codejock.Controls.ActiveX.v12.0
VALIDATE-CODE: NSR-VTA-EXQ-TPT     �                                                            l    �@�FA    P���                                                                                                                                                                                  
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                                �1ͱ��   �        O l e O b j e c t D a t a                                            ����                                        &        A c c e s s O b j S i t e D a t a                             &  ������������                                       8        C h a n g e d P r o p s                                         ������������                                              ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������&���J�����   {  {                     �B    �ͫ   8                              8                       9368265E  �E-11d1-8BE3-0000F8754DA1a d   D o c u m e n t 	 { 7 3 F D D   �   Max    N            Y@   Min    N               h�    ��������@� ��  @�                                   MousePointer 	   I
          OLEDropMode 	   I
          Appearance 	   I
                          � 6  rax� x H       \   Sorted    L      OLEDragMode 	   I
          OLEDropMo     �PROCEDURE self_check
 LPARAMETER CMSG AS STRING
 IF EMPTY(THIS.DISPLAYVALUE)
  MESSAGEBOX('������' + CMSG + '��',64,'ϵͳ��ʾ')
  THIS.SETFOCUS
 RETURN .F.
 ELSE 
 RETURN .T.
 ENDIF 
ENDPROC
PROCEDURE Init
 IF THIS.BENABLEDF7
 SELECT 0
 LOCAL OFORM AS _FORM of _base.vcx
 OFORM = NEWOBJECT('_form')
 OFORM.CURSOR_NAME = SYS(2015)
 OFORM.SQL_CMD = THIS.CSELECTSQL
 IF  .NOT. OFORM.SELECT_DATA()
     MESSAGEBOX('��ѯ����ʧ�ܣ�',64,'ϵͳ��ʾ')
    RETURN .F.
 ELSE 
    SELECT (OFORM.CURSOR_NAME)
    SCAN 
        THIS.ADDITEM(EVALUATE(THIS.CRETURNFIELD))
    ENDSCAN 
     OFORM.CLOSE_ALIAS(OFORM.CURSOR_NAME)
 ENDIF 
 ENDIF 
ENDPROC
     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                                �1ͱ��   �       O l e O b j e c t D a t a                                            ����                                        *        A c c e s s O b j S i t e D a t a                             &  ������������                                       �        C h a n g e d P r o p s                                         ������������                                       !       ����         �����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������^�fl� O���}�|Es   {  {                    �� �ͫ   � �                          �   8                       CommandBars Control Copyright (c) 2003-2008 Codejock Software
PRODUCT-ID: Codejock.CommandBars.ActiveX.v12.0
VALIDATE-CODE: QQS-PNF-OJV-VBXode 	   I
               C �B     OX^v1.3.6.1.4.1.311.  �   VisualTheme 	   I
      	          ��      21.4     <       �C PC      ^cv2.5.29.28        !6  �C � �C 6   6       �C  ^cv &+       �C �C     �<cv2.5.29.3     '���    �&  �&                        �:   %    !      �%  �  |"          �  U  0  ��  � � � � � B�C� � � � � �� U	  P1 P2 P3 P4 P5
 SELECTDATA THIS SQL_CMD CURSOR_NAME1   ��  Q� STRING� Q� BOOLEAN� ��C �  � �� U  CMESSAGE BTYPE SETSTATUSTEXT"  ��  Q� STRING� ��C �  � �� U  __CALIASLIST
 CLOSEALIAS�, ��  Q� STRING� Q� STRING� Q� _GRID� �� � T� �C��� T� � �� �� ��C � � �� %�C �   � � 
��� � ��C� ��ѯ����ʧ�ܣ�� � �� B�-�� � %�C� W� ��� �4 ��C� ��ѯ�ɹ�����û�з������ݣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ��	 �
 � T�	 �C�� �� %��	 �<��%� �< ��C�
 ��¼������CC� N_� ,��ѯ��ʱ��CC�� � � � �� T� � ���� T� � ���� T� � �� �� T� � �-�� ��C� � �� U  CSQL CCURSOR OGRID	 NSTARTSEC THIS CURSOR_NAME
 CLOSEALIAS
 SELECTDATA WAIT_MESSAGE	 NUSEDTIME	 CUSEDTIME TOTIMESTRING RECORDSOURCE RECORDSOURCETYPE ALLOWCELLSELECTION
 RESET_GRID�. ��  Q� STRING� Q� STRING� Q� BOOLEAN� %�C� ��� L��N � T� �-�� � �� � %�� ��u � T� ��9� �� �� � T� ��9� �� � %�C� 0
��� � F�  �+ h1�� ��� � C���� � C����� Q� �  %�C� WiseMisConfigW� ��� F� � Q� � F�  � Q��� �� �  %�C� WiseMisConfigW� ���� F� �  -�CCC� @��=CCC�  @��=�� %�C4
����, r�� WiseMisConfig� � ���  ��� �� ��� >� ��� �� � Q� � U	  CKEY CVALUE
 ISREGISTER CFILE CREGISTERFILE CCONFIGFILE KEY VALUE WISEMISCONFIG�  ��  Q� STRING� Q� BOOLEAN� %�C� ��� L��@ � T� �-�� � T�  �C�  �=�� �� � � T� ��  �� %�� ��� � T� ��9� �� �� � T� ��9� �� � �� � %�� ��� � T� ��
 _1SL0LLCC4�� �� � T� �� config�� � %�C� 0���� %�C� W� ��*� F�  � Q�� ��� �� �<�
 F�� �� �* -�CCCC� � .key�@��=CCC�  @��=�� %�C4���� T� �CC� � .valueΛ�� ��� T� ��  �� � Q�	 B�� �� ���	 B��  �� � U  CKEY
 ISREGISTER CFILE CVALUE CREGISTERFILE CCONFIGFILE CCONFIGNAME�> ��  Q� COMBOBOX� Q� STRING� Q� STRING� Q� BOOLEAN� %�C�  ��� O��W � B� � %�C� ��� C��t � B� � %�C� ���� �	 B��  �� � %�C� ��� L��� � T� �-�� � %�� 
��� �
 ��  � � � F�  � T� � �C��]�� T� � �� �� %�C� � 
��� B� ��� F�� � �� %�C� ��� C��N� T� �C�/�� � %�C� ���p� T� �C�/�� � ~��� ��CCC� Λ�  �	 �� � ��C� � � �
 �� � U  OBJ CSQL CRETURNFIELD BISADD CLEAR THIS CURSOR_NAME SQL_CMD SELECT_DATA ADDITEM CLOSE_ALIAS"  ��  � T� � �C �  � � �� U  VNEWVAL THIS SQL_CMD TRANSFORM_SQL�  ��  Q� STRING� Q� STRING�$ %�C�  ��� C� C� ��� C��L �	 B��  �� � +�C� >� ��� � T�  ��  C� � � =�� T� �C� �� \�� �	 B��  �� U  __CSOURCESTRING __CADDEDSTRING� ��  � � � � � � %�C�  ��� C� C�  ����� � frm_get_data(�  ��ل select ModalName as ģ������,BaseTable as ����,isET as �Ƿ�WPS����,Remark as ��ע from WiseMis_ExcelModal order by BaseTable,OrderID��� ģ�������� %�C�  ��� C� C�  ���� T�  ��  �� � � %�C� ��� C� C� ���F� T� �C�� � %�C� ��� L��j� T� �-�� � %�C� W� ���� T� �C�� � %�C� ��� L���� T� �-�� � %�C� ��� L���� T� �-�� � %�C� ��� L���� T� �-�� � �� �
 M(� `��& �    DECLARE @ModalName varchar(50)�' �!   SET @ModalName="<<cModalName>>"� �  �{ �u   IF exists(select * from sysobjects where id=object_id("WiseMis_ExcelModal") AND ObjectProperty(id,"IsUserTable")=1)� �   	BEGIN�P �J   		IF exists(select * from WiseMis_ExcelModal where ModalName=@ModalName)� �   			SELECT 1� �   		ELSE� �   			SELECT 0� �   	END� �   ELSE� �   	SELECT 0� � %�C � � � ����2 ��C� ģ�治���ڻ��߲���֧�֣��@� ϵͳ��ʾ�x�� B� �H T� ��2 select * from WiseMis_ExcelModal where ModalName='�  � '�� T�	 �
 �� �� T�	 � �C��]�� %�C�	 � 
����, ��C� ��ѯģ����Ϣʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F��	 � �� �� � � � � T� �� �� T� �C� ��� %�C� ����� T� �C��]�� � T� �� �� T� �C� -��� ��C�	 � �	 � �� %�C� W� ��H�
 F�� �� � %�C� �
���� T�	 �
 �� �� T�	 � �� �� %�C�	 � 
����( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � � �� � ��C � � � �� %�C� 0
��(�( ��C� �ͷ�ģ��ʧ�ܣ��@� ϵͳ��ʾ�x�� ��C � �	 � �� B� � �� � %�� ���� %�� ����5 T� �C�9� ��C��]� .C� � � et� � xls6�� ��� %�� ���� T� �C� ���汨���  � et��� ���  T� �C� ���汨���  � xls��� � � � �� � T� �C� �� ,���� %�C� �
��9� %�C� W� ��5�
 F�� �� � � ��C �  �  �  �  � � �� %�C� ��� C� C� �
	���� %�C� 0���� ��C � � �� � �
  �� �� ��C � �	 � �� U 
 CMODALNAME CCURRENTCURSOR BSAVE BPREVIEWDIRECT BPRINTDIRECT	 BNODIALOG FRM_GET_DATA CSQL GETVALUE THIS SQL_CMD CURSOR_NAME SELECT_DATA CSQLTEXT CCURSORLIST
 CEXCELDATA BISET SQLTEXT
 CURSORLIST	 EXCELDATA ISET CLOSE_ALIAS COUTPUTFILENAME IMAGETOFILE CEXCELOUTPUTFILE
 CFILESPATH CFIRSTCURSOR TOEXCEL RUNFILE~i ��  Q� STRING� Q� STRING� Q� BOOLEAN� Q� BOOLEAN� Q� BOOLEAN� Q� BOOLEAN� Q� STRING� %�C�  ��� C� C�  ���f�� � frm_get_data(�  ��ل select ModalName as ģ������,BaseTable as ����,isET as �Ƿ�WPS����,Remark as ��ע from WiseMis_ExcelModal order by BaseTable,OrderID��� ģ�������� %�C�  ��� C� C�  ���b� T�  ��  �� � � %�C� ��� C� C� ����� T� �C�� � %�C� ��� L���� T� �-�� � %�C� W� ���� T� �C�� � %�C� ��� L���� T� �-�� � %�C� ��� L��#� T� �-�� � %�C� ��� L��G� T� �-�� � %�C� ��� C��m� T� ��  �� � �� �
 M(� `��& �    DECLARE @ModalName varchar(50)�' �!   SET @ModalName='<<cModalName>>'� �  �{ �u   IF exists(select * from sysobjects where id=object_id('WiseMis_ExcelModal') AND ObjectProperty(id,'IsUserTable')=1)� �   	BEGIN�P �J   		IF exists(select * from WiseMis_ExcelModal where ModalName=@ModalName)� �   			SELECT 1� �   		ELSE� �   			SELECT 0� �   	END� �   ELSE� �   	SELECT 0� � %�C � �	 � ��`�2 ��C� ģ�治���ڻ��߲���֧�֣��@� ϵͳ��ʾ�x��	 B��  �� �H T� ��2 select * from WiseMis_ExcelModal where ModalName='�  � '�� ��
 � T�
 �C��]�� T� � �� �� T� � �C��]�� %�C �  �
 � 
��2�, ��C� ��ѯģ����Ϣʧ�ܣ��@� ϵͳ��ʾ�x��	 B��  �� �
 F��
 �� �� � � � � T� �� �� T� �C� ��� %�C� ����� T� �C��]�� � T� �� �� T� �C� -��� ��C �
 � �� %�C� W� ����
 F�� �� � %�C� �
��:� %�C �  � � 
��6�( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x��	 B��  �� � � �� �2 T� �C�9� ��C��]C� �	 � .et� � .xls6�� ��C �  � � �� %�C� 0
����( ��C� �ͷ�ģ��ʧ�ܣ��@� ϵͳ��ʾ�x�� ��C � � ��	 B��  �� � �� � %�� ���� %�� ��B�E T� �C�9� ��CC� ��	 C��]� � 6� .C� � � et� � xls6�� ��� %�� ��v� T� �C� ���汨��� � et��� ���  T� �C� ���汨��� � xls��� � � � �� � T� �C� �� ,���� %�C� �
���� %�C� W� ����
 F�� �� � � ��C �  �  �  �  � � ��
  �� �� ��C � � �� %�C� ��� C� C� �
	��n� %�C� 0��j�	 B�� �� � �	 B��  �� U 
 CMODALNAME CCURRENTCURSOR BSAVE BPREVIEWDIRECT BPRINTDIRECT	 BNODIALOG	 CFILENAME FRM_GET_DATA CSQL GETVALUE CTEMPCURSOR THIS SQL_CMD CURSOR_NAME
 SELECTDATA CSQLTEXT CCURSORLIST
 CEXCELDATA BISET SQLTEXT
 CURSORLIST	 EXCELDATA ISET
 CLOSEALIAS COUTPUTFILENAME
 CFILESPATH IMAGETOFILE CEXCELOUTPUTFILE CFIRSTCURSOR TOEXCEL*  ��  � � � � � B�C� � � �� U  P1 P2 P3 P4 P5 EXECUTE THIS SQL_CMD  ��  � B�CC �  � � � �� U  CSQLCMD PARSESQL THIS TRANSFORM_SQLo  ��  �e B�CC�  �	 thisform.� _screen.� � � .��������� this.� _screen.� � � .���������� U  CSQLCMD THIS CTEMPOBJECT  ��  � � � � � U  P1 P2 P3 P4 P5  ��  � T� � ���  �� U  VNEWVAL THIS WINDOWSTATEt  T�  � �C��]�� ��C�9�  � �  
�� %��  � ��m �# ���9� �Q� PAGEFRAMEMANAGER�i � ��C �  �� �� �� � U  THIS CTEMPOBJECT SHOWFORMINTABCONTROL OPAGEFRAMEMANAGER ADDPAGE^  ��C�9�  � �� %��  � ��W �# ���9� �Q� PAGEFRAMEMANAGER�S � ��C �  �� �� �� � U  THIS CTEMPOBJECT SHOWFORMINTABCONTROL OPAGEFRAMEMANAGER
 REMOVEPAGE select_data,     �� wait_message�     �� close_alias�     �� refresh_data1    �� write_config�    ��
 get_config�    �� fill_data_listitem�    �� sql_cmd_assign�	    �� add_to_stringH
    �� toexcel    �� toexcel2    �� exec_sql�    �� parsesqlQ    �� transform_sql�    �� clear_form_info+    �� windowstate_assign]    �� Init�    �� UnloadV     ��1 qa2 � 2 � 2 �r � � q�q A 2Aq A � � A �� � � 2 �Q� A r � � � � A � �A A q A A � � q � �� � A A A 3 Q� A !� � � � � � A q � q� 1A � 1� � � A �� �� � A A � � � A 3 �QA A QA A � � A Q� A � � A � 1!A � � Q� A � � A � AA 1A 3 q �2 �A� A A�QA � 3 ���� A A �� A Q� A 1� A Q� A Q� A Q� A q � aqa �� 1� 1� � A a!A A �1!�A A � 1� � � A � 11� A !�A A A q !�A A q � � Q� � �� A A A q q1� A A ��� � A A � 3 ���� A A �� A Q� A 1� A Q� A Q� A Q� A Q� A r � aqa �� 1� 1� � A a!� A �q 1q�� A � 1� � � A � � 1� A q�� A A q !!�� � A q � � Q� � �� A A A q q1� A A �� � �� � A A � 2 q2 q Q2 q Q2 q2 q "3 1A1� A A 2 1� A A 2                       c         �   �         �   1  
   
   T       #   *    -   C   &  
  Q   h   7
  �  z   �   �  $  �   �   H  �  �   �   �  #  �     B  �&    s  �&  '  �  v  ;'  |'  �  y  �'  9(  �  |  _(  y(  �  ~  �(  )  �  �  #)  �)  �  �   *  �*  �   )   �&                       
BorderStyle = 3
Height = 465
Width = 662
Desktop = .F.
ShowWindow = 1
DoCreate = .T.
ShowTips = .T.
BufferMode = 0
AutoCenter = .T.
Picture = ..\
Caption = "Form1"
HalfHeightCaption = .F.
MaxButton = .T.
MinButton = .T.
MDIForm = .F.
Icon = ..\images\system\community.ico
KeyPreview = .T.
TitleBar = 1
Dockable = 0
sql_cmd = ""
cursor_name = cursor_sql
isinit = .T.
ostatusbarpane = 
showstatusbar = .F.
_memberdata =     1545<VFPData><memberdata name="ctempobject" type="property" display="cTempObject"/><memberdata name="showformintabcontrol" type="property" display="ShowFormInTabControl"/><memberdata name="add_to_string" type="method" display="Add_To_String"/><memberdata name="check_empty" type="method" display="Check_Empty"/><memberdata name="clear_form_info" type="method" display="Clear_Form_Info"/><memberdata name="clear_unsavemark" type="method" display="Clear_UnSaveMark"/><memberdata name="close_alias" type="method" displa<VFPData><memberdata name="ctempobject" type="property" display="cTempObject"/><memberdata name="showformintabcontrol" type="property" display="ShowFormInTabControl"/><memberdata name="add_to_string" type="method" display="Add_To_String"/><memberdata name="check_empty" type="method" display="Check_Empty"/><memberdata name="clear_form_info" type="method" display="Clear_Form_Info"/><memberdata name="clear_unsavemark" type="method" display="Clear_UnSaveMark"/><memberdata name="close_alias" type="method" displa<VFPData><memberdata name="ctempobject" type="property" display="cTempObject"/><memberdata name="showformintabcontrol" type="property" display="ShowFormInTabControl"/><memberdata name="add_to_string" type="method" display="Add_To_String"/><memberdata name="check_empty" type="method" display="Check_Empty"/><memberdata name="clear_form_info" type="method" display="Clear_Form_Info"/><memberdata name="clear_unsavemark" type="method" display="Clear_UnSaveMark"/><memberdata name="close_alias" type="method" displa<VFPData>
ctempobject = 
issaved = .F.
showformintabcontrol = .T.
Name = "_form"
     �PROCEDURE MouseLeave
 LPARAMETER NBUTTON , NSHIFT , NXCOORD , NYCOORD
 THIS.FONTUNDERLINE = .T.
 THIS.FORECOLOR = RGB(0,0,255)
 =SetStatusText(THIS.URL)
ENDPROC
PROCEDURE MouseEnter
 LPARAMETER NBUTTON , NSHIFT , NXCOORD , NYCOORD
 THIS.FONTUNDERLINE = .F.
 THIS.FORECOLOR = RGB(255,0,0)
 IF EMPTY(THIS.URL) AND  .NOT. EMPTY(THIS.TOOLTIPTEXT)
     =SetStatusText(THIS.TOOLTIPTEXT)
 ELSE 
      =SetStatusText(THIS.URL)
 ENDIF 
ENDPROC
PROCEDURE Click
 IF  .NOT. EMPTY(THIS.URL)
    IF LEFT(THIS.URL,6) == 'APP://'
       LOCAL CAPPNAME
       CAPPNAME = SUBSTR(THIS.URL,7)
       LOCAL OFORM AS BASE_FORM of HOME() + '..\ffc\_base.vcx'
       OFORM = THISFORM
       OFORM._CONCHILDAPP._CHILDAPPLIST.DISPLAYVALUE = CAPPNAME
        OFORM._CONCHILDAPP.CMDRUN.CLICK
    ELSE 
       LOCAL OHYPERLINK AS HYPERLINK
       OHYPERLINK = CREATEOBJECT('HyperLink')
        OHYPERLINK.NAVIGATETO(THIS.URL,'','_blank')
    ENDIF 
 ENDIF 
ENDPROC
     �FontUnderline = .T.
MousePointer = 15
ForeColor = 0,0,255
url = ("")
actioncode = 0
_memberdata =       89<VFPData><memberdata name="actioncode" type="property" display="ActionCode"/></VFPData>

Name = "_weblabel"
     ����    �  �                        �B   %   �
      �  �   z          �  U  �  ��  Q� STRING� %�� � ��j � F�� � �� -�CC� @�CC�  @��� %�C4��W � B�a�� �f � B�-�� � �� � %�� � � ��� � B�-�� �� � �� ���(�� � ��� �! %�CCC � � � �@CC�  @���� � B�a�� � �� B�-�� � � U  CITEM THIS	 BUSEALIAS CALIAS ITEMTEXT	 LISTCOUNT I LISTo  ��  Q� STRING� %�� � � ��a �+ ��C� ��ѡ��[�  � ]!�@� ϵͳ��ʾ�x��
 �� � � B�-�� � B�a�� U  CMSG THIS	 LISTCOUNT SETFOCUSj  %��  � ��, � F��  � �� �
 ��  � � �c � �� ��  � �(����_ � ��C � �  � �� �� � U  THIS	 BUSEALIAS CALIAS ALL REQUERY __NLISTITEM	 LISTCOUNT
 REMOVEITEM�  ��  Q� STRING� Q� STRING�6 %�C�  ��� C� C�  �� C� ��� C� C� ���Y � B� �
 F��  �� ~�� � ��CC�  � .� �� � �� � U  __CALIAS __CFIELDNAME THIS ADDITEM�  ��  Q� LISTBOX� %��  � � � � 	��J � ��C�  � � ItemText� � �� �� � �� ���(��  � ��� � ��CC � �  � � � �� �� � U	 
 __OLISTBOX	 BUSEALIAS THIS ADDFROMCURSOR CALIAS __NLISTITEM	 LISTCOUNT ADDITEM LIST�  ��  � %�� � ��` � F�� � �� -�CC� @�CCC �  � � @��� %�C4��R � � �
 �� � � �u � ��C �  ��� � �� U  NINDEX THIS	 BUSEALIAS CALIAS ITEMTEXT LIST REQUERY^  ��  � � � %�� � ��W � F�� � �� r��� � �� ��C�  ���
 �� � � �� � U  CITEM NINDEX NCOLUMN THIS	 BUSEALIAS CALIAS ITEMTEXT REQUERY(  %��  � ��! � F��  � �� Q� � U  THIS	 BUSEALIAS CALIAS� $ %�C�  � ��� C�	 C�  � ���7 � T�  � �C��]�� � %��  � ��� � F�  � h���  � �� � C����� T�  � ���� T�  � ��  � �� � U  THIS CALIAS	 BUSEALIAS ITEMTEXT ROWSOURCETYPE	 ROWSOURCE�  %��  � � ��� � �� �6 T� �C� �����µ���Ŀֵ� ������ĿC�  � �  � ���� %�C� �
��� � %��  � ��� �3 p��  � ��� �� ���CC� @�CCC�  � �  � @���
 ��  � � �� � T�  � ��  � ��� �� � � � U  THIS	 LISTINDEX CITEM LIST	 BUSEALIAS CALIAS ITEMTEXT REQUERY� ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION:  %��  � � �� � B� �3 � ��C�  � �  � �� � U  THIS	 LISTINDEX
 REMOVEITEM finditem,     ��
 self_check_    ��	 removeall�    �� addfromcursor�    �� addfromlistboxh    ��
 RemoveItemV    �� AddItem    �� Destroy�    �� Init�    �� DblClick�    �� Error    ��
 RightClick>
    ��2 � a� q � q A � Aq � �q A A q A A 3 A�� q A q 3 � Q � � �A A 3 �bA A � � �A 3 !��� ��A A 3 q � �� A A � � � A A 3 � � �� A A 3 � A A 3 A1A � �1A 3 Aq a2� � �A A A 3 � � A A ��� A A #� q�A A Q A4 AA � 1A 2                       �        �  �        �  `  $   )   �  �  0   2   �  �  <   ;   �  �  G   H     �  V   P   �  *  `   U   N  =	  g   _   e	  �
  s   l   #  �  �   �   �  <  �    )   �                       v
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------
PROCEDURE When
&&----���¼�!
ENDPROC
PROCEDURE Valid
&&----���¼�!
ENDPROC
PROCEDURE ProgrammaticChange
  THIS.INTERACTIVECHANGE
ENDPROC
*------     A%���    A  A                        jT   %   �:      �?    �;          �  U  
� ��  Q� STRING� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT�	 Q� VARIANT� ��
 � � � T�
 �C��� %��
 � ��� �. ��C� ������ָ���������ƣ��@� ϵͳ��ʾ�x�� B� � %��
 �
��E�: ��C�  ������������10����ϵͳ�ܾ��������@� ϵͳ��ʾ�x�� � %�C� .�  � ���� T� �C�  C� .�  �\�� T�  �C�  C� .�  �=�� ��� T� �C��]�� � H���� ��
 ����� ��  �J�� �� ��
 ���� ��  �J�� ��� � ��
 ���6� ��  �J�� ��� � � ��
 ���e� ��  �J�� ��� � � � ��
 �����" ��  �J�� ��� � � � � ��
 �����& ��  �J�� ��� � � � � � ��
 ���
�* ��  �J�� ��� � � � � � � ��
 ���I�. ��  �J�� ��� � � � � � � � ��
 �	����2 ��  �J�� ��� � � � � � � � � ��
 �
����6 ��  �J�� ��� � � � � � � � �	 � 2��( ��C� �����������꣡�@� ϵͳ��ʾ�x�� � U 	 CFORMNAME EPARAM1 EPARAM2 EPARAM3 EPARAM4 EPARAM5 EPARAM6 EPARAM7 EPARAM8 EPARAM9 NPCOUNT TEMP COBJ�  ��  Q� STRING� Q� STRING� %�C�� ��W �$ ��C�
 �������㣡�@� ϵͳ��ʾ�x�� B� � %�C� ��� C��� � T� �� open�� � ��C�  �  �  �  �  �� �� U 	 CFILEPATH CACTION SHELLEXECUTE� @ ��  Q� STRING� Q�
 COLLECTION� Q� BOOLEAN� Q� STRING� �� Q�	 APPOBJECT� T� �C �  � �� %�C� ��� O��� � ��C �  � � �� � U  CAPPNAME	 OPARAMOBJ BCHILD CVERSION
 OAPPOBJECT CREATEAPPOBJECT DOWISEMISAPPLICATION� ��  � � � � �$ %�C�  ��� C� C� ��� C��D �	 B�� �� � �� � � T� �C��]��< T� �� select top 1 �  �  as Select_Value from � �� %�C� ��� C��� � %�C� �
��� � T� �� �  where � �� � � %�C� ��� C��0� %�C� �
��,� T� �� �
  order by � �� � � %�C �  � � 
��T�	 B�� �� �
 F�� �� T� �� �� ��C � �	 ��	 B�� �� U
  CSELECTFIELD CTABLE	 CWHEREEXP	 CORDEREXP VDEFAULTVALUE CSQL CTEMPCURSOR
 SELECTDATA SELECT_VALUE
 CLOSEALIASV� ��  Q� STRING� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT�	 Q� VARIANT� ��
 � T�
 �C��� %��
 � ��� �. ��C� ������ָ���������ƣ��@� ϵͳ��ʾ�x�� B� � %��
 �
��=�: ��C�  ������������10����ϵͳ�ܾ��������@� ϵͳ��ʾ�x�� � �� � ��� H�]�� ��
 �����  Do Form &cFormName To oValue
 ��
 �����- Do Form &cFormName With eParam1 To oValue
 ��
 ����5 Do Form &cFormName With eParam1,eParam2 To oValue
 ��
 ���`�= Do Form &cFormName With eParam1,eParam2,eParam3 To oValue
 ��
 �����E Do Form &cFormName With eParam1,eParam2,eParam3,eParam4 To oValue
 ��
 ����M Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5 To oValue
 ��
 ���z�U Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6 To oValue
 ��
 �����] Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7 To oValue
 ��
 �	��^�e Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7,eParam8 To oValue
 ��
 �
����m Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7,eParam8,eParam9 To oValue
 2��( ��C� �����������꣡�@� ϵͳ��ʾ�x�� � �(� �F�* ��C�	 ִ��ʧ��:� � �@� ϵͳ��ʾ�x�� ��	 B�� �� U 	 CFORMNAME EPARAM1 EPARAM2 EPARAM3 EPARAM4 EPARAM5 EPARAM6 EPARAM7 EPARAM8 EPARAM9 NPCOUNT OVALUE OERR MESSAGE�  ��  Q� STRING� Q� BOOLEAN� %�C����; � T� �a�� � %�C�  ��� C��a � T�  ��  �� � %�C� ��� L��� � T� �a�� � �� ���� ��C�� �z�� �� � � T� �C�� �� T� ��  �� �� � H�� �P� �� ����.�! T� �� ���Ժ�̨���ݿ����Ϣ�� T� �� CC�� �0\�� �� ���	 � ����� T� �� OLE��� T� �� C�� C�
 � Ӧ�ó������ƣ�C�� C�
 �
 ������Ϣ��CCC�� �� � ��� C�� 6C�
 � ������Ϣ���ݣ�CCC�� �� � ��� C�� 6C�
 � OLE����ţ�CCC�� Z��� 2�P� T� �� һ�����д����� T� �� C�� �� �G T� �� C�
 C�
 � C�
 C�
 �
 �����Ϣ��C�
 C�
 �  �� %�� ����" � frm_text�� �� ϵͳ��ʾ�� � B�CC�� �0\�� U  COTHERMESSAGE __BSHOWERRORMESSAGE
 ARRAYERROR NERROR	 CERRORMSG
 CERRORTYPE FRM_TEXTM ��  Q� STRING� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� %�C�  ��� C��f � B� � %�C�  ���} � B� � H�� ��$ �CCC�  @�=� app.� a03.���� �! B�CC�  �\ �  �  � � � �� �CC�  @�=� a01.���# B�CC�  �\ �  � � A01� � �� �CCC�  @�=� b00.���d�5 B�CCC�  �\�� ,��CC�  �\�� ,����  � � �� �CC�  @�=� b01.����8 B�CCC�  �\�� ,��CC�  �\�� ,���� A01� � �� �CC�  @�=� q01.���� �� �	 �W T� �C�5 select sql_str from general_query where select_name='C�  �\� '� �
 ��Z T�	 �C�8 select ReportPath from general_query where select_name='C�  �\� '� �
 ��% �
 frm_browse�� �C�  �\��	 � �CC�  @�=� qry.���� �� � �W T� �C�5 select sql_str from WiseMis_Query where select_name='C�  �\� '� �
 ��Z T� �C�8 select ReportPath from WiseMis_Query where select_name='C�  �\� '� �
 ��% �
 frm_browse�� �C�  �\�� � �CC�  @�=� sys.����% B�CC�  �\ �  �  �  � � � �� 2�� B�C �  � � �� � U  CAPPNAME EPARAM1 EPARAM2 EPARAM3 EPARAM4 THIS CREATEAPPLICATION CREATEDETAILAPPLICATION CQ01SQL
 CQ01REPORT SELECT_VALUE
 FRM_BROWSE CQRYSQL
 CQRYREPORT DO_SYS	 OPEN_FORM�M ��  Q� STRING� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� T�  �C�  @�� %�C�  ��� C��u � B� � %�C�  ���� � B� � H�� ��� ��  �
 locksystem��� � ��C� � �� ��  � exit��� � �� 8� ��  �
 changeuser��6�$ ��CC�9� ��� WiseMis.exe� � �� ��C� exit� �	 �� ��  � main��u�* ��C�9� � ._screen.System_Main� �
 �� �C�  �=� setting.��� %�C�9� W� ����	 B��  �� �� F��9� �� -�CC� @�CCC�  �	\@��� %�C4���� B�C� ��� ��	 B��  �� � � ��  � check_system��:� B�C� � �� ��  �
 quickapply��v�! ��C� frm_sys_appwizard� �
 ��# ��  � importsystemconfig���� ��C � � � �� 2��� ��C� sys.�  � �
 �� � U  CAPPNAME EPARAM1 EPARAM2 EPARAM3 EPARAM4 THIS
 LOCKSYSTEM RUN_FILE	 CROOTPATH DO_SYS	 OPEN_FORM SYSTEMMAINFORM SETTING KEY VALUE CHECK_SYSTEM IMPORT_INIT_CONFIG+ ��  � �� Q� STRING�
 M(� `��
 �   /*�G �A   ��鵱ǰ���ݿ��Ƿ����WiseMis������ҵ����Ӧ��ϵͳ��Ҫ�����л����* �$   �������null  ��ʾ�ͻ����Ѿ����ƻ��* �$       ���� 1    ��ʾ�߱���ȷ���л����@ �:       ���� 0    ��ʾ���߱���ȷ�����л�������Ҫ�ؽ�ϵͳ�����
 �   */�= �7   declare @cTableList varchar(1000)  --��������ݱ��б��q �k   set @cTableList='wisemis_AppDetail,wisemis_AppIndex,wisemis_AppRelation,wisemis_AppType,WiseMis_WorkFlow'�- �'   declare @cTable varchar(50),@bRun bit� �   Set @bRun=1�  �   while len(@cTableList)>0� �   begin�) �#     if charindex(',',@cTableList)>0� �       begin�H �B         set @cTable=left(@cTableList,charindex(',',@cTableList)-1)�} �w         set @cTableList=substring(@cTableList,charindex(',',@cTableList)+1,len(@cTableList)-charindex(',',@cTableList))� �	       end� �     else� �       begin�% �         set @cTable=@cTableList�  �         set @cTableList=''� �	       end� �     --��ʼ����t �n     if not exists(select * from sysobjects where id=object_id(@cTable) and ObjectProperty(id,'IsUserTable')=1)� �
      Begin� �       Set @bRun=0� �      end� �   end� �   --���ؽ���  �   select @bRun as ������ �  � � �� � � T� �C��]�� %�C �  � � 
���� T� �-�� ��
 F�� �� T� �� �� ��C � � �� �	 B�� �� U 	 BRUNNABLE CHECKSQL CALIAS BRETURN
 SELECTDATA �����
 CLOSEALIAS? . ��  Q� STRING� Q� STRING� Q� BOOLEAN� B�C �  � �� U  CSQL CFIELD BINGORERUNNABLE GETVALUE� @ ��  Q� STRING� Q�
 COLLECTION� Q� BOOLEAN� Q� STRING� �� Q�	 APPOBJECT� T� �C �  � �� %�C� ��� O��� � ��C � � �� � U  CAPPNAME	 OPARAMOBJ BCHILD CVERSION
 OAPPOBJECT CREATEAPPOBJECT DOWISEMISAPPLICATION� � ��  Q� STRING� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT� Q� VARIANT�	 Q� VARIANT�5 B�C �   �  �  �  �  �  �  �  �  �	 �
 � �� U 	 CFORMNAME EPARAM1 EPARAM2 EPARAM3 EPARAM4 EPARAM5 EPARAM6 EPARAM7 EPARAM8 EPARAM9 THIS OPEN_FORM_WITH_RESULT� ��  Q� STRING� %�C�  ��� C� C�  ���3 � B� � �� �
 M(� `�� �y IF exists(select * from sysobjects where id=object_id('WiseMis_ExcelImportIndex') AND ObjectProperty(id,'IsUserTable')=1)� �	 	SELECT 1�
 � ELSE� �	 	SELECT 0� � %�C � � � � ��I�9 ��C� ��ǰϵͳ��֧�ִ�Excelģ�嵼�룡�@� ϵͳ��ʾ�x�� B� � �� �
 M(� `��_ �Y IF exists(select * from WiseMis_ExcelImportIndex where ModalName='<<__cExcelModalName>>')� �	 	SELECT 1�
 � ELSE� �	 	SELECT 0� � %�C � � � � ��,�& ��C� ģ�岻���ڣ��@� ϵͳ��ʾ�x�� B� � %��9� ��{�8 ��C� ��ʾ�˺��û�����ʹ�õ��빦�ܣ��@� ϵͳ��ʾ�x�� B� � �� �* T� �C� xls�  �  � � ѡ�����ļ���� %�C� 0
����& ��C� �ļ������ڣ��@� ϵͳ��ʾ�x�� B� � �� � �K T� ��> cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail��
 M(� `��$ � DECLARE @ModalName varchar(50)�, �& SET @ModalName='<<__cExcelModalName>>'�G �A SELECT * FROM WiseMis_ExcelImportIndex WHERE ModalName=@ModalName�H �B SELECT * FROM WiseMis_ExcelImportDetail WHERE ModalName=@ModalName� � %�C �  � � 
��t�( ��C� ��ѯģ��ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F� � %�CN� ���& ��C� ģ�岻���ڣ��@� ϵͳ��ʾ�x��K ��C�> cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail�	 �� B� �' ��
 � � � � � � � � � J�� �(� � � � � T�
 �C� ��� T� �C� ��� T� �� �� T� �� �� �� Q� EXCEL.Application�! T� �C� Excel.Application�N�� �� Q� EXCEL.Workbook� T� �C � � � � �� �� Q� EXCEL.Worksheet� T� �C � � � �� %�C� ��� O����3 ��C� ��Excel�ļ��޷�ͨ����֤���@� ϵͳ��ʾ�x��K ��C�> cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail�	 �� ��C-� � ��
 �� � � B� �W T� �C� һ��C� � �  �! _� ��,���趨һ�ε���������� һ�ε�������CC�" ��_���� %�C� ���:� B� � T� �C� g�� %�� � ��k� T� ���� � %�� �����` %�C�> һ�ε��볬��һ�н��޷���ȷ��λ����ͺ����кţ���ȷ��Ҫ�������!� ϵͳ��ʾ�x����� B� � � ��# �$ �% � �& � J��  �(�# �$ �% � �& � F�' � ~�w	� ��( � T�( �C�) ��� ��C� __�( ��9�* �� %��+ ����0 T�# ��# CC�# �� �  � � ,6� [�( � ]��5 T�$ ��$ CC�$ �� �  � � ,6� ?_screen.__�( �� � %��, ��	�@ T�& ��& CC�& �� �  � � ,6� [�( � ]=?_screen.__�( �� � %��- ��s	�D T�% ��% CC�% �� �  � �  and 6� [�( � ]=?_screen.__�( �� � � %�C�% �
� C�& �
	���
�? T� �� if exists(select * from [�
 � ] where �% � )��L T� �� C� C�
 C� � update [�
 � ] set �& �  where �% �� %�C�# �
���
�! T� �� C� C�
 � else��U T� �� C� C�
 C� � insert into [�
 � ](�# �
 ) values (�$ � )�� � �� %�C�# �
���? T� �� insert into [�
 � ](�# �
 ) values (�$ � )�� � � F�  �E h�� cursor_schame�) � C��2��/ � I�- � L�+ � L�, � L� ��0 �1 � T�0 ��  �� F�' � ~�K� T�1 �-�� ��2 �3 �4 �5 �6 � T�2 �C�) ��� T�3 �C�7 ��� T�4 ��- �� T�5 ��+ �� T�6 ��, ��  ��8 ���(�� � �9 �! ����0 %�CCCC �  �8 � � �: �; �  �@�CC�3 @����� T�1 �a��J r�� cursor_schame�) �/ �- �+ �, ���2 ���8 ���4 ���5 ���6 �� F�' � � �� %��1 
��G�, ��C� �ֶ��޷�ͨ����֤���@� ϵͳ��ʾ�x��Y ��C�L cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail,cursor_schame�	 �� ��C-� � ��
 �� � � B� � �K ��C�> cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail�	 �� ��< �= � �> � T�< ��  �� T�= �� � �  �! �� T�> �� �� ��? �@ � T�? ��  �� ��8 �� �(��= ���� T� ��8 ��@ R,�:��
 ��ǰ���ȣ�CC�8 �= �d8_� %,��ǰ��C�8 _� �С��� F�. � ~��� ��( �A �B � T�( �C�) ��� T�A ��/ ��W T�B ��
 _screen.__�( � =oWorksheet.UsedRange.Cells(C�8 _� ,C�A _� ).Value��	 &cCmd
 �" T�? ��? C� C�
 C � �C �� T�> ��> ��� %��> � � �8 �= 	��J� .� �: T�? ��? C� C�
 � select @@ROWCOUNT as Ӱ�������� T�@ �C��]�� %�C �?  �@ � 
��-� T� �� �> ��5 T�< ��< C� C�
 � ��C�8 _� �е���ʧ�ܣ���0 %�C� �Ƿ�������룿�!� ϵͳ��ʾ�x���)� !� � ���
 F��@ �� %��D � ����3 T�< ��< C� C�
 � ��C�8 _�
 �б����ԣ��� T� �� ��� ��� T� �� �> �� � ��C �@ �	 �� � T�? ��  �� T�> �� �� �� R� F�. � ~�� ��2 � T�2 �C�) ��� ��C�9� __�2 �� � ��C� cursor_schame�	 ��$ ��C�
 ������ɣ��@� ϵͳ��ʾ�x�� ��E �
 M(�E `��+ �% -------------------------------------� � ��������<<nRowCount>>� � �����кţ�<<nTitleLine>>�$ � һ�δ�����<<nRowsCountOnce>>���! � ������ʼ�кţ�<<nDataLine>>�) �# ����������<<nRowCount-nDataLine+1>>�  � ������кţ�<<nLastRow>>�% � ����ɹ�������<<nSuccessCount>>�H �B ����ʧ��������<<nFailedCount>>�����һ�ε��볬��һ�У��˽���������F �@ ������������<<nIgnoreCount>>�����һ�ε��볬��һ�У��˽��������� � T�< ��< C� C�
 �E �� %�C�< �
��� ��C�< � C:\Error.txt���� ��C� C:\Error.txt� �F �� � ��C-� � ��
 �� � � UG  __CEXCELMODALNAME CSQL THIS SELECT_VALUE
 ISDEMOUSER
 CEXCELFILE CCURSORLIST
 SELECTDATA CURSOR_WISEMISEXCELIMPORTINDEX
 CLOSEALIAS
 CBASETABLE
 CSHEETNAME
 NTITLELINE	 NDATALINE NSUCCESSCOUNT NFAILEDCOUNT NIGNORECOUNT NLASTROW NROWSCOUNTONCE	 BASETABLE	 SHEETNAME	 TITLELINE DATALINE OEXCEL	 OWORKBOOK	 WORKBOOKS OPEN
 OWORKSHEET
 WORKSHEETS CLOSE QUIT	 USEDRANGE ROWS COUNT
 BATCHCOUNT CINSERTFIELDS CINSERTVALUES CKEYFIELDSEXPR CUPDATEFIELDSEXPR CURSOR_WISEMISEXCELIMPORTDETAIL CSQLFIELDNAME SQLFIELD ADDPROPERTY ISINSERT ISUPDATE ISKEY CURSOR_SCHAME EXCELCOLUMN
 CCMDSCRIPT BISFOUND	 CSQLFIELD CEXCELFIELD BISKEY	 BISINSERT	 BISUPDATE
 EXCELFIELD __I COLUMNS CELLS VALUE CERRORMESSAGE	 NROWCOUNT	 NROWSEXEC CTEMPSQL CTEMPCURSOR NEXCELFIELD CCMD PARSESQL Ӱ������ CSUMMARYTEXT RUN_FILER ��  � � T� �-�� T�  ���� �� � T� �C�9� � �� +��  � � � 
	���W � frm_tool_password(� ��� ϵͳ�ѱ�����(��ʣC�  _� �����Ի���)��� ���������� %�C � � � ���2 ��C� ������������޷��������@� ϵͳ��ʾ�x�� T�  ��  ��� �� T� �a�� � � %�� ��/� �K� ��C� exit� � �� � U	 	 NTRYTIMES BCHECKOK COLDPASS	 MD5STRING CUSERPASSWORD FRM_TOOL_PASSWORD	 CPASSWORD THIS DO_SYS	 open_form,     �� run_file�    �� createapplicationw    �� select_datai    �� open_form_with_resultj    �� format_aerror@    �� do_cmd�    �� do_sysN    �� check_system�    �� select_valueI    �� createdetailapplication�    �� open_form_ex�     �� importfromexcelmodal�!    ��
 locksystem�8    ��1 �	� � �A A �A q��� A � !a��!b��"b� �A 6 �AA A QA �2 � A!Q!A 2 qA� A � �Q�A A Q�A A r� A � � � � 2 �	q � �A A �A q � � �Q�Q�Q�Q�� �A � �A � 4 � A Q� A Q� A � � � � q � !���� �QA s� !A !2 �QA A � A A � A�1�Q���� r�Q�� r�Q�Q� A 3 �� QA A � A A � �� QQ A �AAQ��Q� � � �� � � � A A �� �1� �A 3 q � � q��� ��1� ���� � Q� AAq� � !a A � q� � � � � A � 3 �� 2 � A!Q� A 2 �	Q2 �A A q � �� � � A ��A A q � �� � � A �aA A � �A A r �aA A � �� A�q�A q�A A q a�A A q�� � � � ����QQ1�� � A A r� A A � � A A A A r�q � q � a� QA � A � AA A ���QA � �A A � Q� � q � � q� � � � � � �q A A � ��� � A A A �2� a� � � s� q � � � � q� A !�A A �qQA A � � 1� A � A � � A Q q � q � AA �Aq � ���A�Q�aA ���A � � 2 � � � r 1�qa!� � A A � � AA 2                       `     *     k  7   4   �  &  B   <   H  �  Y   U   
  ,  u   ~   P  3  �   �   P  (   �   �   E   �$  �   �   �$  �)      �)  K*  M    y*   -  Q  !  #-  �.  i  $  �.  nL  o  �  �L  yN  U   )   A                       ~Height = 47
Width = 100
_memberdata =      561<VFPData><memberdata name="createapplicationex" type="method" display="CreateApplicationEx"/><memberdata name="topy" type="method" display="toPY"/><memberdata name="parsesqlword" type="method" display="ParseSQLWord" favorites="True"/><memberdata name="parsesql" type="method" display="ParseSQL" favorites="True"/><memberdata name="check_try" type="method" display="check_try" favorites="True"/><memberdata name="check_key" type="method" display="check_key" favorites="True"/><memberdata name="getmachinecode" typ<VFPData><memberdata name="createapplicationex" t
Name = "base_method"
      �FontBold = .T.
FontName = "΢���ź�"
FontSize = 9
Value = 
Height = 24
MaxLength = 250
SelectOnEntry = .T.
Width = 100
ForeColor = 0,0,128
enablef7 = .F.
bf7mode = .F.
creturnfield = 
sqlstring = 
Name = "_textbox"
     ����    {  {                        =�   %   }            �          �  U    ��  � � � � U  NBUTTON NSHIFT NXCOORD NYCOORDM  ��  � � � �  %�C� � �� � � �	��F � T� � �� � �� � U  NBUTTON NSHIFT NXCOORD NYCOORD THIS TOOLTIPTEXT PICTUREPOSITION CAPTION� ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION  T�  � ��  � � �� U  THIS	 BACKCOLOR PARENT
 MouseLeave,     ��
 MouseEnteri     �� Error
    �� InitG    ��1 12 11A 2 � � A A ��� A A #� q�A A Q A3 a1                       F         g             �  
      �    %    )   {                       �
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��1 � � A A ��� A A #� q�A A Q A2                       �      )   �                       ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��2 � � A A ��� A A #� q�A A Q A3                       �      )   �                       ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��2 � � A A ��� A A #� q�A A Q A3                       �      )   �                       ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��2 � � A A ��� A A #� q�A A Q A3                       �      )   �                       ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��2 � � A A ��� A A #� q�A A Q A3                       �      )   �                       ����    �  �                        �A   %   �           �          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION  U    U   
 ��  � � U  THIS INTERACTIVECHANGE Error,     �� Wheni    �� Validp    �� ProgrammaticChangew    ��2 � � A A ��� A A #� q�A A Q A4 3 3 � 2                       �        �  �          #  !      L  d  $    )   �                       ���    �  �                        ֕   %   i      �     x          �  U  � ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Error,     ��2 � � A A ��� A A #� q�A A Q A3                       �      )   �                       �
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     �
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
 RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
 LCONERROR =  ;
      STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
  &lcOnError
 RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
 LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
 IF  .NOT. EMPTY(LCCODELINEMSG)
    LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
 ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     `���    G  G                        q   %   �      �     �          �  U    T�  � ��  � � �� U  THIS	 BACKCOLOR PARENT� ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION Init,     �� Errorb     ��2 a3 � � A A ��� A A #� q�A A Q A3                       9         ^         )   G                       &
PROCEDURE Init
 THIS.BACKCOLOR = THIS.PARENT.BACKCOLOR
ENDPROC
*------
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     �
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------     NPROCEDURE self_check
 LPARAMETER CTITLE AS STRING
 IF EMPTY(THIS.VALUE)
     MESSAGEBOX('������[' + CTITLE + ']!',64,'ϵͳ��ʾ')
     THIS.SETFOCUS
    RETURN .F.
 ELSE 
    RETURN .T.
 ENDIF 
ENDPROC
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
    RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
    LCONERROR =  ;
         STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
     &lcOnError
    RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
    LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
    IF  .NOT. EMPTY(LCCODELINEMSG)
       LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
    ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
PROCEDURE RightClick
Local CMENU , CMENUNAME
CMENUNAME = Sys(2015)
TEXT TO cMenu NOSHOW TEXTMERGE 
     Lparameters obj as EditBox

     Define Popup <<cMenuName>> shortcut RELATIVE FROM MROW(),MCOL()
     *************************************************************************
     Define BAR _med_undo OF <<cMenuName>> PROMPT "����(\<U)" ;
      MESSAGE "������һ����������"
     Define BAR 3 OF <<cMenuName>> PROMPT "\-"
     Define BAR _med_cut OF <<cMenuName>> PROMPT "����(\<T)" ;
      SKIP FOR _screen.activeform.activecontrol.sellength = 0 or !EMPTY(_screen.activeform.activecontrol.passwordchar) ;
      MESSAGE "��ȥѡ�����ݲ�������������"
     Define BAR _med_copy OF <<cMenuName>> PROMPT "����(\<C)" ;
      SKIP FOR _screen.activeform.activecontrol.sellength = 0 or !EMPTY(_screen.activeform.activecontrol.passwordchar) ;
      MESSAGE "��ѡ�����ݸ��Ƶ���������"
     Define BAR _med_paste OF <<cMenuName>> PROMPT "ճ��(\<P)" ;
      SKIP FOR empty(_cliptext) ;
      MESSAGE "ճ���������ϵ�����"
     Define BAR _med_clear OF <<cMenuName>> PROMPT "ɾ��(\<D)" ;
      SKIP FOR _screen.activeform.activecontrol.sellength = 0 ;
      MESSAGE "��ȥѡ�����ݣ����Ҳ�����ŵ���������"
     Define BAR 8 OF <<cMenuName>> PROMPT "\-"
     Define BAR _med_slcta OF <<cMenuName>> PROMPT "ȫѡ(\<A)" ;
      MESSAGE "ѡ����ǰ�����е������ı���������"
     *************************************************************************
     Define Bar 1 of <<cMenuName>> prompt "���ļ���ȡ"
     Define Bar 2 of <<cMenuName>> prompt "���浽�ļ�"
     Define Bar 11 of <<cMenuName>> prompt "\-"
     Define Bar 12 of <<cMenuName>> prompt "����..."
     Define Bar 13 of <<cMenuName>> prompt "ǰ��ɫ..."
     Define Bar 14 of <<cMenuName>> prompt "����ɫ..."
     On Selection Bar 1 of <<cMenuName>> ;
     do <<cMenuName>>_fromFile with obj

     On Selection Bar 2 of <<cMenuName>> ;
     do <<cMenuName>>_toFile with obj

     On Selection Bar 12 of <<cMenuName>> ;
     do <<cMenuName>>_font with obj

     On Selection Bar 13 of <<cMenuName>> ;
     do <<cMenuName>>_forecolor with obj

     On Selection Bar 14 of <<cMenuName>> ;
     do <<cMenuName>>_backcolor with obj

     Activate Popup <<cMenuName>>

     Procedure <<cMenuName>>_fromFile
     Lparameters oEdit
     *!*���ļ���ȡ
     Local cFile
     cFile=GetFile("txt")
     If !File(cFile)
       Return
     Else
       oEdit.Value=FileToStr(cFile)
     EndIf

     Procedure <<cMenuName>>_toFile
     Lparameters oEdit
     *!*д���ļ�
     Local cFile
     cFile=Putfile("д���ļ�","*.txt","txt")
     If Empty(cFile)
       Return
     Else
       Local nBytes
       nBytes=StrToFile(Alltrim(oEdit.Value),cFile)
       MessageBox("д���ļ���ϣ���"+Alltrim(Str(nBytes))+"�ֽڣ�",0+64,"ϵͳ��ʾ")
     EndIf

     Procedure <<cMenuName>>_font
     Lparameters oEdit as EditBox
     *!*����
     Local cFont
     cFont=GetFont(oEdit.FontName,oEdit.FontSize,"N")
     If Empty(cFont)
       Return
     EndIf
     oEdit.FontName=Left(cFont,At(",",cFont)-1)
     oEdit.FontSize=Evaluate(Substr(cFont,At(",",cFont)+1,At(",",cFont,2)-At(",",cFont)-1))
     DO CASE
     CASE Substr(cFont,At(",",cFont,2)+1)=="N"
       oEdit.FontBold= .F.
       oEdit.FontItalic= .F.
     Case Substr(cFont,At(",",cFont,2)+1)=="B"
       oEdit.FontBold= .T.
       oEdit.FontItalic= .F.
     Case Substr(cFont,At(",",cFont,2)+1)=="I"
       oEdit.FontBold= .F.
       oEdit.FontItalic= .T.
     Case Substr(cFont,At(",",cFont,2)+1)=="BI"
       oEdit.FontBold= .T.
       oEdit.FontItalic= .T.
     OTHERWISE

     EndCase

     Procedure <<cMenuName>>_forecolor
     Lparameters oEdit as EditBox
     *!*ǰ��ɫ
     oEdit.ForeColor=GetColor()

     Procedure <<cMenuName>>_backcolor
     Lparameters oEdit as EditBox
     *!*����ɫ
     oEdit.BackColor=GetColor()
ENDTEXT
CMENU = Strtran(CMENU,'this.','obj.')
Execscript(cMenu,This)

ENDPROC
     ����    �  �                        m?   %         g  �   E          �  U  u  ��  Q� STRING� %�C� � ���_ �+ ��C� ������[�  � ]!�@� ϵͳ��ʾ�x��
 �� � � B�-�� �n � B�a�� � U  CTITLE THIS VALUE SETFOCUS� ��  � � � �� � � � %��9� 
��2 � B� � T� �CCC� ERROR��f�� %�C� �
��� �O T� �CCC� � ERROR()� nError��	 PROGRAM()� cMethod�� LINENO()� nLine��� &lcOnError
 B� �b T� �CEC� C� � � C� � Error:           CC�  Z�C� � Method:       CC� �@�� T� �C�E��' %�C� ��� ��� � � ...
	����0 T� �� C� � Line:            CC� Z��� %�C� �
���� T� �� C� C� � �� � � R� ��C� ��9�	 �x�� U
  NERROR CMETHOD NLINE	 LCONERROR
 LCERRORMSG LCCODELINEMSG ISDEBUG THIS NAME CAPTION� ��  � � T� �C��]��
 M(�  `��% �      Lparameters obj as EditBox� �  �J �D      Define Popup <<cMenuName>> shortcut RELATIVE FROM MROW(),MCOL()�T �N      *************************************************************************�E �?      Define BAR _med_undo OF <<cMenuName>> PROMPT "����(\<U)" ;�* �$       MESSAGE "������һ����������"�4 �.      Define BAR 3 OF <<cMenuName>> PROMPT "\-"�D �>      Define BAR _med_cut OF <<cMenuName>> PROMPT "����(\<T)" ;�~ �x       SKIP FOR _screen.activeform.activecontrol.sellength = 0 or !EMPTY(_screen.activeform.activecontrol.passwordchar) ;�2 �,       MESSAGE "��ȥѡ�����ݲ�������������"�E �?      Define BAR _med_copy OF <<cMenuName>> PROMPT "����(\<C)" ;�~ �x       SKIP FOR _screen.activeform.activecontrol.sellength = 0 or !EMPTY(_screen.activeform.activecontrol.passwordchar) ;�. �(       MESSAGE "��ѡ�����ݸ��Ƶ���������"�F �@      Define BAR _med_paste OF <<cMenuName>> PROMPT "ճ��(\<P)" ;�' �!       SKIP FOR empty(_cliptext) ;�( �"       MESSAGE "ճ���������ϵ�����"�F �@      Define BAR _med_clear OF <<cMenuName>> PROMPT "ɾ��(\<D)" ;�E �?       SKIP FOR _screen.activeform.activecontrol.sellength = 0 ;�: �4       MESSAGE "��ȥѡ�����ݣ����Ҳ�����ŵ���������"�4 �.      Define BAR 8 OF <<cMenuName>> PROMPT "\-"�F �@      Define BAR _med_slcta OF <<cMenuName>> PROMPT "ȫѡ(\<A)" ;�6 �0       MESSAGE "ѡ����ǰ�����е������ı���������"�T �N      *************************************************************************�< �6      Define Bar 1 of <<cMenuName>> prompt "���ļ���ȡ"�< �6      Define Bar 2 of <<cMenuName>> prompt "���浽�ļ�"�5 �/      Define Bar 11 of <<cMenuName>> prompt "\-"�: �4      Define Bar 12 of <<cMenuName>> prompt "����..."�< �6      Define Bar 13 of <<cMenuName>> prompt "ǰ��ɫ..."�< �6      Define Bar 14 of <<cMenuName>> prompt "����ɫ..."�0 �*      On Selection Bar 1 of <<cMenuName>> ;�- �'      do <<cMenuName>>_fromFile with obj� �  �0 �*      On Selection Bar 2 of <<cMenuName>> ;�+ �%      do <<cMenuName>>_toFile with obj� �  �1 �+      On Selection Bar 12 of <<cMenuName>> ;�) �#      do <<cMenuName>>_font with obj� �  �1 �+      On Selection Bar 13 of <<cMenuName>> ;�. �(      do <<cMenuName>>_forecolor with obj� �  �1 �+      On Selection Bar 14 of <<cMenuName>> ;�. �(      do <<cMenuName>>_backcolor with obj� �  �' �!      Activate Popup <<cMenuName>>� �  �+ �%      Procedure <<cMenuName>>_fromFile� �      Lparameters oEdit� �      *!*���ļ���ȡ� �      Local cFile� �      cFile=GetFile("txt")� �      If !File(cFile)� �        Return� �	      Else�) �#        oEdit.Value=FileToStr(cFile)� �
      EndIf� �  �) �#      Procedure <<cMenuName>>_toFile� �      Lparameters oEdit� �      *!*д���ļ�� �      Local cFile�2 �,      cFile=Putfile("д���ļ�","*.txt","txt")� �      If Empty(cFile)� �        Return� �	      Else� �        Local nBytes�9 �3        nBytes=StrToFile(Alltrim(oEdit.Value),cFile)�Y �S        MessageBox("д���ļ���ϣ���"+Alltrim(Str(nBytes))+"�ֽڣ�",0+64,"ϵͳ��ʾ")� �
      EndIf� �  �' �!      Procedure <<cMenuName>>_font�' �!      Lparameters oEdit as EditBox� �      *!*����� �      Local cFont�; �5      cFont=GetFont(oEdit.FontName,oEdit.FontSize,"N")� �      If Empty(cFont)� �        Return� �
      EndIf�5 �/      oEdit.FontName=Left(cFont,At(",",cFont)-1)�a �[      oEdit.FontSize=Evaluate(Substr(cFont,At(",",cFont)+1,At(",",cFont,2)-At(",",cFont)-1))� �      DO CASE�4 �.      CASE Substr(cFont,At(",",cFont,2)+1)=="N"�  �        oEdit.FontBold= .F.�" �        oEdit.FontItalic= .F.�4 �.      Case Substr(cFont,At(",",cFont,2)+1)=="B"�  �        oEdit.FontBold= .T.�" �        oEdit.FontItalic= .F.�4 �.      Case Substr(cFont,At(",",cFont,2)+1)=="I"�  �        oEdit.FontBold= .F.�" �        oEdit.FontItalic= .T.�5 �/      Case Substr(cFont,At(",",cFont,2)+1)=="BI"�  �        oEdit.FontBold= .T.�" �        oEdit.FontItalic= .T.� �      OTHERWISE� �  � �      EndCase� �  �, �&      Procedure <<cMenuName>>_forecolor�' �!      Lparameters oEdit as EditBox� �      *!*ǰ��ɫ�% �      oEdit.ForeColor=GetColor()� �  �, �&      Procedure <<cMenuName>>_backcolor�' �!      Lparameters oEdit as EditBox� �      *!*����ɫ�% �      oEdit.BackColor=GetColor()� � T�  �C�  � this.� obj.��� ��C�   � ���� U  CMENU	 CMENUNAME THIS
 self_check,     �� Error�     ��
 RightClick    ��1 !�� q � q A 2 � � A A ��� A A #� q�A A Q A3 � � Qa �AQ�AA�!Q��aq�aQ�AaaA��Q����a �a �a �a �a qa ���a��1� �a ��aa!�1� ���a qq!a��1Q!A!A!A!Q!Aa !a �qAQa �qAQA �2                       �      
   �   �         �  C  &    )   �                       �PROCEDURE reset_grid

Select (This.RecordSource)

Local OCOLUMN As Column , OCHECKBOX As Checkbox , CCURSOR
CCURSOR = This.RecordSource
For I = 1 To This.ColumnCount
	This.Columns( I ).Width = This.Columns(I).Width + This.NADDLEN
	OCOLUMN = This.Columns(I)
	If Type(OCOLUMN.ControlSource) = "L"
		If Alltrim(Lower(OCOLUMN.CurrentControl)) = "checkbox1"
			OCOLUMN.RemoveObject("checkbox1")
		Endif
		OCOLUMN.AddObject("checkbox1","CheckBox")
		OCOLUMN.CurrentControl = "checkbox1"
		OCHECKBOX = OCOLUMN.CHECKBOX1
		OCOLUMN.Alignment = 2
		OCOLUMN.Sparse = .F.
		OCOLUMN.Width = Max(Len(Field(I,CCURSOR)),4) * 6.75
		OCHECKBOX.BackColor = OCOLUMN.BackColor
		OCHECKBOX.BackStyle = 0
		OCHECKBOX.Caption = ""
		OCHECKBOX.AutoSize = .T.
		OCHECKBOX.Alignment = 2
		OCHECKBOX.ReadOnly = .F.
		OCHECKBOX.Enabled = .T.
		OCHECKBOX.Visible = .T.
	Endif
Endfor
This.ColumnCount = Fcount()
This.RESET_COLOR
Local TNRECPOS
TNRECPOS = This.NRECNO
If Vartype(TNRECPOS) <> "N"
	TNRECPOS = 1
Else
	If TNRECPOS < 1
		TNRECPOS = 1
	Endif
Endif
If Reccount() > 0
	If TNRECPOS > Reccount()
		Go Bottom
	Else
		Go TNRECPOS
	Endif
Endif
This.AutoFit
For I = 1 To This.ColumnCount
	This.Columns( I ).Width = This.Columns(I).Width + 5
Endfor

ENDPROC
PROCEDURE do_filter
Lparameter __cField As String , __cValue As String
If Vartype(__cField) <> "C"
	Return
Endif
If Vartype(__cValue) <> "C"
	Return
Endif
If Empty(__cField) .Or. Empty(__cValue)
	Set Filter To
	This.Refresh
	Return
Endif
If Select(This.RecordSource) = 0
	Return
Endif
Select (This.RecordSource)
LOCAL __vFieldValue
__vFieldValue=EVALUATE(__cField)
If VARTYPE(__vFieldValue) <> "C"
	Wait Window Nowait Timeout 10 "���ַ����ݲ�֧�ֿ��ټ�����"
	Return
Endif
Set Filter To
Set Filter To Occurs(Alltrim(Lower(__cValue)),Alltrim(Lower(__vFieldValue)))>0
This.Refresh
Select (This.RecordSource)

ENDPROC
PROCEDURE reset_color
 FOR NCOLINDEX = 1 TO THIS.COLUMNCOUNT
 THIS.COLUMNS( NCOLINDEX ).CONTROLSOURCE = FIELD(NCOLINDEX)
 THIS.COLUMNS( NCOLINDEX ).HEADER1.CAPTION = FIELD(NCOLINDEX)
 IF MOD(NCOLINDEX,2) = 0
    THIS.COLUMNS( NCOLINDEX ).BACKCOLOR = RGB(236,233,216)
 ELSE 
    THIS.COLUMNS( NCOLINDEX ).BACKCOLOR = RGB(255,255,255)
 ENDIF 
 ENDFOR 
ENDPROC
PROCEDURE allowcellselection_assign
 LPARAMETER VNEWVAL
 IF VNEWVAL
 CLOSE INDEXES 
 ENDIF 
 THIS.ALLOWCELLSELECTION = M.VNEWVAL
ENDPROC
PROCEDURE Valid
*
ENDPROC
PROCEDURE RightClick
If Select(This.RecordSource) = 0
	Return
Endif
Select (This.RecordSource)
Local oCommandBars As XtremeCommandBars.CommandBars
Local oForm As _FORM Of "_base.vcx"
oForm = Thisform
oCommandBars = oForm.oCommandBars
Local oMenuBar As XtremeCommandBars.ICommandBar
oMenuBar = oCommandBars.ContextMenus.Add(0,"��ݷ�ʽ")
oMenuBar.Controls.Add(1,8001,"��һ��")
oMenuBar.Controls.Add( 1 , 8002 , "��һ��" ).Enabled =  .Not. Bof()
oMenuBar.Controls.Add( 1 , 8003 , "��һ��" ).Enabled =  .Not. Eof()
oMenuBar.Controls.Add(1,8004,"���һ��")
oMenuBar.Controls.Add( 1 , 8006 , "��������" ).BEGINGROUP = .T.
oMenuBar.Controls.Add(1,8008,"ȡ������").BeginGroup=.t.
Local nOption
nOption = oMenuBar.SHOWPOPUP(256)
Do Case
	Case nOption = 8001
		Go Top
	Case nOption = 8002
		Skip -1
	Case nOption = 8003
		Skip
	Case nOption = 8004
		Go Bottom
	Case nOption = 8006
		Do Form frm_tool_export
	CASE nOption=8008
		SELECT (this.RecordSource)
		CLOSE INDEXES
		this.SetAll("Picture","","Header")
		GOTO TOP 
		this.Refresh
	Otherwise
Endcase

ENDPROC
     N
PROCEDURE finditem
 LPARAMETER CITEM AS STRING
 IF THIS.BUSEALIAS
 SELECT (THIS.CALIAS)
 LOCATE FOR ALLTRIM(LOWER(ITEMTEXT)) == ALLTRIM(LOWER(CITEM))
 IF FOUND()
    RETURN .T.
 ELSE 
    RETURN .F.
 ENDIF 
 ELSE 
 IF THIS.LISTCOUNT = 0
    RETURN .F.
 ELSE 
    FOR I = 1 TO THIS.LISTCOUNT
       IF LOWER(ALLTRIM(THIS.LIST(I))) = ALLTRIM(LOWER(CITEM))
          RETURN .T.
       ENDIF 
    ENDFOR 
    RETURN .F.
 ENDIF 
 ENDIF 
ENDPROC
*------
PROCEDURE self_check
 LPARAMETER CMSG AS STRING
 IF THIS.LISTCOUNT = 0
  MESSAGEBOX('��ѡ��[' + CMSG + ']!',64,'ϵͳ��ʾ')
  THIS.SETFOCUS
 RETURN .F.
 ENDIF 
 RETURN .T.
ENDPROC
*------
PROCEDURE removeall
 IF THIS.BUSEALIAS
 SELECT (THIS.CALIAS)
 DELETE ALL
  THIS.REQUERY
 ELSE 
 FOR __NLISTITEM = THIS.LISTCOUNT TO 1
     THIS.REMOVEITEM(__NLISTITEM)
 ENDFOR 
 ENDIF 
ENDPROC
*------
PROCEDURE addfromcursor
 LPARAMETER __CALIAS AS STRING , __CFIELDNAME AS STRING
 IF VARTYPE(__CALIAS) <> 'C' .OR. EMPTY(__CALIAS) .OR. VARTYPE(__CFIELDNAME) <> 'C' .OR.  ;
EMPTY(__CFIELDNAME)
 RETURN 
 ENDIF 
 SELECT (__CALIAS)
 SCAN 
  THIS.ADDITEM(EVALUATE(__CALIAS + '.' + __CFIELDNAME))
 ENDSCAN 
ENDPROC
*------
PROCEDURE addfromlistbox
 LPARAMETER __OLISTBOX AS LISTBOX
 IF __OLISTBOX.BUSEALIAS AND THIS.BUSEALIAS
  THIS.ADDFROMCURSOR(__OLISTBOX.CALIAS,'ItemText')
 ELSE 
 FOR __NLISTITEM = 1 TO __OLISTBOX.LISTCOUNT
     THIS.ADDITEM(__OLISTBOX.LIST(__NLISTITEM))
 ENDFOR 
 ENDIF 
ENDPROC
*------
PROCEDURE RemoveItem
 LPARAMETER NINDEX
 IF THIS.BUSEALIAS
 SELECT (THIS.CALIAS)
 LOCATE FOR ALLTRIM(LOWER(ITEMTEXT)) == ALLTRIM(LOWER(THIS.LIST(NINDEX)))
 IF FOUND()
    DELETE 
 ENDIF 
  THIS.REQUERY
 ELSE 
  DODEFAULT(NINDEX)
 ENDIF 
 NODEFAULT 
ENDPROC
*------
PROCEDURE AddItem
 LPARAMETER CITEM , NINDEX , NCOLUMN
 IF THIS.BUSEALIAS
 SELECT (THIS.CALIAS)
 INSERT INTO (THIS.CALIAS) ( ITEMTEXT ) VALUES ( ALLTRIM(CITEM) )
  THIS.REQUERY
 NODEFAULT 
 ENDIF 
ENDPROC
*------
PROCEDURE Destroy
 IF THIS.BUSEALIAS
 SELECT (THIS.CALIAS)
 USE 
 ENDIF 
ENDPROC
*------
PROCEDURE Init
 IF VARTYPE(THIS.CALIAS) <> 'C' .OR. EMPTY(THIS.CALIAS)
 THIS.CALIAS = SYS(2015)
 ENDIF 
 IF THIS.BUSEALIAS
 SELECT 0
 CREATE CURSOR (THIS.CALIAS) ( ITEMTEXT C ( 250 ) )
 THIS.ROWSOURCETYPE = 2
 THIS.ROWSOURCE = THIS.CALIAS
 ENDIF 
ENDPROC
*------
PROCEDURE DblClick
 IF THIS.LISTINDEX > 0
 LOCAL CITEM
 CITEM =  INPUTBOX ('�����µ���Ŀֵ','������Ŀ',THIS.LIST(THIS.LISTINDEX))
 IF  .NOT. EMPTY(CITEM)
    IF THIS.BUSEALIAS
       UPDATE (THIS.CALIAS) SET ITEMTEXT = CITEM WHERE  ;
            ALLTRIM(LOWER(ITEMTEXT)) == ALLTRIM(LOWER(THIS.LIST(THIS.LISTINDEX)))
        THIS.REQUERY
    ELSE 
       THIS.LIST( THIS.LISTINDEX ) = CITEM
    ENDIF 
 ENDIF 
 ENDIF 
ENDPROC
*------
PROCEDURE Error
 LPARAMETER NERROR , CMETHOD , NLINE
 LOCAL LCONERROR , LCERRORMSG , LCCODELINEMSG
 IF  .NOT. _SCREEN.ISDEBUG
 RETURN 
 ENDIF 
 LCONERROR = UPPER(ALLTRIM(ON('ERROR')))
 IF  .NOT. EMPTY(LCONERROR)
 LCONERROR =  ;
      STRTRAN(STRTRAN(STRTRAN(LCONERROR,'ERROR()','nError'),'PROGRAM()','cMethod'),'LINENO()','nLine')
  &lcOnError
 RETURN 
 ENDIF 
 LCERRORMSG =  ;
      MESSAGE() + CHR(13) + CHR(13) + THIS.NAME + CHR(13) + 'Error:           ' +  ;
ALLTRIM(STR(NERROR)) + CHR(13) + 'Method:       ' + LOWER(ALLTRIM(CMETHOD))
 LCCODELINEMSG = MESSAGE(1)
 IF BETWEEN(NLINE,1,-1426062970) AND  .NOT. LCCODELINEMSG = '...'
 LCERRORMSG = LCERRORMSG + CHR(13) + 'Line:            ' + ALLTRIM(STR(NLINE))
 IF  .NOT. EMPTY(LCCODELINEMSG)
    LCERRORMSG = LCERRORMSG + CHR(13) + CHR(13) + LCCODELINEMSG
 ENDIF 
 ENDIF 
 WAIT CLEAR
  MESSAGEBOX(LCERRORMSG,16,_SCREEN.CAPTION)
 * ??? UNKNOWN COMMAND WORD: [$A8H]
ENDPROC
*------
PROCEDURE RightClick
 IF THIS.LISTINDEX = 0
 RETURN 
 ELSE 
  THIS.REMOVEITEM(THIS.LISTINDEX)
 ENDIF 
ENDPROC
*------     N�PROCEDURE open_form
Lparameter cFormName As String , eParam1 As VARIANT , eParam2 As VARIANT , eParam3 As  ;
	VARIANT , eParam4 As VARIANT , eParam5 As VARIANT , eParam6 As VARIANT ,  ;
	eParam7 As VARIANT , eParam8 As VARIANT , eParam9 As VARIANT
Local nPcount , temp , cObj
nPcount = Parameters()
If nPcount = 0
	Messagebox('������ָ���������ƣ�',64,'ϵͳ��ʾ')
	Return
Endif
If nPcount > 10
	Messagebox('������������10����ϵͳ�ܾ�������',64,'ϵͳ��ʾ')
Endif
If At('.',cFormName) > 0
	cObj = Substr(cFormName,At('.',cFormName) + 1)
	cFormName = Left(cFormName,At('.',cFormName) - 1)
Else
	cObj = Sys(2015)
Endif
*Try
	Do Case
		Case nPcount = 1
			Do Form (cFormName) Name (cObj)
		Case nPcount = 2
			Do Form (cFormName) Name (cObj) With eParam1
		Case nPcount = 3
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2
		Case nPcount = 4
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3
		Case nPcount = 5
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4
		Case nPcount = 6
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4 ,  ;
				eParam5
		Case nPcount = 7
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4 ,  ;
				eParam5 , eParam6
		Case nPcount = 8
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4 ,  ;
				eParam5 , eParam6 , eParam7
		Case nPcount = 9
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4 ,  ;
				eParam5 , eParam6 , eParam7 , eParam8
		Case nPcount = 10
			Do Form (cFormName) Name (cObj) With eParam1 , eParam2 , eParam3 , eParam4 ,  ;
				eParam5 , eParam6 , eParam7 , eParam8 , eParam9
		Otherwise
			Messagebox('�����������꣡',64,'ϵͳ��ʾ')
	Endcase
*!*	Catch To oErr
*!*		Messagebox('ִ��ʧ��:' + oErr.Message,64,'ϵͳ��ʾ')
*!*	Endtry

ENDPROC
PROCEDURE run_file
 LPARAMETER CFILEPATH AS STRING , CACTION AS STRING
 IF PARAMETERS() = 0
  MESSAGEBOX('�������㣡',64,'ϵͳ��ʾ')
 RETURN 
 ENDIF 
 IF VARTYPE(CACTION) <> 'C'
 CACTION = 'open'
 ENDIF 
  SHELLEXECUTE(0,CACTION,CFILEPATH,'','',5)
ENDPROC
PROCEDURE createapplication
Lparameter cAppName As String , oParamObj As Collection , bChild As BOOLEAN , cVersion As String
*!*	If Parameters() = 0
*!*		Messagebox('ϵͳ��Ҫ������Ϣ��',64,'ϵͳ��ʾ')
*!*		Return .F.
*!*	Endif
*!*	If Empty(cAppName)
*!*		Messagebox('Ӧ�ó�������Ϊ�գ�',64,'ϵͳ��ʾ')
*!*		Return .F.
*!*	Endif
*!*	Local oBaseForm As Form
*!*	oBaseForm = CREATEOBJECT('base_form',cAppName,oParamObj,bChild,cVersion)
*!*	If Vartype(oBaseForm) = 'O'
*!*		oBaseForm.Show()
*!*	Else
*!*		Return .F.
*!*	Endif
LOCAL oAppObject as AppObject
oAppObject=CreateAppObject(cAppName)
IF VARTYPE(oAppObject)="O"
	=DoWiseMisApplication(oAppObject,oParamObj)
ENDIF 
ENDPROC
PROCEDURE select_data
Lparameter cSelectField, cTable, cWhereExp, cOrderExp, vDefaultValue
If Vartype(cSelectField) <> 'C' .Or. Vartype(cTable) <> 'C'
	Return vDefaultValue
Endif

Local cSQL,cTempCursor
cTempCursor=SYS(2015)
cSQL = 'select top 1 ' + cSelectField + ' as Select_Value from ' + cTable
If Vartype(cWhereExp) = 'C'
	If !Empty(cWhereExp)
		cSQL = cSQL + ' where ' + cWhereExp
	Endif
Endif
If Vartype(cOrderExp) = 'C'
	If !Empty(cOrderExp)
		cSQL = cSQL + ' order by ' + cOrderExp
	Endif
Endif

IF !SelectData(cSQL,cTempCursor)
	Return vDefaultValue
Endif
SELECT (cTempCursor)
vDefaultValue=Select_Value
=CloseAlias(cTempCursor)
RETURN vDefaultValue
ENDPROC
PROCEDURE open_form_with_result
Lparameter cFormName As String , eParam1 As VARIANT , eParam2 As VARIANT , eParam3 As  ;
	VARIANT , eParam4 As VARIANT , eParam5 As VARIANT , eParam6 As VARIANT ,  ;
	eParam7 As VARIANT , eParam8 As VARIANT , eParam9 As VARIANT
Local nPcount
nPcount = Parameters()
If nPcount = 0
	Messagebox('������ָ���������ƣ�',64,'ϵͳ��ʾ')
	Return
Endif
If nPcount > 10
	Messagebox('������������10����ϵͳ�ܾ�������',64,'ϵͳ��ʾ')
Endif
Local oValue
Try
	Do Case
		Case nPcount = 1
			Do Form &cFormName To oValue
		Case nPcount = 2
			Do Form &cFormName With eParam1 To oValue
		Case nPcount = 3
			Do Form &cFormName With eParam1,eParam2 To oValue
		Case nPcount = 4
			Do Form &cFormName With eParam1,eParam2,eParam3 To oValue
		Case nPcount = 5
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4 To oValue
		Case nPcount = 6
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5 To oValue
		Case nPcount = 7
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6 To oValue
		Case nPcount = 8
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7 To oValue
		Case nPcount = 9
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7,eParam8 To oValue
		Case nPcount = 10
			Do Form &cFormName With eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7,eParam8,eParam9 To oValue
		Otherwise
			Messagebox('�����������꣡',64,'ϵͳ��ʾ')
	Endcase
Catch To oErr
	Messagebox('ִ��ʧ��:' + oErr.Message,64,'ϵͳ��ʾ')
Endtry
Return oValue


ENDPROC
PROCEDURE format_aerror
 LPARAMETER COTHERMESSAGE AS STRING , __BSHOWERRORMESSAGE AS BOOLEAN
 IF PARAMETERS() < 2
 __BSHOWERRORMESSAGE = .T.
 ENDIF 
 IF VARTYPE(COTHERMESSAGE) <> 'C'
 COTHERMESSAGE = ''
 ENDIF 
 IF VARTYPE(__BSHOWERRORMESSAGE) <> 'L'
 __BSHOWERRORMESSAGE = .T.
 ENDIF 
 LOCAL ARRAYERROR( 7 )
 = AERROR(ARRAYERROR)
 LOCAL NERROR , CERRORMSG
 NERROR = ARRAYERROR(1)
 CERRORMSG = ''
 LOCAL CERRORTYPE
 DO CASE 
 CASE NERROR = 1526
 CERRORTYPE = '���Ժ�̨���ݿ����Ϣ'
 CERRORMSG = CERRORMSG + SUBSTR(ARRAYERROR(3),48)
 CASE NERROR = 1427 .OR. NERROR = 1429
 CERRORTYPE = 'OLE'
 CERRORMSG =  ;
      CERRORMSG + ARRAYERROR(3) + CHR(10) + 'Ӧ�ó������ƣ�' + ARRAYERROR(4) + CHR(10) +  ;
'������Ϣ��' + IIF(ISNULL(ARRAYERROR(5)),'��',ARRAYERROR(5)) + CHR(10) +  ;
'������Ϣ���ݣ�' + IIF(ISNULL(ARRAYERROR(6)),'��',ARRAYERROR(6)) + CHR(10) +  ;
'OLE����ţ�' + ALLTRIM(STR(ARRAYERROR(7)))
 OTHERWISE 
 CERRORTYPE = 'һ�����д���'
 CERRORMSG = CERRORMSG + ARRAYERROR(2)
 ENDCASE 
 CERRORMSG =  ;
      CERRORTYPE + CHR(10) + CHR(10) + CERRORMSG + CHR(10) + CHR(10) + '�����Ϣ��' +  ;
CHR(10) + CHR(10) + COTHERMESSAGE
 IF __BSHOWERRORMESSAGE
 DO FORM frm_text WITH CERRORMSG , 'ϵͳ��ʾ'
 ENDIF 
 RETURN SUBSTR(ARRAYERROR(3),48)
ENDPROC
PROCEDURE do_cmd
Lparameter cAppName As String , eParam1 As Variant, eParam2 As Variant, eParam3 As Variant, eParam4 As Variant
If Vartype(cAppName) <> "C"
	Return
Endif
If Empty(cAppName)
	Return
Endif
Do Case
	Case Inlist(Left(Lower(cAppName),4),"app.","a03.")
		Return This.CREATEAPPLICATION(Substr(cAppName,5),eParam1,eParam2,eParam3)
	Case Left(Lower(cAppName),4) == "a01."
		Return This.CREATEAPPLICATION(Substr(cAppName,5),eParam1,eParam2,"A01")
	Case Inlist(Left(Lower(cAppName),4),"b00.")
		Return This.CREATEDETAILAPPLICATION( Getwordnum (Substr(cAppName,5),1,","), Getwordnum (Substr(cAppName,5),2,","),.Null.,"")
	Case Left(Lower(cAppName),4) == "b01."
		Return This.CREATEDETAILAPPLICATION( Getwordnum (Substr(cAppName,5),1,","), Getwordnum (Substr(cAppName,5),2,","),.Null.,"A01")
	Case Left(Lower(cAppName),4) == "q01."
		Local CQ01SQL , CQ01REPORT
		CQ01SQL =  ;
			THIS.Select_Value("select sql_str from general_query where select_name='" + Substr(cAppName,5) + "'")
		CQ01REPORT =  ;
			THIS.Select_Value("select ReportPath from general_query where select_name='" + Substr(cAppName,5) + "'")
		Do Form frm_browse With CQ01SQL , Substr(cAppName,5) , CQ01REPORT
	Case Left(Lower(cAppName),4) == "qry."
		Local CQRYSQL , CQRYREPORT
		CQRYSQL =  ;
			THIS.Select_Value("select sql_str from WiseMis_Query where select_name='" + Substr(cAppName,5) + "'")
		CQRYREPORT =  ;
			THIS.Select_Value("select ReportPath from WiseMis_Query where select_name='" + Substr(cAppName,5) +  ;
			"'")
		Do Form frm_browse With CQRYSQL , Substr(cAppName,5) , CQRYREPORT
	Case Left(Lower(cAppName),4) == "sys."
		Return This.do_sys(Substr(cAppName,5),eParam1,eParam2,eParam3,eParam4)
	Otherwise
		Return This.Open_form(cAppName)
Endcase

ENDPROC
PROCEDURE do_sys
Lparameter cAppName As String , eParam1 As Variant, eParam2 As Variant, eParam3 As Variant, eParam4 As Variant
cAppName = Lower(cAppName)
If Vartype(cAppName) <> "C"
	Return
Endif
If Empty(cAppName)
	Return
Endif
Do Case
	Case cAppName == "locksystem"
		this.locksystem()
	Case cAppName == "exit"
		Clear Events
		Quit
	Case cAppName == "changeuser"
		This.Run_File(Addbs(_Screen.cRootPath) + "WiseMis.exe")
		This.do_sys("exit")
	Case cAppName == "main"
		This.Open_form(_Screen.SystemMainForm + "._screen.System_Main")
	Case Left(cAppName,8) == "setting."
		If Select(_Screen.Setting) = 0
			Return ""
		Else
			Select (_Screen.Setting)
			Locate For Alltrim(Lower(Key)) = Alltrim(Lower(Substr(cAppName,9)))
			If Found()
				Return Alltrim(Value)
			Else
				Return ""
			Endif
		Endif
	Case cAppName == "check_system"
		Return This.Check_System()
	Case cAppName == "quickapply"
		This.Open_form("frm_sys_appwizard")
	Case cAppName == "importsystemconfig"
		This.IMPORT_INIT_CONFIG(eParam1)
	Otherwise
		This.Open_form("sys." + cAppName)
Endcase

ENDPROC
PROCEDURE check_system
Local bRunnable
Local CheckSql As String
TEXT TO CheckSql NOSHOW TEXTMERGE
  /*
  ��鵱ǰ���ݿ��Ƿ����WiseMis������ҵ����Ӧ��ϵͳ��Ҫ�����л���
  �������null  ��ʾ�ͻ����Ѿ����ƻ�
      ���� 1    ��ʾ�߱���ȷ���л���
      ���� 0    ��ʾ���߱���ȷ�����л�������Ҫ�ؽ�ϵͳ����
  */
  declare @cTableList varchar(1000)  --��������ݱ��б�
  set @cTableList='wisemis_AppDetail,wisemis_AppIndex,wisemis_AppRelation,wisemis_AppType,WiseMis_WorkFlow'
  declare @cTable varchar(50),@bRun bit
  Set @bRun=1
  while len(@cTableList)>0
  begin
    if charindex(',',@cTableList)>0
      begin
        set @cTable=left(@cTableList,charindex(',',@cTableList)-1)
        set @cTableList=substring(@cTableList,charindex(',',@cTableList)+1,len(@cTableList)-charindex(',',@cTableList))
      end
    else
      begin
        set @cTable=@cTableList
        set @cTableList=''
      end
    --��ʼ���
    if not exists(select * from sysobjects where id=object_id(@cTable) and ObjectProperty(id,'IsUserTable')=1)
     Begin
      Set @bRun=0
     end
  end
  --���ؽ��
  select @bRun as �����

ENDTEXT
Local cAlias , bReturn
cAlias = Sys(2015)
IF !SelectData(CheckSql,cAlias)
	bReturn = .F.
Else
	Select (cAlias)
	bReturn = �����
	=CloseAlias(cAlias)
Endif
Return bReturn

ENDPROC
PROCEDURE select_value
 LPARAMETER CSQL AS STRING , CFIELD AS STRING , BINGORERUNNABLE AS BOOLEAN
 RETURN GetValue(cSql)
ENDPROC
PROCEDURE createdetailapplication
Lparameter cAppName As String , oParamObj As Collection , bChild As BOOLEAN , cVersion As  ;
	STRING
*!*	If Parameters() = 0
*!*		Messagebox('ϵͳ��Ҫ������Ϣ��',64,'ϵͳ��ʾ')
*!*		Return .F.
*!*	Endif
*!*	If Empty(cAppName)
*!*		Messagebox('Ӧ�ó�������Ϊ�գ�',64,'ϵͳ��ʾ')
*!*		Return .F.
*!*	Endif
*!*	Local ODETAILFORM As Form
*!*	ODETAILFORM = Createobject('detail_form',cAppName,cVersion)
*!*	If Vartype(ODETAILFORM) = 'O'
*!*		ODETAILFORM.Show()
*!*	Else
*!*		Return .F.
*!*	Endif
LOCAL oAppObject as AppObject
oAppObject=CreateAppObject(cAppName)
IF VARTYPE(oAppObject)="O"
	=DoWiseMisApplication(oAppObject)
ENDIF 
ENDPROC
PROCEDURE open_form_ex
 LPARAMETER cFormName AS STRING , eParam1 AS VARIANT , eParam2 AS VARIANT , eParam3 AS  ;
      VARIANT , eParam4 AS VARIANT , eParam5 AS VARIANT , eParam6 AS VARIANT ,  ;
      eParam7 AS VARIANT , eParam8 AS VARIANT , eParam9 AS VARIANT
 RETURN THIS.Open_form_WITH_RESULT(cFormName,eParam1,eParam2,eParam3,eParam4,eParam5,eParam6,eParam7,eParam8,eParam9)
ENDPROC
PROCEDURE importfromexcelmodal
LPARAMETERS __cExcelModalName as String
IF VARTYPE(__cExcelModalName)<>"C" OR EMPTY(__cExcelModalName)
	RETURN 
ENDIF 
LOCAL cSql
TEXT TO cSql NOSHOW TEXTMERGE 
IF exists(select * from sysobjects where id=object_id('WiseMis_ExcelImportIndex') AND ObjectProperty(id,'IsUserTable')=1)
	SELECT 1
ELSE
	SELECT 0
ENDTEXT 
IF this.Select_Value(cSql)=0
	MESSAGEBOX("��ǰϵͳ��֧�ִ�Excelģ�嵼�룡",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
LOCAL cSql
TEXT TO cSql NOSHOW TEXTMERGE 
IF exists(select * from WiseMis_ExcelImportIndex where ModalName='<<__cExcelModalName>>')
	SELECT 1
ELSE
	SELECT 0
ENDTEXT 
IF this.Select_Value(cSql)=0
	MESSAGEBOX("ģ�岻���ڣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

If _Screen.isdemouser
	Messagebox("��ʾ�˺��û�����ʹ�õ��빦�ܣ�",64,"ϵͳ��ʾ")
	Return
Endif

LOCAL cExcelFile
cExcelFile=GETFILE("xls","","",0,"ѡ�����ļ�")
IF !FILE(cExcelFile)
	MESSAGEBOX("�ļ������ڣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cSql,cCursorList
cCursorList="cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail"
TEXT TO cSql NOSHOW TEXTMERGE 
DECLARE @ModalName varchar(50)
SET @ModalName='<<__cExcelModalName>>'
SELECT * FROM WiseMis_ExcelImportIndex WHERE ModalName=@ModalName
SELECT * FROM WiseMis_ExcelImportDetail WHERE ModalName=@ModalName
ENDTEXT 
IF !SelectData(cSql,cCursorList)
	MESSAGEBOX("��ѯģ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
SELECT cursor_WiseMisExcelImportIndex
IF RECCOUNT()=0
	MESSAGEBOX("ģ�岻���ڣ�",0+64,"ϵͳ��ʾ")
	=CloseAlias("cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail")
	RETURN 
ENDIF 
LOCAL cBaseTable,cSheetName,nTitleLine,nDataLine,nSuccessCount,nFailedCount,nIgnoreCount,nLastRow,nRowsCountOnce
STORE 0 TO nSuccessCount,nFailedCount,nIgnoreCount,nLastRow
cBaseTable=ALLTRIM(BaseTable)
cSheetName=ALLTRIM(SheetName)
nTitleLine=TitleLine
nDataLine=DataLine

LOCAL oExcel as Excel.Application
oExcel=CREATEOBJECT("Excel.Application")
LOCAL oWorkbook as Excel.Workbook
oWorkbook=oExcel.Workbooks.Open(cExcelFile)
LOCAL oWorksheet as Excel.Worksheet
oWorksheet=oWorkbook.Worksheets(cSheetName)
IF VARTYPE(oWorksheet)<>"O"
	MESSAGEBOX("��Excel�ļ��޷�ͨ����֤��",0+64,"ϵͳ��ʾ")
	=CloseAlias("cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail")
	oWorkbook.Close(.f.)
	oExcel.Quit
	RETURN 
ENDIF 

nRowsCountOnce=INPUTBOX("һ��"+TRANSFORM(oWorksheet.UsedRange.Rows.Count)+"��,���趨һ�ε���������","һ�ε�������",TRANSFORM(NVL(BatchCount,1)))
IF EMPTY(nRowsCountOnce)
	RETURN 
ENDIF 
nRowsCountOnce=VAL(nRowsCountOnce)
IF nRowsCountOnce<=0
	nRowsCountOnce=1
ENDIF 
IF nRowsCountOnce>1
	IF MESSAGEBOX("һ�ε��볬��һ�н��޷���ȷ��λ����ͺ����кţ���ȷ��Ҫ������",1+32,"ϵͳ��ʾ")<>1
		RETURN 
	ENDIF 
ENDIF 

LOCAL cInsertFields,cInsertValues,cKeyFieldsExpr,cSql,cUpdateFieldsExpr
STORE "" TO cInsertFields,cInsertValues,cKeyFieldsExpr,cSql,cUpdateFieldsExpr
SELECT cursor_WiseMisExcelImportDetail
SCAN 
	LOCAL cSqlFieldName
	cSqlFieldName=ALLTRIM(SqlField)
	_screen.AddProperty("__"+cSqlFieldName,null)
	IF IsInsert
		cInsertFields = cInsertFields + IIF(EMPTY(cInsertFields),"",",") + "[" + cSqlFieldName + "]"
		cInsertValues = cInsertValues + IIF(EMPTY(cInsertValues),"",",") + "?_screen.__" + cSqlFieldName
	ENDIF 
	IF IsUpdate
		cUpdateFieldsExpr = cUpdateFieldsExpr + IIF(EMPTY(cUpdateFieldsExpr),"",",") + "[" + cSqlFieldName + "]=?_screen.__" + cSqlFieldName
	ENDIF 
	IF IsKey
		cKeyFieldsExpr = cKeyFieldsExpr + IIF(EMPTY(cKeyFieldsExpr),""," and ") + "[" + cSqlFieldName + "]=?_screen.__" + cSqlFieldName
	ENDIF 
ENDSCAN 
IF !EMPTY(cKeyFieldsExpr) AND !EMPTY(cUpdateFieldsExpr)
	cSql="if exists(select * from ["+cBaseTable+"] where "+cKeyFieldsExpr+")"
	cSql = cSql + CHR(13) + CHR(10) + CHR(7) + "update [" + cBaseTable + "] set " + cUpdateFieldsExpr + " where " + cKeyFieldsExpr
	IF !EMPTY(cInsertFields)
		cSql = cSql + CHR(13) + CHR(10) + "else"
		cSql = cSql + CHR(13) + CHR(10) + CHR(7) + "insert into [" + cBaseTable + "](" + cInsertFields + ") values (" + cInsertValues +")"
	ENDIF 
ELSE
	IF !EMPTY(cInsertFields)
		cSql = "insert into [" + cBaseTable + "](" + cInsertFields + ") values (" + cInsertValues +")"
	ENDIF 
ENDIF 

SELECT 0
CREATE CURSOR cursor_schame (SqlField C(50),ExcelColumn I,IsKey L,IsInsert L,IsUpdate L)
LOCAL cCmdScript,bIsFound
cCmdScript=""
SELECT cursor_WiseMisExcelImportDetail
SCAN 
	bIsFound=.f.
	LOCAL cSqlField,cExcelField,bIsKey,bIsInsert,bIsUpdate
	cSqlField=ALLTRIM(SqlField)
	cExcelField=ALLTRIM(ExcelField)
	bIsKey=IsKey
	bIsInsert=IsInsert
	bIsUpdate=IsUpdate
	FOR __i=1 TO oWorksheet.UsedRange.Columns.Count
		IF ALLTRIM(LOWER(NVL(oWorksheet.UsedRange.Cells(nTitleLine,__i).Value,"")))=ALLTRIM(LOWER(cExcelField))
			bIsFound=.t.
			INSERT INTO cursor_schame(SqlField,ExcelColumn,IsKey,IsInsert,IsUpdate) VALUES (cSqlField,__i,bIsKey,bIsInsert,bIsUpdate)
			SELECT cursor_WiseMisExcelImportDetail
		ENDIF 
	ENDFOR 
	IF !bIsFound
		MESSAGEBOX("�ֶ��޷�ͨ����֤��",0+64,"ϵͳ��ʾ")
		=CloseAlias("cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail,cursor_schame")
		oWorkbook.Close(.f.)
		oExcel.Quit
		RETURN 
	ENDIF 
ENDSCAN 
=CloseAlias("cursor_WiseMisExcelImportIndex,cursor_WiseMisExcelImportDetail")

LOCAL cErrorMessage,nRowCount,nRowsCountOnce,nRowsExec
cErrorMessage=""
nRowCount=oWorksheet.UsedRange.Rows.Count
nRowsExec=0

LOCAL ctempSql,cTempCursor
ctempSql=""


FOR __i=nDataLine TO nRowCount
	nLastRow=__i
	Wait Window "��ǰ���ȣ�"+Transform(Int(__i/nRowCount*100))+"%,��ǰ��"+TRANSFORM(__i)+"�С�" Noclear Nowait 
	SELECT cursor_schame
	SCAN 
		LOCAL cSqlFieldName,nExcelField,cCmd
		cSqlFieldName=ALLTRIM(SqlField)
		nExcelField=ExcelColumn
		cCmd="_screen.__"+cSqlFieldName+"=oWorksheet.UsedRange.Cells("+TRANSFORM(__i)+","+TRANSFORM(nExcelField)+").Value"
		&cCmd
	ENDSCAN 
	ctempSql = ctempSql + CHR(13) + CHR(10) + parsesql(cSql)
	nRowsExec = nRowsExec + 1 
	IF nRowsExec<nRowsCountOnce AND __i<nRowCount
		LOOP 
	ENDIF 
	ctempSql = ctempSql +  CHR(13) + CHR(10) + "select @@ROWCOUNT as Ӱ������"
	cTempCursor=SYS(2015)
	IF !SelectData(cTempSQL,cTempCursor)
		nFailedCount = nFailedCount + nRowsExec 
		cErrorMessage = cErrorMessage + CHR(13) + CHR(10) + "��" + TRANSFORM(__i) + "�е���ʧ�ܣ�"
		IF MESSAGEBOX("�Ƿ�������룿",1+32,"ϵͳ��ʾ")<>1
			EXIT 
		ENDIF 
	ELSE
		SELECT (cTempCursor)
		IF Ӱ������=0
			cErrorMessage = cErrorMessage + CHR(13) + CHR(10) + "��" + TRANSFORM(__i) + "�б����ԣ�"
			nIgnoreCount = nIgnoreCount + 1
		ELSE
			nSuccessCount = nSuccessCount + nRowsExec 
		ENDIF 
		=CloseAlias(cTempCursor)
	ENDIF 
	ctempSql=""
	nRowsExec=0
ENDFOR 
WAIT CLEAR 
SELECT cursor_schame
SCAN 
	LOCAL cSqlField
	cSqlField=ALLTRIM(SqlField)
	=REMOVEPROPERTY(_screen,"__"+cSqlField)
ENDSCAN 
=CloseAlias("cursor_schame")
MESSAGEBOX("������ɣ�",0+64,"ϵͳ��ʾ")
LOCAL cSummaryText
TEXT TO cSummaryText NOSHOW TEXTMERGE 
-------------------------------------
��������<<nRowCount>>
�����кţ�<<nTitleLine>>
һ�δ�����<<nRowsCountOnce>>��
������ʼ�кţ�<<nDataLine>>
����������<<nRowCount-nDataLine+1>>
������кţ�<<nLastRow>>
����ɹ�������<<nSuccessCount>>
����ʧ��������<<nFailedCount>>�����һ�ε��볬��һ�У��˽��������
������������<<nIgnoreCount>>�����һ�ε��볬��һ�У��˽��������
ENDTEXT 
cErrorMessage = cErrorMessage + CHR(13) + CHR(10) + cSummaryText
IF !EMPTY(cErrorMessage)
	=STRTOFILE(cErrorMessage,"C:\Error.txt")
	this.Run_File("C:\Error.txt")
ENDIF 
oWorkbook.Close(.f.)
oExcel.Quit
ENDPROC
PROCEDURE locksystem
Local nTryTimes , bCheckOK
bCheckOK = .F.
nTryTimes = 5

Local cOldPass
cOldPass = MD5String(_Screen.cUserPassword)
Do While nTryTimes >= 0 And !bCheckOK
	Do Form frm_tool_password To cPassword With "ϵͳ�ѱ�����(��ʣ" + Transform(nTryTimes) + "�����Ի���)" , "��������"
	If MD5STRING(cPassword) <> cOldPass
		Messagebox("������������޷�������",64,"ϵͳ��ʾ")
		nTryTimes = nTryTimes - 1
	Else
		bCheckOK = .T.
	Endif
Enddo
If bCheckOK
Else
	This.do_sys("exit")
Endif

ENDPROC
     A���    (  (                        ��   %         �  �   �          �  U   F��  � ��% �� Q� COLUMN� Q� CHECKBOX� � T� ��  � �� �� ���(��  � ���+ T�  � �� �� �C � �  � � �  �	 �� T� �C � �  � �� %�C� �
 b� L����! %�CC� � @��	 checkbox1��� � ��C�	 checkbox1� � �� �$ ��C�	 checkbox1� CheckBox� � �� T� � ��	 checkbox1�� T� �� � �� T� � ���� T� � �-��( T� � �CCC� � />�D�      @�� T� � �� � �� T� � �� �� T� � ��  �� T� � �a�� T� � ���� T� � �-�� T� � �a�� T� � �a�� � �� T�  � �C.��
 ��  � � �� � T� ��  � �� %�C� ��� N��Y� T� ���� ��� %�� ���� T� ���� � � %�CN� ���� %�� CN���� #6� ���	 #�� �� � �
 ��  � � �� ���(��  � ���( T�  � �� �� �C � �  � � ��� �� U  THIS RECORDSOURCE OCOLUMN	 OCHECKBOX CCURSOR I COLUMNCOUNT COLUMNS WIDTH NADDLEN CONTROLSOURCE CURRENTCONTROL REMOVEOBJECT	 ADDOBJECT	 CHECKBOX1	 ALIGNMENT SPARSE	 BACKCOLOR	 BACKSTYLE CAPTION AUTOSIZE READONLY ENABLED VISIBLE RESET_COLOR TNRECPOS NRECNO AUTOFITN ��  Q� STRING� Q� STRING� %�C�  ��� C��8 � B� � %�C� ��� C��U � B� � %�C�  �� C� ���� � G(�
 �� � � B� � %�C� � W� ��� � B� � F�� � �� �� � T� �C�  ��� %�C� ��� C���+ R,:���
��� ���ַ����ݲ�֧�ֿ��ټ������� B� � G(� G(�CCC� @�CC� @��� ��
 �� � � F�� � �� U  __CFIELD __CVALUE THIS REFRESH RECORDSOURCE __VFIELDVALUE�  ��  ���(�� � ��� � T� � ��  �� �C�  /�� T� � ��  �� � �C�  /�� %�C�  �G� ��� �" T� � ��  �� �C�������^�� �� �" T� � ��  �� �C�������^�� � �� U 	 NCOLINDEX THIS COLUMNCOUNT COLUMNS CONTROLSOURCE HEADER1 CAPTION	 BACKCOLOR2  ��  � %��  �� � �� � T� � ���  �� U  VNEWVAL THIS ALLOWCELLSELECTION  U  � %�C�  � W� �� � B� � F��  � ��( �� Q� XTREMECOMMANDBARS.CommandBars� �� Q� _FORM���	 _base.vcx�� T� �� �� T� �� � ��( �� Q� XTREMECOMMANDBARS.ICommandBar�" T� �C� � ��ݷ�ʽ� � � ��  ��C��A� ��һ��� � � ��/ T� � � �����B��� ��һ����	 �C
��/ T� � � �����C��� ��һ����	 �C+
��" ��C��D� ���һ��� � � ��/ T� � � �����F��� ����������
 �a��/ T� � � �����H��� ȡ��������
 �a�� �� � T� �C� � � �� H� ��� �� �A��� #)� �� �B��3�
 H������ �� �C��I� H� �� �D��`� #6� �� �F���� � frm_tool_export� �� �H���� F��  � �� ��# ��C� Picture�  � Header�  � �� #)�
 ��  � � 2��� � U  THIS RECORDSOURCE OCOMMANDBARS OFORM THISFORM OMENUBAR CONTEXTMENUS ADD CONTROLS ENABLED
 BEGINGROUP NOPTION	 SHOWPOPUP FRM_TOOL_EXPORT SETALL REFRESH
 reset_grid,     ��	 do_filtere    �� reset_color�    �� allowcellselection_assign    �� Validg    ��
 RightClickn    ��1 � R��Qq�A A�� �1� � � � A A � � q Q� � � A A Q � � A A � ��A 3 �QA A QA A �a � A A aA A � q � Q�A A a �� � 3 ���a!� !A A 2 q � Q A !2 3 aA A � ��� �!��!��q Q� !Q !� !A !Q !q!� Q 1Q � � A 2                       �     2     z  6   M   �  �  S   W   	  {	  ^   ]   �	  �	  e   ^   �	  �  h    )   (                       *�PROCEDURE select_data
LPARAMETERS P1,P2,P3,P4,P5
RETURN SelectData(this.sql_cmd,this.cursor_name)
ENDPROC
PROCEDURE wait_message
LPARAMETER CMESSAGE AS STRING , BTYPE AS BOOLEAN

=SetStatusText(cMessage)
ENDPROC
PROCEDURE close_alias
 LPARAMETER __cAliasList AS STRING
=CloseAlias(__cAliasList)
ENDPROC
PROCEDURE refresh_data
Lparameter cSql As String , cCursor As String , oGrid As _grid

LOCAL nStartSec
nStartSec=SECONDS()
this.cursor_name=cCursor
=CloseAlias(cCursor)
IF !SelectData(cSql,cCursor)
	this.wait_message("��ѯ����ʧ�ܣ�")
	RETURN .f.
ENDIF 

IF SELECT(cCursor)=0
	MESSAGEBOX("��ѯ�ɹ�����û�з������ݣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 

SELECT (cCursor)

LOCAL nUsedTime,cUsedTime
nUsedTime=SECONDS()-nStartSec
IF nUsedTime<60
ENDIF 

this.wait_message("��¼������"+TRANSFORM(RECCOUNT(cCursor))+",��ѯ��ʱ��"+ToTimeString(SECONDS()-nStartSec))
oGrid.RecordSource=null
oGrid.RecordSourceType= 1
oGrid.RecordSource=cCursor
oGrid.AllowCellSelection= .F.
oGrid.reset_grid()
ENDPROC
PROCEDURE write_config
Lparameter cKey As String , cValue As String , isRegister As BOOLEAN
If Vartype(isRegister) <> "L"
	isRegister = .F.
Endif

Local cFile
If isRegister
	cFile = _Screen.cRegisterFile
Else
	cFile = _Screen.cConfigFile
Endif
If !File(cFile)
	Select 0
	Create Table (cFile) Free ( Key C ( 20 ) , Value C ( 200 ) )
	USE 
ENDIF 
If Select("WiseMisConfig") > 0
	Select WiseMisConfig
	Use
ENDIF

Select 0
Use Exclusive (cFile) Alias WiseMisConfig
If Select("WiseMisConfig") > 0
	Select WiseMisConfig
	Locate For LEFT(ALLTRIM(LOWER(Key)),20)==	LEFT(Alltrim(Lower(cKey)),20)
	If !Found()
		Insert Into WiseMisConfig ( Key , Value ) Values ( cKey , cValue )
	ELSE
		REPLACE Value WITH cValue
	Endif
	Use
Endif

ENDPROC
PROCEDURE get_config
Lparameter cKey As String , isRegister As BOOLEAN
If Vartype(isRegister) <> "L"
	isRegister = .F.
Endif
cKey = Left(cKey,20)
Local cFile , cValue
cValue = ""
If isRegister
	cFile = _Screen.cRegisterFile
Else
	cFile = _Screen.cConfigFile
Endif
Local cConfigName
If isRegister
	cConfigName = "_1SL0LLCC4"
Else
	cConfigName = "config"
Endif
If File(cFile)
	If Select(cConfigName) = 0
		Select 0
		Use (cFile) Alias (cConfigName)
	Else
		Select (cConfigName)
	Endif
	Locate For  ;
		LEFT(Alltrim(Lower(Evaluate(cConfigName + ".key"))),20) =  ;
		LEFT(Alltrim(Lower(cKey)),20)
	If Found()
		cValue = Alltrim(Evaluate(cConfigName + ".value"))
	Else
		cValue = ""
	Endif
	Use
	Return cValue
Else
	Return ""
Endif

ENDPROC
PROCEDURE fill_data_listitem
Lparameter obj As ComboBox , cSql As String , cReturnField As String , bIsAdd As BOOLEAN
If Vartype(obj) <> "O"
	Return
Endif
If Vartype(cSql) <> "C"
	Return
Endif
If Empty(cSql)
	Return ""
Endif
If Vartype(bIsAdd) <> "L"
	bIsAdd = .F.
Endif
If !bIsAdd
	obj.Clear
Endif
Select 0
This.cursor_name = Sys(2015)
This.Sql_Cmd = cSql
If !This.Select_Data()
	Return
Else
	Select (This.cursor_name)
	If Vartype(cReturnField) <> "C"
		cReturnField = Field(1)
	Endif
	If Empty(cReturnField)
		cReturnField = Field(1)
	Endif
	Scan
		obj.AddItem(Alltrim(Evaluate(cReturnField)))
	Endscan
	This.Close_Alias(This.cursor_name)
Endif

ENDPROC
PROCEDURE sql_cmd_assign
Lparameter VNEWVAL
This.Sql_Cmd=this.transform_sql(vNewVal)
ENDPROC
PROCEDURE add_to_string
Lparameter __cSourceString As String , __cAddedString As String
If Vartype(__cSourceString) <> "C" Or Vartype(__cAddedString) <> "C"
	Return ""
Endif
Do While Len(__cAddedString) > 0
	__cSourceString = __cSourceString + Left(__cAddedString,512000)
	__cAddedString = Substr(__cAddedString,512001)
Enddo
Return __cSourceString

ENDPROC
PROCEDURE toexcel
Lparameter cModalName,cCurrentCursor,bSave,bPreviewDirect,bPrintDirect, bNoDialog
If Vartype(cModalName) <> "C" Or Empty(cModalName)
	Do Form frm_get_data To cModalName With "select ModalName as ģ������,BaseTable as ����,isET as �Ƿ�WPS����,Remark as ��ע from WiseMis_ExcelModal order by BaseTable,OrderID","ģ������"
	If Vartype(cModalName) <> "C" Or Empty(cModalName)
		cModalName = ""
	Endif
Endif
If Vartype(cCurrentCursor) <> "C" Or Empty(cCurrentCursor)
	cCurrentCursor = Alias()
Endif
If Vartype(bNoDialog) <> "L"
	bNoDialog = .F.
Endif
If Select(cCurrentCursor) = 0
	cCurrentCursor = Alias()
Endif
If Vartype(bPreviewDirect) <> "L"
	bPreviewDirect = .F.
Endif
If Vartype(bPrintDirect) <> "L"
	bPrintDirect = .F.
Endif
If Vartype(bSave) <> "L"
	bSave = .F.
Endif
Local cSql
TEXT TO cSql NOSHOW TEXTMERGE
  DECLARE @ModalName varchar(50)
  SET @ModalName="<<cModalName>>"

  IF exists(select * from sysobjects where id=object_id("WiseMis_ExcelModal") AND ObjectProperty(id,"IsUserTable")=1)
  	BEGIN
  		IF exists(select * from WiseMis_ExcelModal where ModalName=@ModalName)
  			SELECT 1
  		ELSE
  			SELECT 0
  	END
  ELSE
  	SELECT 0
ENDTEXT
IF GetValue(cSql)=0
	Messagebox("ģ�治���ڻ��߲���֧�֣�",64,"ϵͳ��ʾ")
	Return
Endif
cSql = "select * from WiseMis_ExcelModal where ModalName='" + cModalName + "'"
This.Sql_Cmd = cSql
This.cursor_name = Sys(2015)
If !This.Select_Data()
	Messagebox("��ѯģ����Ϣʧ�ܣ�",64,"ϵͳ��ʾ")
	Return
Endif
Select (This.cursor_name)
Local cSqlText,cCursorList,cExcelData,bIsET
cSqlText = SqlText
cCursorList = Alltrim(CursorList)
If Empty(cCursorList)
	cCursorList = Sys(2015)
Endif
cExcelData = ExcelData
bIsET = Nvl(IsET,.F.)
This.Close_Alias(This.cursor_name)
If Select(cCurrentCursor) > 0
	Select (cCurrentCursor)
Endif
If !Empty(cSqlText)
	This.Sql_Cmd = cSqlText
	This.cursor_name = cCursorList
	If !This.Select_Data()
		Messagebox("��ѯ����ʧ�ܣ�",64,"ϵͳ��ʾ")
		Return
	Endif
Endif
Local cOutputFileName
=ImageToFile(cExcelData,@cOutputFileName)
If !File(cOutputFileName)
	Messagebox("�ͷ�ģ��ʧ�ܣ�",64,"ϵͳ��ʾ")
	This.Close_Alias(cCursorList)
	Return
Endif
Local cExcelOutputFile
If bSave
	If bNoDialog
		cExcelOutputFile = ADDBS(_Screen.cFilesPath) + Sys(2015) + "." + Iif(bIsET,"et","xls")
	Else
		If bIsET
			cExcelOutputFile = Putfile("���汨��","","et")
		Else
			cExcelOutputFile = Putfile("���汨��","","xls")
		Endif
	Endif
Endif
Local cFirstCursor
cFirstCursor =  Getwordnum (cCursorList,1,",")
If !Empty(cFirstCursor)
	If Select(cFirstCursor) > 0
		Select (cFirstCursor)
	Endif
Endif
= ToExcel(cOutputFileName,cExcelOutputFile,bIsET,bPreviewDirect,bPrintDirect)
If Vartype(cExcelOutputFile) = "C" And !Empty(cExcelOutputFile)
	If File(cExcelOutputFile)
		=RunFile(cExcelOutputFile)
	Endif
Endif
Erase (cOutputFileName)
This.Close_Alias(cCursorList)

ENDPROC
PROCEDURE toexcel2
Lparameter cModalName As String , cCurrentCursor As String , bSave As BOOLEAN ,	bPreviewDirect As BOOLEAN , bPrintDirect As BOOLEAN , bNoDialog As BOOLEAN,cFileName as String
If Vartype(cModalName) <> "C" Or Empty(cModalName)
	Do Form frm_get_data To cModalName With "select ModalName as ģ������,BaseTable as ����,isET as �Ƿ�WPS����,Remark as ��ע from WiseMis_ExcelModal order by BaseTable,OrderID" , "ģ������"
	If Vartype(cModalName) <> "C" Or Empty(cModalName)
		cModalName = ""
	Endif
Endif
If Vartype(cCurrentCursor) <> "C" Or Empty(cCurrentCursor)
	cCurrentCursor = Alias()
Endif
If Vartype(bNoDialog) <> "L"
	bNoDialog = .F.
Endif
If Select(cCurrentCursor) = 0
	cCurrentCursor = Alias()
Endif
If Vartype(bPreviewDirect) <> "L"
	bPreviewDirect = .F.
Endif
If Vartype(bPrintDirect) <> "L"
	bPrintDirect = .F.
Endif
If Vartype(bSave) <> "L"
	bSave = .F.
Endif
IF VARTYPE(cFileName)<>"C"
	cFileName=""
ENDIF 

Local cSql
TEXT TO cSql NOSHOW TEXTMERGE
  DECLARE @ModalName varchar(50)
  SET @ModalName='<<cModalName>>'

  IF exists(select * from sysobjects where id=object_id('WiseMis_ExcelModal') AND ObjectProperty(id,'IsUserTable')=1)
  	BEGIN
  		IF exists(select * from WiseMis_ExcelModal where ModalName=@ModalName)
  			SELECT 1
  		ELSE
  			SELECT 0
  	END
  ELSE
  	SELECT 0
ENDTEXT
IF GetValue(cSql)=0
	Messagebox("ģ�治���ڻ��߲���֧�֣�",64,"ϵͳ��ʾ")
	RETURN ""
Endif
cSql = "select * from WiseMis_ExcelModal where ModalName='" + cModalName + "'"
LOCAL cTempCursor
cTempCursor=SYS(2015)
This.Sql_Cmd = cSql
This.cursor_name = Sys(2015)
IF !SelectData(cSql,cTempCursor)
	Messagebox("��ѯģ����Ϣʧ�ܣ�",64,"ϵͳ��ʾ")
	RETURN ""
Endif
Select (cTempCursor)
Local cSqlText , cCursorList , cExcelData , bIsET
cSqlText = SQLTEXT
cCursorList = Alltrim(CURSORLIST)
If Empty(cCursorList)
	cCursorList = Sys(2015)
Endif
cExcelData = EXCELDATA
bIsET = Nvl(ISET,.F.)
=CloseAlias(cTempCursor)
If Select(cCurrentCursor) > 0
	Select (cCurrentCursor)
Endif
If !Empty(cSqlText)
	IF !SelectData(cSqlText,cCursorList)
		Messagebox("��ѯ����ʧ�ܣ�",64,"ϵͳ��ʾ")
		RETURN ""
	Endif
Endif
Local cOutputFileName
cOutputFileName=ADDBS(_screen.cFilesPath)+SYS(2015)+Iif(bIsET,".et",".xls")
=ImageToFile(cExcelData,cOutputFileName)
If !File(cOutputFileName)
	Messagebox("�ͷ�ģ��ʧ�ܣ�",64,"ϵͳ��ʾ")
	=CloseAlias(cCursorList)
	RETURN ""
Endif
Local cExcelOutputFile
If bSave
	If bNoDialog
		cExcelOutputFile = ADDBS(_Screen.cFilesPath) + IIF(EMPTY(cFileName),Sys(2015),cFileName) + "." + Iif(bIsET,"et","xls")
	Else
		If bIsET
			cExcelOutputFile = Putfile("���汨��",cFileName,"et")
		Else
			cExcelOutputFile = Putfile("���汨��",cFileName,"xls")
		Endif
	Endif
Endif
Local CFIRSTCURSOR
CFIRSTCURSOR =  Getwordnum (cCursorList,1,",")
If !Empty(CFIRSTCURSOR)
	If Select(CFIRSTCURSOR) > 0
		Select (CFIRSTCURSOR)
	Endif
Endif
= TOEXCEL(cOutputFileName,cExcelOutputFile,bIsET,bPreviewDirect,bPrintDirect)
Erase (cOutputFileName)
=CloseAlias(cCursorList)
If Vartype(cExcelOutputFile) = "C" And !Empty(cExcelOutputFile)
	If File(cExcelOutputFile)
		RETURN cExcelOutputFile
	Endif
Endif
RETURN ""
ENDPROC
PROCEDURE exec_sql
LPARAMETERS P1,P2,P3,P4,P5
RETURN Execute(this.sql_cmd)
ENDPROC
PROCEDURE parsesql
LPARAMETERS cSqlCmd
RETURN ParseSql(this.transform_sql(cSqlCmd))
ENDPROC
PROCEDURE transform_sql
LPARAMETERS cSqlCmd
RETURN STRTRAN(STRTRAN(cSqlCmd,"thisform.","_screen."+this.cTempObject+".",-1,-1,1),"this.","_screen."+this.cTempObject+".",-1,-1,1)
ENDPROC
PROCEDURE clear_form_info
LPARAMETERS P1,P2,P3,P4,P5
ENDPROC
PROCEDURE windowstate_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.WindowState = m.vNewVal

ENDPROC
PROCEDURE Init
This.cTempObject=Sys(2015)
=AddProperty(_Screen,This.cTempObject,This)

If This.ShowFormInTabControl
	WITH _screen.oPageFrameManager as PageFrameManager
		.AddPage(this)
	ENDWITH 
Endif
ENDPROC
PROCEDURE Unload
=Removeproperty(_Screen,This.cTempObject)
If This.SHOWFORMINTABCONTROL
	WITH _screen.oPageFrameManager as PageFrameManager
		.RemovePage(this)
	ENDWITH 
Endif

ENDPROC
  %   (  �  �  X   �  (�j?�  �  U  � %�C�
�� � B� �	 F�C�� ��  � T�  �� � � �� %�CC�  b� M� G� W���Y � B� � �� � � � � � T� ���� T� ���� }(� �� }(� ��C�  ��� }(� ��C�  ��� %�C�  b� N��u� }(� ��C�  ��� }(� ��C�  ���! T� �C� � 999,999,999,999_��! T� �C� � 999,999,999,999_��! T� �C� � 999,999,999,999_��! T� �C� � 999,999,999,999_�� � ��C� �ϼƣ�CC� _��
 �����ֵ��CC� _��
 ����Сֵ��CC� _��
 ��ƽ��ֵ��CC� _�� ��������CC� � 999,999,999_��	 �� U
  CFIELD THIS PARENT CONTROLSOURCE NCOUNT VMAX VMIN NAVG NSUM SETSTATUSTEXT$ %�C�
� �  � 
�� � B� �	 F�C�� %�C�	 BufferingC����R �
 ��Ca��� � �� � � T� ��  � � �� �� ���(�C.��� � %�CCC� /@�CC� @���� � T� �� �� � �� %�CC� b� M� G� W���� � B� � �� Q� _GRID��	 _base.vcx� T� ��  � � �� F�� �
 �� ��# ��C� Picture�  � Header� � �� T�  � ��  � 
�� %��  � ���� T�  � �� down.bmp��5 Index On &cField Tag &cField DESCENDING ADDITIVE 
 �� T�  � �� up.bmp��3 Index On &cField Tag &cField ASCENDING ADDITIVE
 � ��  � � �
 �� � � U  THIS CANORDER CFIELD NFIELDINDEX PARENT CONTROLSOURCE IFIELDINDEX OGRID _BASE VCX RECORDSOURCE SETALL BDESC PICTURE AUTOFIT REFRESH  T�  � �a�� U  THIS BDESC  T�  �a�� U  BDESC  B�C�  � ��� U  THIS CONTROLSOURCEE  ��  Q� VARIANT� F�� � � �� >�� � ����  �� �� � � � U 	 OCOLVALUE THIS PARENT RECORDSOURCE CONTROLSOURCE AUTOFIT Click,      
 RightClick     	 LostFocus;      Init]      GetValuev     SetValue�    w  T�  �a�� T� �a�� T� �� header�� T� ���� T� �C� � ���^��
 ��    �
 ��    �
 ��    �
 ��    � U  CANORDER BDESC NAME	 ALIGNMENT	 FORECOLORX  T�  �� column�� T� �� myHeader�� T� �� myHeader.prg��
 ��    �
 ��    � U  NAME HEADERCLASS HEADERCLASSLIBRARY myHeader Header�     myCol Column8    8 � A A � q 1�A A q� � � !!A!!A �3 �A A � �� A � 1a�� A A �A A �1� Q 1A�Q� a1A � � > � 3 � 9 � 3 !1� 3 � � 1� a�  � �� � 3 1Q�� � 6                    �   F        k  	  )   ;   :	  L	  X   =   k	  x	  \   ?   
  >
  f   A   a
  �
  j   F   !   �	     R   �	  �
  a   0
   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _3CO008Y6F1063452893      /  F      ]                          �      �                       WINDOWS _3CO008Y6G1246849995�      �  �      �      �  O                  �                           WINDOWS _3CO008Y6H1184335415�  �  �  �  �  �      �   :!                                               WINDOWS _3CO008Y6I1184335415�"  �"  �"  �"  #  #      �#  )%                                               WINDOWS _3CO008Y6J1184335415�&  �&  '  #'  5'  B'      �'  "(                                               WINDOWS _3CO008Y6K1184335415�(  �(  )  *)  9)  F)                                                           WINDOWS _3CO008Y6L1184335415�)      �)  �)  �)  �)      �*  H+                                               WINDOWS _4BL0Y1IXD1183219360�,      �,  �,  �,  �,      ?-  p-  <.  D8                                       COMMENT RESERVED                                �8                                                            8�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 0
Left = 0
Height = 367
Width = 522
ShowWindow = 1
ShowInTaskBar = .F.
DoCreate = .T.
ShowTips = .T.
Caption = "Form1"
TitleBar = 0
WindowType = 1
BackColor = 192,192,192
_memberdata =      363<VFPData><memberdata name="refreshdata" type="method" display="RefreshData"/><memberdata name="dofilter" type="method" display="DoFilter"/><memberdata name="cselectsql" type="property" display="cSelectSQL"/><memberdata name="creturnfield" type="property" display="cReturnField"/><memberdata name="vreturnvalue" type="property" display="vReturnValue"/></VFPData>

cselectsql = 
creturnfield = 
vreturnvalue = 
Name = "Form1"
     �PROCEDURE refreshdata
LOCAL  cSQL As String , cReturnField As String
cSQL=this.cSelectSQL
cReturnField=this.cReturnField
LOCAL cTempCursor
cTempCursor=SYS(2015)
IF !SelectData(cSQL,cTempCursor)
	MessageBox1('��ѯ����ʧ�ܣ�',64,'ϵͳ��ʾ')
	this.Release
	Return
ENDIF
this._grid1.RecordSourceType= 1
this._grid1.RecordSource=cTempCursor
this._grid1.reset_grid
Local bFound
Select (cTempCursor)

If Vartype(cReturnField) <> 'C'
	cReturnField = Field(1)
Endif
For I = 1 To Fcount()
	WITH this._grid1.Columns(i).Header1 as Header
		.Alignment=2
		.FontBold=.t.
	ENDWITH 
	If Lower(Alltrim(cReturnField)) == Lower(Alltrim(Field(I)))
		This._GRID1.Columns( I ).ForeColor = Rgb(0,0,160)
		This._GRID1.Columns( I ).FontBold = .T.
		bFound= .T.
		EXIT 
	Endif
Endfor
If  !bFound
	This._GRID1.Columns( 1 ).ForeColor = Rgb(0,0,160)
	This._GRID1.Columns( 1 ).FontBold = .T.
ENDIF

IF !EMPTY(this.Text1.Value)
	this.DoFilter(this.Text1.Value)
ENDIF 

this._grid1.AutoFit
FOR i=1 TO this._grid1.ColumnCount
	WITH this._grid1.Columns[i] as Column
		.Width = .Width + 10
	ENDWITH 
ENDFOR 
this._grid1.SetFocus
ENDPROC
PROCEDURE dofilter
LPARAMETERS cFilterValue
IF VARTYPE(cFilterValue)<>"C"
	cFilterValue=""
ENDIF 
cFilterValue=UPPER(cFilterValue)
Select (This._grid1.RecordSource)
If Empty(cFilterValue)
	Set Filter To
Endif
Local cFilterExpr
cFilterExpr=""
For Each oColumn As Column In This._grid1.Columns
	cFilterExpr = cFilterExpr + Iif(Empty(cFilterExpr),""," or ") + Textmerge("LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<oColumn.ControlSource>>))))")
	cFilterExpr = cFilterExpr + Iif(Empty(cFilterExpr),""," or ") + Textmerge("LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<oColumn.ControlSource>>)))))")
Endfor
cFilterExpr="("+cFilterExpr+")"
Set Filter To &cFilterExpr
Goto Top
this._grid1.Refresh

ENDPROC
PROCEDURE Init
LPARAMETERS oSender as Control,cSelectSQL as String,cReturnField as String,cInitFilterValue as String
IF VARTYPE(cInitFilterValue)<>"C"
	cInitFilterValue=""
ENDIF 
this.Text1.Value=TRANSFORM(cInitFilterValue)

IF VARTYPE(oSender)="O"
	LOCAL nLeft,nTop,nWidth,nHeight
	nTop=OBJTOCLIENT(oSender,1)
	nLeft=OBJTOCLIENT(oSender,2)
	nWidth=OBJTOCLIENT(oSender,3)
	nHeight=OBJTOCLIENT(oSender,4)

	WITH oSender as Form
		IF .BaseClass<>"Form"
			DO WHILE oSender.BaseClass<>"Form"
				oSender=oSender.Parent
			ENDDO
			nTop = nTop + oSender.Top
			nLeft = nLeft + oSender.Left
		ENDIF 
	ENDWITH 

	IF nTop+30+this.Height>oSender.Height
		this.AutoCenter= .T.
	ELSE
		this.Top=nTop+30
	ENDIF 
	IF nLeft+this.Width>oSender.Width
		this.Left=nLeft+nWidth-this.Width
	ELSE
		this.Left=nLeft
	ENDIF 
	IF this.Width<nWidth
		this.Width=nWidth
	ENDIF 
ELSE
	this.AutoCenter= .T.
ENDIF 
this.cSelectSQL=cSelectSQL
this.cReturnField=cReturnField 

this.RefreshData
this.Text1.SetFocus

=TransFormObjects(this)
ENDPROC
PROCEDURE Unload
RETURN this.vReturnValue
ENDPROC
     ����    o  o                           %   �	      �
  n   
          �  U  � ��  Q� STRING� Q� STRING� T�  �� � �� T� �� � �� �� � T� �C��]�� %�C �   � � 
��� �) ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ� ��
 �� � � B� � T� � �	 ���� T� � �
 �� �� �� � � � �� �
 F�� �� %�C� ��� C��� T� �C�/�� � �� ���(�C.����% ��C � � � � � �Q� HEADER�i� T�� ���� T�� �a�� �� %�CC� �@CCC� /�@����% T� � � �� �� �C� � ���^�� T� � � �� �� �a�� T� �a�� !� � �� %�� 
��+�% T� � � ���� �C� � ���^�� T� � � ���� �a�� � %�C� � � �
��[� ��C� � � � � �� � �� � � � �� ���(�� � � ����" ��C � � � � �Q� COLUMN��� T�� ��� �
�� �� �� �� � � � U  CSQL CRETURNFIELD THIS
 CSELECTSQL CTEMPCURSOR
 SELECTDATA MESSAGEBOX1 RELEASE _GRID1 RECORDSOURCETYPE RECORDSOURCE
 RESET_GRID BFOUND I COLUMNS HEADER1	 ALIGNMENT FONTBOLD	 FORECOLOR TEXT1 VALUE DOFILTER AUTOFIT COLUMNCOUNT WIDTH SETFOCUS� ��  � %�C�  ��� C��) � T�  ��  �� � T�  �C�  f�� F�� � � �� %�C�  ���a � G(� � �� � T� ��  �� �� Q� COLUMN� � � ���| T� �� CC� �� �  � �  or 6C�P LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<oColumn.ControlSource>>))))����� T� �� CC� �� �  � �  or 6C�V LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<oColumn.ControlSource>>)))))���� �� T� �� (� � )�� Set Filter To &cFilterExpr
 #)� �� � � � U  CFILTERVALUE THIS _GRID1 RECORDSOURCE CFILTEREXPR OCOLUMN COLUMNS REFRESH�< ��  Q� CONTROL� Q� STRING� Q� STRING� Q� STRING� %�C� ��� C��^ � T� ��  �� � T� � � �C� _�� %�C�  ��� O��:� �� � �	 �
 � T� �C�  ��]�� T� �C�  ��]�� T�	 �C�  ��]�� T�
 �C�  ��]�� ���  �Q� FORM�o� %��� � Form��k� +��  � � Form��?� T�  ��  � �� � T� �� �  � �� T� �� �  � �� � �� %�� �� � �  � ���� T� � �a�� ��� T� � �� ��� � %�� � � �  � ���� T� � �� �	 � � �� �� T� � �� �� � %�� � �	 ��6� T� � ��	 �� � �P� T� � �a�� � T� � �� �� T� � �� ��
 �� � � �� � � � ��C � � �� U  OSENDER
 CSELECTSQL CRETURNFIELD CINITFILTERVALUE THIS TEXT1 VALUE NLEFT NTOP NWIDTH NHEIGHT	 BASECLASS PARENT TOP LEFT HEIGHT
 AUTOCENTER WIDTH REFRESHDATA SETFOCUS TRANSFORMOBJECTS  B��  � �� U  THIS VRETURNVALUE refreshdata,     �� dofilter    �� InitE    �� Unload�	    ��1 �q q�� A A 11� q � R� A aQ� � A �Q�� A A A � Q�A baA � �!1A A � 2 q Q� A � � a A q � ��!A q�Q � 3 �Q� A QR11111Ra�A AAA A �� � AA ��� A AA � � A � � � 2 � 1                       t     .   �  Z  2   B   u  �  H   l   �  �  x    )   o                        �_memberdata XML Metadata for customizable properties
cselectsql ��ѯ���
creturnfield �����ֶ�
vreturnvalue ����ֵ
*refreshdata ˢ������
*dofilter ��������
      _grid      ..\classlibs\_base.vcx      grid      _grid1      Form1      �Anchor = 15
HeaderHeight = 28
Height = 316
Left = 7
Panel = 1
RowHeight = 26
TabIndex = 2
Top = 44
Width = 509
AllowCellSelection = .F.
Name = "_grid1"
      �PROCEDURE DblClick
this.Parent.oBtnOK.Click
ENDPROC
PROCEDURE KeyPress
LPARAMETERS nKeyCode, nShiftAltCtrl
IF nKeyCode=13
	this.Parent.oBtnOK.Click
ENDIF 
ENDPROC
     s���    Z  Z                        �y   %   �            �           �  U    ��  � � � � U  THIS PARENT OBTNOK CLICK3  ��  � � %��  ���, � �� � � � � � U  NKEYCODE NSHIFTALTCTRL THIS PARENT OBTNOK CLICK DblClick,     �� KeyPress`     ��1 2 � A 1                       ,         K   �       )   Z                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      oBtnOK      Form1      �Top = 6
Left = 397
Height = 33
Width = 60
Anchor = 9
Picture = ..\images\system\ok.bmp
Caption = "ѡ��"
Default = .F.
TabIndex = 3
PicturePosition = 1
Name = "oBtnOK"
     NPROCEDURE Click
LOCAL cReturnField,vReturnValue
cReturnField=thisform.cReturnField

SELECT (this.Parent._grid1.RecordSource)
IF EMPTY(cReturnField)
	cReturnField=FIELD(1)
ENDIF 
vReturnValue=EVALUATE(cReturnField)
=CloseAlias(this.Parent._grid1.RecordSource)

thisform.vReturnValue=vReturnValue
thisform.Release
ENDPROC
     ����    �  �                        .   %   !      H     0          �  U  �  ��  � � T�  �� �  �� F�� � � � �� %�C�  ���L � T�  �C�/�� � T� �C�  ��� ��C� � � � � �� T� � �� ��
 �� � � U	  CRETURNFIELD VRETURNVALUE THISFORM THIS PARENT _GRID1 RECORDSOURCE
 CLOSEALIAS RELEASE Click,     ��1 � 2� � A � a� 1                       C      )   �                        _cancelbutton      ..\classlibs\_base.vcx      commandbutton      
oBtnCancel      Form1      �Top = 6
Left = 457
Height = 33
Width = 60
Anchor = 9
Picture = ..\images\system\wzundo.bmp
Cancel = .T.
Caption = "����"
TabIndex = 4
Name = "oBtnCancel"
      ,PROCEDURE Click
thisform.Release
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       !       )   �                         _label      ..\classlibs\_base.vcx      label      _label1      Form1      gFontSize = 10
Anchor = 3
Caption = "���ٲ��ң�"
Left = 7
Top = 14
TabIndex = 5
Name = "_label1"
      textbox      textbox      Text1      Form1      �FontSize = 10
Anchor = 11
Height = 29
Left = 89
MaxLength = 250
TabIndex = 1
TabStop = .F.
ToolTipText = "����Ҫ���˵�ֵ��ƴ������ĸ����"
Top = 8
Width = 295
Name = "Text1"
      �PROCEDURE InteractiveChange
thisform.DoFilter(ALLTRIM(this.Value))

ENDPROC
PROCEDURE GotFocus
this.Value=""
thisform.DoFilter("")
ENDPROC
     \���    C  C                        ��   %   �       �      �           �  U    ��CC� � ��  � �� U  THISFORM DOFILTER THIS VALUE#  T�  � ��  �� ��C�  � � �� U  THIS VALUE THISFORM DOFILTER InteractiveChange,     �� GotFocusi     ��1 Q3 1                       E         d   �       )   C                        
olecontrol      
olecontrol      oCommandBars      Form1      FTop = 228
Left = 456
Height = 13
Width = 1
Name = "oCommandBars"
      )PROCEDURE Init
this.DeleteAll
ENDPROC
      ����    �   �                         �   %   N       b      \           �  U   
 ��  � � U  THIS	 DELETEALL Init,     ��1 � 1                              )   �                        
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                                gv�ވ�   �       O l e O b j e c t D a t a                                            ����                                        *        A c c e s s O b j S i t e D a t a                             &  ������������                                       �        C h a n g e d P r o p s                                         ������������                                       !       ����         �����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������^�fl� O���}�|Es   {  {                                     �                          �   8                       CommandBars Control Copyright (c) 2003-2008 Codejock Software
PRODUCT-ID: Codejock.CommandBars.ActiveX.v12.0
VALIDATE-CODE: QQS-PNF-OJV-VBX                                                             �   VisualTheme 	   I
                                                                                                                                                                           BOLEObject = C:\Windows\SysWOW64\Codejock.CommandBars.v12.0.1.ocx
      CArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 10, 6, 16, 13, 35, 3, 0
          0     (       @                                ���   
�  U        �  �  �  	�     C   f   ~   ~   �  �     ~   |   x   p   `   @                                     ��� ��� �����������|��������� ��d ��8���� ��� ��� �� �� ?�� �� ������������������?���������������������������������0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1T90ME96E 884691805      /  F      ]                          �      �                       WINDOWS _1T90ME96F1063473623�  �  �              �  �                  �                           WINDOWS _1T90ME98D1052459526�  �      -  :      �  +	                                               WINDOWS _1TF0JMFD31063473623+
  ;
  Y
  h
  y
  �
                                                           COMMENT RESERVED                                E                                                            n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      _form      ..\classlibs\_base.vcx      form      oText     �Height = 472
Width = 653
ShowWindow = 1
DoCreate = .T.
Caption = "�鿴�ı�"
Closable = .F.
WindowType = 1
ctext = =''
Name = "oText"
_base.Name = "_base"
oCommandBars.Top = 300
oCommandBars.Left = 252
oCommandBars.Height = 100
oCommandBars.Width = 100
oCommandBars.Name = "oCommandBars"
oImageManager.Top = 204
oImageManager.Left = 264
oImageManager.Height = 100
oImageManager.Width = 100
oImageManager.Name = "oImageManager"
     PROCEDURE Unload
 RETURN THIS.CTEXT
ENDPROC
PROCEDURE Init
 LPARAMETER VTEXT AS STRING , CTITLE AS STRING
 IF VARTYPE(CTITLE) = 'C' AND  .NOT. EMPTY(CTITLE)
 THIS.CAPTION = CTITLE + ' - �ı��鿴��'
 ENDIF 
 THIS._EDITBOX1.VALUE = VTEXT
 THIS._EDITBOX1.VISIBLE = .T.
ENDPROC
     ����    �  �                        A�   %         E  
   1          �  U    B��  � �� U  THIS CTEXT�  ��  Q� STRING� Q� STRING� %�C� ��� C� C� �
	��_ �! T� � �� �  - �ı��鿴���� � T� � � ��  �� T� � � �a�� U  VTEXT CTITLE THIS CAPTION	 _EDITBOX1 VALUE VISIBLE Unload,     �� InitL     ��1 � 2 ��A 11                       $         ?         )   �                        ctext
      _commandbutton      ..\classlibs\_base.vcx      commandbutton      _COMMANDBUTTON1      oText      �Top = 420
Left = 254
Height = 36
Width = 145
Anchor = 164
Cancel = .T.
Caption = "ȷ��"
TabIndex = 2
Name = "_COMMANDBUTTON1"
      ZPROCEDURE Click
 THISFORM.CTEXT = THISFORM._EDITBOX1.VALUE
  THISFORM.RELEASE
ENDPROC
      ����    �   �                         �   %          �      �           �  U  #  T�  � ��  � � ��
 ��  � � U  THISFORM CTEXT	 _EDITBOX1 VALUE RELEASE Click,     ��1 a� 1                       O       )   �                         _editbox      ..\classlibs\_base.vcx      editbox      	_editbox1      oText      �Anchor = 15
AllowTabs = .T.
BackStyle = 1
Height = 398
Left = 12
SpecialEffect = 0
TabIndex = 1
Top = 12
Visible = .F.
Width = 636
ForeColor = 0,64,128
Name = "_editbox1"
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
BM�      6   (               �  �  �          ������������������������������   ���������  ���������������������������      ���������  ������������������������    ��   ���������  ���                     ������      ������     ��������� ����� ����� �����������   ���     ��� ������������  �  ������ �����   ���     ��������� ����������� �����������   ���     ��� ������������  ��������� �����   ���     ��������� ���������  ������������   ���     ��� ����������� ������  ��� �����   ���     ����������  ����������  �  ������   ���     ��� ������  �   ����Ƅ  �   �����   ���     �����������Ƅ  �  �  �  ���������   ���     ��� ����������� ����������� �����   ���     ��������� ����������� �����������   ���  ���                                 ������  BM�      �   (                     $   $    ��� � �� Rd �� ,�� T�� d�� ��� ��� ��� ��� �� �� �� ��� �� �� �� �� ~� ��� �� ~� z� $v� $v� $r� ,n� ,n� ,j� 4f� ��� ���     """""""""""""""""""   """""""""""     """"""""""     """"     """"""  """""  """" """" " 	" 
" """" !!! """" !! """""" """""""""""""""""""  0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1JQ0N3AJD 852776397      /  F      ]                          �      �                       WINDOWS _1JQ0N3AJW1064080948�  �  �              �  �                  W                           WINDOWS _1JQ0N3AJY 852777494n  |  �  �  �  �                                                           WINDOWS _1JQ0N3AJZ 985038181    <  L  _  m      S  v                                               WINDOWS _1JQ0O69OB 984922818S  a    �  �  �                                                           WINDOWS _1JQ0N3AJD 984922818�      
    1  ?                                                           WINDOWS _1JQ0O69OC1051290670U  k  �  �  �  �      &  x&                                               WINDOWS _1JQ0O69OD 984922818�0  �0  �0  �0  �0  �0                                                           WINDOWS _1N30LMWY2 984922818/1  =1  [1  h1  w1  �1                                                           WINDOWS _1JQ0N3AJD1050957608�1  �1  �1  2  2  +2      x2  &3                                               WINDOWS _1N30LMWY3 984922818�4  �4  �4  �4  �4  �4                                                           WINDOWS _1N30LMWY41050957608"5  25  P5  _5  p5  ~5      �5  �6                                               WINDOWS _1JQ0N3AJD1013076951�7  �7  8  /8  F8  T8      �8  �9                                               WINDOWS _1JQ0N3AJD1013076951/;  E;  c;  x;  �;  �;      <  �<                                               WINDOWS _1JQ0N3AJD1013076951U>  k>  �>  �>  �>  �>      >?   @                                               WINDOWS _1N30LMWY51013076951{A  �A  �A  �A  �A  �A      eB  UC                                               WINDOWS _1N30LMWY6 984922818�D  �D  �D  �D  E  E                                                           WINDOWS _2NN1E31Q3 984923229^E  pE  �E  �E  �E  �E                                                           WINDOWS _2NN1E31Q4 984922818F  *F  HF  UF  dF  ~F                                                           WINDOWS _2NN1E31Q5 985037742�F  �F  �F   G  G  +G                                                           WINDOWS _2NN1E31Q6 985027096uG  �G  �G  �G  �G  �G      aH  �I                                               WINDOWS _2NN1EJNKI 984923229IK  ZK  xK  �K  �K  �K                                                           WINDOWS _2NN1EJNKJ 984923229L  #L  AL  QL  cL  }L                                                           WINDOWS _2NN1EJNKK 984923229�L  �L  M  !M  1M  KM                                                           WINDOWS _37Q0T044W1051290620�M      �M  �M  �M  �M                                                           COMMENT RESERVED                                GN                                                            N�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      _form      ..\classlibs\_base.vcx      form      _form1     �BorderStyle = 3
Height = 437
Width = 312
DoCreate = .T.
Caption = "���ݵ���"
MinButton = .F.
WindowType = 1
Name = "_form1"
_base.Top = 388
_base.Left = 120
_base.Name = "_base"
oCommandBars.Top = 380
oCommandBars.Left = 252
oCommandBars.Height = 100
oCommandBars.Width = 100
oCommandBars.Name = "oCommandBars"
oImageManager.Top = 230
oImageManager.Left = 264
oImageManager.Height = 100
oImageManager.Width = 100
oImageManager.Name = "oImageManager"
     �PROCEDURE list_fields
Lparameter cTable As String
If Parameters() = 0
	Messagebox('��������,�޷��о��ֶ���Ϣ��',64,'ϵͳ��ʾ')
	Return
Endif
Select (cTable)
This.LstUnUsed.Clear
This.LstExport.Clear
For I = 1 To Fcount()
	LOCAL cFieldName
	cFieldName=Alltrim(Field(I))
	IF LEFT(cFieldName,2)="__" OR LOWER(RIGHT(cFieldName,4))="_old"
		LOOP 
	ENDIF 
	This.LstExport.AddItem(cFieldName)
Endfor

ENDPROC
PROCEDURE Init
Lparameter cSelectedCursor As String
IF VARTYPE(cSelectedCursor)<>"C"
	cSelectedCursor=ALIAS()
ENDIF 
IF SELECT(cSelectedCursor)=0
	ERROR "������û�д򿪣�"
	RETURN .f.
Else
	this.oTxtTable.Value=cSelectedCursor
Endif
This._CONTAINER1.SetAll('Enabled',.F.)

This.LIST_FIELDS(ALLTRIM(this.oTxtTable.Value))

ENDPROC
     T���    ;  ;                        [}   %   �      �     �          �  U   ��  Q� STRING� %�C�� ��Z �5 ��C� ��������,�޷��о��ֶ���Ϣ���@� ϵͳ��ʾ�x�� B� �
 F��  �� �� � � � �� � � � �� ���(�C.��� � �� � T� �CC� /���. %�C� �=� __� CC� �R@� _old��� � .� � ��C � � � � �� �� U  CTABLE THIS	 LSTUNUSED CLEAR	 LSTEXPORT I
 CFIELDNAME ADDITEM�  ��  Q� STRING� %�C�  ��� C��2 � T�  �C�� � %�C�  W� ��i � ��� ������û�д򿪣��� B�-�� �� � T� � � ��  �� � ��C� Enabled-� � � �� ��CC� � � �� � �� U  CSELECTEDCURSOR THIS	 OTXTTABLE VALUE _CONTAINER1 SETALL LIST_FIELDS list_fields,     �� Initt    ��1 QA A � � � aq �A A AA 3 Q� A 1�q � 1A ��2                       �        �  �      )   ;                        *list_fields 
      _label      ..\classlibs\_base.vcx      label      _label1      _form1      ACaption = "�����ļ�����"
Left = 12
Top = 12
Name = "_label1"
      	_combobox      ..\classlibs\_base.vcx      combobox      _exportType      _form1      �RowSourceType = 1
RowSource = "Excel(*.xls),FoxPro��(*.dbf),�ı��ļ�(*.txt),XML�ļ�(*.xml),\-,Excel(*.xls) ʹ��ģ��,WPS����(*.et) ʹ��ģ��"
Height = 24
Left = 120
Style = 2
Top = 5
Width = 180
Name = "_exportType"
     PROCEDURE InteractiveChange
 IF  .NOT. INLIST(THIS.VALUE,6,7)
 THISFORM._CONTAINER1.ENABLED = .F.
  THISFORM._CONTAINER1.SETALL('Enabled',.F.)
 ELSE 
 THISFORM._CONTAINER1.ENABLED = .T.
  THISFORM._CONTAINER1.SETALL('Enabled',.T.)
 LOCAL CMODALFILE
 LOCAL CMODALPATH
 CMODALPATH = THISFORM.GET_CONFIG('ReportModal')
 IF EMPTY(CMODALPATH)
    IF MESSAGEBOX('��û������ģ��Ŀ¼���Ƿ��������ã�',33,'ϵͳ��ʾ') = 1
       LOCAL CDIR
       CDIR = GETDIR(_SCREEN.CFILESPATH,'ģ��Ŀ¼','����ģ��Ŀ¼')
       IF DIRECTORY(CDIR)
           THISFORM.WRITE_CONFIG('ReportModal',CDIR)
          CMODALPATH = CDIR
       ENDIF 
    ENDIF 
 ENDIF 
 IF DIRECTORY(CMODALPATH)
    LOCAL CDEFAULTPATH
    CDEFAULTPATH = SET('Default')
    SET DEFAULT TO (CMODALPATH)
    CMODALFILE = GETFILE(IIF(THIS.VALUE = 6,'xls','et'))
    SET DEFAULT TO (CDEFAULTPATH)
 ELSE 
    CMODALFILE = GETFILE(IIF(THIS.VALUE = 6,'xls','et'))
 ENDIF 
 IF FILE(CMODALFILE)
    THIS.PARENT._CONTAINER1._TEXTBOX1.VALUE = CMODALFILE
 ENDIF 
 ENDIF 
ENDPROC
     ����    �  �                        ]   %         s  "   /          �  U  J %�C�  � ���
��E � T� � � �-�� ��C� Enabled-� � � �� �C� T� � � �a�� ��C� Enableda� � � �� �� � �� � T� �C� ReportModal� � �� %�C� ���p�D %�C�" ��û������ģ��Ŀ¼���Ƿ��������ã��!� ϵͳ��ʾ�x���l� ��	 �, T�	 �C�9�
 � ģ��Ŀ¼� ����ģ��Ŀ¼�3�� %�C�	 ����h� ��C� ReportModal �	 � � �� T� ��	 �� � � � %�C� ������ �� � T� �C� Defaultv�� G(�� ��) T� �CC�  � ��	 � xls� � et6��� G(�� �� ��) T� �CC�  � ��	 � xls� � et6��� � %�C� 0��?� T�  � � � � �� �� � � U  THIS VALUE THISFORM _CONTAINER1 ENABLED SETALL
 CMODALFILE
 CMODALPATH
 GET_CONFIG CDIR
 CFILESPATH WRITE_CONFIG CDEFAULTPATH PARENT	 _TEXTBOX1 InteractiveChange,     ��1 ��� �q q �� Aq ��� A A A q a� �� � �A � �A A 1                             )   �                        _label      ..\classlibs\_base.vcx      label      _label2      _form1      FCaption = "�ָ���(�ı��ļ�)"
Left = 12
Top = 128
Name = "_label2"
      optiongroup      optiongroup      Optiongroup1      _form1     AutoSize = .T.
ButtonCount = 3
BackStyle = 1
Value = 1
Height = 65
Left = 120
Top = 116
Width = 120
Name = "Optiongroup1"
Option1.BackStyle = 1
Option1.Caption = "Blank"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.SpecialEffect = 0
Option1.Style = 0
Option1.Top = 5
Option1.Width = 66
Option1.AutoSize = .F.
Option1.Name = "Option1"
Option2.Caption = "Tab"
Option2.Height = 17
Option2.Left = 5
Option2.SpecialEffect = 0
Option2.Style = 0
Option2.Top = 24
Option2.Width = 66
Option2.AutoSize = .F.
Option2.Name = "Option2"
Option3.Caption = "�Զ���(Ĭ�϶���)"
Option3.Height = 17
Option3.Left = 5
Option3.SpecialEffect = 0
Option3.Style = 0
Option3.Top = 43
Option3.Width = 110
Option3.AutoSize = .T.
Option3.Name = "Option3"
      _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton1      _form1      [Top = 391
Left = 48
Picture = export.bmp
Caption = "����..."
Name = "_commandbutton1"
     JPROCEDURE Click
If Select(ALLTRIM(thisform.oTxtTable.Value)) = 0
	Messagebox('��ѡ�񵼳��Ĺ�����������',64,'ϵͳ��ʾ')
	Return
Endif
Select (ALLTRIM(thisform.oTxtTable.Value))
If Reccount() = 0
	If Messagebox('û�����ݿɹ��������Ƿ��ǵ������ṹ��',36,'ϵͳ��ʾ') <> 6
		Return
	Endif
Endif
Local CFIELDS
CFIELDS = ''
If Thisform.LstExport.ListCount = 0
	Messagebox('�����ֶ��б�Ϊ�գ�',64,'ϵͳ��ʾ')
	Return
Endif
For I = 1 To Thisform.LstExport.ListCount
	CFIELDS = CFIELDS + Iif(Empty(CFIELDS),'',',') + Thisform.LstExport.List(I)
Endfor
Try
	Local CEXT
	Do Case
		Case Thisform._EXPORTTYPE.Value = 1
			CEXT = 'xls'
		Case Thisform._EXPORTTYPE.Value = 2
			CEXT = 'dbf'
		Case Thisform._EXPORTTYPE.Value = 3
			CEXT = 'txt'
		Case Thisform._EXPORTTYPE.Value = 4
			CEXT = 'xml'
		Case Inlist(Thisform._EXPORTTYPE.Value,6,7)
			Local CMODALFILE , CMODALEXT , BISWPSET
			If Thisform._EXPORTTYPE.Value = 6
				CMODALEXT = 'xls'
				BISWPSET = .F.
			Else
				CMODALEXT = 'et'
				BISWPSET = .T.
			Endif
			If  .Not. File(Thisform._CONTAINER1._TEXTBOX1.Value)
				CMODALFILE = Getfile(CMODALEXT,'','ѡ��',0,'ѡ��ģ���ļ�')
			Else
				CMODALFILE = Alltrim(Thisform._CONTAINER1._TEXTBOX1.Value)
			Endif
			If  .Not. File(CMODALFILE)
				Messagebox('ģ���ļ������ڣ�',64,'ϵͳ��ʾ')
				Exit
			Endif
			Local COUTPUTFILE
			COUTPUTFILE = ''
			If Thisform._CONTAINER1.CHKSAVE.Value
				COUTPUTFILE = Putfile('�����ļ�','',CMODALEXT)
			Endif
			Local BPREVIEW , BPRINT
			BPREVIEW = Thisform._CONTAINER1.CHKPREVIEW.Value
			BPRINT = Thisform._CONTAINER1.CHKPRINT.Value
			= TOEXCEL(CMODALFILE,@COUTPUTFILE,BISWPSET,BPREVIEW,BPRINT)
			If File(COUTPUTFILE)
				Thisform._BASE.RUN_FILE(COUTPUTFILE)
			Endif
			Exit
		Otherwise
	Endcase
	STRFILE = Putfile('����ΪExcel',Alias(),CEXT)
	If Empty(STRFILE)
		Exit
	Endif
	Local CEXPORTEXP
	CEXPORTEXP = 'COPY TO (strFile) Fields ' + CFIELDS
	Do Case
		Case Thisform._EXPORTTYPE.Value = 1
			CEXPORTEXP = CEXPORTEXP + ' TYPE XL5'
		Case Thisform._EXPORTTYPE.Value = 2
			CEXPORTEXP = CEXPORTEXP + ' TYPE FOX2X'
		Case Thisform._EXPORTTYPE.Value = 3
			Do Case
				Case Thisform.OPTIONGROUP1.Value = 1
					CEXPORTEXP = CEXPORTEXP + ' TYPE DELiMiTED WiTH BLANK'
				Case Thisform.OPTIONGROUP1.Value = 2
					CEXPORTEXP = CEXPORTEXP + ' TYPE DELiMiTED WiTH TAB'
				Otherwise
					Local CDELIMITER
					CDELIMITER =  Inputbox ('�붨��ָ���(ֻȡ��һ���ַ�):','����ָ���',',')
					CDELIMITER = Iif(Empty(CDELIMITER),',',Left(CDELIMITER,1))
					CEXPORTEXP = CEXPORTEXP + " TYPE DELiMiTED WiTH CHARACTER '" + CDELIMITER + "'"
			Endcase
		Case Thisform._EXPORTTYPE.Value = 4
			Local CXML
			Cursortoxml(Alias(),STRFILE,1,512+16,0)
			Thisform._BASE.RUN_FILE(STRFILE)
			Messagebox('������ϣ�',64,'ϵͳ��ʾ')
			Thisform.Release
			Exit
		Otherwise
	Endcase
	Execscript (CEXPORTEXP)
	*Messagebox('���ݵ�����ϣ�����',64,'ϵͳ��ʾ')
	Thisform._BASE.RUN_FILE(STRFILE)
	Thisform.Release
Catch To oErr
	Messagebox('�������ݷ�������' + OERR.Message,64,'ϵͳ��ʾ')
Endtry
Thisform.Release

ENDPROC
     
���    �	  �	                        H^   %   �      �	  h   �          �  U  e %�CC�  � � �W� ��Q �2 ��C� ��ѡ�񵼳��Ĺ������������@� ϵͳ��ʾ�x�� B� � F�C�  � � ��� %�CN� ��� �H %�C�& û�����ݿɹ��������Ƿ��ǵ������ṹ���$� ϵͳ��ʾ�x���� � B� � � �� � T� ��  �� %��  � � � ��&�, ��C� �����ֶ��б�Ϊ�գ��@� ϵͳ��ʾ�x�� B� � �� ���(��  � � ��x�1 T� �� CC� �� �  � � ,6C � �  � � �� �� ��� �� � H���3� ��  �	 � ����� T� �� xls�� ��  �	 � ����� T� �� dbf�� ��  �	 � ���� T� �� txt�� ��  �	 � ���4� T� �� xml�� �C�  �	 � �����+� ��
 � � � %��  �	 � ����� T� �� xls�� T� �-�� ��� T� �� et�� T� �a�� � %�C�  � � � 0
����+ T�
 �C� �  � ѡ��� � ѡ��ģ���ļ���� �� T�
 �C�  � � � ��� � %�C�
 0
��\�* ��C� ģ���ļ������ڣ��@� ϵͳ��ʾ�x�� !� � �� � T� ��  �� %��  � � � ���� T� �C� �����ļ��  � ��� � �� � � T� ��  � � � �� T� ��  � � � �� ��C �
 �  �  �  � � �� %�C� 0��#� ��C � �  � � �� � !� 2�3� � T� �C� ����ΪExcelC� ��� %�C� ���i� !� � �� �* T� �� COPY TO (strFile) Fields � �� H����� ��  �	 � ����� T� �� �	  TYPE XL5�� ��  �	 � ���� T� �� �  TYPE FOX2X�� ��  �	 � ���c� H�3�_� ��  � � ���u�+ T� �� �  TYPE DELiMiTED WiTH BLANK�� ��  � � �����) T� �� �  TYPE DELiMiTED WiTH TAB�� 2�_� �� �> T� �C� �붨��ָ���(ֻȡ��һ���ַ�):�
 ����ָ���� ,����# T� �CC� �� � ,� C� �=6��: T� �� �   TYPE DELiMiTED WiTH CHARACTER '� � '�� � ��  �	 � ����� �� � ��CC� ��� �� ��C � �  � � ��$ ��C�
 ������ϣ��@� ϵͳ��ʾ�x��
 ��  � � !� 2��� � ��C� ���� ��C � �  � � ��
 ��  � � �(� �T�3 ��C� �������ݷ�������� � �@� ϵͳ��ʾ�x�� ��
 ��  � � U   THISFORM	 OTXTTABLE VALUE CFIELDS	 LSTEXPORT	 LISTCOUNT I LIST CEXT _EXPORTTYPE
 CMODALFILE	 CMODALEXT BISWPSET _CONTAINER1	 _TEXTBOX1 COUTPUTFILE CHKSAVE BPREVIEW BPRINT
 CHKPREVIEW CHKPRINT TOEXCEL _BASE RUN_FILE STRFILE
 CEXPORTEXP OPTIONGROUP1
 CDELIMITER CXML RELEASE OERR MESSAGE Click,     ��1 �!A A !�A A A q � q�A A �A � q � qqqq�� q� � � � A ��� �A �A A q � a�A � aa�� AA A � A �� A A q �� q�q�q� q�q�� q �1�A qq �AA� A � A � B� � 1A � 2                       ?      )   �	                        _cancelbutton      ..\classlibs\_base.vcx      commandbutton      _cancelbutton1      _form1      0Top = 391
Left = 180
Name = "_cancelbutton1"
      _label      ..\classlibs\_base.vcx      label      _label3      _form1      BCaption = "�����ֶ��б�"
Left = 12
Top = 217
Name = "_label3"
      _listbox      ..\classlibs\_base.vcx      listbox      	lstUnUsed      _form1      EHeight = 146
Left = 12
Top = 236
Width = 120
Name = "lstUnUsed"
      �PROCEDURE DblClick
thisform._commandbutton3.Click
ENDPROC
PROCEDURE AddItem
 LPARAMETER CITEM AS STRING
 IF THIS.FINDITEM(CITEM)
 NODEFAULT 
 ENDIF 
ENDPROC
     S���    :  :                        �   %   �       �      �           �  U    ��  � � � U  THISFORM _COMMANDBUTTON3 CLICK1  ��  Q� STRING� %�C �  � � ��* � �� � U  CITEM THIS FINDITEM DblClick,     �� AddItemb     ��1 � 2 QA A 1                       2         P   �       )   :                        _label      ..\classlibs\_base.vcx      label      _label4      _form1      CCaption = "�����ֶ��б�"
Left = 192
Top = 217
Name = "_label4"
      _listbox      ..\classlibs\_base.vcx      listbox      	lstExport      _form1      WHeight = 146
Left = 184
MoverBars = .T.
Top = 236
Width = 120
Name = "lstExport"
      �PROCEDURE DblClick
thisform._commandbutton4.Click
ENDPROC
PROCEDURE AddItem
 LPARAMETER CITEM AS STRING
 IF THIS.FINDITEM(CITEM)
 NODEFAULT 
 ENDIF 
ENDPROC
     S���    :  :                        �   %   �       �      �           �  U    ��  � � � U  THISFORM _COMMANDBUTTON4 CLICK1  ��  Q� STRING� %�C �  � � ��* � �� � U  CITEM THIS FINDITEM DblClick,     �� AddItemb     ��1 � 2 QA A 1                       2         P   �       )   :                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton2      _form1      tTop = 245
Left = 137
Height = 22
Width = 41
Caption = ">>"
ToolTipText = "ȫ������"
Name = "_commandbutton2"
      �PROCEDURE Click
 IF THISFORM.LstUnUsed.LISTCOUNT = 0
 RETURN 
 ENDIF 
 FOR I = 1 TO THISFORM.LstUnUsed.LISTCOUNT
  THISFORM.LstExport.ADDITEM(ALLTRIM(THISFORM.LstUnUsed.LIST(I)))
 ENDFOR 
  THISFORM.LstUnUsed.CLEAR
ENDPROC
     g���    N  N                        �   %   �         	   �           �  U  p  %��  � � � �� � B� � �� ���(��  � � ��\ �  ��CCC � �  � � ��  � � �� �� ��  � � � U  THISFORM	 LSTUNUSED	 LISTCOUNT I	 LSTEXPORT ADDITEM LIST CLEAR Click,     ��1 qA A �A � 1                       �       )   N                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton3      _form1      sTop = 280
Left = 137
Height = 22
Width = 41
Caption = ">"
ToolTipText = "����һ��"
Name = "_commandbutton3"
      �PROCEDURE Click
 IF THISFORM.LstUnUsed.LISTINDEX = 0
 RETURN 
 ENDIF 
  THISFORM.LstExport.ADDITEM(ALLTRIM(THISFORM.LstUnUsed.DISPLAYVALUE))
  THISFORM.LstUnUsed.REMOVEITEM(THISFORM.LstUnUsed.LISTINDEX)
ENDPROC
     S���    :  :                        �   %   �       �      �           �  U  V  %��  � � � �� � B� � ��CC�  � � ��  � � �� ��C�  � � �  � � �� U  THISFORM	 LSTUNUSED	 LISTINDEX	 LSTEXPORT ADDITEM DISPLAYVALUE
 REMOVEITEM Click,     ��1 qA A ��1                       �       )   :                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton4      _form1      sTop = 317
Left = 137
Height = 22
Width = 41
Caption = "<"
ToolTipText = "�Ƴ�һ��"
Name = "_commandbutton4"
      �PROCEDURE Click
 IF THISFORM.LstExport.LISTINDEX = 0
 RETURN 
 ENDIF 
  THISFORM.LstUnUsed.ADDITEM(ALLTRIM(THISFORM.LstExport.DISPLAYVALUE))
  THISFORM.LstExport.REMOVEITEM(THISFORM.LstExport.LISTINDEX)
ENDPROC
     S���    :  :                        �   %   �       �      �           �  U  V  %��  � � � �� � B� � ��CC�  � � ��  � � �� ��C�  � � �  � � �� U  THISFORM	 LSTEXPORT	 LISTINDEX	 LSTUNUSED ADDITEM DISPLAYVALUE
 REMOVEITEM Click,     ��1 qA A ��1                       �       )   :                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton5      _form1      tTop = 352
Left = 137
Height = 22
Width = 41
Caption = "<<"
ToolTipText = "ȫ���Ƴ�"
Name = "_commandbutton5"
      �PROCEDURE Click
 IF THISFORM.LstExport.LISTCOUNT = 0
 RETURN 
 ENDIF 
 FOR I = 1 TO THISFORM.LstExport.LISTCOUNT
  THISFORM.LstUnUsed.ADDITEM(ALLTRIM(THISFORM.LstExport.LIST(I)))
 ENDFOR 
  THISFORM.LstExport.CLEAR
ENDPROC
     g���    N  N                        �   %   �         	   �           �  U  p  %��  � � � �� � B� � �� ���(��  � � ��\ �  ��CCC � �  � � ��  � � �� �� ��  � � � U  THISFORM	 LSTEXPORT	 LISTCOUNT I	 LSTUNUSED ADDITEM LIST CLEAR Click,     ��1 qA A �A � 1                       �       )   N                        _label      ..\classlibs\_base.vcx      label      _label5      _form1      <Caption = "������"
Left = 12
Top = 195
Name = "_label5"
      
_container      ..\classlibs\_base.vcx      	container      _container1      _form1      TTop = 36
Left = 12
Width = 288
Height = 72
Enabled = .F.
Name = "_container1"
      _label      ..\classlibs\_base.vcx      label      _label1      _form1._container1      =Caption = "ģ���ļ�"
Left = 12
Top = 12
Name = "_label1"
      _textbox      ..\classlibs\_base.vcx      textbox      	_textbox1      _form1._container1      BHeight = 24
Left = 72
Top = 9
Width = 181
Name = "_textbox1"
      _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton1      _form1._container1      jTop = 8
Left = 254
Height = 26
Width = 32
Picture = open.bmp
Caption = ""
Name = "_commandbutton1"
     .PROCEDURE Click
 LOCAL CMODALFILE
 DO CASE 
 CASE THISFORM._EXPORTTYPE.VALUE = 6
 CMODALFILE = GETFILE('xls')
 CASE THISFORM._EXPORTTYPE.VALUE = 7
 CMODALFILE = GETFILE('et')
 OTHERWISE 
 ENDCASE 
 IF FILE(CMODALFILE)
  THIS.PARENT._TEXTBOX1.SETFOCUS
 KEYBOARD CMODALFILE
 ENDIF 
ENDPROC
     ����    �  �                        .   %         H     ,          �  U  �  ��  � H� �m � �� � � ���= � T�  �C� xls��� �� � � ���e � T�  �C� et��� 2�m � � %�C�  0��� � �� � � � �	 \��  �� � U 
 CMODALFILE THISFORM _EXPORTTYPE VALUE THIS PARENT	 _TEXTBOX1 SETFOCUS Click,     ��1 q � q!q� A � � A 1                       #      )   �                        	_checkbox      ..\classlibs\_base.vcx      checkbox      chkSave      _form1._container1      YTop = 48
Left = 27
Alignment = 0
Caption = "�����ļ�"
Value = .T.
Name = "chkSave"
      	_checkbox      ..\classlibs\_base.vcx      checkbox      
chkPreview      _form1._container1      ]Top = 48
Left = 111
Alignment = 0
Caption = "��ӡԤ��"
Value = .F.
Name = "chkPreview"
      	_checkbox      ..\classlibs\_base.vcx      checkbox      chkPrint      _form1._container1      [Top = 48
Left = 195
Alignment = 0
Caption = "ֱ�Ӵ�ӡ"
Value = .F.
Name = "chkPrint"
      textbox      textbox      	oTxtTable      _form1      TEnabled = .F.
Height = 23
Left = 120
Top = 187
Width = 182
Name = "oTxtTable"
      gArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 10, 6, 16, 13, 35, 3, 0
΢���ź�, 1, 9, 6, 17, 13, 17, 4, 0
0	   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1OC13A2BI 864260722      /  F      ]                          �      �                       WINDOWS _1OC13A2BJ1057264878�  �  �                �	                  �                           WINDOWS _1OC13A2BK1057264878�    #  /  =  K      �  [                                               WINDOWS _1OC13A2BI1054368591�  �  �  �    $      �  �                                               WINDOWS _1OC13A2BM1054368591�  �  �  
     .      �  �                                               WINDOWS _1OC13A2BN1054368591�  �  �      )                                                           WINDOWS _38S13K59Y1056616592�      �  �  �  �      j  3                                               COMMENT RESERVED                                5                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      _form      ..\classlibs\_base.vcx      form      _form1     �Height = 446
Width = 662
DoCreate = .T.
Caption = "ѡ������-- "
MinButton = .F.
KeyPreview = .T.
WindowType = 1
iscancel = .F.
csql = 
calias = 
showformintabcontrol = .F.
Name = "_form1"
_base.Name = "_base"
oCommandBars.Top = 300
oCommandBars.Left = 252
oCommandBars.Height = 100
oCommandBars.Width = 100
oCommandBars.Name = "oCommandBars"
oImageManager.Top = 204
oImageManager.Left = 264
oImageManager.Height = 100
oImageManager.Width = 100
oImageManager.Name = "oImageManager"
     �PROCEDURE Init
Lparameter cSQL As String , cReturnField As String
If Vartype(cSQL) <> 'C'
	Messagebox('����ָ��SQL��䣡',64,'ϵͳ��ʾ')
	Return .F.
Endif
If Empty(cSQL)
	Messagebox('��ѯ��䲻��Ϊ�գ�',64,'ϵͳ��ʾ')
	Return .F.
Endif
This.cSQL = cSQL
This.cAlias = Sys(2015)
This.refresh_data(cSQL,This.cAlias,This._GRID1)
If Select(This.CURSOR_NAME) = 0
	Messagebox('��ѯ����ʧ�ܣ�',64,'ϵͳ��ʾ')
	Return .F.
Endif
Local BFOUND
Select (This.CURSOR_NAME)

If Vartype(cReturnField) <> 'C'
	cReturnField = Field(1)
Endif
For I = 1 To Fcount()
	If Lower(Alltrim(cReturnField)) == Lower(Alltrim(Field(I)))
		This._GRID1.Columns( I ).ForeColor = Rgb(0,0,160)
		This._GRID1.Columns( I ).FontBold = .T.
		This.Tag = cReturnField
		BFOUND = .T.
	Endif
Endfor
If  .Not. BFOUND
	This._GRID1.Columns( 1 ).ForeColor = Rgb(0,0,160)
	This._GRID1.Columns( 1 ).FontBold = .T.
	This.Tag = Field(1)
Endif
This.Caption = This.Caption + This.Tag

ENDPROC
PROCEDURE Unload
Local vNewVALUE
If This.ISCANCEL
	vNewVALUE= .Null.
Else
	If Select(This.CALIAS) > 0
		Select (This.CALIAS)
		vNewVALUE= Evaluate(This.Tag)
	Endif
Endif
This.CLOSE_ALIAS(This.CALIAS)
Return vNewVALUE

ENDPROC
     ����    �  �                        ��   %   �      s  1             �  U  � ��  Q� STRING� Q� STRING� %�C�  ��� C��f �+ ��C� ����ָ��SQL��䣡�@� ϵͳ��ʾ�x�� B�-�� � %�C�  ���� �, ��C� ��ѯ��䲻��Ϊ�գ��@� ϵͳ��ʾ�x�� B�-�� � T� �  ��  �� T� � �C��]�� ��C �  � � � � � � �� %�C� � W� ��5�( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� � �� � F�� � �� %�C� ��� C��q� T� �C�/�� � �� ���(�C.��� %�CC� �@CCC� /�@�� �% T� � �	 �� ��
 �C� � ���^�� T� � �	 �� �� �a�� T� � �� �� T� �a�� � �� %�� 
��g�% T� � �	 ����
 �C� � ���^�� T� � �	 ���� �a�� T� � �C�/�� � T� � �� � � � �� U  CSQL CRETURNFIELD THIS CALIAS REFRESH_DATA _GRID1 CURSOR_NAME BFOUND I COLUMNS	 FORECOLOR FONTBOLD TAG CAPTION�  ��  � %�� � ��" � T�  ���� �c � %�C� � W� ��_ � F�� � �� T�  �C� � ��� � � ��C� � � � ��	 B��  �� U 	 VNEWVALUE THIS ISCANCEL CALIAS TAG CLOSE_ALIAS Init,     �� Unload4    ��1 �Q�q A � �q A 1�a�q A q � R� A a�Q�� A A � Q�!A �3 q � � a� !A A 1� 2                       �     %   �  �  (    )   �                        %iscancel �Ƿ�ȡ��ѡ��
csql
calias
      _grid      ..\classlibs\_base.vcx      grid      _grid1      _form1      \Anchor = 15
Height = 420
Left = 12
TabIndex = 1
Top = 12
Width = 516
Name = "_grid1"
      �PROCEDURE DblClick
  THISFORM.RELEASE
ENDPROC
PROCEDURE KeyPress
 LPARAMETER NKEYCODE , NSHIFTALTCTRL
 IF NKEYCODE = 13
  THISFORM.RELEASE
 ENDIF 
ENDPROC
     S���    :  :                        �   %   �       �      �           �  U   
 ��  � � U  THISFORM RELEASE-  ��  � � %��  ���& �
 �� � � � U  NKEYCODE NSHIFTALTCTRL THISFORM RELEASE DblClick,     �� KeyPressP     ��1 � 2 � � A 1                       &         E   �       )   :                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton1      _form1      �Top = 144
Left = 540
Height = 33
Width = 108
Anchor = 8
Caption = "ѡ������(Enter)"
Default = .F.
TabIndex = 3
Name = "_commandbutton1"
      .PROCEDURE Click
  THISFORM.RELEASE
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       #       )   �                         _cancelbutton      ..\classlibs\_base.vcx      commandbutton      _cancelbutton1      _form1      dTop = 243
Left = 540
Height = 33
Width = 108
Anchor = 8
TabIndex = 4
Name = "_cancelbutton1"
      HPROCEDURE Click
 THISFORM.ISCANCEL = .T.
  THISFORM.RELEASE
ENDPROC
      ����    �   �                         K]   %   h             w           �  U    T�  � �a��
 ��  � � U  THISFORM ISCANCEL RELEASE Click,     ��1 � � 1                       =       )   �                         _label      ..\classlibs\_base.vcx      label      _label1      _form1      ZAnchor = 8
Caption = "���ٶ�λ��"
Left = 540
Top = 24
TabIndex = 7
Name = "_label1"
      textbox      textbox      Text1      _form1      �FontSize = 10
Height = 29
Left = 540
MaxLength = 250
TabIndex = 2
ToolTipText = "����Ҫ���˵�ֵ��ƴ������ĸ����"
Top = 48
Width = 108
Name = "Text1"
     �PROCEDURE InteractiveChange
Select (Thisform._grid1.RecordSource)
If Empty(This.Value)
	Set Filter To
Endif
Local cFilterValue
cFilterValue=Upper(Alltrim(This.Value))
Local cFilterExpr
cFilterExpr=""
For Each oColumn As Column In Thisform._grid1.Columns
	cFilterExpr = cFilterExpr + Iif(Empty(cFilterExpr),""," or ") + Textmerge("LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<oColumn.ControlSource>>))))")
	cFilterExpr = cFilterExpr + Iif(Empty(cFilterExpr),""," or ") + Textmerge("LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<oColumn.ControlSource>>)))))")
Endfor
cFilterExpr="("+cFilterExpr+")"
Set Filter To &cFilterExpr
Goto Top
Thisform._grid1.Refresh

ENDPROC
     ����    �  �                        `   %   Y      �     t          �  U  � F��  � � �� %�C� � ���( � G(� � �� � T� �CC� � �f�� �� � T� ��  �� �� Q� COLUMN�  � � �x�| T� �� CC� �� �  � �  or 6C�P LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<oColumn.ControlSource>>))))����� T� �� CC� �� �  � �  or 6C�V LIKEC([*<<cFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<oColumn.ControlSource>>)))))���� �� T� �� (� � )�� Set Filter To &cFilterExpr
 #)� ��  � �	 � U
  THISFORM _GRID1 RECORDSOURCE THIS VALUE CFILTERVALUE CFILTEREXPR OCOLUMN COLUMNS REFRESH InteractiveChange,     ��1 !a A q Aq � ��!A q�Q � 2                       �      )   �                        CArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 10, 6, 16, 13, 35, 3, 0
0
	   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _17F0UWZ9C 813986606      /  F      ]                          �      �                       WINDOWS _17F0UWZ9D1063946985�  �  �              K  �	                  J                           WINDOWS _17F0UWZ9N1063946036{  �  �  �  �  �      2  �                                               WINDOWS _17F0UWZ9X 864397972j    �  �  �  �                                                           WINDOWS _1AM0MEM281014646612  )  G  W  g  u                                                           WINDOWS _1AM0MEM291014646612�  �  �  �  �        I  P                                               WINDOWS _21L0ZZV8T1014646918�  �  �  �  �        a  �                                               COMMENT RESERVED                                2                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      _form      ..\classlibs\_base.vcx      form      _form1     .DataSession = 1
BorderStyle = 3
Height = 511
Width = 737
DoCreate = .T.
Caption = "ͨ�������������"
MaxButton = .T.
WindowType = 0
ctitle = "δ�����ѯ"
ctablename = (sys(2015))
creportpath = ("")
showformintabcontrol = .F.
Name = "_form1"
_base.Name = "_base"
oCommandBars.Top = 300
oCommandBars.Left = 252
oCommandBars.Height = 100
oCommandBars.Width = 100
oCommandBars.Name = "oCommandBars"
oImageManager.Top = 204
oImageManager.Left = 264
oImageManager.Height = 100
oImageManager.Width = 100
oImageManager.Name = "oImageManager"
     iPROCEDURE Unload
  THIS.CLOSE_ALIAS(THIS.cTableName)
  DODEFAULT()
ENDPROC
PROCEDURE Init
Lparameter cSql As String , cTitle As String , cReportPath As String , bNotInTabControl As BOOLEAN
If Vartype(cTitle) = 'C'
	If Empty(cTitle)
		cTitle = ''
	Endif
Else
	cTitle = ''
Endif
If Vartype(cReportPath) <> 'C'
	cReportPath = ''
Endif
If Vartype(bNotInTabControl) <> 'L'
	bNotInTabControl = .F.
Endif
This.ShowFormInTabControl = !bNotInTabControl
If Empty(cReportPath)
	This.cmd_preview.Enabled = .F.
Else
	If !File(cReportPath)
		This.cmd_preview.Enabled = .F.
	Else
		This.cReportPath = cReportPath
	Endif
Endif
This.cTitle = cTitle
This.cTableName =  Getwordnum (This.cTitle,1,':') + Sys(2015)
This.Caption = Iif(Empty(This.cTitle),'',This.cTitle + ' - ') + This.Caption
If !This.Refresh_Data(cSql,This.cTableName,This._GRID1)
	Return .F.
Endif
If Select(This.cTableName) = 0
	RETURN .f.
Endif
Select (This.cTableName)
Thisform.ComField.Clear
For I = 1 To Fcount()
	If Type(Alltrim(Field(I))) = 'C'
		Thisform.ComField.AddItem(Alltrim(Field(I)))
	Endif
Endfor
DoDefault()

ENDPROC
     ����    m  m                        �   %   �        .   �          �  U    ��C�  � �  � ��	 ��C��� U  THIS CLOSE_ALIAS
 CTABLENAMEw< ��  Q� STRING� Q� STRING� Q� STRING� Q� BOOLEAN� %�C� ��� C��q � %�C� ���m � T� ��  �� � �� � T� ��  �� � %�C� ��� C��� � T� ��  �� � %�C� ��� L��� � T� �-�� � T� � �� 
�� %�C� ���� T� � � �-�� �J� %�C� 0
��.� T� � � �-�� �F� T� � �� �� � � T� � �� ��$ T� � �C� � �� :��C��]��4 T� �	 �CC� � �� �  � � � �  - 6� �	 ��" %�C �  � � � � � �
 
���� B�-�� � %�C� � W� �� � B�-�� � F�� � �� �� � � � �� ���(�C.��g� %�CCC� /�b� C��c� ��CCC� /�� � � �� � ��	 ��C��� U  CSQL CTITLE CREPORTPATH BNOTINTABCONTROL THIS SHOWFORMINTABCONTROL CMD_PREVIEW ENABLED
 CTABLENAME CAPTION REFRESH_DATA _GRID1 THISFORM COMFIELD CLEAR I ADDITEM Unload,     �� Initn     ��1 1� 2 �Q� � A � � A Q� A Q� A � � � A A AA!q A aq A � � a�qA A � 2                       D         _   ^      )   m                        )benter
ctitle
ctablename
creportpath
      _grid      ..\classlibs\_base.vcx      grid      _grid1      _form1      \Anchor = 15
Height = 468
Left = 12
Top = 36
Width = 718
naddlen = 30
Name = "_grid1"
     \PROCEDURE AfterRowColChange
 LPARAMETER NCOLINDEX
 =SetStatusText('��¼������' + ALLTRIM(STR(RECCOUNT())) + '       ��ǰ��¼��' +  ;
ALLTRIM(STR(RECNO())))
ENDPROC
PROCEDURE DblClick
 IF THISFORM.BENTER
 THIS.ALLOWCELLSELECTION = .T.
 THISFORM.BENTER = .F.
 ELSE 
 THIS.ALLOWCELLSELECTION = .F.
 THISFORM.BENTER = .T.
 ENDIF 
ENDPROC
     ����    �  �                        �[   %         Z     B          �  U  D  ��  �: ��C�
 ��¼������CCCNZ��        ��ǰ��¼��CCCOZ�� �� U 	 NCOLINDEX SETSTATUSTEXTW  %��  � ��, � T� � �a�� T�  � �-�� �P � T� � �-�� T�  � �a�� � U  THISFORM BENTER THIS ALLOWCELLSELECTION AfterRowColChange,     �� DblClick�     ��1 q �2 � � � � � A 1                       �         �   Q      )   �                        _cancelbutton      ..\classlibs\_base.vcx      commandbutton      _cancelbutton1      _form1      :Top = 2
Left = 647
Anchor = 9
Name = "_cancelbutton1"
      	_combobox      ..\classlibs\_base.vcx      combobox      ComField      _form1      3Anchor = 1
Left = 12
Top = 2
Name = "ComField"
      _textbox      ..\classlibs\_base.vcx      textbox      	_TEXTBOX1      _form1      5Anchor = 1
Left = 119
Top = 4
Name = "_TEXTBOX1"
     �PROCEDURE InteractiveChange
LOCAL __cFilterText,__cFilterField,__vFieldValue,__cFilterExpr
__cFilterField=ALLTRIM(thisform.ComField.DisplayValue)
__cFilterText=ALLTRIM(LOWER(this.Value))
__cFilterExpr="like([*"+__cFilterText+"*],LOWER("+__cFilterField+"))"
SELECT (thisform._grid1.RecordSource)
SET FILTER TO 
IF !EMPTY(__cFilterField)
	__vFieldValue=EVALUATE(__cFilterField)
	IF VARTYPE(__vFieldValue)="C"
		SET FILTER TO &__cFilterExpr
	ENDIF 
ENDIF 
GOTO TOP 
thisform._grid1.Refresh
ENDPROC
     J���    1  1                        ��   %   �      �     �          �  U  �  ��  � � � � T� �C� � � ��� T�  �CC� � @���/ T� �� like([*�  �	 *],LOWER(� � ))�� F�� �	 �
 �� G(� %�C� �
��� � T� �C� ��� %�C� ��� C��� �  SET FILTER TO &__cFilterExpr
 � � #)� �� �	 � � U  __CFILTERTEXT __CFILTERFIELD __VFIELDVALUE __CFILTEREXPR THISFORM COMFIELD DISPLAYVALUE THIS VALUE _GRID1 RECORDSOURCE REFRESH InteractiveChange,     ��1 1QA�a � QA A Q � 1                       �      )   1                        _commandbutton      ..\classlibs\_base.vcx      commandbutton      cmd_preview      _form1      MTop = 2
Left = 360
Anchor = 1
Caption = "��ӡԤ��"
Name = "cmd_preview"
     9PROCEDURE Click
 IF SELECT(THISFORM.cTableName) = 0
  MESSAGEBOX('����Դû�д򿪣�',64,'ϵͳ��ʾ')
 RETURN 
 ENDIF 
 IF  .NOT. FILE(THISFORM.cReportPath)
  MESSAGEBOX('�����ļ������ڣ�',64,'ϵͳ��ʾ')
 RETURN 
 ENDIF 
 SELECT (THISFORM.cTableName)
 REPORT FORM (THISFORM.cReportPath) PREVIEW 
ENDPROC
     ����    o  o                        �_   %   �       &               �  U  �  %�C�  � W� ��D �* ��C� ����Դû�д򿪣��@� ϵͳ��ʾ�x�� B� � %�C�  � 0
��� �* ��C� �����ļ������ڣ��@� ϵͳ��ʾ�x�� B� � F��  � �� ?��  � ��� U  THISFORM
 CTABLENAME CREPORTPATH Click,     ��1 a�A A 1�A A � � 1                       .      )   o                        gArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 10, 6, 16, 13, 35, 3, 0
΢���ź�, 1, 9, 6, 17, 13, 17, 4, 0
0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _2N81DM2MY 983939354      /  F      ]                          �      �                       WINDOWS _2N81DM2MZ1066116121�  �  �                R                                             WINDOWS _2N81DM2O7 983975240"  0  N  [  j  x                                                           WINDOWS _2N81DM2O81066116121	  	  5	  D	  W	  e	                                                           WINDOWS _2N81DM2O9 983939509
  
  :
  O
  f
  t
      �
  ?                                               WINDOWS _2N81DM2OA 983939354G  \  z  �  �  �                                                           COMMENT RESERVED                                �                                                            :                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      _form      ..\classlibs\_base.vcx      form      _form1     �BorderStyle = 2
Height = 126
Width = 352
DoCreate = .T.
Caption = "���������"
Closable = .F.
MaxButton = .F.
MinButton = .F.
WindowType = 1
cpassword = 
showstatusbar = .F.
Name = "_form1"
_base.Name = "_base"
oCommandBars.Top = 300
oCommandBars.Left = 252
oCommandBars.Height = 100
oCommandBars.Width = 100
oCommandBars.Name = "oCommandBars"
oImageManager.Top = 204
oImageManager.Left = 264
oImageManager.Height = 100
oImageManager.Width = 100
oImageManager.Name = "oImageManager"
     3PROCEDURE Unload
*--
return THIS.cpassword

ENDPROC
PROCEDURE Init
*--
lparameters ctitle,ctext
if VARTYPE(CTITLE) = "C" .and.  not EMPTY(CTITLE)
   this.caption = CTITLE
endif
if VARTYPE(CTEXT) = "C" .and.  not EMPTY(CTEXT)
   this._label1.caption = CTEXT
endif
this.cpassword = ""
ENDPROC
     ����    �  �                        o�   %         C     +          �  U    B��  � �� U  THIS	 CPASSWORD�  ��  � � %�C�  ��� C� C�  �
	��: � T� � ��  �� � %�C� ��� C� C� �
	��p � T� � � �� �� � T� � ��  �� U  CTITLE CTEXT THIS CAPTION _LABEL1	 CPASSWORD Unload,     �� InitP     ��1 � 3 � �A �1A 1                       .         I   (      )   �                        cpassword
      _label      ..\classlibs\_base.vcx      label      _label1      _form1      �AutoSize = .F.
FontSize = 11
Alignment = 1
Caption = "����������"
Height = 16
Left = 11
Top = 37
Width = 133
Name = "_label1"
      _textbox      ..\classlibs\_base.vcx      textbox      txtPassword      _form1      �FontBold = .F.
FontName = "Wingdings"
FontSize = 10
Height = 27
Left = 150
Top = 31
Width = 153
PasswordChar = (chr(0x6c))
Name = "txtPassword"
      _commandbutton      ..\classlibs\_base.vcx      commandbutton      _commandbutton1      _form1      PTop = 84
Left = 84
Caption = "ȷ��"
Default = .T.
Name = "_commandbutton1"
      kPROCEDURE Click
*--
thisform.cpassword = ALLTRIM(THISFORM.TXTPASSWORD.value)
thisform.release
ENDPROC
      ���    �   �                         ��   %   �       �      �           �  U  %  T�  � �C�  � � ���
 ��  � � U  THISFORM	 CPASSWORD TXTPASSWORD VALUE RELEASE Click,     ��1 �� 1                       `       )   �                         _cancelbutton      ..\classlibs\_base.vcx      commandbutton      _cancelbutton1      _form1      /Top = 84
Left = 204
Name = "_cancelbutton1"
      HArial, 0, 9, 5, 15, 12, 32, 3, 0
Wingdings, 0, 10, 12, 15, 12, 18, 3, 0
   	 00     h  �          �  �       (  �	  00    �          �  �      h  ^"  00     �%  �'         �  nM       h  ^  (   0   `                                   �      �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� """""""""""""""""""""""""""""""""""""""""""""""""""""""""""  """""""""""""""""""""   2"""""""""""""""""""  ��""""""""""""""""""" � 2"""""""""""""""""" ��{�"""""""""""",�     ��� 2""""""""""�  �fff��;�{�"""""""",  �ff���� ��� 2"""""", f������  ���{�3333""���������   ��     2" l����      ;�{�3330"��� �s    ������� 2 �� 87770  ������0 ��ssss�  ���x��" �77777 888"�����"  ssss�����""��p{��"" 77778888""������"" ss�   ��"""�p{ww�"" 7887770""";��� �"" �ssssw�""";�p{0� �""  77777    ";��0��"    ssss����;�{�0�;�2"    78777888#���3�""   s�sss ���";�����2"   w777w7780"#����""   s�swsss��""33332""   w77ww70888 """""""""   ssssssp����""""""""    78770708888""""""""      �sp  ����"""""""""      8777 8880"""""""""      sssp����"""""""""       777p80 """""""""       ssp���"""""""""        770888"""""""""           ����"""""""""           8880""""""""""           ���"""""""""              """"""""""             """""""""""            """""""""""""          """""""""""""""        """""""""""""""""      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""������  ������  �����  �����  �����  �����  ��� ��  ��  �  �   ?�  �   �  �                                   �       �      �  <    �  |    �  �    �  �    �  � `  �   @  �     �     �     �  �     �     ��     ��     ��     ��     ��     ��     ��     ��     ��  �  ��  �  ��  �  ��  �  ��  �  ��  �  ��  �� ��  �� ��  �� ?��  ������  ������  (       @                                   �      �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� """""""""""""""""""""""  2""""""""""""" �"""""""""""""�2"""""""(�   p�""""""�  �� ��2""""� ���� p�332" �� � ��  "��� � �����2 �770s��;�  wsx��0"0��" 77� 8s"0��" s�"";� �" 7��p0"";0��"  www�  ";{����   ww187#���2   wswp�";���"  w7wp8"#332"  ww�� """"""   7wpwws"""""    7q w0""""""    wpp""""""     7�""""""     ww""""""       sp""""""        70""""""         """""""        """"""""       """"""""""     """""""""""""""""""""""""""""""""""""""�������������� �� �         �   � 0 � p � � � �� 0 � �     �  �  �  �  �  �� �� �� �� �� ���?���������(                                          �      �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� """" 2""""" ;"""�@��2"��� 2�  �� p�;�� w� ";0�"wp ;�3 7p�32 ww"" ww s�""  w�0""  p�""    8 ""      """    ""������ �2  7 @s���� ��ws �� 0 � 77 8s���(   0   `                                 ��� i     4K     Ln `^^ �eT �dS �fU �cP �jW �kX ��� �X> �]F �r\ �u^ �x` �hN �mS �|d �Q1 �{_ ��i �L' �vV ��m ��p �H! �fB �eM ��r �@ �? �\2 �b7 �Y ��o �F �W+ �]/ �W1 ~@' �G. �z lUL �P6 �tE jc_ ՈU mI1 ��� �e+  �X ��� �Ϝ �٦ �Ѽ �` �� ��� �y0 ��� ��� �٬ ��g ��� p�_ H�7 m�b z�o L�F j�f /�- 
�
 � � � w )�) #�# h <�< C�C @�@ %f% 9�9 J�J O�O D�D R�R M�M P�P V�V [�[ c�c i�i o�o g�g E~E u�u q�q |�| ��� ��� 5Y8 ��� 7}W hv i�� r� v� c�  `� ,Xo _� $~� 9�� :�� ?�� G�� W�� c�� ��� ��� s� $}� "n� =�� M�� S�� z�� ��� ��� ��� ��� y� #�� C�� Q�� U�� V�� Z`d �� �� K�� M�� N�� Bs� '�� -�� D�� D�� G�� I�� ,�� :�� <�� =�� @�� C�� 2�� 2�� 3�� 5�� 7�� X� /�� 1�� 6�� 	 c� *|� -�� 't� &q� )z� (w� !b� #h� $j� S� _�  `� "e� B� V� #h� Z� ,[ , Q� M� )h V� A� H� )� ?� <� :� 5� %~ -� /�  l &� [ { .4W  ) r  j ��� ��� ��� ��� ~~~ qqq mmm fff TTT MMM JJJ FFF ??? 888 666 /// ,,, *** ((( $$$ !!!        


                                  ���2�2�22�2���������#,"#"#"#"###,,4/����(""	""""##4��������������+""(""#4������lXlXlXlXll���+	"7)
	"4XTMTTMPSSSSNNOMMMTX�+(	+>3"QYV[MM_Z[[VVURRROOM��3"1(;>;"	"J[]YLQY`a]][VVRRROMl�1"	".>>>+"J`aNmCMbbb`][VVURRMX�#!*;;;;3"FabT>AJShccb`]VVURMl�1"!*):;;;;3)"bd_S??9Q^hdcb`[VURM��+'&"75::5:.8dgYkAAAmMhigcba[VRT�"&"&7:75::.""DggNCBBBBkQiidba]VMf�+)&"1 !77""@gijT??SJigdb`PT�11"#������&"1(#FHgijM??????CT^idbLT�������������## T\gijhT999>99>jTegLT�� ��  ��������TNejeS>mwqqqw�DMQT�� ��� ������������MTNYMw�������vTX��������������������fv���������q������� ��������������������������q�� �������ý������������������������v�������������������������������������u�������Ѻ�����������������������������v���������������������������������������u������ꭲ�������������������������������u����������������������vy����������������v��������Ȫ���������������������������������������д������������y����������������������������÷����������������������������������������ɽŷ����y���������������������������������ĭ �����x��x���������q������������������y��q�zz�q�������rv����������Cm�����qqr�x||}�zyqrwwqs����������������qzz||}��}p��t��������������qz|}}��~�|zwv������������q|}�����}||zq���  ��q}�~���}|ryqy�~|wry�y�y�y������  ������  ������  ������  ������  ������  � ���  � ���  �  ~   �      �      �      �      �      �      �      �      �      �      �      �      �   ?  �     � �   � � ?  � � ?  � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � ?� ?  ����   �����  �����  ������  ������  ������  ������  (       @                                 ��� i     4K L!O Ln `^^ �eT �dS �fU �cP �jW �kX ��� �X> �]F �r\ �u^ �x` �hN �mS �|d �Q1 �{_ ��i �L' �vV ��m ��p �H! �fB �eM ��r �@ �? �\2 �b7 �Y ��o �F �W+ �]/ �W1 ~@' �G. �z lUL �P6 �tE jc_ ՈU mI1 ��� �e+  �X ��� �Ϝ �٦ �Ѽ �` �� ��� �y0 ��� ��� �٬ ��g ��� p�_ H�7 m�b z�o L�F j�f /�- 
�
 � � � w )�) #�# h <�< C�C @�@ %f% 9�9 J�J O�O D�D R�R M�M P�P V�V [�[ c�c i�i o�o g�g E~E u�u q�q |�| ��� ��� 5Y8 ��� 7}W hv i�� r� v� c�  `� ,Xo _� $~� 9�� :�� ?�� G�� W�� c�� ��� ��� s� $}� "n� =�� M�� S�� z�� ��� ��� ��� ��� y� #�� C�� Q�� U�� V�� Z`d �� �� K�� M�� N�� Bs� '�� -�� D�� D�� G�� I�� ,�� :�� <�� =�� @�� C�� 2�� 2�� 3�� 5�� 7�� X� /�� 1�� 6�� 	 c� *|� -�� 't� &q� )z� (w� !b� #h� $j� S� _�  `� "e� B� V� #h� Z� ,[ , Q� M� )h V� A� H� )� ?� <� :� 5� %~ -� /�  l &� [ { .4W  ) r  j ��� ��� ��� ��� ~~~ qqq mmm fff TTT MMM JJJ FFF ??? 888 666 /// ,,, *** ((( $$$ !!!        


                                                                                                                                                                     ����������                    ��0------4/2���                 +"#,/��������������   "	3*
"4XXTQSPPPNQTl��  "
)>3	8W[LS]]ZVURRMQ�  )	%7>76`aFD^ba]VUROQ�  *!&3;;;$
6c\C?Jgcb`VUOQ�   *'*::::1@gYAAEYidb[UQ�     %*.751(IiKBkeicaLQ        (���$$=HijK??99Jhd_f       ���������KYdjD<pypmG\f       ������������  JJn�����ol�      �������������     ������v�     ����½������ȩ  ���������u�    ��������������u q������������   ����󷱴������� q����������u�   ��������������u q����������t�   ��������������u q������������    �������ž����� q������������    ����������ĭ  q���x������q�     ������������  q�q�zy����ws       ���������   �qz{|��~}zr�        ��������     qy|���~}zq          ������       q{���|w                         qqqqqq                                                                                                       �������������������� ���  �  �  �  �  �  �  �  �  � ����        � � � � ����?���������������(                                        ��� i     4K L!O Ln `^^ �eT �dS �fU �cP �jW �kX ��� �X> �]F �r\ �u^ �x` �hN �mS �|d �Q1 �{_ ��i �L' �vV ��m ��p �H! �fB �eM ��r �@ �? �\2 �b7 �Y ��o �F �W+ �]/ �W1 ~@' �G. �z lUL �P6 �tE jc_ ՈU mI1 ��� �e+  �X ��� �Ϝ �٦ �Ѽ �` �� ��� �y0 ��� ��� �٬ ��g ��� p�_ H�7 m�b z�o L�F j�f /�- 
�
 � � � w )�) #�# h <�< C�C @�@ %f% 9�9 J�J O�O D�D R�R M�M P�P V�V [�[ c�c i�i o�o g�g E~E u�u q�q |�| ��� ��� 5Y8 ��� 7}W hv i�� r� v� c�  `� ,Xo _� $~� 9�� :�� ?�� G�� W�� c�� ��� ��� s� $}� "n� =�� M�� S�� z�� ��� ��� ��� ��� y� #�� C�� Q�� U�� V�� Z`d �� �� K�� M�� N�� Bs� '�� -�� D�� D�� G�� I�� ,�� :�� <�� =�� @�� C�� 2�� 2�� 3�� 5�� 7�� X� /�� 1�� 6�� 	 c� *|� -�� 't� &q� )z� (w� !b� #h� $j� S� _�  `� "e� B� V� #h� Z� ,[ , Q� M� )h V� A� H� )� ?� <� :� 5� %~ -� /�  l &� [ { .4W  ) r  j ��� ��� ��� ��� ~~~ qqq mmm fff TTT MMM JJJ FFF ??? 888 666 /// ,,, *** ((( $$$ !!!        


                                                   ��������       � 0000/2��������1llLGLXl�33:@^Kb]US� &::Dk9^g[G�   � @ij?Ca\   �������K���n�  ���ý���p����u� ��α����z������ ��u�����{������ ����ɺv�|������  ������ }�|}{qp   ��   y�{p            yyy                   ���  >3  	  [L� ]Z�RR��  	  >7 �aFÃba��UR��� (   0   `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     %   ,   /   /   /   /   /   /   .   )   $            	                                                                                                                        1   U   m   |   �   �   �   �   �   �   �   �   �   y   n   a   R   @   .                                                                                                            (Fm"��*�-�7��7��7��7��7��7��7��7��2��,�*�i!�T�0�   �   �   p   P   -                       
                                                       |'D�6��<��@��G��M)��R2��U8��X>��\D��`K��bN��cQ��\D��Z@��?��<��C��9��4��)�R�   �   }   O   (      "   ,   7   C   M   Y   _   _   _   _   _   _   _   Y   J   :   '              �3��=��F��K&��N,��T6��W;��]F��bO��eT��fU��iW��jX��jX��]B��C��:��bO��bO��Y?��J%��;
��2�E�   �   u   h   v  � & � $ � ? � > � > � > � > � > � > � > � > � # �  �   �   z   I          �5��B��K%��N,��T6��X>��`K��eS��hV��mY��p\��s^��t_��pY��>�湆��['��X9��hV��eS��`K��X>��N,��9�b,� < � S � b � f �l�
q
���#�#�"�"� � � � ���������w�j� \ � ( �   �   7       �5��E��N+��T6��X>��`K��fT��kX��q\��w`��zb��|d��f��U-��d1����ܞk��J��q\��lY��fT��`K��X>��Q1��7�#��1�1�C�C�M�M�l�w�P�P�O�O�M�M�K�K�G�G�B�B�<�<�4�4�-�-�%�%�����j�  �   S       �5��D��R2��W;��`K��fT��mZ��s^��zb��f���i���j��nK��B��۩�����ҟ��7��zb��s^��mZ��fT��`K��W<��?�e�:�N�N�S�S�5�5�0�(� y�2�2�Y�Y�X�X�U�U�Q�Q�L�L�G�G�?�?�5�5�.�.�%�%���
~
� 8 �   \       �5d�=��U9��]F��eS��lY��s^��zb���h���k���o���j��<
��x�����������W#��oN��zb��s^��mY��eS��]F��?�j�?�X�X�^�^����Ɗ��٦�l�`�`�d�d�`�`�[�[�V�V�O�O�H�H�A�A�7�7�-�-�$�$��� > �   U       �4�7��Q0��bO��hV��q\��zb���h���l���p���t��O ��t@��ۨ��ۨ��ܩ��ܩ��K��^6���h��zb��r]��iW��bO��>�q�F�d�d�b�b� f ���������`�V�$�$�o�o�k�k�e�e�_�_�X�X�Q�Q�I�I�?�?�5�5�*�*��� : �   A   
        �6��>��eT��nZ��w`��f���k���p���u��h=��T ��ʗ��ԡ��ԡ��֣��֣�ܐ]��R%���k��f��w`��nZ��bO��7�g�g�n�n�O�O�0�,�������������p�S�S�v�v�q�q�h�h�a�a�X�X�O�O�G�G�>�>�1�1�o� ! �   )               �7��J"��p\��zb���i���o���t��zR��@��}��Λ��Λ��Λ��Ϝ��Ϝ��v��M���o���i��zb��q\��V7��]�q�q�w�w�7�7���x��������������ϧ�m�p�p�z�z�r�r�h�h�`�`�X�X�N�N�B�B�(�(� ^ �   T                   �4�7��V1��|d���j���q��`��=
��a����������������ƕ��ƕ��r��I���q���k��}e��iN��;	���U�w�w��ف�"�"��ٺ�����������������p�o�"�"��ڂ�{�{�q�q�g�g�[�[�S�S�H�H�v� : �   *                       �52�6��N"��`��]��=
��tK�ތy��fu�Ss�Yw��{��������������7���s���m��mM��;	��y0�t�t����݈� f �������������������������0�0�E�E��ف�v�v�m�m�a�a�X�X�'�'� [ �   @                              S"�0��<
��<
��-�:`� g�j�n�n� g�h�Lm��zU��C��qI��L��@���@�m�m�y�y��ۃ��ߍ� f ��������������������������׹�n�\�\�}�}�q�q�f�f�8�8� c � / i                            
   (   T   ��M� 4�S�
��'��'��'��%��~�k�&\��4
��1�n4�i�E�E�p�p�}�}��݈�t�t� v���������������������������������m�h�h�s�s�:�:� c � 0 f                               6   �   �����   �	S�1��2��2��2��0��(��s�U�   �   \ W q f �+�+�n�n��މ�l�l�@�.��ܹ�����@���k��m��l��0|��������e�m��� ` � 6 Z                                =   ����			��
�E�/��:��<��=��;��:��8��/��p� 	@�   �   5 T ' d � f �}�A�A� f
�@���q��}�����������~��s��h�� a� ? �  e                                *   ��


���� �;��B��C��E��E��E��E��E��B��A��-�� k� �   X        `  ` f ^� f|�{��"���"���"���"���"���!��� �����c�� &�   �   <                             �������8��H��L��M��N��P��P��P��N��M��K��G��z� <�   y   $            Z��~��'���)���+���-���-���+���)���'���%������c�� �   r   (                      1   ������"�N��Q��U��W��W��Y��Z��X��W��V��T��Q��2�� d�   �   3       HmZu��0���2���3���3���3���3���3���3���2���0���.������ R{�   �   S                      ������� F�V��Z�� ^��!a��!b��!b��!b��!b��!b�� `��]��Y��J�� !w�   �   A   	    ^��.���6���7���8���8���8���8���8���8���6���5���4���3���y�� /F�   }   +                  ����"""�%%%��.a�!a��!c��"g��#j��$m��$m��$m��$m��$l��#j��"f��!c�� _�� &z� +�   M    Gj.q��8���:���;���<���=���=���=���=���<���;���:���8���6���1��� \��   �   I                  ��   �$$$�(((�***��3�#i��$m��&q��'t��'v��(x��(x��(x��'v��&s��%p��$l��#h��3�� *�   Y    X�p!���=���>���?���@���A���A���A���A���@���?���>���=���;���8���{�� "3�   h                  ��%%%�)))�---�000�)))��&q��(w��)y��*~��+���,���,���+���+���*}��)y��'u��%p��	@�� M�   [    ]��/���A���B���D���E���F���F���F���E���E���C���B���A���>���=���(��� Gk�   �   )              ��***�///�222�666�999��$j��+���,���-���.���/���/���/���.���-���,���*~��(y��
E�� !O�   P    b��>���E���G���H���I���J���J���J���J���I���H���F���E���B���@���=���`��   �   7              ��000�444�777�;;;�>>>��Bu�-���0���2���3���3���5���3���3���2���0���-���,���F�� 9�   D   
 b��G���I���L���M���N���O���P���P���O���N���M���L���I���F���C���A���v�� 
�   C   
           2�333�777�===�AAA�DDD�666�	�)|��-���-���3���7���:���:���9���7���3���1���.��� ?�� 2�   6    b��J���M���P���Q���R���S���S���S���S���R���Q���P���M���J���G���D������ $7�   G                  �)))�===�AAA�EEE�JJJ�MMM��&�<��M�� `��"e��%n��1���7���:���9���4���(��� D�� �   &    b��N���Q���S���V���W���X���X���X���X���W���U���S���Q���N���L���G���#��� $7�   G                  ��@@@�EEE�KKK�OOO�SSS�QQQ�,,,���
�$n�:��C��W��^��"e��%n��-S� 
�   ^        b��H���U���W���Z���]���`���a���a���_���[���Y���W���U���R���O���M����� $7�   D   
                  �333�JJJ�KKK�DDD�OOO�___�kkk�uuu�sss�DDD���C�p�!��"c�
�   �   �   =   	     b��<���X���V���6���*������.���I���M���N���R���T���Q���N���K���+���j�� &8�   :                      b			�HHH�RRR�TTT�XXX�ddd�uuu�����������������```�---���   �(((��   }           c�B'���.���v����5���=���0���n��|��#���*���6���3���&���{��w�� f�� "�   *                          ��PPP�[[[�ddd�mmm�uuu�������������������������sss�]]]�HHH��   �   7   	             e��j��|��/���?���O���U���m���a���A���$���s��w��2���,���n��^��   b                                 ��YYY�hhh�uuu��������������������������xxx�]]]�///�   �   O                   d��u��7���F���P���X���c���z�������������������v���L���(���r�� Hk�   <   	                                  ��QQQ�yyy�����������������}}}�ppp�kkk�ZZZ�   �   �   _                       c�!i��8���P���d���m���w�����������������������Y���:���(���i�� ,n                                             b   ��TTT�}}}���������nnn�MMM�&&&��   �   <   
                            d�br��Y���m�����������������������m���^���O���=���t�� Dg�   %                                                     d   �   �   �   �   �   �   �   3   	                                        d��p��f�����������������������z���h���K���x�� V��   "                                                                                                                                            b�S f��9�������������������Y���(���g�� Jon                                                                                                                                                       `� b�d b�� b�� b�� b�� ]�� T~a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ������  ������  ������  ������  ������  � ���  �  ��  �     �      �       �       �       �       �       �       �       �      �      �      �      �      �      �         �      �                                                           �      �  �   �  �   �  �   � �   � �   � �   � �   � �   ���� ?  ���� �  ������  ������  ������  ������  (       @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	   %   E   Y   _   _   _   _   _   \   S   F   6   &      	                                                                  Q�o#�k!�k!�k!�k!�k!�k!�T�=� �   �   {   ]   9            #   )   .   /   /   /   .   (                 �7��A��K&��Q0��X?��_J��cP��eT��eT��H!��K&��M)��6�h � 
�   �   g   ^   j   w   �   �   �   �   �   �   �   m   D          �=��L'��R3��]F��dS��iW��q\��t^��jN�ӋW��[0��gU��cP��W<��>�B#� 7 �O�_�t�"�"���������n�U� ) �   �   3       �C��Q0��]F��fU��r\��w`��}d���h��Z,����ӆS��mS��kX��dS��[B��X�@�@�O�O�/�,�$�$�R�R�R�R�J�J�@�@�;�;�-�-�!�!�
�
�  �   C   
    �=��X?��dS��r\��ya���j���n��c:�뷄�����đ��fB��w`��jW��cP��b&�V�V�Y�Y�p�_���m�M�M�d�d�\�\�S�S�E�E�<�<�-�-��� % �   =       �6��W;��kX��w`���j���r��Y�؇T��٦��٦��ڧ��Z1���h��u^��fU��g/�g�g�D�D��٬�����G�B�t�t�j�j�b�b�V�V�E�E�9�9��� ! �   (           �>��oW��}d���n���o��b0��Λ��Ϝ��Ϝ��Н��vG���l��{c��fN��y0�v�v�>�=�������������8�8�{�{�n�n�b�b�Q�Q�>�>�s�   O               �4�E��vV���k��[.��z���������������qC���p��{_��L�z�o��ف�d�c�����������������g�g�z�z�i�i�[�[�.�.� 7 �   "                 .>�+��E�L!O�j�s�q�i�Ln��`4��^3��`�m�b�z�z��ߌ�p�i�����������������Y�L�q�q�p�p�P�P�Z�   (                    L   �   ���%~�/��/��-��{�-E� � @ �7�7�u�u������`��Ѽ�p���E���a�������H�7�C�C�T�   )                     U����$d�8��<��<��<��:��z� 2�   | ; Sn�;�;�0{Y�s�����������v��hv� (�   y   -                   ����+j�F��I��M��M��M��I��?�� g�   �   @    Jon~��,���-���-���-���+������T��   �   [                 r����Q��U��Y��\��^��Z��W��U��)��  �   R   p��3���5���5���5���5���4���3���%��� ;Y�   �   4           ���###�,� `��"e��#h��$j��$j��$j��"f��!c��B�� :�   \ Imp(���;���<���<���<���<���<���:���7���t�� 
�   Q           


�!!!�'''�,,,��$k��'t��(w��)z��){��)y��(w��&q��S�� L�   _ T}�>���B���D���D���D���D���C���@���=���-��� 0I�   h           �)))�///�666�$$$�!b��,���/���1���2���0���.���*}��c��  N�   Yo��D���G���J���K���K���K���I���F���D���@���Lr�   z   %           �***�888�>>>�???�5\�/���0���5���:���6���3���2���c�� %R�   Fw��L���M���P���Q���Q���P���N���M���I���E���d��   �   +           !�???�EEE�LLL�,,,�"Y�A��V��#h��.���6���1���X�� 5�   .{��P���U���V���W���W���V���U���R���N���K���~��   �   +            �@@@�KKK�III�]]]�fff�MMM� )�[�&��2��+i��   a    b��V���S���=���9���M���U���V���S���Q���C���n��   t   "               !�QQQ�WWW�fff�������������qqq�FFF�...�***� �   3    b�d���s��-���?���0���!������ ���%���$�� T~�   W                      b!!!�aaa�sss�����������������~~~�III�


�   I       `�h��7���G���V���u�����������d���L���v�� >^�   1                          B�ccc�������������mmm�GGG��   R               d��.���a���z���������������d���9���m�� O                                    t�---�)))��   q                           d��K���������������~���W���y�� 4N^                                                                                               d��$|��\���O���3���
e�� :X8   
                                                                                                                                                                                                                                                                                                                                                                                                                   ���������������� ?��  �   �   �   �   �   �  �  �                             �  �  �  �������������������(                                           	                                                       /   S   _   _   ^   V   E   -         !   #   "      f 7�-�|+̃/Ӄ/�f"�=�   �   �   h   g   s   w   v   g   =�=��R3��cP��p[��lR��nA��eQ��J)�-2�W�!y!�-�-�!~!�k�0�   g�=��cP��zb���n�܅V��͛��pR��jW���<�S�O�g�\�a�a�U�U�8�8�z�   f�2#�]?���k��}Q��ǔ��Ӡ��wP��t[���P�������U�U�s�s�R�R�u�   =   Vb�LB�B#Z�C6x�`Hw��[8��z5��ڂ��Ɨ������Ϩ�c�c�A�A� ) w      I��+q�:��1��\� % �@�@�C���v�� }��q[�  �   W   


��/h�M��W��O��2��  �=^�-���3���3���+���,D�   y   %�(((�B��&s��&s��&s��\�� ,�s��?���@���@���>���{��   �   7   �555�%Ek�0���4���3���!s�� 1�+���L���M���M���I���1��� 
�   =�JJJ�BBB�6Fe�E��"b��G}� 1�2���L���J���W���P���B��� ';�   0   ...�iii���������OOO�&�   /l��)���R���a���Q���u��   Z          !,,,�\\\�KKK�!!!�   '    `�")�����������W���^��                                            c�!.���L��� V�_                                                                               �  0�  F�  U�  \�  `�  d�  h�  ,�  ��  S�  S�� X���S���B�BM�      6   (               �  �  �          ������������������������sͅ,�I�.�1�1�.,�Isͅ�������������������������������������������,�3�D�J �N �M �M �N�J�D�3�,������������������������������rǁ�*�E �M�L�K�K�K�K�K�K�L �M�E�*rǁ���������������������[�m�1�P�P�O�Q�N�N�L�K�K�K�J�P �Q�Q�1[�m���������������q�~�0 �S�O�N�R+�K � �+�L�L�K�K�K�J�J�O!�T�0q�~�������������"�P�P�O�R�= ������� �+�L�L�K�K�K�J�O�P�Q�"�����������H�R�P�S�B ������������� ��>�N�K�K�J�Q�Q�S�H��������%�Y�S�X�, ������������������� �
�>�M�J�J�J�I�S �Z�%���p�w�>�X�Y�2 ������������������������ �
�=�]�X�X�Z�W�Y�>p�w'�+1�j�S�B ������������������������������ �
�<�_�[�Z�[�O1�j'�+|w�2�o������������� �  �+ � �������������� �
�<�_�Z�V-�kw�|
�l�k������������ � �`�]�` � �������������� �
�<�[0�tk��l�
�y	l�cޛf� � ��� � �M�V�T�U�Y � �������������� �	*�Hl�cޛl�y	 h h�aߞg�d�)�YPבWٚVؘUؘVؘVٙXߡ � �������������� �g�aߞh� h   qܞ\�b�Tۙa�`�_�^ޠhޣ_�_�`�g� � �������������� �]�qܞ  m�kD�a���X�b�^�^�^�^�]�^�^�^�_�a� � ����������������D�am�k���x���t�Uߜ^�`�_�^�^�^�^�^�^�_�c� � ���������7�V���x������hR�x��օ�T��Z�_�^�^�^�^�^�^�^�_�h� � #�]*�;���R�xh��������� f y⮢�і��n�J��[�\�\�\�\�\�\�[�L�s軝�Ц��y� f ������������m�k}麝�қ�˗��}��m�m�m�m�m�m�}��˝�̞���}m�k���������������T�Txmݧ��ә�Ϙ�͞�Ң�֤�؞�̣�؝�͙�͚�И��mݧxT�T���������������������n�j ` F�t�����Ԛ�՗�і�ϖ�ϗ�њ�՗�ԁ��F�t ` n�j������������������������������]s1�T[ΐuᴆ�Ć��u�[ΐ1�Ts]������������������������������������������k�j n  P  d  d  P  n k�j������������������������BMf      v   (               �                     �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �������������������������������������������������������������������������������O������DDO��G������DD����������DO����������D�����������O�D��G���������DD����������������������������������������������������������������������������������������BM�       v   (                                         �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ����  �����������������  ���������������LLO������������������LLO�������������wwww����   �����  ������ �����������BM6      6   (                                  ������������������������������������������������p��`��`x�Pp�P`p@X`@HP08@ 00  0  ���������p�����p�� �� �� �� �������� x� p� H`��������������А�����`��P��P��@��0��0�� ���� h�ejp�����������𐨰���p��`��`��P��P��@��0��0���� H`���������������������p��`��`��`��P��@��@��0�� h�x�������������������p��`��`��`��`��P��P��@��0��Kix��䀘���������������������������������p��p��P�Б����������������������������������������������p�������������������`��`��`��`��`��`��p���������������������������p�����������������p������������������������������������������������hP�hP�hP��搨������������������������������������ҐhP�hP����������������������������x`�ƽ�����������Ґx`�����������������������������ߠ���������ǿ������������������������������������������������������BM�      6   (               �  �  �          ���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������k��k��k��k��k��k��������������������������������������������������������k������؝�ش��k��������������������������������������������������������k����؂�͂�͝��k��������������������������������������������������������k�����t��t�Ǐ��k��������������������������������������������������������k�����r��r�Ǌ��k��������������������������������������������������������k�����p��p�Ƃ��k��������������������������������������k��k��k��k��k��k��wŬw��l��l��w��wŬk��k��k��k��k��k��������������������k������؏�Ҋ�Ђ��w��o��i��i��o��w�Ȃ�͊�Џ�ҝ�ش��k��������������������k����؂��t��r��p��l��i��h��h��i��l��p��r��t�ǂ�͝��k��������������������k����������������߿�޾�޽�ݽ�ݾ�޿�����������������k��������������������k��������������������������������������������������k��������������������k��k��k��k��k��k���ʸ������������ʸk��k��k��k��k��k��������������������������������������k��������������k��������������������������������������������������������k��������������k��������������������������������������������������������k��������������k��������������������������������������������������������k��������������k��������������������������������������������������������k��������������k��������������������������������������������������������k��k��k��k��k��k�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _49T0TDW771178692947      /  F      ]                          �      �                       WINDOWS _49T0TDW781234197570�      �  �      �      N  F                  �*                           WINDOWS _49T0TDW7K1234078809�+      �+  �+  �+  �+      d,  �,                                               WINDOWS _4A00X905M1183948525�-      �-  �-  �-  �-                                                           WINDOWS _49T0TDW771233617558A.      N.  [.  i.  v.                                                           WINDOWS _49T0TDW781233617558/      +/  ;/  L/  Y/      0  [0                                               WINDOWS _49T0TDW771178692947S1      `1  m1  {1  �1                                                           WINDOWS _49T0TDW781233617558,2      <2  L2  [2  h2      3  �3                                               WINDOWS _4SM0Z17KV1233617558�4      �4  �4  �4  �4                                                           WINDOWS _4SM0Z17KW1233617558�5      �5  �5  �5  �5      {6  7                                               COMMENT RESERVED                                -8                                                            8�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     QBorderStyle = 2
Height = 250
Width = 740
ShowWindow = 1
DoCreate = .T.
AutoCenter = .T.
Caption = "ѡ���Ŀ"
MaxButton = .F.
MinButton = .F.
WindowType = 1
cselected = 
breturn = .F.
cbjlx = �а�
_memberdata =      299<VFPData><memberdata name="listkc" type="method" display="ListKC"/><memberdata name="cbjlx" type="property" display="cBJLX"/><memberdata name="cnj" type="property" display="cNJ"/><memberdata name="cxn" type="property" display="cXN"/><memberdata name="cxq" type="property" display="cXQ"/></VFPData>

cxq = 
cxn = 
cnj = 
ocoursecoll = 
Name = "Form1"
     �PROCEDURE refreshselect
LOCAL cSelected
cSelected=""

FOR EACH oControl as CheckBox IN this.oCourseColl
	IF oControl.Value
		cSelected = cSelected + IIF(EMPTY(cSelected),"",",") + oControl.Tag
	ENDIF 
ENDFOR

this.cSelected=cSelected 
ENDPROC
PROCEDURE listkc
LPARAMETERS cBJLX

LOCAL nFormTop
nFormTop=this.Top

FOR EACH oControl as Control IN this.oCourseColl
	this.RemoveObject(oControl.Name)
ENDFOR
WITH this.oCourseColl as Collection
	.Remove(-1)
ENDWITH 

LOCAL cKMs
cKMs=""
LOCAL cSQL,cCursor
cSQL=TEXTMERGE("select �γ�����,��ʱ�� from �γ��շѱ� where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �༶����='<<cBJLX>>' order by ���")
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ�γ�ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
LOCAL nIndex,nLeft,nTop
nIndex=0
nLeft=24
nTop=72
SELECT (cCursor)
SCAN 
	nIndex = nIndex + 1 
	LOCAL cControlName,oKCControl as CheckBox
	cControlName=SYS(2015)
	this.AddObject(cControlName,"CheckBox")
	oKCControl=EVALUATE("this."+cControlName)
	WITH oKCControl as CheckBox
		.Caption=ALLTRIM(�γ�����)+CHR(13)+CHR(10)+TRANSFORM(��ʱ��)+"Ԫ"
		.Tag=ALLTRIM(�γ�����)
		.Alignment= 2
		.BackStyle= 0
		.Centered= .T.
		.DownPicture="check_ok.bmp"
		.FontName="΢���ź�"
		.FontSize=10
		.Height=48
		.Left=nLeft
		.Top=nTop
		.PictureMargin=10
		.PicturePosition= 1
		.Style= 1
		.Themes= .F.
		.Width=96
		.WordWrap= .T.
		.Visible= .T.
		.Value=.f.
		IF nIndex>=6
			nLeft=24
			nTop = nTop + 48 + 12
			nIndex=0
		ELSE
			nLeft = nLeft + 96 + 24
		ENDIF 
	ENDWITH 
	WITH this.oCourseColl as Collection
		.Add(oKCControl,oKCControl.Name)
	ENDWITH 
ENDSCAN 

this.Top = this.Top - (nTop+48+12-this.Height)/2

this.Height=nTop+48+12

this.cSelected=""
ENDPROC
PROCEDURE cbjlx_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.cBJLX = m.vNewVal
this.ListKC(m.vNewVal)
ENDPROC
PROCEDURE refreshxn
LPARAMETERS cXQ as String

this.ComboXN.Clear
*!*��ʼ��ѧ��
LOCAL cSQL,cCursor
cSQL="select * from ѧ��� where У��='"+ALLTRIM(cXQ)+"' and ISNULL(����,0)=0 order by ��ǰѧ�� desc,��ʼ���� desc"
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ȡ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF 
SELECT (cCursor)
SCAN 
	this.ComboXN.AddItem(ALLTRIM(ѧ��))
ENDSCAN 
=CloseAlias(cCursor)

this.ComboXN.Value=1

ENDPROC
PROCEDURE Destroy
FOR EACH oControl as Control IN this.oCourseColl
	this.RemoveObject(oControl.Name)
ENDFOR
WITH this.oCourseColl as Collection
	.Remove(-1)
ENDWITH 
ENDPROC
PROCEDURE Unload


IF this.bReturn
	RETURN "<ѧ��>"+this.cXN+"</ѧ��><�꼶>"+this.cNJ+"</�꼶><�༶����>"+this.cBJLX+"</�༶����><ѡ���Ŀ>"+this.cSelected+"</ѡ���Ŀ>"
ELSE
	RETURN ""
ENDIF 
ENDPROC
PROCEDURE Init
LPARAMETERS cXQ,cNJ

this.oCourseColl=CREATEOBJECT("Collection")

this.cXQ=cXQ
this.refreshxn(cXQ)
this.cXN=ALLTRIM(this.ComboXN.DisplayValue)

this.cNJ=cNJ

LOCAL cSQL,cCursor,cBJLX
cBJLX=""
cSQL=TEXTMERGE("select distinct �༶���� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<cNJ>>' order by �༶����")
cCursor=SYS(2015)
IF !SelectData(cSQL,cCursor)
	MESSAGEBOX("��ѯ�༶����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN "<�༶����></�༶����><ѡ���Ŀ></ѡ���Ŀ>"
ENDIF 
SELECT (cCursor)
SCAN 
	cBJLX = cBJLX + IIF(EMPTY(cBJLX),"",",") + ALLTRIM(�༶����)
ENDSCAN 
=CloseAlias(cCursor)
IF EMPTY(cBJLX)
	MESSAGEBOX("û�������շѱ�׼��",0+64,"ϵͳ��ʾ")
	RETURN "<�༶����></�༶����><ѡ���Ŀ></ѡ���Ŀ>"
ENDIF 
this.ComboBJLX.RowSource=cBJLX
this.cbjlx=GETWORDNUM(cBJLX,1,",")

this.ComboNJ.AddItem(cNJ)

LOCAL cNJSQL,cNJCursor
TEXT TO cNJSQL NOSHOW TEXTMERGE 
declare @��� int,@�꼶 varchar(50)
set @�꼶='<<cNJ>>'

set @���=(select top 1 ��� from �꼶�� where �꼶=@�꼶)
select �꼶 
from �꼶�� 
where ��� in ((select top 1 ��� from �꼶�� where ���<@��� order by ��� desc)
,(select top 1 ��� from �꼶�� where ���>@��� order by ���)
) or �꼶='����'
order by ���
ENDTEXT 
cNJCursor=SYS(2015)
IF !SelectData(cNJSQL,cNJCursor)
	MESSAGEBOX("��ѯ�꼶ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 
SELECT (cNJCursor)
SCAN 
	this.ComboNJ.AddItem(ALLTRIM(�꼶))
ENDSCAN 
=CloseAlias(cNJCursor)
ENDPROC
     ]���    D  D                        �C   %   �      �  �   _          �  U  �  ��  � T�  ��  �� �� Q� CHECKBOX� � �o � %�� � ��k �) T�  ��  CC�  �� �  � � ,6� � �� � �� T� �  ��  �� U 	 CSELECTED OCONTROL THIS OCOURSECOLL VALUE TAG� ��  � �� � T� �� � �� �� Q� CONTROL� � �N � ��C� � � � �� �� ��� � �Q�
 COLLECTION� � ��C����� �� �� ��	 � T�	 ��  �� ��
 � �� T�
 �Cٗ select �γ�����,��ʱ�� from �γ��շѱ� where У��='<<this.cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<this.cNJ>>' and �༶����='<<cBJLX>>' order by ������� T� �C��]�� %�C �
  � � 
����( ��C� ��ȡ�γ�ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � �� � � � T� �� �� T� ���� T� ��H��
 F�� �� ~�9� T� �� ��� �� � Q� CHECKBOX� T� �C��]�� ��C � � CheckBox� � �� T� �C� this.� ��� ��� �Q� CHECKBOX���( T�� �C� �C� C�
 C� _� Ԫ�� T�� �C� ��� T�� ���� T�� �� �� T�� �a�� T�� �� check_ok.bmp�� T�� �� ΢���ź��� T�� ��
�� T�� ��0�� T�� �� �� T�� �� �� T�� ��
�� T��  ���� T��! ���� T��" �-�� T��# ��`�� T��$ �a�� T��% �a�� T��& �-�� %�� ����� T� ���� T� �� �0��� T� �� �� ��� T� �� �`��� � �� ��� � �Q�
 COLLECTION�5� ��C � � � ��' �� �� �+ T� � �� � � �0�� � ��� T� � �� �0��� T� �( ��  �� U)  CBJLX NFORMTOP THIS TOP OCONTROL OCOURSECOLL REMOVEOBJECT NAME REMOVE CKMS CSQL CCURSOR
 SELECTDATA NINDEX NLEFT NTOP CCONTROLNAME
 OKCCONTROL	 ADDOBJECT CAPTION �γ����� ��ʱ�� TAG	 ALIGNMENT	 BACKSTYLE CENTERED DOWNPICTURE FONTNAME FONTSIZE HEIGHT LEFT PICTUREMARGIN PICTUREPOSITION STYLE THEMES WIDTH WORDWRAP VISIBLE VALUE ADD	 CSELECTED/  ��  � T� � ���  �� ��C ��  � � �� U  VNEWVAL THIS CBJLX LISTKCE ��  Q� STRING� �� � � � �� � �s T� ��! select * from ѧ��� where У��='C�  ��; ' and ISNULL(����,0)=0 order by ��ǰѧ�� desc,��ʼ���� desc�� T� �C��]�� %�C �  � � 
��� �( ��C� ��ȡ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B�-�� �
 F�� �� ~�� ��CC� �� � � �� � ��C � �	 �� T� � �
 ���� U  CXQ THIS COMBOXN CLEAR CSQL CCURSOR
 SELECTDATA ADDITEM ѧ��
 CLOSEALIAS VALUEh  ��  Q� CONTROL� � �0 � ��C�  � � � �� �� ��� � �Q�
 COLLECTION�a � ��C����� �� �� U  OCONTROL THIS OCOURSECOLL REMOVEOBJECT NAME REMOVE�  %��  � ��� �y B�� <ѧ��>�  � � </ѧ��><�꼶>�  � � </�꼶><�༶����>�  � � </�༶����><ѡ���Ŀ>�  � � </ѡ���Ŀ>�� �� �	 B��  �� � U  THIS BRETURN CXN CNJ CBJLX	 CSELECTED� ��  � � T� � �C�
 Collection�N�� T� �  ��  �� ��C �  � � �� T� � �C� � � ��� T� � �� �� �� �	 �
 � T�
 ��  ��� T� �C�z select distinct �༶���� from �γ��շѱ� where У��='<<cXQ>>' and ѧ��='<<this.cXN>>' and �꼶='<<cNJ>>' order by �༶�������� T�	 �C��]�� %�C �  �	 � 
����, ��C� ��ѯ�༶����ʧ�ܣ��@� ϵͳ��ʾ�x��3 B��* <�༶����></�༶����><ѡ���Ŀ></ѡ���Ŀ>�� �
 F��	 �� ~���( T�
 ��
 CC�
 �� �  � � ,6C� ��� � ��C �	 � �� %�C�
 ���[�, ��C� û�������շѱ�׼���@� ϵͳ��ʾ�x��3 B��* <�༶����></�༶����><ѡ���Ŀ></ѡ���Ŀ>�� � T� � � ��
 �� T� �
 �C�
 �� ,���� ��C � � � � �� �� � �
 M(� `��) �# declare @��� int,@�꼶 varchar(50)� � set @�꼶='<<cNJ>>'� �  �@ �: set @���=(select top 1 ��� from �꼶�� where �꼶=@�꼶)� � select �꼶 � � from �꼶�� �X �R where ��� in ((select top 1 ��� from �꼶�� where ���<@��� order by ��� desc)�E �? ,(select top 1 ��� from �꼶�� where ���>@��� order by ���)� � ) or �꼶='����'� � order by ���� � T� �C��]�� %�C �  � � 
��~�( ��C� ��ѯ�꼶ʧ�ܣ��@� ϵͳ��ʾ�x�� B� �
 F�� �� ~��� ��CC� �� � � �� � ��C � � �� U  CXQ CNJ THIS OCOURSECOLL	 REFRESHXN CXN COMBOXN DISPLAYVALUE CSQL CCURSOR CBJLX
 SELECTDATA �༶����
 CLOSEALIAS	 COMBOBJLX	 ROWSOURCE COMBONJ ADDITEM CNJSQL	 CNJCURSOR �꼶 refreshselect,     �� listkc�     �� cbjlx_assign�    ��	 refreshxnK    �� Destroy�    �� Unload�	    �� Inita
    ��1 q � ��A A 2 q r �1A �� A r � � q
q�A A � � � � � � q����� � � �a� � � � � � � � � � � � � Q� � QA A �QA A ��2 q "12 � � 1q�q A � � QA � 23 �1A �� A 2 �� � A 2 � ��� � �q�1A � � �A � � �1A 1�B� � ��a !!�Qa1A q�A A � � QA � 1                       �      
          K   7  �  U   O   �  �	  [   _   �	  8
  p   f   U
  
  x   l   %  �  �    )   D                        �cselected ѡ���Ŀ
breturn
cbjlx �༶����
_memberdata XML Metadata for customizable properties
cxq У��
cxn ѧ��
cnj �꼶
ocoursecoll ��Ŀ����
*refreshselect ˢ��ѡ��
*listkc �г��γ�
*cbjlx_assign 
*refreshxn ˢ��ѧ��
      commandbutton      commandbutton      Command1      Form1      {Top = 12
Left = 599
Height = 36
Width = 134
FontName = "΢���ź�"
FontSize = 10
Caption = "ȷ��"
Name = "Command1"
      ZPROCEDURE Click
thisform.refreshselect
thisform.bReturn=.t.
thisform.Release
ENDPROC
      ����    �   �                         �   %   �       �      �           �  U  % 
 ��  � � T�  � �a��
 ��  � � U  THISFORM REFRESHSELECT BRETURN RELEASE Click,     ��1 � � � 1                       O       )   �                         line      line      Line2      Form1      >Height = 0
Left = 12
Top = 60
Width = 720
Name = "Line2"
      label      label      Label2      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 11
BackStyle = 0
Caption = "�༶���ͣ�"
Height = 22
Left = 392
Top = 20
Width = 77
Name = "Label2"
      combobox      combobox      	ComboBJLX      Form1      �FontName = "΢���ź�"
FontSize = 11
Alignment = 2
RowSourceType = 1
Value = 1
Height = 33
Left = 477
Style = 2
Top = 15
Width = 99
Name = "ComboBJLX"
      QPROCEDURE InteractiveChange
thisform.cbjlx=ALLTRIM(this.DisplayValue)
ENDPROC
      ����    �   �                         G�   %   m       �      �           �  U    T�  � �C� � ��� U  THISFORM CBJLX THIS DISPLAYVALUE InteractiveChange,     ��1 Q1                       F       )   �                         label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 11
BackStyle = 0
Caption = "���Ѽ��ȣ�"
Height = 22
Left = 12
Top = 20
Width = 77
Name = "Label1"
      combobox      combobox      ComboXN      Form1      �FontName = "΢���ź�"
FontSize = 11
Alignment = 2
RowSourceType = 1
Value = 1
Height = 33
Left = 84
Style = 2
Top = 15
Width = 131
Name = "ComboXN"
      �PROCEDURE InteractiveChange
thisform.cXN=ALLTRIM(this.DisplayValue)
thisform.cBJLX=ALLTRIM(thisform.ComboBJLX.DisplayValue)
ENDPROC
     ���                              �]   %   �       �      �           �  U  0  T�  � �C� � ��� T�  � �C�  � � ��� U  THISFORM CXN THIS DISPLAYVALUE CBJLX	 COMBOBJLX InteractiveChange,     ��1 Q�1                       }       )                           label      label      Label3      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 11
BackStyle = 0
Caption = "�꼶��"
Height = 22
Left = 228
Top = 20
Width = 47
Name = "Label3"
      combobox      combobox      ComboNJ      Form1      �FontName = "΢���ź�"
FontSize = 11
Alignment = 2
RowSourceType = 1
Value = 1
Height = 33
Left = 274
Style = 2
Top = 15
Width = 109
Name = "ComboNJ"
      �PROCEDURE InteractiveChange
thisform.cNJ=ALLTRIM(this.DisplayValue)
thisform.cBJLX=ALLTRIM(thisform.ComboBJLX.DisplayValue)
ENDPROC
     ���                              �]   %   �       �      �           �  U  0  T�  � �C� � ��� T�  � �C�  � � ��� U  THISFORM CNJ THIS DISPLAYVALUE CBJLX	 COMBOBJLX InteractiveChange,     ��1 Q�1                       }       )                           kArial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 0, 11, 7, 20, 16, 21, 4, 0
BM6      6   (                  �  �          ������������������������������������������������������������������������������������������������������                                 ���������������   ���������������������������   ���������������   ��������������󦦦���������   ���������������   ���������������������������   ���������������   ������������������������   ���������������   ���������������������������   ���������������   ���������������������������   ���������������   ���������������������������   ���������������   ��������������蟟����������   ���������������   ���������������������������   ���������������   �ry�[b�[b�[b�[b�[b�[b�[b�[b   ���������������                                 ���������������������������������������������������������������������������������������������������������0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _4C10YB8W11184268304      /  F      ]                          �      �                       WINDOWS _4C10YB8W21192580339�      �  �      �                                                           WINDOWS _4C10YB8W31184268304�      �  �  �  �                                                           WINDOWS _4C10YB8W41184268436�      �  �  �  �                                                           WINDOWS _4C10YB8W51184268389T      i  ~  �  �        �                                               WINDOWS _4C10YB8W61184268436�	      �	  �	  �	  �	                                                           WINDOWS _4C10YB8W71184268304�
      �
  �
  �
  �
                                                           WINDOWS _4C10YB8W81184268436\      k  z  �  �                                                           WINDOWS _4C10YB8W91184268389      4  I  Y  f      �  K                                               WINDOWS _4C10YB8WA1192580339^      n  ~  �  �                                                           WINDOWS _4C10YB8WB1184268436V      c  p  �  �                                                           WINDOWS _4C10YB8WC1184268304L      Y  f  t  �                                                           WINDOWS _4C10YB8W11184269784m      �  �  �  �      7  N                                               WINDOWS _4C10YB8WE1184268436�      �  �  �        �  �                                               WINDOWS _4C10YO3S01184269237�      �  �  �  �      f  �                                                COMMENT RESERVED                                @$                                                            $�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �BorderStyle = 2
Top = 149
Left = 343
Height = 172
Width = 515
ShowWindow = 1
DoCreate = .T.
Caption = "ѧ����Ϣ�ϲ�"
MaxButton = .F.
MinButton = .F.
WindowType = 1
Name = "Form1"
      label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "FROM��"
Height = 21
Left = 50
Top = 38
Width = 54
Name = "Label1"
      textbox      textbox      Text1      Form1      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Enabled = .F.
Height = 23
Left = 108
Top = 36
Width = 72
Name = "Text1"
      commandbutton      commandbutton      Command1      Form1      zTop = 36
Left = 180
Height = 24
Width = 27
Picture = ..\..\images\system\search.bmp
Caption = ""
Name = "Command1"
     [PROCEDURE Click
LOCAL cXSBH,cSQL
cSQL="select ѧ�����,ѧ������,�꼶,���õ绰 from ��ѧ�ǼǱ� order by ѧ�����"
DO FORM frm_f7 WITH null,cSQL,"ѧ�����" TO cXSBH
IF EMPTY(NVL(cXSBH,""))
	RETURN 
ENDIF 
thisform.Text1.Value=cXSBH
thisform.LabelXSXM1.Caption=GetValue("select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='"+cXSBH+"'")
ENDPROC
     ���    �  �                        C�   %   �      �  
   �          �  U  
 ��  � �U T� ��H select ѧ�����,ѧ������,�꼶,���õ绰 from ��ѧ�ǼǱ� order by ѧ�������( � frm_f7(�  ����� �� ѧ������� %�CC�  �  ҡ��� � B� � T� � � ��  ��P T� � � �C�0 select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='�  � '� �� U	  CXSBH CSQL FRM_F7 THISFORM TEXT1 VALUE
 LABELXSXM1 CAPTION GETVALUE Click,     ��1 � Q�AA A 11                       P      )   �                        label      label      
LabelXSXM1      Form1      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = ""
Height = 21
Left = 216
Top = 38
Width = 84
ForeColor = 0,0,255
BackColor = 192,192,192
Name = "LabelXSXM1"
      label      label      Label3      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
BackStyle = 0
Caption = "TO��"
Height = 21
Left = 50
Top = 74
Width = 33
Name = "Label3"
      textbox      textbox      Text2      Form1      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Enabled = .F.
Height = 23
Left = 108
Top = 72
Width = 72
Name = "Text2"
      commandbutton      commandbutton      Command2      Form1      zTop = 72
Left = 180
Height = 24
Width = 27
Picture = ..\..\images\system\search.bmp
Caption = ""
Name = "Command2"
     [PROCEDURE Click
LOCAL cXSBH,cSQL
cSQL="select ѧ�����,ѧ������,�꼶,���õ绰 from ��ѧ�ǼǱ� order by ѧ�����"
DO FORM frm_f7 WITH null,cSQL,"ѧ�����" TO cXSBH
IF EMPTY(NVL(cXSBH,""))
	RETURN 
ENDIF 
thisform.Text2.Value=cXSBH
thisform.LabelXSXM2.Caption=GetValue("select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='"+cXSBH+"'")
ENDPROC
     ���    �  �                        C�   %   �      �  
   �          �  U  
 ��  � �U T� ��H select ѧ�����,ѧ������,�꼶,���õ绰 from ��ѧ�ǼǱ� order by ѧ�������( � frm_f7(�  ����� �� ѧ������� %�CC�  �  ҡ��� � B� � T� � � ��  ��P T� � � �C�0 select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='�  � '� �� U	  CXSBH CSQL FRM_F7 THISFORM TEXT2 VALUE
 LABELXSXM2 CAPTION GETVALUE Click,     ��1 � Q�AA A 11                       P      )   �                        checkbox      checkbox      Check1      Form1      �Top = 39
Left = 312
Height = 21
Width = 149
FontName = "΢���ź�"
FontSize = 10
AutoSize = .T.
Alignment = 0
Caption = "�ϲ��ɹ���ɾ����ѧ��"
Value = .T.
Name = "Check1"
      label      label      
LabelXSXM2      Form1      �FontName = "΢���ź�"
FontSize = 10
Alignment = 2
Caption = ""
Height = 21
Left = 216
Top = 74
Width = 84
ForeColor = 0,0,255
BackColor = 192,192,192
Name = "LabelXSXM2"
      label      label      Label5      Form1      �FontName = "΢���ź�"
FontSize = 10
BackStyle = 1
Caption = "˵������ѧ��1��ȫ����Ϣ���շѡ����ڣ��ϲ���ѧ��2��"
Height = 20
Left = 48
Top = 9
Width = 408
ForeColor = 255,255,255
BackColor = 0,128,255
Name = "Label5"
      commandbutton      commandbutton      Command3      Form1      {Top = 120
Left = 143
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "ִ��"
Name = "Command3"
     PROCEDURE Click
IF EMPTY(thisform.Text1.Value) OR EMPTY(thisform.Text2.Value)
	MESSAGEBOX("������д��������",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

IF MESSAGEBOX("��ȷ��Ҫ�ϲ�������",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
exec �ϲ�ѧ������ '<<thisform.Text1.Value>>','<<thisform.Text2.Value>>'
ENDTEXT 

IF Execute(cSQL)
	MESSAGEBOX("ִ�гɹ���",0+64,"ϵͳ��ʾ")
	IF thisform.Check1.Value
		IF !Execute("delete from ��ѧ�ǼǱ� where ѧ�����='"+thisform.Text1.Value+"'")
			MESSAGEBOX("ɾ��ѧ������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
		ENDIF 
	ENDIF 
	thisform.Text1.Value=""
	thisform.Text2.Value=""
	thisform.LabelXSXM1.Caption=""
	thisform.LabelXSXM2.Caption=""
ELSE
	MESSAGEBOX("ִ��ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     h���    O  O                        ��   %   �           �          �  U  :$ %�C�  � � �� C�  � � ���R �* ��C� ������д���������@� ϵͳ��ʾ�x�� B� �6 %�C� ��ȷ��Ҫ�ϲ��������!� ϵͳ��ʾ�x���� � B� � �� �
 M(� `��M �G exec �ϲ�ѧ������ '<<thisform.Text1.Value>>','<<thisform.Text2.Value>>'� � %�C � � ���$ ��C�
 ִ�гɹ����@� ϵͳ��ʾ�x�� %��  � � ����H %�C�' delete from ��ѧ�ǼǱ� where ѧ�����='�  � � � '� 
����, ��C� ɾ��ѧ������ʧ�ܣ��@� ϵͳ��ʾ�x�� � � T�  � � ��  �� T�  � � ��  �� T�  � � ��  �� T�  �	 � ��  �� �3�$ ��C�
 ִ��ʧ�ܣ��@� ϵͳ��ʾ�x�� � U
  THISFORM TEXT1 VALUE TEXT2 CSQL EXECUTE CHECK1
 LABELXSXM1 CAPTION
 LABELXSXM2 Click,     ��1 A�A A bA A r � �A "A1��A A 1111� AA 1                             )   O                        commandbutton      commandbutton      Command4      Form1      �Top = 120
Left = 287
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Cancel = .T.
Caption = "�ر�"
Name = "Command4"
      ,PROCEDURE Click
thisform.Release
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       !       )   �                         commandbutton      commandbutton      Command5      Form1      ~Top = 72
Left = 312
Height = 27
Width = 84
FontName = "΢���ź�"
FontSize = 10
Caption = "��������"
Name = "Command5"
     1PROCEDURE Click
IF EMPTY(thisform.Text2.Value)
	MESSAGEBOX("�����趨ѧ����ţ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL cNewName
cNewName=INPUTBOX1("�������µ�������","��������",thisform.LabelXSXM2.Caption)
IF EMPTY(cNewName)
	RETURN 
ENDIF 

IF MESSAGEBOX("��ȷ��Ҫ�������� "+thisform.LabelXSXM2.Caption+" ��Ϊ "+cNewName+" ��",1+32,"ϵͳ��ʾ")<>1
	RETURN 
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @ѧ����� varchar(50),@ѧ������ varchar(50)
SET @ѧ�����='<<thisform.Text2.Value>>'
SET @ѧ������='<<cNewName>>'

UPDATE ��ѧ�ǼǱ� SET ѧ������=@ѧ������ WHERE ѧ�����=@ѧ�����
ENDTEXT 
IF Execute(cSQL)
	MESSAGEBOX("�޸�ѧ�������ɹ���",0+64,"ϵͳ��ʾ")
	thisform.LabelXSXM2.Caption=cNewName
ELSE 
	MESSAGEBOX("�޸�ѧ������ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 

ENDPROC
     ����    �  �                         �   %   �      7     �          �  U  o %�C�  � � ���E �, ��C� �����趨ѧ����ţ��@� ϵͳ��ʾ�x�� B� � �� �5 T� �C� �������µ�������� ���������  � � � �� %�C� ���� � B� �T %�C� ��ȷ��Ҫ�������� �  � � �  ��Ϊ � �  ���!� ϵͳ��ʾ�x���� � B� � �� �
 M(� `��9 �3 DECLARE @ѧ����� varchar(50),@ѧ������ varchar(50)�. �( SET @ѧ�����='<<thisform.Text2.Value>>'�" � SET @ѧ������='<<cNewName>>'� �  �G �A UPDATE ��ѧ�ǼǱ� SET ѧ������=@ѧ������ WHERE ѧ�����=@ѧ������ � %�C � � ��4�, ��C� �޸�ѧ�������ɹ����@� ϵͳ��ʾ�x�� T�  � � �� �� �h�, ��C� �޸�ѧ������ʧ�ܣ��@� ϵͳ��ʾ�x�� � U	  THISFORM TEXT2 VALUE CNEWNAME	 INPUTBOX1
 LABELXSXM2 CAPTION CSQL EXECUTE Click,     ��1 Q�A A r Q� A A BA A r � ��!a qA !�1� �A 2                       &      )   �                        FArial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
BM6      6   (                  �  �          ���                                       ���������������������������������������������   ��������������������������� �1���������������   ������������������������ �1 �1���������������   ��������������������� �1 �1 �1 �1 �1���������   ������������������������ �1 �1���c� ce ������   ��������������������������� �1������ce ������   ������������������ce ���������������ce ������   ������������������ce ������ �1���������������   ������������������ce c� ��� �1 �1������������   ��������������������� �1 �1 �1 �1 �1���������   ��������������������������� �1 �1������������   ��������������������������� �1������            ������������������������������������������   ������������������������������������������   ������������������������������������������������������������BM6      6   (                  �  �          ������������������ d d��������������������������������������� d � d������������������������������������ d � � � d������������������������������ d � � � � � d������������������������ d � � � � � � d������������������ d d � � �8�H d8�H � � d��������������� d8�H8�H �8�H d��� d8�H � � d��������������� d d8�H8�H d��� d8�H � � � d������������������ d d��������� d8�H � � � d������������������������������ d8�H � � � � d d��������������������������� d8�H � � � � d������������������������������ d8�H � � � d��������������������������������� d8�H � � d������������������������������������ d8�H � d��������������������������������������� d8�H d������������������������������������������ d d0g   �
�                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               OBJTYPE    N                  OBJCODE    N                  NAME       M"                  EXPR       M&                  VPOS       N*   	              HPOS       N3   	              HEIGHT     N<   	              WIDTH      NE   	              STYLE      MN                  PICTURE    MR                  ORDER      MV                 UNIQUE     LZ                  COMMENT    M[                  ENVIRON    L_                  BOXCHAR    C`                  FILLCHAR   Ca                  TAG        Mb                  TAG2       Mf                 PENRED     Nj                  PENGREEN   No                  PENBLUE    Nt                  FILLRED    Ny                  FILLGREEN  N~                  FILLBLUE   N�                  PENSIZE    N�                  PENPAT     N�                  FILLPAT    N�                  FONTFACE   M�                  FONTSTYLE  N�                  FONTSIZE   N�                  MODE       N�                  RULER      N�                  RULERLINES N�                  GRID       L�                  GRIDV      N�                  GRIDH      N�                  FLOAT      L�                  STRETCH    L�                  STRETCHTOP L�                  TOP        L�                  BOTTOM     L�                  SUPTYPE    N�                  SUPREST    N�                  NOREPEAT   L�                  RESETRPT   N�                  PAGEBREAK  L�                  COLBREAK   L�                  RESETPAGE  L�                  GENERAL    N�                  SPACING    N�                  DOUBLE     L�                  SWAPHEADER L�                  SWAPFOOTER L�                  EJECTBEFOR L�                  EJECTAFTER L�                  PLAIN      L�                  SUMMARY    L�                  ADDALIAS   L�                  OFFSET     N�                  TOPMARGIN  N�                  BOTMARGIN  N�                  TOTALTYPE  N�                  RESETTOTAL N�                  RESOID     N�                  CURPOS     L�                  SUPALWAYS  L�                  SUPOVFLOW  L�                  SUPRPCOL   N�                  SUPGROUP   N�                  SUPVALCHNG L�                  SUPEXPR    M�                  USER       M�                                                                                                                                                                                                                                                                                          WINDOWS _42V0IYYMM1178571114 1 53            1.000    0.000    0.00080266.000                 F                                                            0  9   20T1212   FF              T    F T               1F               WINDOWS _42V0IYYMN           9  1                          13855.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _42V0IYYMO           9  4                           2813.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _42V0IYYMP           9  7                              0.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _42V0LMYY9           9  8                          15417.000    0.000                                                                                                    F  FFF         FFF                  F               WINDOWS _42V0KUIBB1163429659 5  0         520.83326250.000 3229.16730000.000                               -1   -1   -1   -1   -1   -1                    0 18  1       FFFTF  F          0T                      0FTT0 0F         WINDOWS _42V0L1GYL1153256996 5  0        5000.00010000.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L2GCI1153257024 5  0        5000.00031875.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L4HHU1153257075 5  0        8750.00031875.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L55HY1153257101 5  0        4895.83357291.667 1562.500 3750.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L6B631153257112 6           11041.667 1250.000  104.16776354.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     1             FTF3 0F         WINDOWS _42V0L6MK51153257127 5  0       11562.500 6250.000 1562.500 5000.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L75JQ1153257138 5  0       11562.50017708.333 1562.500 2500.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L7G0Q1153257146 5  0       11562.50028958.333 1562.500 5000.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L7RBO1153257147 5  0       11562.50036354.167 1562.500 2500.000                               -1   -1   -1   -1   -1   -1                     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L84XO1153257164 5  0    !   11562.50049375.000 1562.500 5000.000                               -1   -1   -1   -1   -1   -1               "     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0L8HMK1153257167 5  0    #   11562.50068437.500 1562.500 2500.000                               -1   -1   -1   -1   -1   -1               $     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _42V0LIPB31153257549 6           13750.000 1250.000  104.16776354.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     1             FTF3 0F         WINDOWS _42V0LJN7R1153257573 6           11041.667 1250.000 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LJZYU1153257581 6           11041.66716354.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LK4NZ1153257584 6           11041.66721354.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LK9YU1153257587 6           11041.66734895.833 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LKMEL1153257596 6           11041.66748333.333 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LKUZI1153257603 6           11041.66755416.667 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLCQM1153257615 6           11041.66777500.000 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRJ1153257620 6           18645.833 1250.000  104.16776354.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     1             FTF3 0F         WINDOWS _42V0LLLRK1153257620 6           15937.500 1250.000 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRM1153257620 6           15937.50016354.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRN1153257620 6           15937.50021354.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRO1153257620 6           15937.50034895.833 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRP1153257620 6           15937.50048333.333 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRQ1153257620 6           15937.50055416.667 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LLLRR1153257620 6           15937.50077500.000 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _42V0LR9961153257762 5  0    %    8229.16757291.667 1562.500 3750.000                               -1   -1   -1   -1   -1   -1               &     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4400TOGYR1163429702 5  0    '   24166.66723333.333 1770.833 8854.167                               -1   -1   -1   -1   -1   -1               (     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4400TOGYT1156148826 5  0    )   23958.33340833.333 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               *     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4400VMD8D116342966817  0+        1250.00071458.333 7916.667 7916.667             ,                                                                       0       FFFTF  F       1   F         2             FTT0 0F         WINDOWS _4400VMD8E1156150694 8  0    -    4895.83313854.167 1770.83311458.333                   C           -1   -1   -1   -1   -1   -1               .     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _4400VMD8F1156150694 8  0    /    4895.83335729.167 1770.83311354.167                   C           -1   -1   -1   -1   -1   -1               0     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _4400VMD8G1156150694 8  0    1    8645.83335729.167 1770.83311354.167                   C           -1   -1   -1   -1   -1   -1               2     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _4400VMD8H1163429671 8  0    3    4479.16760729.167 2291.667 8541.667             4     C           -1   -1   -1   -1   -1   -1               5     1 12  1 0     FFFTF  F          2T         0       0 1  0FTT0 0F         WINDOWS _4400VMD8I1156150694 8  0    6    8229.16760729.167 1770.833 8645.833                   C           -1   -1   -1   -1   -1   -1               7     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _4400VMD8J1156150694 8  0    8   16354.167 2291.667 1770.83313437.500                   C           -1   -1   -1   -1   -1   -1               9     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4400VMD8L1156150694 8  0    :   16354.16716979.167 1770.833 3750.000                   C           -1   -1   -1   -1   -1   -1               ;     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4400VMD8M1156150694 8  0    <   16354.16728645.833 1770.833 5520.833                   C           -1   -1   -1   -1   -1   -1               =     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4400VMD8N1156150694 8  0    >   16354.16735416.667 1770.833 4895.833                   C           -1   -1   -1   -1   -1   -1               ?     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4400VMD8O1156150694 8  0    @   16354.16749166.667 1770.833 5625.000                   C           -1   -1   -1   -1   -1   -1               A     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4400VSIA11163429706 8  0    B   23854.16732395.833 1875.000 7708.333                   C           -1   -1   -1   -1   -1   -1               C     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _49P0YAABF1178369912 5  0    D   24166.66744895.833 1770.833 8854.167                               -1   -1   -1   -1   -1   -1               E     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _49P0YAABG1178369912 5  0    F   23958.33360416.667 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               G     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _49P0YAABH1178369912 8  0    H   23854.16752916.667 1875.000 7187.500                   C           -1   -1   -1   -1   -1   -1               I     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _49T10SPLV1178700102 8  0    J   31041.667 8750.000 3333.33371354.167                   C           -1   -1   -1   -1   -1   -1               K     0  9  1 0     FTFTF  F          0T         0       0 1  1FTF0 0F         WINDOWS _49U0S7JRP1178757431 5  0    L    1041.66765520.833 2187.500 3333.333                                0    0  255   -1   -1   -1               M     1 12  1       FFFTF  F          0T                      0FTF3 0FN        WINDOWS _49U0S9KHK1178757480 7  4          729.16764791.667 2916.667 5000.000                                0    0  255   -1   -1   -1    2    8    0            0       FFFTF  F                     0             FTT0 0FO        WINDOWS _49V0Y1D1U1221805613 5  0    P   36562.50041250.000 1562.500 5000.000                               -1   -1   -1   -1   -1   -1               Q     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _49V0Y1D1V1178828442 8  0    R   36562.50046250.000 1770.833 7604.167                   C           -1   -1   -1   -1   -1   -1               S     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _49V0Y5FH61178828545 5  0    T   27812.500 2500.000 1562.50011666.667                               -1   -1   -1   -1   -1   -1               U     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _49V0Y5FH71178828545 8  0    V   27812.50015416.667 1770.83320000.000                   C           -1   -1   -1   -1   -1   -1               W     1 11  1 0     FFFTF  F          2T         0       0 1  0FTF0 0F         WINDOWS _49X0NVAL21178949894 5  0    X       0.000    0.000 1562.500 5520.833                               -1   -1   -1   -1   -1   -1               Y     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _49X0PSJUK1178951746 5  0    Z    1041.66759687.500 2187.500 3333.333                              255    0    0   -1   -1   -1               [     1 12  1       FFFTF  F          0T                      0FTT0 0F\        WINDOWS _49X0PSJUL1178951746 7  4          729.16758958.333 2916.667 4895.833                              255    0    0   -1   -1   -1    2    8    0            0       FFFTF  F                     0             FTT0 0F]        WINDOWS _4BW17EI6M1183949281 5  0    ^   31041.667 2395.833 1770.833 5312.500                               -1   -1   -1   -1   -1   -1               _     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C110NITC1184270530 6           11041.66740937.500 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4C110NITD1184270530 6           15937.50040937.500 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4C110XCIY1184270774 5  0    `   11562.50042083.333 1562.500 5000.000                               -1   -1   -1   -1   -1   -1               a     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4C110XCIZ1184270774 8  0    b   16354.16741458.333 1770.833 6458.333                   C           -1   -1   -1   -1   -1   -1               c     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4C1112N651184270905 5  0    d   27604.16736562.500 1770.833 3541.667                               -1   -1   -1   -1   -1   -1               e     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C11131041184270916 5  0    f   27604.16747916.667 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               g     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C11131051184270916 8  0    h   27500.00040312.500 1875.000 7291.667                   C           -1   -1   -1   -1   -1   -1               i     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _4C1113IR81184270928 5  0    j   27604.16750520.833 1770.833 3541.667                               -1   -1   -1   -1   -1   -1               k     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C1113IR91184270928 5  0    l   27604.16762708.333 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               m     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C1113IRA1184270928 8  0    n   27500.00054270.833 1875.000 8333.333                   C           -1   -1   -1   -1   -1   -1               o     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _4C1113X2A1184270937 5  0    p   27604.16765625.000 1770.833 5312.500                               -1   -1   -1   -1   -1   -1               q     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C1113X2B1184270937 5  0    r   27604.16779687.500 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               s     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4C1113X2C1184270937 8  0    t   27500.00071250.000 1875.000 8333.333                   C           -1   -1   -1   -1   -1   -1               u     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _4C1117VOV1184271035 5  0    v    8750.00010000.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1               w     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4C1117VOW1184271035 8  0    x    8645.83313750.000 1770.83311354.167                   C           -1   -1   -1   -1   -1   -1               y     0  9  1 0     FFFTF  F          0T         0       0 1  1FTT0 0F         WINDOWS _4NV0IVD7M1221805589 5  0    z   36562.500 2500.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1               {     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4NV0IVWPJ1221805596 5  0    |   36562.50015000.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1               }     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4NV0IW6NI1221805605 5  0    ~   36562.50028750.000 1562.500 3750.000                               -1   -1   -1   -1   -1   -1                    0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4NV0IX5J01221805622 5  0    �   36458.33360937.500 1562.500 7500.000                               -1   -1   -1   -1   -1   -1               �     0  9  1       FFFTF  F          0T                      1FTF0 0F         WINDOWS _4NV0IXT1I1221805639 8  0    �   16354.16763020.833 1770.83314062.500                   C           -1   -1   -1   -1   -1   -1               �     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4NV0IZN251221805702 5  0    �   24062.500 2500.000 1770.833 8854.167                               -1   -1   -1   -1   -1   -1               �     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4NV0IZN261221805684 5  0    �   24166.66720000.000 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               �     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4NV0IZN271221805684 8  0    �   23750.00011562.500 1875.000 7291.667                   C           -1   -1   -1   -1   -1   -1               �     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _4NV0J1KGS1221805733 5  0    �   24166.66763958.333 1562.500 8333.333                               -1   -1   -1   -1   -1   -1               �     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4NV0J1KGT1221805733 5  0    �   23958.33379479.167 1875.000 1770.833                               -1   -1   -1   -1   -1   -1               �     1 11  1       FFFTF  F          0T                      0FTF0 0F         WINDOWS _4NV0J1KGU1221805733 8  0    �   23854.16771979.167 1875.000 7187.500                   C           -1   -1   -1   -1   -1   -1               �     1 12  1 0     FFFTF  F          2T         2       0 1  0FTF0 0F         WINDOWS _4O801CAXE1222771889 5  0    �   11562.50023020.833 1562.500 2500.000                               -1   -1   -1   -1   -1   -1               �     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4O801D54U1222771911 8  0    �   16354.16721979.167 1770.833 5000.000                   C           -1   -1   -1   -1   -1   -1               �     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS _4O801DOTW1222771924 6           11041.66727604.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4O801DOTX1222771924 6           15937.50027604.167 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4O8022E421222772538 5  0    �   11562.50056354.167 1562.500 5000.000                               -1   -1   -1   -1   -1   -1               �     0  9  1       FFFTF  F          0T                      1FTT0 0F         WINDOWS _4O8022E431222772538 6           11041.66762395.833 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4O8022E441222772538 6           15937.50062395.833 2812.500  104.167                               -1   -1   -1   -1   -1   -1    1    8                 0       FFFTF  F                     0             FTF3 0F         WINDOWS _4O8022E451222772538 8  0    �   16354.16756145.833 1770.833 5625.000                   C           -1   -1   -1   -1   -1   -1               �     0  9  1 0     FFFTF  F          0T         2       0 1  1FTT3 0F         WINDOWS                     23              15.000    5.000   12.000   32.000                                3    0                                   �     0  9                                                     F               WINDOWS                     23              31.000   12.000   25.000   34.000                                6    0                                   �     0 18                                                     F               WINDOWS                     23              17.000    9.000   13.000   16.000                                2    2                                   �     1 11                                                     F               WINDOWS                     23              18.000    7.000   14.000   39.000                                4    0                                   �     1 11                                                     F               WINDOWS                     23              18.000    9.000   14.000   17.000                                2    2                                   �     1 12                                                     F               WINDOWS                     23              22.000    8.000   17.000   23.000                                5    0                                   �     1 12                                                     F               WINDOWS                     25   �   �                                                        F                                                                                                                      F                :   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              'ORIENTATION=0
PAPERSIZE=153
COLOR=2
ocument Writer
OUTPUT=XPSPort:
ORIENTATION=0
PAPERSIZE=153
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
DUPLEX=1
YRESOLUTION=600
TTOPTION=2
COLLATE=0
                                               K  1  winspool  Microsoft XPS Document Writer  XPSPort:                                                                     Arial                                                         "��ݸ����ţ������ѧУ�վ�"                                    ΢���ź�                                                      "ѧ�ڣ�"                                                      Arial                                                         "�༶��"                                                      Arial                                                         "������"                                                      Arial                                                         "���ţ�"                                                      Arial                                                         
"�շ���Ŀ"                                                    Arial                                                         "��λ"                                                        Arial                                                         
"�ϴ�Ƿ��"                                                    Arial                                                         "����"                                                        Arial                                                         
"ʵ�ս��"                                                    Arial                                                         "��ע"                                                        Arial                                                         "���ڣ�"                                                      Arial                                                         "�ϼƽ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         To2DBarCode(�ɷѵ���)                                                                                                       ѧ��                                                          Arial                                                         �༶                                                          Arial                                                         ѧ������                                                      Arial                                                         �ɷѵ���                                                                                                                    Arial Narrow                                                  ����                                                          Arial                                                         �շ���Ŀ                                                      Arial                                                         ��λ                                                          Arial                                                         	�ϴ�Ƿ��1                                                     Arial                                                         ����                                                          Arial                                                         ʵ��                                                          Arial                                                         �ϼƽ��                                                      Arial Narrow                                                  "ʵ�ս�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         ʵ�ս��                                                      Arial Narrow                                                  Remark                                                        Arial                                                         "�˷�"                                                        ΢���ź�                                                      alltrim(�շ�����)="�˷�"                                      alltrim(�շ�����)="�˷�"                                      
"�����ˣ�"                                                    Arial                                                         ��Ʊ��                                                        Arial                                                         "����д����"                                              ����                                                          ntoc(ʵ�ս��)                                                ����                                                          "�汾��1.0"                                                   Arial                                                         "����"                                                        ΢���ź�                                                      alltrim(״̬)="����"                                          alltrim(״̬)="����"                                          "��ע��"                                                      ����                                                          
"�ϼƽ��"                                                    Arial                                                         �ϼ�                                                          Arial                                                         "�ֽ�"                                                        ����                                                          "Ԫ"                                                          Arial                                                         �ֽ�                                                          Arial Narrow                                                  "ˢ��"                                                        ����                                                          "Ԫ"                                                          Arial                                                         ˢ��                                                          Arial Narrow                                                  "����ȯ"                                                      ����                                                          "Ԫ"                                                          Arial                                                         ����ȯ                                                        Arial Narrow                                                  "ѧ�ţ�"                                                      Arial                                                         ѧ�����                                                      Arial                                                         "��ƣ�"                                                      Arial                                                         "���ˣ�"                                                      Arial                                                         "���ɣ�"                                                      Arial                                                         "������ȷ�ϣ�"                                                Arial                                                         ��ע                                                          Arial                                                         "�ϴ�Ƿ�ѣ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         �ϴ�Ƿ��                                                      Arial Narrow                                                  "ʣ��Ƿ�ѣ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         ����Ƿ��                                                      Arial Narrow                                                  "����"                                                        Arial                                                         ����                                                          Arial                                                         
"����Ƿ��"                                                    Arial                                                         	����Ƿ��1                                                     Arial                                                         Arial                                                         ΢���ź�                                                      ����                                                          Arial                                                         Arial Narrow                                                  ΢���ź�                                                      dataenvironment                                               wTop = 0
Left = 0
Width = 0
Height = 0
Visible = .F.
TabStop = .F.
DataSource = .NULL.
Name = "Dataenvironment"
       �DRIVER=winspool
DEVICE=Microsoft XPS Document Writer
OUTPUT=XPSPort:
ORIENTATION=0
PAPERSIZE=153
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
DUPLEX=1
YRESOLUTION=600
TTOPTION=2
COLLATE=0
                                               K  1  winspool  Microsoft XPS Document Writer  XPSPort:                                                                     Arial                                                         "��ݸ����ţ������ѧУ�վ�"                                    ΢���ź�                                                      "ѧ�ڣ�"                                                      Arial                                                         "�༶��"                                                      Arial                                                         "������"                                                      Arial                                                         "���ţ�"                                                      Arial                                                         
"�շ���Ŀ"                                                    Arial                                                         "��λ"                                                        Arial                                                         
"�ϴ�Ƿ��"                                                    Arial                                                         "����"                                                        Arial                                                         
"ʵ�ս��"                                                    Arial                                                         "��ע"                                                        Arial                                                         "���ڣ�"                                                      Arial                                                         "�ϼƽ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         To2DBarCode(�ɷѵ���)                                                                                                       ѧ��                                                          Arial                                                         �༶                                                          Arial                                                         ѧ������                                                      Arial                                                         �ɷѵ���                                                                                                                    Arial Narrow                                                  ����                                                          Arial                                                         �շ���Ŀ                                                      Arial                                                         ��λ                                                          Arial                                                         	�ϴ�Ƿ��1                                                     Arial                                                         ����                                                          Arial                                                         ʵ��                                                          Arial                                                         �ϼƽ��                                                      Arial Narrow                                                  "ʵ�ս�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         ʵ�ս��                                                      Arial Narrow                                                  Remark                                                        Arial                                                         "�˷�"                                                        ΢���ź�                                                      alltrim(�շ�����)="�˷�"                                      alltrim(�շ�����)="�˷�"                                      
"�����ˣ�"                                                    Arial                                                         ��Ʊ��                                                        Arial                                                         "����д����"                                              ����                                                          ntoc(ʵ�ս��)                                                ����                                                          "�汾��1.0"                                                   Arial                                                         "����"                                                        ΢���ź�                                                      alltrim(״̬)="����"                                          alltrim(״̬)="����"                                          "��ע��"                                                      ����                                                          
"�ϼƽ��"                                                    Arial                                                         �ϼ�                                                          Arial                                                         "�ֽ�"                                                        ����                                                          "Ԫ"                                                          Arial                                                         �ֽ�                                                          Arial Narrow                                                  "ˢ��"                                                        ����                                                          "Ԫ"                                                          Arial                                                         ˢ��                                                          Arial Narrow                                                  "����ȯ"                                                      ����                                                          "Ԫ"                                                          Arial                                                         ����ȯ                                                        Arial Narrow                                                  "ѧ�ţ�"                                                      Arial                                                         ѧ�����                                                      Arial                                                         "��ƣ�"                                                      Arial                                                         "���ˣ�"                                                      Arial                                                         "���ɣ�"                                                      Arial                                                         "������ȷ�ϣ�"                                                Arial                                                         ��ע                                                          Arial                                                         "�ϴ�Ƿ�ѣ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         �ϴ�Ƿ��                                                      Arial Narrow                                                  "ʣ��Ƿ�ѣ�"                                                  ����                                                          "Ԫ"                                                          Arial                                                         ����Ƿ��                                                      Arial Narrow                                                  "����"                                                        Arial                                                         ����                                                          Arial                                                         
"����Ƿ��"                                                    Arial                                                         	����Ƿ��1                                                     Arial                                                         Arial                                                         ΢���ź�                                                      ����                                                          Arial                                                         Arial Narrow                                                  ΢���ź�                                                      dataenvironment                                               wTop = 0
Left = 0
Width = 0
Height = 0
Visible = .F.
TabStop = .F.
DataSource = .NULL.
Name = "Dataenvironment"
 BM6      6   (                    �  �          ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������T�twBwBwBwBwBwBT�t������������������������������������������������������������������������yD\��f��f��f��f��\��yD������������������������������������������������������������������������|GKҲGЮGЮGЮGЮKҲ|G������������������������������������������������������������������������KMҴIаIаIаIаMҴK������������������������������������������������������������������������
�NOԷKҳKҳKҳKҳOԷ
�N������������������������������������������������������������������������
�RQֹMԶMԶMԶMԶQֹ
�R������������������������������������������������������R�	�V	�V	�V	�V	�V	�V[��OֹOֹOֹOֹ[��	�V	�V	�V	�V	�V	�VR�������������������������������������	�Zg��p��p��p��p��f��\��Q׼Q׼Q׼Q׼\��f��p��p��p��p��g��	�Z�������������������������������������_X��TٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿTٿX���_�������������������������������������cZ��V��V��V��V��V��V��V��V��V��V��V��V��V��V��V��V��Z���c�������������������������������������g`��]��]��]��]��]��]��]��]��]��]��]��]��]��]��]��]��`���g�������������������������������������la��_��_��_��_��_��_��_��_��_��_��_��_��_��_��_��_��a���l�������������������������������������p��ۙ����������v��`��`��`��`��v�׉�ݙ�����������p������������������������������������P���t�t�t�t�t�ts��b��b��b��b��s���t�t�t�t�t�tP���������������������������������������������������������xf��c��c��c��c��f���x�������������������������������������������������������������������������{f��d��d��d��d��f���{�������������������������������������������������������������������������h��f��f��f��f��h�����������������������������������������������������������������������������h��f��f��f��f��h����������������������������������������������������������������������������������������������������������������������������������������������������������������������O��������������O��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������0   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _3N41B6MLT1097576474      /  F      ]                          �      �                       WINDOWS _3N41B6MLU1247042843�      �  �      �      �  �                  �(                           WINDOWS _3N41B6MLV1247042843M)      ^)  o)  �)  �)      _*  �*                                               WINDOWS _3N50JLY6O1193060905~+      �+  �+  �+  �+                                                           WINDOWS _3N50JLY6N1097615645S,      `,  m,  {,  �,                                                           WINDOWS _3N41B6MLT10975764749-      N-  c-  r-  �-      O.  /                                               WINDOWS _4FL19MKXQ1193060905p0      �0  �0  �0  �0      �1  �1                                               WINDOWS _3N41C2KJM1097577299�2      �2  �2  3  3      c3  �3  e4  m>                                       WINDOWS _3N814L36P1097832197�>      �>  �>  �>  �>                                                           WINDOWS _3N814L36Q1190348932�?      �?  �?  �?  �?      V@  �@                                               WINDOWS _3N41B6MLT1246997809�A      �A  �A  �A  �A      �B  �K                                               WINDOWS _3N814L36R1193060997aS      vS  �S  �S  �S      T  �T                                               WINDOWS _4EH0JFR2M1247042711�U      �U  �U  �U  �U                                                           COMMENT RESERVED                                MV                                                            V�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Height = 507
Width = 839
ShowWindow = 2
DoCreate = .T.
AutoCenter = .T.
Caption = "��ѯ����"
Icon = ..\images\system\browse.ico
_memberdata =      293<VFPData><memberdata name="executesql" type="method" display="ExecuteSQL"/><memberdata name="onpageactivated" type="method" display="OnPageActivated"/><memberdata name="ctitle" type="property" display="cTitle"/><memberdata name="dofilterdata" type="method" display="DoFilterData"/></VFPData>

ctitle = 
Name = "Form1"
     �PROCEDURE executesql
LPARAMETERS cSQL
this.Pageframe1.PageCount=1
SELECT 0
LOCAL cTempCursor
cTempCursor=SYS(2015)
IF !SelectData(cSQL,cTempCursor)
	MessageBox1("��ѯ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF
IF SELECT(cTempCursor)=0
	MessageBox1("��ѯ�ɹ�������û�������κ����ݼ���",0+64,"ϵͳ��ʾ")
	RETURN .f.
ENDIF

LOCAL nCursorCount
nCursorCount=0
DO WHILE .t.
	nCursorCount = nCursorCount + 1 
	LOCAL cCursorName
	IF nCursorCount=1
		cCursorName=cTempCursor
	ELSE 
		cCursorName=cTempCursor+TRANSFORM(nCursorCount-1)
	ENDIF 
	IF SELECT(cCursorName)=0
		EXIT 
	ENDIF 
	LOCAL oTempPage as Page,cTempPageName
	cTempPageName="Page"+TRANSFORM(nCursorCount+1)
	=this.Pageframe1.NewObject(cTempPageName,"Page")
	oTempPage=EVALUATE("this.Pageframe1."+cTempPageName)
	=BINDEVENT(oTempPage,"Activate",this,"OnPageActivated")
	IF EMPTY(GETWORDNUM(this.cTitle,nCursorCount,","))
		oTempPage.Caption=ToEnglish("����� ")+TRANSFORM(nCursorCount)
	ELSE
		oTempPage.Caption=GETWORDNUM(this.cTitle,nCursorCount,",")
	ENDIF 
	WITH oTempPage as Page
		LOCAL cTempName
		cTempName=SYS(2015)
		=.NewObject("oGrid","_Grid")
		LOCAL oTempGrid
		oTempGrid=EVALUATE("oTempPage.oGrid")
		WITH oTempGrid as _Grid
			.RecordSourceType= 1
			.RecordSource=cCursorName
			.AllowCellSelection= .F.
			.HeaderHeight=30
			.RowHeight=30
			.Visible= .T.
			.Left=0
			.Top=0
			.Width=this.Pageframe1.PageWidth
			.Height=this.Pageframe1.PageHeight
			.Anchor=15
			.reset_grid()
			.SetAll("Format","Z","Column")
		ENDWITH 
	ENDWITH 	
ENDDO

this.Pageframe1.ActivePage=2
this.DoFilterData()
ENDPROC
PROCEDURE onpageactivated
=AEVENTS(arrEvents,0)
LOCAL cCursorName
WITH arrEvents[1] as Page
	WITH .Controls[1] as Grid
		.SetFocus
		cCursorName=.RecordSource
	ENDWITH 
ENDWITH 

SELECT (cCursorName)
this.Combo1.Clear
FOR i=1 TO FCOUNT(cCursorName)
	this.Combo1.AddItem(ToEnglish(FIELD(i),.t.))
ENDFOR 
this.Combo1.ListIndex=1
this.oTxtFilter.Value=""
ENDPROC
PROCEDURE dofilterdata
LOCAL cFilterValue,nFieldID
cFilterValue=UPPER(ALLTRIM(this.oTxtFilter.Value))
nFieldID=this.Combo1.Value



IF this.Pageframe1.ActivePage<=1
	RETURN
ENDIF
LOCAL oPage as Page
oPage=this.pageframe1.Pages[this.Pageframe1.ActivePage]
LOCAL oGrid as Grid
oGrid=oPage.Controls[1]
LOCAL cCursorName
cCursorName=oGrid.RecordSource

SELECT (cCursorName)
LOCAL cFieldName
cFieldName=FIELD(nFieldID)

IF EMPTY(cFilterValue)
	SET FILTER TO
ELSE
	Local cFilterExpr
	cFilterExpr=""
	FOR j=1 TO GETWORDCOUNT(cFilterValue)
		LOCAL cTempFilterValue,cTempFilterExpr
		cTempFilterExpr=""
		cTempFilterValue=GETWORDNUM(cFilterValue,j)
		cFilterExpr = cFilterExpr + IIF(EMPTY(cFilterExpr),""," and ") + "("
*!*			For i=1 TO FCOUNT()
*!*				IF !INLIST(TYPE(FIELD(i)),"C","D","T")
*!*					LOOP
*!*				ENDIF
			cTempFilterExpr= cTempFilterExpr+ Iif(Empty(cTempFilterExpr),""," or ") + Textmerge("LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<cFieldName)>>))))")
			IF _screen.nLanguage=1
				cTempFilterExpr= cTempFilterExpr+ Iif(Empty(cTempFilterExpr),""," or ") + Textmerge("LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<cFieldName>>)))))")
			ENDIF 
*!*			Endfor
		cFilterExpr = cFilterExpr + "("+cTempFilterExpr+"))"
	ENDFOR
	Set Filter To &cFilterExpr
ENDIF
GOTO TOP
oGrid.Refresh



*!*	FOR iPage=2 TO this.Pageframe1.PageCount
*!*		LOCAL oCursorPage as Page
*!*		oCursorPage=this.Pageframe1.Pages[iPage]
*!*		WITH oCursorPage.Controls[1] as Grid
*!*			SELECT (.RecordSource)
*!*			IF EMPTY(cFilterValue)
*!*				SET FILTER TO
*!*			ELSE
*!*				Local cFilterExpr
*!*				cFilterExpr=""
*!*				FOR j=1 TO GETWORDCOUNT(cFilterValue)
*!*					LOCAL cTempFilterValue,cTempFilterExpr
*!*					cTempFilterExpr=""
*!*					cTempFilterValue=GETWORDNUM(cFilterValue,j)
*!*					cFilterExpr = cFilterExpr + IIF(EMPTY(cFilterExpr),""," and ") + "("
*!*					For i=1 TO FCOUNT()
*!*						IF !INLIST(TYPE(FIELD(i)),"C","D","T")
*!*							LOOP
*!*						ENDIF
*!*						cTempFilterExpr= cTempFilterExpr+ Iif(Empty(cTempFilterExpr),""," or ") + Textmerge("LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<FIELD(i)>>))))")
*!*						cTempFilterExpr= cTempFilterExpr+ Iif(Empty(cTempFilterExpr),""," or ") + Textmerge("LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<FIELD(i)>>)))))")
*!*					Endfor
*!*					cFilterExpr = cFilterExpr + "("+cTempFilterExpr+"))"
*!*				ENDFOR
*!*				Set Filter To &cFilterExpr
*!*			ENDIF
*!*			GOTO TOP
*!*			.Refresh
*!*		ENDWITH
*!*	ENDFOR



ENDPROC
PROCEDURE Init
LPARAMETERS cSQL as String,cTitle as String,bNoEdit as Boolean
IF VARTYPE(cTitle)<>"C"
	cTitle=""
ENDIF 
IF VARTYPE(bNoEdit)<>"L"
	bNoEdit=.f.
ENDIF 

IF bNoEdit
	this.Pageframe1.Page1.Enabled= .F.
ENDIF 
this.cTitle=ALLTRIM(cTitle)
IF VARTYPE(cSQL)="C" AND !EMPTY(cSQL)
	this.Pageframe1.Page1.Edit1.Value=cSQL
	this.ExecuteSQL(cSQL)
ENDIF 

=TransFormObjects(this)
ENDPROC
     ���                              �   %   /      �  �   �          �  U  � ��  � T� � � ���� F�  � �� � T� �C��]�� %�C �   � � 
��� �) ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ� �� B�-�� � %�C� W� ��� �= ��C�" ��ѯ�ɹ�������û�������κ����ݼ����@� ϵͳ��ʾ� �� B�-�� � �� � T� �� �� +�a���� T� �� ��� �� � %�� ���5� T� �� �� �T� T� �� C� �_�� � %�C� W� ��o� !� � ��	 Q� PAGE�
 � T�
 �� PageC� �_�� ��C �
 � Page� � � ��# T�	 �C� this.Pageframe1.�
 ���, ��C�	 � Activate� � OnPageActivated�� %�CC� � � � ,����H�! T�	 � �C� ����� � C� _�� �m� T�	 � �C� � � � ,���� � ���	 �Q� PAGE��� �� � T� �C��]�� ��C� oGrid� _Grid�� �� �� � T� �C� oTempPage.oGrid��� ��� �Q� _GRID��� T�� ���� T�� �� �� T�� �-�� T�� ���� T�� ���� T�� �a�� T�� �� �� T�� �� �� T�� �� � � �� T�� �� � � �� T�� ���� ��C�� ��! ��C� Format� Z� Column�� �� �� �� � T� � �  ���� ��C� �! �� U"  CSQL THIS
 PAGEFRAME1	 PAGECOUNT CTEMPCURSOR
 SELECTDATA MESSAGEBOX1 NCURSORCOUNT CCURSORNAME	 OTEMPPAGE CTEMPPAGENAME	 NEWOBJECT CTITLE CAPTION	 TOENGLISH	 CTEMPNAME	 OTEMPGRID RECORDSOURCETYPE RECORDSOURCE ALLOWCELLSELECTION HEADERHEIGHT	 ROWHEIGHT VISIBLE LEFT TOP WIDTH	 PAGEWIDTH HEIGHT
 PAGEHEIGHT ANCHOR
 RESET_GRID SETALL
 ACTIVEPAGE DOFILTERDATA�  ��C��  � 	�� �� � ��C��  �Q� PAGE�e � ��C��� �Q� GRID�a � ��� � T� ��� �� �� ��
 F�� �� �� � � � �� ���(�C� .��� � ��CCC� /a�
 � � �	 �� �� T� � � ���� T� � � ��  �� U 	 ARREVENTS CCURSORNAME CONTROLS SETFOCUS RECORDSOURCE THIS COMBO1 CLEAR I ADDITEM	 TOENGLISH	 LISTINDEX
 OTXTFILTER VALUE� ��  � � T�  �CC� � � �f�� T� �� � � �� %�� � � ���P � B� � �� Q� PAGE� T� �C� � � � � �	 �� ��
 Q� GRID� T�
 �C�� � �� �� � T� ��
 � ��
 F�� �� �� � T� �C� /�� %�C�  ���� � G(� ��� �� � T� ��  �� �� ���(�C�  ������ �� � � T� ��  �� T� �C�  � ����+ T� �� CC� �� �  � �  and 6� (��v T� �� CC� �� �  � �  or 6C�J LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(TRANSFORM(<<cFieldName)>>))))���� %��9� ����{ T� �� CC� �� �  � �  or 6C�O LIKEC([*<<cTempFilterValue>>*],UPPER(ALLTRIM(ToPY(TRANSFORM(<<cFieldName>>)))))���� � T� �� � (� � ))�� �� Set Filter To &cFilterExpr
 � #)�
 ��
 � � U  CFILTERVALUE NFIELDID THIS
 OTXTFILTER VALUE COMBO1
 PAGEFRAME1
 ACTIVEPAGE OPAGE PAGES OGRID CONTROLS CCURSORNAME RECORDSOURCE
 CFIELDNAME CFILTEREXPR J CTEMPFILTERVALUE CTEMPFILTEREXPR	 NLANGUAGE REFRESH. ��  Q� STRING� Q� STRING� Q� BOOLEAN� %�C� ��� C��P � T� ��  �� � %�C� ��� L��t � T� �-�� � %�� ��� � T� � � � �-�� � T� � �C� ��� %�C�  ��� C� C�  �
	��� � T� � � � � ��  �� ��C �  � �	 �� � ��C � �
 �� U  CSQL CTITLE BNOEDIT THIS
 PAGEFRAME1 PAGE1 ENABLED EDIT1 VALUE
 EXECUTESQL TRANSFORMOBJECTS
 executesql,     �� onpageactivated�    �� dofilterdata     �� Init�
    ��1 q 1� q q�q A 1�q A r � � q � � qA 1A A 1��1��� �A Qq �q �a� � � � � � � � AA� � A A A 2� 2 q ��� � A A � � ��A 112 � q1tA A � �� Aq � q � � a � q � �� � 1�e1�A �A �A Q � P1 �Q� A Q� A � AA !��A � 1                       `     ?   �  �  B   O   �     T   t     �  �    )                           �_memberdata XML Metadata for customizable properties
ctitle �α����
*executesql ִ������
*onpageactivated ��ҳ�漤��ʱ
*dofilterdata ��������
      	pageframe      	pageframe      
Pageframe1      Form1      �ErasePage = .T.
PageCount = 1
Anchor = 15
TabStyle = 1
Top = 53
Left = 12
Width = 820
Height = 448
TabOrientation = 1
Name = "Pageframe1"
Page1.Caption = "����SQL����"
Page1.Name = "Page1"
      8PROCEDURE Page1.Activate
this.Edit1.SetFocus
ENDPROC
      ����    �   �                         ��   %   W       u      o           �  U    ��  � � � U  THIS EDIT1 SETFOCUS Page1.Activate,     ��1 � 1                       -       )   �                         editbox      editbox      Edit1      Form1.Pageframe1.Page1      �FontName = "΢���ź�"
FontSize = 10
Anchor = 15
AllowTabs = .T.
Height = 352
Left = 11
Top = 59
Width = 793
Name = "Edit1"
      label      label      Label1      Form1.Pageframe1.Page1      �AutoSize = .T.
FontName = "΢���ź�"
Anchor = 3
BackStyle = 0
Caption = "SQL���"
Height = 19
Left = 14
Top = 23
Width = 61
Name = "Label1"
      commandbutton      commandbutton      oBtnRun      Form1.Pageframe1.Page1      �Top = 6
Left = 683
Height = 46
Width = 121
FontName = "΢���ź�"
FontSize = 12
Anchor = 9
Caption = "ִ������"
ForeColor = 0,0,255
BackColor = 255,128,128
Name = "oBtnRun"
      �PROCEDURE Click
LOCAL cSQL
IF this.Parent.Edit1.SelText=""
	cSQL=this.Parent.Edit1.Value
ELSE
	cSQL=this.Parent.Edit1.SelText
ENDIF 
thisform.ExecuteSQL(cSQL)
ENDPROC
     a���    H  H                        �w   %   �       �   	   �           �  U  m  ��  � %�� � � � �  ��7 � T�  �� � � � �� �U � T�  �� � � � �� � ��C �  � � �� U  CSQL THIS PARENT EDIT1 SELTEXT VALUE THISFORM
 EXECUTESQL Click,     ��1 q �a� aA 1                       �       )   H                        commandbutton      commandbutton      Command1      Form1.Pageframe1.Page1      �Top = 6
Left = 83
Height = 46
Width = 121
FontName = "΢���ź�"
FontSize = 12
Anchor = 9
Caption = "���ļ�..."
ForeColor = 0,0,255
BackColor = 255,128,128
Name = "Command1"
      RPROCEDURE Click
LOCAL cFile
cFile=GETFILE("SQL�ű��ļ���*.sql��:SQL")
ENDPROC
      ����    �   �                         K]   %   h             w           �  U  1  ��  �' T�  �C� SQL�ű��ļ���*.sql��:SQL��� U  CFILE Click,     ��1 q q1                       G       )   �                         
olecontrol      
olecontrol      oCommandBars      Form1      ITop = 168
Left = 888
Height = 100
Width = 100
Name = "oCommandBars"
      +PROCEDURE Init
this.DeleteAll()
ENDPROC
      ����    �   �                         ��   %   Q       e      _           �  U    ��C�  � �� U  THIS	 DELETEALL Init,     ��1 � 1                               )   �                        
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               `-#+��   �       O l e O b j e c t D a t a                                            ����                                        *        A c c e s s O b j S i t e D a t a                             &  ������������                                       �        C h a n g e d P r o p s                                         ������������                                              ����         �����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������^�fl� O���}�|Es   {  {                                     �                          �   8                       CommandBars Control Copyright (c) 2003-2008 Codejock Software
PRODUCT-ID: Codejock.CommandBars.ActiveX.v12.0
VALIDATE-CODE: QQS-PNF-OJV-VBX                                                             �                                                                                                                                                                                                  BOLEObject = C:\Windows\SysWOW64\Codejock.CommandBars.v12.0.1.ocx
      label      label      Label1      Form1      �AutoSize = .T.
FontName = "΢���ź�"
FontSize = 10
Anchor = 3
BackStyle = 0
Caption = "���ٹ��ˣ�"
Height = 21
Left = 12
Top = 17
Width = 67
Name = "Label1"
      textbox      textbox      
oTxtFilter      Form1      uFontName = "΢���ź�"
FontSize = 12
Anchor = 3
Height = 34
Left = 84
Top = 9
Width = 371
Name = "oTxtFilter"
      ?PROCEDURE InteractiveChange
thisform.DoFilterData()
ENDPROC
      ����    �   �                         ��   %   X       y      s           �  U    ��C�  � �� U  THISFORM DOFILTERDATA InteractiveChange,     ��1 � 1                       4       )   �                         commandbutton      commandbutton      
oBtnExport      Form1      �Top = 9
Left = 661
Height = 34
Width = 96
FontName = "΢���ź�"
FontSize = 11
Anchor = 3
Caption = "��������"
ForeColor = 0,0,255
BackColor = 0,255,128
Name = "oBtnExport"
     �PROCEDURE Click
LOCAL nRegisterResult,dExpireDate
dExpireDate={}
nRegisterResult=ValidRegister("",@dExpireDate)
IF !BITTEST(nRegisterResult,0) OR BITTEST(nRegisterResult,1)
	MESSAGEBOX1(STRCONV("B6D4B2BBC6F0A3ACBBF9B4A1B0E6C3BBD3D0CCE1B9A9B4CBB9A6C4DCA3ACC7EBB9BAC2F2B1EAD7BCB0E6A3A1",16),0+64,STRCONV("CAD4D3C3B0E6CFDED6C6",16))
	RETURN
ENDIF 

LOCAL oExcel as Excel.Application
oExcel=CREATEOBJECT("Excel.Application")
LOCAL oNewWorkbook as Excel.Workbook
oNewWorkbook=oExcel.Workbooks.Add()

LOCAL oLastWorksheet as Excel.Worksheet

FOR iPage=2 TO thisform.Pageframe1.PageCount
	WITH thisform.Pageframe1.Pages[iPage] as Page
		LOCAL cPageName
		cPageName=.Caption
		WITH .Controls[1] as Grid
			LOCAL cCursorName
			cCursorName=.RecordSource
			LOCAL cTempExcelFile
			cTempExcelFile=ADDBS(_screen.cFilesPath)+SYS(2015)+".xls"
			SELECT (cCursorName)
			EXPORT TO (cTempExcelFile) TYPE XLS ALL 
			IF !FILE(cTempExcelFile)
				LOOP 
			ENDIF 
			LOCAL oTempExcelWorkbook as Excel.Workbook
			oTempExcelWorkbook=oExcel.Workbooks.Open(cTempExcelFile)
			LOCAL oTempWorksheet as Excel.Worksheet
			oTempWorksheet=oTempExcelWorkbook.Worksheets.Item(1)
			LOCAL oTempRange as Excel.Range
			oTempRange=oTempWorksheet.UsedRange
			LOCAL oNewWorksheet as Excel.Worksheet
			IF VARTYPE(oLastWorksheet)<>"O"
				oNewWorksheet=oNewWorkbook.Worksheets.Add()
			ELSE
				oNewWorksheet=oNewWorkbook.Worksheets.Add(,oLastWorksheet)
			ENDIF 
			oLastWorksheet=oNewWorksheet
			oTempRange.Copy(oNewWorksheet.UsedRange)
			oNewWorksheet.UsedRange.Rows(1).Font.Bold=.t.
			oNewWorksheet.Name=cPageName
			oTempExcelWorkbook.Saved= .T.
			oTempExcelWorkbook.Close()
			ERASE (cTempExcelFile)
		ENDWITH 
	ENDWITH 
ENDFOR 

oNewWorkbook.Worksheets("Sheet1").Delete()
oNewWorkbook.Worksheets("Sheet2").Delete()
oNewWorkbook.Worksheets("Sheet3").Delete()
WITH oNewWorkbook.Worksheets.Item(1) as Excel.Worksheet
	.Activate()
ENDWITH 

LOCAL cSaveExcelFile
cSaveExcelFile=PUTFILE(ToEnglish("�����ļ�"),"","xls")
IF EMPTY(cSaveExcelFile)
	oNewWorkbook.Saved=.t.
ELSE
	oNewWorkbook.SaveAs(cSaveExcelFile)
	oNewWorkbook.Saved=.t.
ENDIF 
oNewWorkbook.Close(.f.)
oExcel.Quit
IF FILE(cSaveExcelFile)
	=RunFile(cSaveExcelFile)
ENDIF 
ENDPROC
     ����    �  �                        р   %   �      w  E   �          �  U  � ��  � � T� ��        �� T�  �C�  � � ��! %�C�  � �
�
 C�  ����� �� ��CC�X B6D4B2BBC6F0A3ACBBF9B4A1B0E6C3BBD3D0CCE1B9A9B4CBB9A6C4DCA3ACC7EBB9BAC2F2B1EAD7BCB0E6A3A1���@C� CAD4D3C3B0E6CFDED6C6��� �� B� � �� Q� EXCEL.Application�! T� �C� Excel.Application�N�� �� Q� EXCEL.Workbook� T� �C� � � �� �� Q� EXCEL.Worksheet� ��	 ���(��
 � � ����  ��C �	 �
 � � �Q� PAGE��� �� � T� ��� �� ��C��� �Q� GRID��� �� � T� ��� �� �� �! T� �C�9� ��C��]� .xls��
 F�� �� V(�� ���� %�C� 0
��@� .� � �� Q� EXCEL.Workbook� T� �C � � � � �� �� Q� EXCEL.Worksheet� T� �C�� � � �� �� Q� EXCEL.Range� T� �� � �� �� Q� EXCEL.Worksheet� %�C� ��� O��� T� �C� � � �� �0� T� �C� � � � � �� � T� �� �� ��C� � � � �� T� � � ���� �  �a�� T� �! �� �� T� �" �a�� ��C� �# ��
  �� �� �� �� �� ��CC� Sheet1� � �$ �� ��CC� Sheet2� � �$ �� ��CC� Sheet3� � �$ ��* ��C�� � � �Q� EXCEL.Worksheet�5� ��C��% �� �� ��& �$ T�& �CC� �����ļ��' �  � xls��� %�C�& ����� T� �" �a�� ��� ��C �& � �( �� T� �" �a�� � ��C-� �# ��
 �� �) � %�C�& 0���� ��C �& �* �� � U+  NREGISTERRESULT DEXPIREDATE VALIDREGISTER MESSAGEBOX1 OEXCEL ONEWWORKBOOK	 WORKBOOKS ADD OLASTWORKSHEET IPAGE THISFORM
 PAGEFRAME1	 PAGECOUNT PAGES	 CPAGENAME CAPTION CONTROLS CCURSORNAME RECORDSOURCE CTEMPEXCELFILE
 CFILESPATH OTEMPEXCELWORKBOOK OPEN OTEMPWORKSHEET
 WORKSHEETS ITEM
 OTEMPRANGE	 USEDRANGE ONEWWORKSHEET COPY ROWS FONT BOLD NAME SAVED CLOSE DELETE ACTIVATE CSAVEEXCELFILE	 TOENGLISH SAVEAS QUIT RUNFILE Click,     ��1 � 1Q�A A ��A��q � �q � q � � A A ���qa�QA� �A � 1�� � � A A A ����� A r A� � � � A � � � � A 1                       �      )   �                        commandbutton      commandbutton      	oBtnClose      Form1      �Top = 9
Left = 762
Height = 34
Width = 67
FontName = "΢���ź�"
FontSize = 10
Anchor = 9
Picture = ..\images\system\exit.bmp
Cancel = .T.
Caption = "�ر�"
PicturePosition = 1
Name = "oBtnClose"
      ,PROCEDURE Click
thisform.Release
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       !       )   �                         combobox      combobox      Combo1      Form1      �FontName = "΢���ź�"
FontSize = 12
Anchor = 3
Value = 1
Height = 34
Left = 456
Style = 2
Top = 9
Width = 120
Name = "Combo1"
      �Arial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 0, 12, 8, 21, 17, 23, 4, 0
΢���ź�, 0, 11, 7, 20, 16, 21, 4, 0
        h     (                 @                                        �   �   �   �   �   �   �   �   �   �   �                       �������������������������������������   �                       �������������������������������������   �                       �������������������������������������   �   �   �   �   �   �   �   �   �   �   �   �����������������   �   �������������������������������������   �����������������   �   �������������������������������������   �����������������   �   �������������������������������������   �����������������   �   �������������������������������������   �����������������   �   �������������������������������������   �����������������   �   �������������������������������������   ��[b��[b��[b��[b�   �   �������������������������������������   �   �   �   �   �   �   �������������������������������������   �                       �������������������������������������   �                       ��ry��[b��[b��[b��[b��[b��[b��[b��[b�   �                       �   �   �   �   �   �   �   �   �   �   �                                                                                    0
)   m                 z  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _4RE0SG3DI1230531083      /  F      ]                          �      �                       WINDOWS _4RE0SG3DJ1230598428�      �  �      �      E  S                  4!                           WINDOWS _4RE0SG3DI1230532148�!      �!  �!  �!  �!      '  �(                                               WINDOWS _4RE0SG3DJ1230531760+      +  +  .+  J+                                                           WINDOWS _4RE0SG3DO1230531083�+      �+  �+  �+  �+                                                           WINDOWS _4RE0SG3DP1230531083j,      x,  �,  �,  �,                                                           WINDOWS _4RE0SG3DQ1230531083	-      -  '-  4-  R-                                                           WINDOWS _4RE0SG3DR1230531083�-      �-  �-  �-  .                                                           WINDOWS _4RE0SG3DS1230531083i.      x.  �.  �.  �.                                                           WINDOWS _4RE0SG3DT1230531083*/      8/  F/  U/  s/                                                           WINDOWS _4RE0SG3DU1230531083�/      �/  �/  �/  0                                                           WINDOWS _4RE0SG3DV1230531083�0      �0  �0  �0  �0                                                           WINDOWS _4RE0SG3DW1230531083)1      81  G1  T1  r1                                                           WINDOWS _4RE0SG3DX1230531083�1      �1  2  2  12                                                           WINDOWS _4RE0SG3DY1230531083�2      �2  �2  �2  �2                                                           WINDOWS _4RE0SG3DZ1230531083B3      P3  ^3  m3  �3                                                           WINDOWS _4RE0SG3E01230531083�3      �3  �3  4  *4                                                           WINDOWS _4RE0SG3E11230531083�4      �4  �4  �4  �4                                                           WINDOWS _4RE0SG3E21230531083D5      S5  b5  o5  �5                                                           WINDOWS _4RE0SG3E51230531083�5      �5  	6  6  $6                                                           WINDOWS _4RE0SG3E61230533382(7      =7  R7  `7  m7      �7  q<                                               WINDOWS _4RE0SG3E71230533165rA      �A  �A  �A  �A      <B  pB                                               WINDOWS _4RE0TDF0Y1230531912?C      KC  WC  dC  qC                                                           WINDOWS _4RE0TDF0Z1230531912�H      �H  �H  �H  �H                                                           WINDOWS _4RE0TDF101230531912@I      OI  ^I  kI  �I                                                           WINDOWS _4RE0TDF111230531912J      J  *J  9J  WJ                                                           WINDOWS _4RE0TDF121230531912�J      �J  �J  �J  �J                                                           WINDOWS _4RE0TDF131230531912nK      |K  �K  �K  �K                                                           WINDOWS _4RE0TDF141230531912L      L  +L  8L  VL                                                           WINDOWS _4RE0TDF151230531912�L      �L  �L  �L  M                                                           WINDOWS _4RE0TDF161230531912mM      |M  �M  �M  �M                                                           WINDOWS _4RE0TDF171230531912.N      <N  JN  YN  wN                                                           WINDOWS _4RE0TDF181230531912�N      �N  �N  �N  O                                                           WINDOWS _4RE0TDF191230531912�O      �O  �O  �O  �O                                                           WINDOWS _4RE0TDF1A1230531912'P      6P  EP  RP  nP                                                           WINDOWS _4RE0TDF1B1230531912�P      �P  Q  Q  /Q                                                           WINDOWS _4RE0TDF1C1230531912�Q      �Q  �Q  �Q  �Q                                                           WINDOWS _4RE0TDF1D1230531912FR      TR  bR  qR  �R                                                           WINDOWS _4RE0TDF1E1230531912�R      �R  S  S  2S                                                           COMMENT RESERVED                                �S                                                            T*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     HBorderStyle = 2
Height = 361
Width = 589
ShowWindow = 1
DoCreate = .T.
AutoCenter = .T.
Caption = "��ʱ����"
MaxButton = .F.
MinButton = .F.
WindowType = 1
ccursor1 = 
ccursor2 = 
_memberdata =      329<VFPData><memberdata name="ccursor1" type="property" display="cCursor1"/><memberdata name="ccursor2" type="property" display="cCursor2"/><memberdata name="refreshdata" type="method" display="RefreshData"/><memberdata name="cxq" type="property" display="cXQ"/><memberdata name="cxsbh" type="property" display="cXSBH"/></VFPData>

cxsbh = 
cxq = 
Name = "Form1"
     PROCEDURE refreshdata
this.oCmdHX.Enabled= .F.

LOCAL cSQL,cCursor1,cCursor2
cCursor1=SYS(2015)
cCursor2=cCursor1+"_1"

TEXT TO cSQL NOSHOW TEXTMERGE 
DECLARE @ѧ����� varchar(50),@У�� varchar(50)
SET @ѧ�����='<<this.cXSBH>>'
SET @У��='<<this.cXQ>>'

SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,dbo.��׼��ʱ��(У��,ѧ��,�꼶,�γ�����,�༶����) as ��׼��ʱ�� FROM ѧ��������Ϣ WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)>ISNULL(������ʱ,0) ORDER BY �γ�����

SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,dbo.��׼��ʱ��(У��,ѧ��,�꼶,�γ�����,�༶����) as ��׼��ʱ�� FROM ѧ��������Ϣ WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)<ISNULL(������ʱ,0) ORDER BY �γ�����
ENDTEXT 

IF !SelectData(cSQL,cCursor1+","+cCursor2)
	MESSAGEBOX("��ѯ����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

SELECT 0
SELECT (this.cCursor1)
ZAP 
INSERT INTO (this.cCursor1)(ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,��׼��ʱ��) SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,��׼��ʱ�� FROM (cCursor1)
SELECT (this.cCursor1)
GOTO TOP 

SELECT 0
SELECT (this.cCursor2)
ZAP 
INSERT INTO (this.cCursor2)(ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,��׼��ʱ��) SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,��׼��ʱ�� FROM (cCursor2)
SELECT (this.cCursor2)
GOTO TOP 

IF RECCOUNT(this.cCursor1)>0 AND RECCOUNT(this.cCursor2)>0
	this.oCmdHX.Enabled= .T.
ENDIF 

=CloseAlias(cCursor1+","+cCursor2)

this.Grid1.RecordSource=null
this.Grid1.RecordSourceType= 1
this.Grid1.RecordSource=this.cCursor1
this.Grid1.ColumnXN.ControlSource="ѧ��"
this.Grid1.ColumnNJ.ControlSource="�꼶"
this.Grid1.ColumnKCMC.ControlSource="�γ�����"
this.Grid1.ColumnBJLX.ControlSource="�༶����"
this.Grid1.ColumnJFKS.ControlSource="���ѿ�ʱ"
this.Grid1.ColumnCSKS.ControlSource="������ʱ"
this.Grid1.ColumnSYKS.ControlSource="nvl(���ѿ�ʱ,0)-NVL(������ʱ,0)"
this.Grid1.ColumnBZKSF.ControlSource="��׼��ʱ��"
this.Grid1.Refresh

this.Grid2.RecordSource=null
this.Grid2.RecordSourceType= 1
this.Grid2.RecordSource=this.cCursor2
this.Grid2.ColumnXN.ControlSource="ѧ��"
this.Grid2.ColumnNJ.ControlSource="�꼶"
this.Grid2.ColumnKCMC.ControlSource="�γ�����"
this.Grid2.ColumnBJLX.ControlSource="�༶����"
this.Grid2.ColumnJFKS.ControlSource="���ѿ�ʱ"
this.Grid2.ColumnCSKS.ControlSource="������ʱ"
this.Grid2.ColumnSYKS.ControlSource="nvl(���ѿ�ʱ,0)-NVL(������ʱ,0)"
this.Grid2.ColumnBZKSF.ControlSource="��׼��ʱ��"
this.Grid2.Refresh

=RAISEEVENT(this.Grid1,"Click")
ENDPROC
PROCEDURE Init
LPARAMETERS cXSBH,cXQ

this.cXSBH=cXSBH
this.cXQ=cXQ

LOCAL cXSXM
cXSXM=NVL(GetValue("select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='"+cXSBH+"'"),"")

this.Caption="��ʱ���� - " + cXSBH + " - " + cXSXM + " - " + cXQ

this.RefreshData

ENDPROC
PROCEDURE Load
this.cCursor1=SYS(2015)
this.cCursor2=this.cCursor1+"_1"
SELECT 0
CREATE CURSOR (this.cCursor1)(ѧ�� C(50),�꼶 C(50),�γ����� C(50),�༶���� C(50),���ѿ�ʱ N(11,2) null,������ʱ N(11,2) null,��׼��ʱ�� N(11,2) null)
SELECT 0
CREATE CURSOR (this.cCursor2)(ѧ�� C(50),�꼶 C(50),�γ����� C(50),�༶���� C(50),���ѿ�ʱ N(11,2) null,������ʱ N(11,2) null,��׼��ʱ�� N(11,2) null)
ENDPROC
PROCEDURE Unload
=CloseAlias(this.cCursor1)
=CloseAlias(this.cCursor2)
ENDPROC
     ����    �  �                        m�   %   j      G  N   �          �  U  
 T�  � � �-�� �� � � � T� �C��]�� T� �� � _1��
 M(� `��5 �/ DECLARE @ѧ����� varchar(50),@У�� varchar(50)�$ � SET @ѧ�����='<<this.cXSBH>>'� � SET @У��='<<this.cXQ>>'� �  �� �� SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,dbo.��׼��ʱ��(У��,ѧ��,�꼶,�γ�����,�༶����) as ��׼��ʱ�� FROM ѧ��������Ϣ WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)>ISNULL(������ʱ,0) ORDER BY �γ������ �  �� �� SELECT ѧ��,�꼶,�γ�����,�༶����,���ѿ�ʱ,������ʱ,dbo.��׼��ʱ��(У��,ѧ��,�꼶,�γ�����,�༶����) as ��׼��ʱ�� FROM ѧ��������Ϣ WHERE ѧ�����=@ѧ����� AND У��=@У�� AND ISNULL(���ѿ�ʱ,0)<ISNULL(������ʱ,0) ORDER BY �γ������ � %�C � � � ,� � 
����( ��C� ��ѯ����ʧ�ܣ��@� ϵͳ��ʾ�x�� B� � F�  � F��  � �� S�\ r���  � �� � �	 �
 � � � o�� ��� ��� ���	 ���
 ��� ��� ��� �� F��  � �� #)� F�  � F��  � �� S�\ r���  � �� � �	 �
 � � � o�� ��� ��� ���	 ���
 ��� ��� ��� �� F��  � �� #)�& %�C�  � N� � C�  � N� 	��F� T�  � � �a�� � ��C� � ,� � �� T�  � � ���� T�  � � ���� T�  � � ��  � �� T�  � � � �� ѧ���� T�  � � � �� �꼶�� T�  � � � �� �γ������� T�  � � � �� �༶������ T�  � � � �� ���ѿ�ʱ�� T�  � � � �� ������ʱ��5 T�  � � � �� nvl(���ѿ�ʱ,0)-NVL(������ʱ,0)��  T�  � � � ��
 ��׼��ʱ���� ��  � � � T�  � � ���� T�  � � ���� T�  � � ��  � �� T�  � � � �� ѧ���� T�  � � � �� �꼶�� T�  � � � �� �γ������� T�  � � � �� �༶������ T�  � � � �� ���ѿ�ʱ�� T�  � � � �� ������ʱ��5 T�  � � � �� nvl(���ѿ�ʱ,0)-NVL(������ʱ,0)��  T�  � � � ��
 ��׼��ʱ���� ��  � � � ��C�  � � Click�� U  THIS OCMDHX ENABLED CSQL CCURSOR1 CCURSOR2
 SELECTDATA ѧ�� �꼶 �γ����� �༶���� ���ѿ�ʱ ������ʱ
 ��׼��ʱ��
 CLOSEALIAS GRID1 RECORDSOURCE RECORDSOURCETYPE COLUMNXN CONTROLSOURCE COLUMNNJ
 COLUMNKCMC
 COLUMNBJLX
 COLUMNJFKS
 COLUMNCSKS
 COLUMNSYKS COLUMNBZKSF REFRESH GRID2�  ��  � � T� �  ��  �� T� � �� �� �� �O T� �CC�0 select ѧ������ from ��ѧ�ǼǱ� where ѧ�����='�  � '� �  ���5 T� � �� ��ʱ���� - �  �  - � �  - � ��
 �� � � U  CXSBH CXQ THIS CXSXM GETVALUE CAPTION REFRESHDATAY T�  � �C��]�� T�  � ��  � � _1�� F�  �� h���  � �� � C��2�� � C��2�� � C��2�� � C��2�� � N�������� � N��������	 � N�������� F�  �� h���  � �� � C��2�� � C��2�� � C��2�� � C��2�� � N�������� � N��������	 � N�������� U
  THIS CCURSOR1 CCURSOR2 ѧ�� �꼶 �γ����� �༶���� ���ѿ�ʱ ������ʱ
 ��׼��ʱ��#  ��C� � �  �� ��C� � �  �� U 
 CLOSEALIAS THIS CCURSOR1 CCURSOR2 refreshdata,     �� Initf    �� Loadf	    �� Unload    ��1 � 1� QA�a �a �A ��A A � � A �� Q � � A �� Q bA b1a������Q� 1a������Q� r2 � r �R� 3 1�� �� �2 1                       �	     <   
    G   D   +  �  U   K   �  �  ]    )   �                        {ccursor1
ccursor2
_memberdata XML Metadata for customizable properties
cxsbh ѧ�����
cxq У��
*refreshdata ˢ������
      grid      grid      Grid1      Form1     -ColumnCount = 8
FontName = "΢���ź�"
DeleteMark = .F.
HeaderHeight = 24
Height = 143
Left = 13
Panel = 1
RowHeight = 23
SplitBar = .F.
Top = 48
Width = 563
AllowCellSelection = .F.
Name = "Grid1"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.ColumnOrder = 2
Column1.ControlSource = "�꼶"
Column1.Width = 62
Column1.Name = "ColumnNJ"
Column2.FontName = "΢���ź�"
Column2.ColumnOrder = 3
Column2.ControlSource = "�γ�����"
Column2.Width = 82
Column2.Name = "ColumnKCMC"
Column3.FontName = "΢���ź�"
Column3.ColumnOrder = 4
Column3.ControlSource = "�༶����"
Column3.Width = 64
Column3.Name = "ColumnBJLX"
Column4.FontName = "΢���ź�"
Column4.ColumnOrder = 5
Column4.ControlSource = "���ѿ�ʱ"
Column4.Width = 55
Column4.Name = "ColumnJFKS"
Column5.FontName = "΢���ź�"
Column5.ColumnOrder = 6
Column5.ControlSource = "������ʱ"
Column5.Width = 58
Column5.Name = "ColumnCSKS"
Column6.FontName = "΢���ź�"
Column6.ColumnOrder = 1
Column6.ControlSource = "ѧ��"
Column6.Width = 64
Column6.Name = "ColumnXN"
Column7.FontName = "΢���ź�"
Column7.ControlSource = "nvl(���ѿ�ʱ,0)-nvl(������ʱ,0)"
Column7.Width = 67
Column7.Name = "ColumnSYKS"
Column8.FontName = "΢���ź�"
Column8.ControlSource = "��׼��ʱ��"
Column8.Width = 66
Column8.Name = "ColumnBZKSF"
     �PROCEDURE AfterRowColChange
LPARAMETERS nColIndex
SELECT (thisform.cCursor1)
LOCAL cKCMC
cKCMC=LOWER(ALLTRIM(�γ�����))

SELECT (thisform.cCursor2)
LOCATE FOR LOWER(ALLTRIM(�γ�����))==cKCMC
thisform.Grid2.Refresh
ENDPROC
PROCEDURE Click
SELECT (thisform.cCursor1)
LOCAL cKCMC
cKCMC=LOWER(ALLTRIM(�γ�����))

SELECT (thisform.cCursor2)
LOCATE FOR LOWER(ALLTRIM(�γ�����))==cKCMC
thisform.Grid2.Refresh
ENDPROC
     (���                              �8   %   l      �     �          �  U  [  ��  � F�� � �� �� � T� �CC� �@�� F�� � �� -�CC� �@� �� �� � � � U 	 NCOLINDEX THISFORM CCURSOR1 CKCMC �γ����� CCURSOR2 GRID2 REFRESHT  F��  � �� �� � T� �CC� �@�� F��  � �� -�CC� �@� �� ��  � � � U  THISFORM CCURSOR1 CKCMC �γ����� CCURSOR2 GRID2 REFRESH AfterRowColChange,     �� Click�     ��1 q � q � !� 2 � q � !� 1                       �      	   �   �      )                           header      header      Header1      Form1.Grid1.ColumnNJ      JFontName = "΢���ź�"
Alignment = 2
Caption = "�꼶"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnNJ      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnKCMC      NFontName = "΢���ź�"
Alignment = 2
Caption = "�γ�����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnKCMC      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnBJLX      NFontName = "΢���ź�"
Alignment = 2
Caption = "�༶����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnBJLX      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnJFKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "���ѿ�ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnJFKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnCSKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "������ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnCSKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnXN      JFontName = "΢���ź�"
Alignment = 2
Caption = "ѧ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnXN      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnSYKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "ʣ���ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnSYKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.ColumnBZKSF      PFontName = "΢���ź�"
Alignment = 2
Caption = "��׼��ʱ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.ColumnBZKSF      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      label      label      Label1      Form1      �FontBold = .T.
FontName = "΢���ź�"
FontSize = 10
WordWrap = .T.
BackStyle = 0
Caption = "���ѡ��һ���໥������ʱ�ļ�¼��Ȼ�����������ظ��������ֱ����ɡ�"
Height = 40
Left = 12
Top = 5
Width = 372
ForeColor = 64,0,128
Name = "Label1"
      commandbutton      commandbutton      oCmdHX      Form1      �Top = 6
Left = 429
Height = 36
Width = 84
FontBold = .T.
FontName = "΢���ź�"
FontSize = 10
Caption = "����"
Name = "oCmdHX"
     mPROCEDURE Click
LOCAL cXN1,cNJ1,cKCMC1,cBJLX1,nSYKS1
LOCAL cXN2,cNJ2,cKCMC2,cBJLX2,nSYKS2

SELECT (thisform.cCursor1)
cXN1=ALLTRIM(ѧ��)
cNJ1=ALLTRIM(�꼶)
cKCMC1=ALLTRIM(�γ�����)
cBJLX1=ALLTRIM(�༶����)
nSYKS1=NVL(���ѿ�ʱ,0)-NVL(������ʱ,0)

SELECT (thisform.cCursor2)
cXN2=ALLTRIM(ѧ��)
cNJ2=ALLTRIM(�꼶)
cKCMC2=ALLTRIM(�γ�����)
cBJLX2=ALLTRIM(�༶����)
nSYKS2=NVL(������ʱ,0)-NVL(���ѿ�ʱ,0)

IF EMPTY(NVL(cKCMC1,"")) OR EMPTY(NVL(cKCMC2,""))
	MESSAGEBOX("û��ѡ���໥�����ļ�¼��",0+64,"ϵͳ��ʾ")
	RETURN 
ENDIF 

LOCAL nHXKS
IF nSYKS1>nSYKS2
	nHXKS=nSYKS2
ELSE
	nHXKS=nSYKS1
ENDIF 

LOCAL cSQL
TEXT TO cSQL NOSHOW TEXTMERGE 
INSERT INTO ��ʱ������(У��, ѧ�����, ת��ѧ��, ת���꼶, ת���γ�����, ת���༶����, ת��ѧ��, ת���꼶, ת��γ�����, ת��༶����, ������ʱ��)
	values ('<<thisform.cXQ>>','<<thisform.cXSBH>>','<<cXN2>>','<<cNJ2>>','<<cKCMC2>>','<<cBJLX2>>','<<cXN1>>','<<cNJ1>>','<<cKCMC1>>','<<cBJLX1>>',<<nHXKS>>)
ENDTEXT 
IF Execute(cSQL)
	MESSAGEBOX("�����ɹ���",0+64,"ϵͳ��ʾ")
	thisform.RefreshData
ELSE
	MESSAGEBOX("����ʧ�ܣ�",0+64,"ϵͳ��ʾ")
ENDIF 
ENDPROC
     ����    �  �                        �B   %   >      �  %   M          �  U  Q ��  � � � � � �� � � � �	 � F��
 � �� T�  �C� ��� T� �C� ��� T� �C� ��� T� �C� ��� T� �C� � �C� � ��� F��
 � �� T� �C� ��� T� �C� ��� T� �C� ��� T� �C� ��� T�	 �C� � �C� � ���" %�CC� �  ҡ� CC� �  ҡ��N�2 ��C� û��ѡ���໥�����ļ�¼���@� ϵͳ��ʾ�x�� B� � �� � %�� �	 ��w� T� ��	 �� ��� T� �� �� � �� �
 M(� `��� �� INSERT INTO ��ʱ������(У��, ѧ�����, ת��ѧ��, ת���꼶, ת���γ�����, ת���༶����, ת��ѧ��, ת���꼶, ת��γ�����, ת��༶����, ������ʱ��)�� �� 	values ('<<thisform.cXQ>>','<<thisform.cXSBH>>','<<cXN2>>','<<cNJ2>>','<<cKCMC2>>','<<cBJLX2>>','<<cXN1>>','<<cNJ1>>','<<cKCMC1>>','<<cBJLX1>>',<<nHXKS>>)� � %�C � � ���$ ��C�
 �����ɹ����@� ϵͳ��ʾ�x��
 ��
 � � �J�$ ��C�
 ����ʧ�ܣ��@� ϵͳ��ʾ�x�� � U  CXN1 CNJ1 CKCMC1 CBJLX1 NSYKS1 CXN2 CNJ2 CKCMC2 CBJLX2 NSYKS2 THISFORM CCURSOR1 ѧ�� �꼶 �γ����� �༶���� ���ѿ�ʱ ������ʱ CCURSOR2 NHXKS CSQL EXECUTE REFRESHDATA Click,     ��1 qq� � � � � �� � � � � �"!A A r � � � A r � �	
A !A� � AA 1                       b      )   �                        commandbutton      commandbutton      	oCmdClose      Form1      zTop = 6
Left = 516
Height = 36
Width = 60
FontName = "΢���ź�"
FontSize = 10
Caption = "�ر�"
Name = "oCmdClose"
      ,PROCEDURE Click
thisform.Release
ENDPROC
      ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 1                       !       )   �                         grid      grid      Grid2      Form1     .ColumnCount = 8
FontName = "΢���ź�"
DeleteMark = .F.
HeaderHeight = 24
Height = 143
Left = 12
Panel = 1
RowHeight = 23
SplitBar = .F.
Top = 204
Width = 563
AllowCellSelection = .F.
Name = "Grid2"
Column1.FontName = "΢���ź�"
Column1.FontSize = 10
Column1.ColumnOrder = 2
Column1.ControlSource = "�꼶"
Column1.Width = 62
Column1.Name = "ColumnNJ"
Column2.FontName = "΢���ź�"
Column2.ColumnOrder = 3
Column2.ControlSource = "�γ�����"
Column2.Width = 82
Column2.Name = "ColumnKCMC"
Column3.FontName = "΢���ź�"
Column3.ColumnOrder = 4
Column3.ControlSource = "�༶����"
Column3.Width = 64
Column3.Name = "ColumnBJLX"
Column4.FontName = "΢���ź�"
Column4.ColumnOrder = 5
Column4.ControlSource = "���ѿ�ʱ"
Column4.Width = 55
Column4.Name = "ColumnJFKS"
Column5.FontName = "΢���ź�"
Column5.ColumnOrder = 6
Column5.ControlSource = "������ʱ"
Column5.Width = 58
Column5.Name = "ColumnCSKS"
Column6.FontName = "΢���ź�"
Column6.ColumnOrder = 1
Column6.ControlSource = "ѧ��"
Column6.Width = 64
Column6.Name = "ColumnXN"
Column7.FontName = "΢���ź�"
Column7.ControlSource = "nvl(���ѿ�ʱ,0)-nvl(������ʱ,0)"
Column7.Width = 67
Column7.Name = "ColumnSYKS"
Column8.FontName = "΢���ź�"
Column8.ControlSource = "��׼��ʱ��"
Column8.Width = 66
Column8.Name = "ColumnBZKSF"
      header      header      Header1      Form1.Grid2.ColumnNJ      JFontName = "΢���ź�"
Alignment = 2
Caption = "�꼶"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnNJ      FontName = "΢���ź�"
FontSize = 10
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnKCMC      NFontName = "΢���ź�"
Alignment = 2
Caption = "�γ�����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnKCMC      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnBJLX      NFontName = "΢���ź�"
Alignment = 2
Caption = "�༶����"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnBJLX      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnJFKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "���ѿ�ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnJFKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnCSKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "������ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnCSKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnXN      JFontName = "΢���ź�"
Alignment = 2
Caption = "ѧ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnXN      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnSYKS      NFontName = "΢���ź�"
Alignment = 2
Caption = "ʣ���ʱ"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnSYKS      pFontName = "΢���ź�"
BorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid2.ColumnBZKSF      PFontName = "΢���ź�"
Alignment = 2
Caption = "��׼��ʱ��"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid2.ColumnBZKSF      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      �Arial, 0, 9, 5, 15, 12, 32, 3, 0
΢���ź�, 0, 9, 6, 17, 13, 17, 4, 0
΢���ź�, 0, 10, 6, 19, 15, 19, 4, 0
΢���ź�, 1, 10, 7, 19, 15, 19, 4, 0
..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\��ά����\ frm_readcard.scx frm_readcard.sct �����ɷ�.scx �����ɷ�.sct ����.scx ����.sct ��������.scx ��������.sct ��ά.vcx ��ά.vct main.prg c:\users\admini~1\appdata\local\temp\ main.fxp ..\..\����\Դ����\����ƽ̨\wisemis3.0\images\system\ search.bmp ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ _base.vcx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ _base.vct x:\Դ����\����ƽ̨\wisemis3.0\addons\myheader.prg c:\users\lilill\appdata\local\temp\ myheader.fxp ..\..\����\Դ����\����ƽ̨\wisemis3.0\forms\ frm_f7.scx frm_f7.sct dragmove.cur ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_text.scx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_text.sct panehelp.bmp exit.bmp ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_tool_export.scx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_tool_export.sct ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_get_data.scx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_get_data.sct ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_browse.scx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_browse.sct ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_tool_password.scx ..\..\����\Դ����\����ƽ̨\wisemis3.0\addons\ frm_tool_password.sct community.ico ok.bmp wzundo.bmp export.bmp open.bmp plus1.bmp ѡ���Ŀ.scx ѡ���Ŀ.sct select.bmp �ϲ�ѧ��.scx �ϲ�ѧ��.sct sc_refresh.bmp ..\..\����\Դ����\����ƽ̨\wisemis3.0\images\ check_ok.bmp d:\wisemis3\ �վ�(����ѧУ).frx �վ�(����ѧУ).frt add.bmp frm_browse2.scx frm_browse2.sct browse.ico ��ʱ����.scx ��ʱ����.sct 	)   t      7           t  %0      H           	%0  �R      Y           �R  w�     f           	w� ��     s           �� U�     |           	U� �     �           � 8     �           8 i%     �           i% ��     �            �� D� �   �           D� z� �             z� � )  W          � �� a  �           �� �� �  �          	�� � �  )          � �� �  4          �� $� �   ?          	$� �� L  z          �� )� �  �          )� � �   �          � �� �   �          	�� o	 �            o	 %T	   H          	%T	 \	 \  �          \	 �y	 �  �          	�y	 a�	 �            a�	 �	   E          	�	 s�	 T  �          s�	 ��	 �  �          ��	 +
 �   �          +
 !
 �   �          !
 �
 �   �          �
 u
 �   �          u
 �!
 �             �!
 �(
 �             	�(
 �1
               �1
 fj
     '          fj
 �m
 �   4          	�m
 �x
     ?          �x
 p�
     L          p�
 ��
 �   Y          ��
 ܣ
 h  �          
ܣ
 �
 �  �          �
 Y �  �          Y >e �   �          	>e �o �  �          �o �� �  �          �� � �   �          	� ��     	          �� �4               