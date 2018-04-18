$Name <FILENAME>

! Obj_Source
;Project created by:
;Joao Rodrigues SLAC
;joaoprod@slac.staford.edu
;
;Project reviewed by:
;
;Project tested by:
;
;
;
;History of change:

#Include <func06.fps>

! Id_Pluto[D20]:1=000000000001
! Id_Pluto[D20]:2=000000000002
! Id_Pluto[D20]:3=000000000003

! Export M3.20,M3.21

! I1.0=P1_TSW0                          ;Thermal switch PRT-UTT-TSSW-00
! I1.1=P1_TSW1                          ;Thermal switch  PRT-UTT-TSSW-01
! I1.2=P1_TSW2                          ;Thermal switch  PRT-UTT-TSSW-02
! I1.3=P1_TSW3                          ;Thermal switch  PRT-UTT-TSSW-03
! I1.4=P1_NO_LEAK                       ;No Leak signal from leak detector PRT-UTT-LLD-00
! I1.5=P1_LEAK                          ;Leak signal from leak detector PRT-UTT-LLD-00
! I1.6=P1_SMK                           ;Smoke detector alarm contact PRT-UTT-SMK-00
! I1.7=P1_LEAK_FAULT                    ;Leak detector fault signal  PRT-UTT-LLD-00
! Q1.0=P1_UTPowPerm                     ;Utility Trunk High Power Permit PWR-UTT-FRB-00
! Q1.1=P1_REBPowPerm                    ;REB Power Supply Permit
! Q1.2=P1_CoolantValve                  ;Coolant valve control PRT-UTT-RLY-00
! Q1.3=P1_LeakPow                       ;Leak Detection Power PRT-UTT-DCD-00
! GM1.0=P1_TSW0Lstate                   ;Latch TSW0 input state
! GM1.1=P1_TSW1Lstate                   ;Latch TSW1 input state
! GM1.2=P1_TSW2Lstate                   ;Latch TSW2 input state
! GM1.3=P1_TSW3Lstate                   ;Latch TSW3 input state
! GM1.4=P1_SMKLstate                    ;Latch SMK input state
! GM1.5=P1_LEAKLstate                   ;Latch Leak input state
! GM1.6=P1_LEAKFAULTLstate              ;Latch Leak Fault input state
! GM1.7=P1_Temp1state                   ;1 temp alarm latch state
! GM1.8=P1_TempOkLstate                 ;3 of four temps ok slatch tate
! GM1.9=P1_SMKfaultLstate               ;Latch SMKFault input state
! I2.0=P2_ClpRTD0                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-00
! I2.1=P2_ClpRTD1                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-01
! I2.2=P2_ClpRTD2                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-02
! I2.3=P2_ClpRTD3                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-03
! I2.4=P2_SMKFault                      ;Smoke detector fault contact PRT-UTT-SMK-00
! I2.5=P2_SMKWarning                    ;Smoke detector warning contact PRT-UTT-SMK-00
! I2.7=P2_MasterReset                   ;Resets all latches for intialization purposes
! Q2.0=P2_ColdHeatPerm                  ;Cold Plate Heater Permit
! Q2.1=P2_ColdRefPerm                   ;Cold Plate refrigerator Permit
! GM2.0=P2_ClpTemp0HighLstatus          ;
! GM2.1=P2_ClpTemp1HighLstatus          ;
! GM2.2=P2_ClpTemp2HighLstatus          ;
! GM2.3=P2_ClpTemp3HighLstatus          ;
! GM2.4=P2_ClpTemp0LowLstatus           ;
! GM2.5=P2_ClpTemp1LowLstatus           ;
! GM2.6=P2_ClpTemp2LowLstatus           ;
! GM2.7=P2_ClpTemp3LowLstatus           ;
! GM2.10=P2_ClpTempHigh                 ;
! GM2.11=P2_ClpTempLow                  ;
! I3.0=P3_CypRTD4                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-04
! I3.1=P3_CypRTD5                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-05
! I3.2=P3_CypRTD6                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-06
! I3.3=P3_CypRTD3                       ;4-20 mA RTD signal from the cold plate PRT-UTT-SGC-07
! I3.5=P3_HexVac                        ;HEX-Can Vacuum Status
! I3.6=P3_CryVac                        ;Cryostat Vacuum Status
! Q3.0=P3_CryoHeatPerm                  ;Cryo Plate Heater Permit
! Q3.1=P3_CryoRefPerm                   ;Cryo Plate refrigerator Permit
! GM3.0=P3_CryVacLstatus                ;
! GM3.1=P3_HexVacLstatus                ;
! GM3.2=P3_CypTemp4HighLstatus          ;
! GM3.3=P3_CypTemp5HighLstatus          ;
! GM3.4=P3_CypTemp6HighLstatus          ;
! GM3.5=P3_CypTemp7HighLstatus          ;
! GM3.6=P3_CypTemp4LowLstatus           ;
! GM3.7=P3_CypTemp5LowLstatus           ;
! GM3.8=P3_CypTemp6LowLstatus           ;
! GM3.9=P3_CypTemp7LowLstatus           ;
! GM3.10=P3_CypTempHigh                 ;3 of 4
! GM3.11=P3_CypTempLow                  ;3 of 4
! M3.20=P3_CryVacL                      ;Cryostat vacuum latch
! M3.21=P3_HexVacL                      ;Heat exchanger vacuum latch

! Pgm_Pluto:1
! Instruction_Set_3
! Ext_comm:0=Device 0,Packet 0, 400
;PRT-UTT-PLC1
;
;Utility Trunk Power Interlocks
;REB PS interlocks
;
;Inputs: Utility trunk thermal switches, smoke detector, master permit, reset
;Controls: Utility Trunk Power and the REB power supplies.
;

! I1.0,A_Pulse,Non_Inv
! I1.1,B_Pulse,Non_Inv
! I1.2,C_Pulse,Non_Inv
! I1.3,A_Pulse,Non_Inv
! I1.4,B_Pulse,Non_Inv
! I1.5,B_Pulse,Non_Inv
! I1.6,C_Pulse,Non_Inv
! I1.7,A_Pulse,Non_Inv
! Q1.10,A_Pulse
! Q1.11,B_Pulse
! Q1.12,C_Pulse
! Q1.13,Static
! Q1.14,Static
! Q1.15,Static
! Q1.16,Static
! Q1.17,Static

! Q1.10=P1_APower                       ;TSW0, TSW3, Leak Detector Fault
! Q1.11=P1_BPower                       ;TSW1,  Leak Detector Fault
! Q1.12=P1_CPower                       ;TSW2, Smoke detector alarm
! Q1.13=P1_UTLeakAn                     ;UT Coolant Leak Indicator
! Q1.14=P1_UTHotAn                      ;UT Hot Indicator
! Q1.15=P1_UTSmkAn                      ;UT Smoke Indicator
! Q1.16=P1_UTPowAn                      ;UT Power Status
! Q1.17=P1_REBPowAn                     ;REB Power Status
! M1.5=P1_OutToGateway                  ;????????????????????
! M1.6=P1_ResetUtE                      ;External reset for the utility trunk power
! M1.7=P1_MUTReset                      ;(External UT reset) OR (Master reset)
! M1.10=P1_TSW0L                        ;Latch TSW0 input
! M1.11=P1_TSW1L                        ;Latch TSW1 input
! M1.12=P1_TSW2L                        ;Latch TSW2 input
! M1.13=P1_TSW3L                        ;Latch TSW3 input
! M1.14=P1_SMKL                         ;Latch SMK input
! M1.15=P1_LEAKL                        ;Latch Leak input
! M1.16=P1_LEAKFAULTL                   ;Latch Leak Fault input
! M1.17=P1_NO_LEAKL                     ;Latch No Leak input
! M1.18=P1_TempOkL                      ;3 of four temps ok
! M1.19=P1_SMKfaultL                    ;Latch SMKFault input 


S1.0_0=Safe
P1_MUTReset=P(P1_ResetUTe)+P(P2_MasterReset)
;Reset Signal
P1_TSW0L=StartT(P1_TSW0,P1_MUTReset,1,P1_TSW0Lstate)
;TSW0 Latch
P1_TSW1L=StartT(P1_TSW1,P1_MUTReset,1,P1_TSW1Lstate)
;TSW1 Latch
P1_TSW2L=StartT(P1_TSW2,P1_MUTReset,1,P1_TSW2Lstate)
;TSW2 Latch
P1_TSW3L=StartT(P1_TSW3,P1_MUTReset,1,P1_TSW3Lstate)
;TSW3 Latch
P1_SMKL=StartT(P1_SMK,P1_MUTReset,1,P1_SMKLstate)
;moke Latch
P1_SMKfaultL=StartT(P2_SMKFault,P1_MUTReset,1,P1_SMKfaultLstate)
;Smoke Fault  Latch
P1_LEAKL=StartT(P1_LEAK,P1_MUTReset,1,P1_LEAKLstate)
;Leak Latch
P1_LEAKFAULTL=StartT(P1_LEAK_FAULT,P1_MUTReset,1,P1_LEAKFAULTLstate)
;Leak Fault Latch
P1_TempOkL=P1_TSW0L*P1_TSW1L*P1_TSW2L+P1_TSW0L*P1_TSW1L*P1_TSW3L+P1_TSW0L*P1_TSW2L*P1_TSW3L+P1_TSW1L*P1_TSW2L*P1_TSW3L
;3 of 4 TSW
P1_UTPowPerm=P1_TempOkL*P1_SMKL*P1_SMKfaultL*P1_LEAKL*P1_LEAKFAULTL
; High Power Permit Logic
P1_REBPowPerm=P2_ColdHeatPerm*P3_CryoHeatPerm
;REB Power Permit Logic
P1_CoolantValve=P1_LEAKL*P1_LEAKFAULTL
;Coolant valve

S1.1_0=Non Safe
P1_ResetUTe=Ext_Sig(0,0)
;Get external UT reset signal
P1_LeakPow
;Leak Detector Power ?????????????? Test if needed. if needed do it of all the other power outs
P1_UTPowAn=P1_UTPowPerm
;UT Power Permit indicator
P1_REBPowAn=P1_REBPowPerm
;REB Power Permit indicator
P1_TempOkLstate=(P1_TSW0Lstate+P1_TSW1Lstate+P1_TSW2Lstate+P1_TSW3Lstate)*/P1_TempOkL
;ne TSW alert
P1_Temp1state=P1_TSW0Lstate+P1_TSW1Lstate+P1_TSW2Lstate+P1_TSW3Lstate
;ne TSW alert
P1_UTHotAn=P1_TempOkLstate
;UT Hot indicator
P1_UTSmkAn=P1_SMKLstate
;UT Smoke indicator
P1_UTLeakAn=P1_LEAKLstate
;UT Leak indicator

! Pgm_Pluto:2
! Instruction_Set_3
;PRT-UTT-PLC2
;
;Cold Heaters and Refrigeration Interlocks
;
;Inputs: 4 cold plate conditioned  RTD anlalog signals plus a reset
;Outputs: Cold plate heater interlock and cold plater refrigerator interlock
;

! I2.0,Analog,20mA
! I2.1,Analog,20mA
! I2.2,Analog,20mA
! I2.3,Analog,20mA
! I2.4,A_Pulse,Non_Inv
! I2.5,A_Pulse,Non_Inv
! I2.7,Static
! Q2.10,A_Pulse
! Q2.11,B_Pulse
! Q2.13,Static
! Q2.14,Static
! Q2.15,Static
! Q2.16,Static
! Q2.17,Static

! Q2.10=P2_APower                       ;Signal to Smoke Detector Warning and Fault contact
! Q2.11=P2_BPower                       ;
! Q2.13=P2_MPMActiveAn                  ;MPM Active Indicator
! Q2.14=P2_ColdPlateHotAn               ;Cold Plate Hot Indicator
! Q2.15=P2_ColdPlateColdAn              ;Cold Plate Cold Indicator
! Q2.16=P2_ColdHeatLockAn               ;Cold Heat Lock Indicator
! Q2.17=P2_ColdFrigLockAn               ;Cold Frig Lock Indicator
! M2.0=P2_ToGateOne                     ;
! M2.1=P2_ToGateTwo                     ;
! M2.6=P2_ResetClpE                     ;External reset for the utility trunk power
! M2.7=P2_MClpReset                     ;(External clp reset) OR (Master reset)
! M2.8=P2_ClpRTD0valid                  ;ClpRTD0valid
! M2.9=P2_ClpRTD1valid                  ;ClpRTD1valid
! M2.10=P2_ClpRTD2valid                 ;ClpRTD2valid
! M2.11=P2_ClpRTD3valid                 ;ClpRTD3valid
! M2.12=P2_ClpTemp0HighL                ;ClpTemp0High
! M2.13=P2_ClpTemp1HighL                ;ClpTemp1High
! M2.14=P2_ClpTemp2HighL                ;ClpTemp2High
! M2.15=P2_ClpTemp3HighL                ;ClpTemp3High
! M2.16=P2_ClpTemp0LowL                 ;
! M2.17=P2_ClpTemp1LowL                 ;
! M2.18=P2_ClpTemp2LowL                 ;
! M2.19=P2_ClpTemp3LowL                 ;
! R2.0=P2_ClpRTD0current                ;
! R2.1=P2_ClpRTD0Temp                   ;
! R2.2=P2_ClpRTD1current                ;
! R2.3=P2_ClpRTD1Temp                   ;
! R2.4=P2_ClpRTD2current                ;
! R2.5=P2_ClpRTD2Temp                   ;
! R2.6=P2_ClpRTD3current                ;
! R2.7=P2_ClpRTD3Temp                   ;
! R2.10=P2_ClpLH                        ;
! R2.11=P2_ClpLL                        ;


S2.0_0=Safe
P2_MClpReset=P(P2_ResetClpE)+P(P2_MasterReset)
(P2_ClpLL=228)
(P2_ClpLH=295)
P2_ClpRTD0valid=ReadCurrent(0,120,320,P2_ClpRTD0current,P2_ClpRTD0Temp)
;``
P2_ClpRTD1valid=ReadCurrent(1,120,320,P2_ClpRTD1current,P2_ClpRTD1Temp)
;``
P2_ClpRTD2valid=ReadCurrent(2,120,320,P2_ClpRTD2current,P2_ClpRTD2Temp)
;``
P2_ClpRTD3valid=ReadCurrent(3,120,320,P2_ClpRTD1current,P2_ClpRTD3Temp)
;``
P2_ClpTemp0HighL=StartT((P2_ClpRTD0Temp<P2_ClpLH)*P2_ClpRTD0valid,P2_MClpReset,1,P2_ClpTemp0HighLstatus)
;< LH to Heaters
;
P2_ClpTemp1HighL=StartT((P2_ClpRTD1Temp<P2_ClpLH)*P2_ClpRTD1valid,P2_MClpReset,1,P2_ClpTemp1HighLstatus)
P2_ClpTemp2HighL=StartT((P2_ClpRTD2Temp<P2_ClpLH)*P2_ClpRTD2valid,P2_MClpReset,1,P2_ClpTemp2HighLstatus)
P2_ClpTemp3HighL=StartT((P2_ClpRTD3Temp<P2_ClpLH)*P2_ClpRTD3valid,P2_MClpReset,1,P2_ClpTemp3HighLstatus)
P2_ClpTemp0LowL=StartT((P2_ClpRTD0Temp>P2_ClpLL)*P2_ClpRTD0valid,P2_MClpReset,1,P2_ClpTemp0LowLstatus)
;> LLOW to Ref
;
P2_ClpTemp1LowL=StartT((P2_ClpRTD1Temp>P2_ClpLL)*P2_ClpRTD1valid,P2_MClpReset,1,P2_ClpTemp1LowLstatus)
P2_ClpTemp2LowL=StartT((P2_ClpRTD2Temp>P2_ClpLL)*P2_ClpRTD2valid,P2_MClpReset,1,P2_ClpTemp2LowLstatus)
P2_ClpTemp3LowL=StartT((P2_ClpRTD3Temp>P2_ClpLL)*P2_ClpRTD3valid,P2_MClpReset,1,P2_ClpTemp3LowLstatus)
P2_ClpTempHigh=P2_ClpTemp0HighL*P2_ClpTemp1HighL*P2_ClpTemp2HighL+P2_ClpTemp0HighL*P2_ClpTemp1HighL*P2_ClpTemp3HighL+P2_ClpTemp0HighL*P2_ClpTemp2HighL*P2_ClpTemp3HighL+P2_ClpTemp1HighL*P2_ClpTemp2HighL*P2_ClpTemp3HighL
P2_ColdHeatPerm=P2_ClpTempHigh
P2_ClpTempLow=P2_ClpTemp0LowL*P2_ClpTemp1LowL*P2_ClpTemp2LowL+P2_ClpTemp0LowL*P2_ClpTemp1LowL*P2_ClpTemp3LowL+P2_ClpTemp0LowL*P2_ClpTemp2LowL*P2_ClpTemp3LowL+P2_ClpTemp1LowL*P2_ClpTemp2LowL*P2_ClpTemp3LowL
P2_ColdRefPerm=P2_ClpTempLow*P3_HexVacL*P3_CryVacL

S2.1_0=Non Safe
P2_ResetClpE=Ext_Sig(16,0)
P2_ToGateOne=ToGateway_User_A(SM_1Hz,1,P2_ClpRTD0Temp,P2_ClpRTD1Temp)
P2_ToGateTwo=ToGateway_User_A(P(/P2_ToGateOne),2,P2_ClpRTD2Temp,P2_ClpRTD3Temp)
P2_ColdFrigLockAn=/P2_ColdRefPerm
P2_ColdHeatLockAn=/P2_ColdHeatPerm
P2_ColdPlateHotAn=(P2_ClpTemp0HighLstatus+P2_ClpTemp1HighLstatus+P2_ClpTemp2HighLstatus+P2_ClpTemp3HighLstatus)*/P2_ClpTempHigh
;
;
P2_ColdPlateColdAn=(P2_ClpTemp0LowLstatus+P2_ClpTemp1LowLstatus+P2_ClpTemp2LowLstatus+P2_ClpTemp3LowLstatus)*/P2_ClpTempLow
P2_MPMActiveAn=SM_Pluto1_Present*SM_Pluto2_Present*SM_Pluto3_Present

! Pgm_Pluto:3
! Instruction_Set_3
;PRT-UTT-PLC3
;
;Cryo Heaters and Refrigeration Interlocks
;
;Inputs: 4 cryo plate conditioned  RTD anlalog signals, vacuum status,  plus resets
;Outputs: Cryo plate heater interlock and cryo plate refrigerator interlock

! I3.0,Analog,20mA
! I3.1,Analog,20mA
! I3.2,Analog,20mA
! I3.3,Analog,20mA
! I3.5,A_Pulse,Non_Inv
! I3.6,B_Pulse,Non_Inv
! Q3.10,A_Pulse
! Q3.11,B_Pulse
! Q3.12,Static
! Q3.13,Static
! Q3.14,Static
! Q3.15,Static
! Q3.16,Static
! Q3.17,Static

! Q3.10=P3_APower                       ;Signal to HEX-Can Vacuum Status contact
! Q3.11=P3_BPower                       ;Signal to Cryostat Vacuum Status contact
! Q3.12=P3_CryoPlateHotAn               ;Cryo Plate Hot Indicator
! Q3.13=P3_CryoPalteColdAn              ;Cryo Plate Cold Indicator
! Q3.14=P3_HVBadAn                      ;Hex Vac Bad Indicator
! Q3.15=P3_CVBadAn                      ;Cryo Vac Bad Indicator
! Q3.16=P3_CryoHeatLock                 ;Cryo Heat Lock Indicator
! Q3.17=P3_CryoFrigLockAn               ;Cryo Frig Lock Indicator
! M3.0=P3_ToGateFour                    ;
! M3.1=P3_ToGateFive                    ;
! M3.2=P3_ToGateSix                     ;
! M3.4=P3_MCypReset                     ;Gateway or Master reset of cryo plate interlocks
! M3.5=P3_MVacReset                     ;Gateway or Master reset of the vacuum interlocks
! M3.6=P3_ResetCypE                     ;Gateway reset of cryo plate interlocks
! M3.7=P3_ResetVacE                     ;Gateway reset of the vacuum interlocks
! M3.8=P3_CypRTD4valid                  ;
! M3.9=P3_CypRTD5valid                  ;
! M3.10=P3_CypRTD6valid                 ;
! M3.11=P3_CypRTD7valid                 ;
! M3.12=P3_CypTemp4HighL                ;
! M3.13=P3_CypTemp5HighL                ;
! M3.14=P3_CypTemp6HighL                ;
! M3.15=P3_CypTemp7HighL                ;
! M3.16=P3_CypTemp4LowL                 ;
! M3.17=P3_CypTemp5LowL                 ;
! M3.18=P3_Cyptemp6LowL                 ;
! M3.19=P3_CypTemp7LowL                 ;
! R3.0=P3_CypRTD4current                ;
! R3.1=P3_CypRTD4Temp                   ;
! R3.2=P3_CypRTD5current                ;
! R3.3=P3_CypRTD5Temp                   ;
! R3.4=P3_CypRTD6current                ;
! R3.5=P3_CypRTD6Temp                   ;
! R3.6=P3_CypRTD7current                ;
! R3.7=P3_CypRTD7Temp                   ;
! R3.10=P3_CypYH                        ;
! R3.11=P3_CypYL                        ;


S3.0_0=Safe
P3_MCypReset=P(P3_ResetCypE)+P(P2_MasterReset)
P3_MVacReset=P(P3_ResetVacE)+P(P2_MasterReset)
(P3_CypYL=130)
(P3_CypYH=270)
P3_HexVacL=StartT(P3_HexVac,P3_MVacReset,1,P3_HexVacLstatus)
P3_CryVacL=StartT(P3_CryVac,P3_MVacReset,1,P3_CryVacLstatus)
P3_CypRTD4valid=ReadCurrent(0,120,320,P3_CypRTD4current,P3_CypRTD4Temp)
P3_CypRTD5valid=ReadCurrent(0,120,320,P3_CypRTD5current,P3_CypRTD5Temp)
P3_CypRTD6valid=ReadCurrent(0,120,320,P3_CypRTD6current,P3_CypRTD6Temp)
P3_CypRTD7valid=ReadCurrent(0,120,320,P3_CypRTD7current,P3_CypRTD7Temp)
P3_CypTemp4HighL=StartT((P3_CypRTD4Temp<P3_CypYH)*P3_CypRTD4valid,P3_MCypReset,1,P3_CypTemp4HighLstatus)
;temp < YH
P3_CypTemp5HighL=StartT((P3_CypRTD5Temp<P3_CypYH)*P3_CypRTD5valid,P3_MCypReset,1,P3_CypTemp5HighLstatus)
P3_CypTemp6HighL=StartT((P3_CypRTD6Temp<P3_CypYH)*P3_CypRTD6valid,P3_MCypReset,1,P3_CypTemp6HighLstatus)
P3_CypTemp7HighL=StartT((P3_CypRTD7Temp<P3_CypYH)*P3_CypRTD7valid,P3_MCypReset,1,P3_CypTemp7HighLstatus)
P3_CypTempHigh=P3_CypTemp4HighL*P3_CypTemp5HighL*P3_CypTemp6HighL+P3_CypTemp4HighL*P3_CypTemp5HighL*P3_CypTemp7HighL+P3_CypTemp4HighL*P3_CypTemp6HighL*P3_CypTemp7HighL+P3_CypTemp5HighL*P3_CypTemp6HighL*P3_CypTemp4HighL
P3_CryoHeatPerm=P3_CypRTD6valid
P3_CypTemp4LowL=StartT((P3_CypRTD4Temp>P3_CypYL)*P3_CypRTD4valid,P3_MCypReset,1,P3_CypTemp4LowLstatus)
;temo > YL
P3_CypTemp5LowL=StartT((P3_CypRTD5Temp>P3_CypYL)*P3_CypRTD5valid,P3_MCypReset,1,P3_CypTemp5LowLstatus)
P3_CypTemp6LowLstatus=StartT((P3_CypRTD6Temp>P3_CypYL)*P3_CypRTD6valid,P3_MCypReset,1,P3_CypTemp6LowLstatus)
P3_CypTemp7LowL=StartT((P3_CypRTD7Temp>P3_CypYL)*P3_CypRTD7valid,P3_MCypReset,1,P3_CypTemp7LowLstatus)
P3_CypTempLow=P3_CypTemp4LowL*P3_CypTemp5LowL*P3_CypTemp6LowL+P3_CypTemp4LowL*P3_CypTemp5LowL*P3_CypTemp7LowL+P3_CypTemp4LowL*P3_CypTemp6LowL*P3_CypTemp7LowL+P3_CypTemp5LowL*P3_CypTemp6LowL*P3_CypTemp7LowL
P3_CryoRefPerm=P3_CypTempLow*P3_CryVacL*P3_HexVacL

S3.1_0=Non Safe
P3_ResetCypE=Ext_Sig(32,0)
P3_ResetVacE=Ext_Sig(48,0)
P3_ToGateFour=ToGateway_User_A(SM_1Hz,3,P3_CypRTD4Temp,P3_CypRTD5Temp)
P3_ToGateFive=ToGateway_User_A(P(/P3_ToGateFour),4,P3_CypRTD4Temp,P3_CypRTD5Temp)
P3_ToGateSix=ToGateway_User_C(P(/P3_ToGateFive),5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0)
P3_CVBadAn=/P3_CryVacLstatus
P3_HVBadAn=/P3_HexVacLstatus
P3_CryoHeatLock=/P3_CryoHeatPerm
P3_CryoFrigLockAn=/P3_CryoRefPerm
P3_CryoPlateHotAn=(P3_CypTemp4HighLstatus+P3_CypTemp5HighLstatus+P3_CypTemp6HighLstatus+P3_CypTemp7HighLstatus)*/P3_CypTempHigh
;
;
P3_CryoPalteColdAn=(P3_CypTemp4LowLstatus+P3_CypTemp5LowLstatus+P3_CypTemp6LowLstatus+P3_CypTemp7LowLstatus)*/P3_CypTempLow
;
;
