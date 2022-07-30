10 REM Trident
20 COLOR 6, 4
30 CLS
40 LOCATE 11, 28
50 PRINT "3D Rendering Example"
60 LOCATE 13, 9
70 PRINT "Push arrow, Page Up and Page Down keys, Esc twice to quit"
80 X = 200
90 Y = 300
100 Z = 400
110 C = 500
120 REM DO
130 REM DO
140 INKEY K
150 NAP 10
160 IF K < 0 GOTO 130
170 REM LOOP
180 IF K = 27 END
190 IF (K = 339) * (S > -10) S = S - 1
200 IF (K = 338) * (S < 10) S = S + 1
210 IF (K = 259) * (T > -15) T = T - 1
220 IF (K = 258) * (T < 15) T = T + 1
230 IF (K = 261) * (R > -25) R = R - 1
240 IF (K = 260) * (R < 25) R = R + 1
250 IF ((K = 261) * (R = -25)) + ((K = 260) * (R = 25)) GOTO 120
260 IF ((K = 339) * (S = -10)) + ((K = 338) * (S = 10)) GOTO 120
270 IF ((K = 259) * (T = -15)) + ((K = 258) * (T = 15)) GOTO 120
280 COLOR 7, 4
290 CLS
300 G = 0
310 @(C) = -1
320 E = 0
330 F = 1
340 A = 0
350 B = 21
360 D = 0
370 Q = 2
380 N = 10
390 GOSUB 1170
400 E = 1
410 F = 0
420 A = -5
430 B = 31
440 D = 0
450 Q = 3
460 N = 11
470 GOSUB 1170
480 E = 0
490 F = 1
500 A = -5
510 B = 32
520 D = 0
530 Q = 1
540 N = 5
550 GOSUB 1170
560 E = 0
570 F = 1
580 A = 0
590 B = 32
600 D = 0
610 N = 7
620 GOSUB 1170
630 E = 0
640 F = 1
650 A = 5
660 B = 32
670 D = 0
680 N = 5
690 GOSUB 1170
700 N = 0
710 REM DO
720 IF @(C + N) < 0 GOTO 750
730 N = N + 1
740 GOTO 710
750 REM LOOP
760 I = 0
770 REM DO
780 IF I >= N GOTO 1030
790 J = 0
800 REM DO
810 IF @(C + J + 1) < 0 GOTO 1000
820 IF @(Y + J + 1) > @(Y + J) GOTO 850
830 J = J + 1
840 GOTO 800
850 REM END IF
860 E = @(X + J + 1)
870 F = @(Y + J + 1)
880 G = @(Z + J + 1)
890 H = @(C + J + 1)
900 @(X + J + 1) = @(X + J)
910 @(Y + J + 1) = @(Y + J)
920 @(Z + J + 1) = @(Z + J)
930 @(C + J + 1) = @(C + J)
940 @(X + J) = E
950 @(Y + J) = F
960 @(Z + J) = G
970 @(C + J) = H
980 J = J + 1
990 GOTO 800
1000 REM LOOP
1010 I = I + 1
1020 GOTO 770
1030 REM LOOP
1040 N = 0
1050 REM DO
1060 IF @(Y + N) < 1 GOTO 1130
1070 J = @(X + N) * 255 / @(Y + N) / 8 + 40
1080 I = @(Z + N) * 255 / @(Y + N) / 8 + 25
1090 Q = @(C + N)
1100 GOSUB 1410
1110 N = N + 1
1120 GOTO 1050
1130 REM LOOP
1140 GOTO 120
1150 REM LOOP
1160 END
1170 REM SUBROUTINE line
1180 I = 0
1190 REM DO
1200 IF @(C + I) < 0 GOTO 1230
1210 I = I + 1
1220 GOTO 1190
1230 REM LOOP
1240 J = 0
1250 REM DO
1260 IF J >= N GOTO 1370
1270 @(X + I) = A + R
1280 @(Y + I) = B + S
1290 @(Z + I) = D + T
1300 @(C + I) = Q
1310 A = A + E
1320 B = B + F
1330 D = D + G
1340 I = I + 1
1350 J = J + 1
1360 GOTO 1250
1370 REM LOOP
1380 @(C + I) = -1
1390 RETURN
1400 REM
1410 REM SUBROUTINE pixel
1420 IF (I < 0) + (I > 49) + (J < 0) + (J > 76) RETURN
1430 LOCATE 24 - I / 2, J
1440 P = I - I / 2 * 2
1450 INCHAR K, L, M
1460 IF P = 0 GOTO 1560
1470 IF K = 32 COLOR Q, M
1480 IF K = 32 OUT 223
1490 IF K = 223 COLOR Q, M
1500 IF K = 223 OUT 223
1510 IF K = 220 COLOR L, Q
1520 IF K = 220 OUT 220
1530 IF K = 219 COLOR L, Q
1540 IF K = 219 OUT 220
1550 GOTO 1650
1560 REM ELSE
1570 IF K = 32 COLOR Q, M
1580 IF K = 32 OUT 220
1590 IF K = 223 COLOR L, Q
1600 IF K = 223 OUT 223
1610 IF K = 220 COLOR Q, M
1620 IF K = 220 OUT 220
1630 IF K = 219 COLOR L, Q
1640 IF K = 219 OUT 223
1650 REM END IF
1660 RETURN

