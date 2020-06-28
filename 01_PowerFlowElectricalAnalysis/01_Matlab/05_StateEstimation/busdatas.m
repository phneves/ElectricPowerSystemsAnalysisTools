function busdt = busdatas(num)

%         |Bus | Type | Vsp | theta | PGi | QGi | PLi | QLi |  Qmin | Qmax |
busdata14 = [ 1     1    1.060   0       0     0     0     0       0       0;
            2     2    1.045   0      40   42.4  21.7   12.7    -40     50;
            3     2    1.010   0       0   23.4  94.2   19.0     0      40;
            4     3    1.0     0       0     0   47.8   -3.9     0       0;
            5     3    1.0     0       0     0    7.6    1.6     0       0;
            6     2    1.070   0       0   12.2  11.2    7.5    -6      24;
            7     3    1.0     0       0     0    0.0    0.0     0       0;
            8     2    1.090   0       0   17.4   0.0    0.0    -6      24;
            9     3    1.0     0       0     0   29.5   16.6     0       0;
            10    3    1.0     0       0     0    9.0    5.8     0       0;
            11    3    1.0     0       0     0    3.5    1.8     0       0;
            12    3    1.0     0       0     0    6.1    1.6     0       0;
            13    3    1.0     0       0     0   13.5    5.8     0       0;
            14    3    1.0     0       0     0   14.9    5.0     0       0;];
        
 %         |Bus | Type | Vsp | theta | PGi | QGi | PLi | QLi |  Qmin | Qmax |
busdata30 = [ 1     1    1.06    0       0     0     0     0       0       0;
            2     2    1.043   0      40   50.0  21.7   12.7    -40     50;
            3     3    1.0     0       0     0    2.4    1.2     0       0;
            4     3    1.06    0       0     0    7.6    1.6     0       0;
            5     2    1.01    0       0   37.0  94.2   19.0    -40     40;
            6     3    1.0     0       0     0    0.0    0.0     0       0;
            7     3    1.0     0       0     0   22.8   10.9     0       0;
            8     2    1.01    0       0   37.3  30.0   30.0    -10     40;
            9     3    1.0     0       0     0    0.0    0.0     0       0;
            10    3    1.0     0       0     0    5.8    2.0     0       0;
            11    2    1.082   0       0   16.2   0.0    0.0    -6      24;
            12    3    1.0     0       0     0   11.2    7.5     0       0;
            13    2    1.071   0       0   10.6   0.0    0.0    -6      24;
            14    3    1.0     0       0     0    6.2    1.6     0       0;
            15    3    1.0     0       0     0    8.2    2.5     0       0;
            16    3    1.0     0       0     0    3.5    1.8     0       0;
            17    3    1.0     0       0     0    9.0    5.8     0       0;
            18    3    1.0     0       0     0    3.2    0.9     0       0;
            19    3    1.0     0       0     0    9.5    3.4     0       0;
            20    3    1.0     0       0     0    2.2    0.7     0       0;
            21    3    1.0     0       0     0   17.5   11.2     0       0;
            22    3    1.0     0       0     0    0.0    0.0     0       0;
            23    3    1.0     0       0     0    3.2    1.6     0       0;
            24    3    1.0     0       0     0    8.7    6.7     0       0;
            25    3    1.0     0       0     0    0.0    0.0     0       0;
            26    3    1.0     0       0     0    3.5    2.3     0       0;
            27    3    1.0     0       0     0    0.0    0.0     0       0;
            28    3    1.0     0       0     0    0.0    0.0     0       0;
            29    3    1.0     0       0     0    2.4    0.9     0       0;
            30    3    1.0     0       0     0   10.6    1.9     0       0 ];
        
switch num
    case 14
        busdt = busdata14;
    case 30
        busdt = busdata30;
end