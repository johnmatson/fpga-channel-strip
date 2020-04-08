module sineWaveGen #( parameter scale = 0.9 ) (
                    input logic clk_48, reset_n,
                    input logic [2:0] freq,
                    output logic signed [15:0] outWave);

    logic [15:0] sample;

    logic signed [15:0] wave;

    // Sampling Points:
    // 0: 100 Hz - line 26
    // 1: 250 Hz - line 1951
    // 2: 500 Hz - line 2724
    // 3: 1 kHz - line 3113
    // 4: 2.5 kHz - line 3314
    // 5: 5 kHz - line 3399
    // 6: 10 kHz - line 3444

    always_comb begin
        outWave = wave*scale;
    end

    always_ff @  (posedge clk_48, negedge reset_n) begin
        
        if (~reset_n) begin
            sample <= 0;
            wave <= '0;
        end

        else begin
            case (freq)
            0: begin    // 100 Hz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 428.906778;
                    sample <= 2;
                end
                2: begin
                    wave <= 857.740065;
                    sample <= 3;
                end
                3: begin
                    wave <= 1286.426383;
                    sample <= 4;
                end
                4: begin
                    wave <= 1714.892278;
                    sample <= 5;
                end
                5: begin
                    wave <= 2143.064335;
                    sample <= 6;
                end
                6: begin
                    wave <= 2570.869190;
                    sample <= 7;
                end
                7: begin
                    wave <= 2998.233539;
                    sample <= 8;
                end
                8: begin
                    wave <= 3425.084156;
                    sample <= 9;
                end
                9: begin
                    wave <= 3851.347903;
                    sample <= 10;
                end
                10: begin
                    wave <= 4276.951740;
                    sample <= 11;
                end
                11: begin
                    wave <= 4701.822745;
                    sample <= 12;
                end
                12: begin
                    wave <= 5125.888116;
                    sample <= 13;
                end
                13: begin
                    wave <= 5549.075193;
                    sample <= 14;
                end
                14: begin
                    wave <= 5971.311464;
                    sample <= 15;
                end
                15: begin
                    wave <= 6392.524582;
                    sample <= 16;
                end
                16: begin
                    wave <= 6812.642373;
                    sample <= 17;
                end
                17: begin
                    wave <= 7231.592853;
                    sample <= 18;
                end
                18: begin
                    wave <= 7649.304237;
                    sample <= 19;
                end
                19: begin
                    wave <= 8065.704953;
                    sample <= 20;
                end
                20: begin
                    wave <= 8480.723651;
                    sample <= 21;
                end
                21: begin
                    wave <= 8894.289221;
                    sample <= 22;
                end
                22: begin
                    wave <= 9306.330800;
                    sample <= 23;
                end
                23: begin
                    wave <= 9716.777787;
                    sample <= 24;
                end
                24: begin
                    wave <= 10125.559855;
                    sample <= 25;
                end
                25: begin
                    wave <= 10532.606960;
                    sample <= 26;
                end
                26: begin
                    wave <= 10937.849357;
                    sample <= 27;
                end
                27: begin
                    wave <= 11341.217609;
                    sample <= 28;
                end
                28: begin
                    wave <= 11742.642603;
                    sample <= 29;
                end
                29: begin
                    wave <= 12142.055555;
                    sample <= 30;
                end
                30: begin
                    wave <= 12539.388028;
                    sample <= 31;
                end
                31: begin
                    wave <= 12934.571942;
                    sample <= 32;
                end
                32: begin
                    wave <= 13327.539584;
                    sample <= 33;
                end
                33: begin
                    wave <= 13718.223620;
                    sample <= 34;
                end
                34: begin
                    wave <= 14106.557109;
                    sample <= 35;
                end
                35: begin
                    wave <= 14492.473512;
                    sample <= 36;
                end
                36: begin
                    wave <= 14875.906705;
                    sample <= 37;
                end
                37: begin
                    wave <= 15256.790987;
                    sample <= 38;
                end
                38: begin
                    wave <= 15635.061097;
                    sample <= 39;
                end
                39: begin
                    wave <= 16010.652220;
                    sample <= 40;
                end
                40: begin
                    wave <= 16383.500000;
                    sample <= 41;
                end
                41: begin
                    wave <= 16753.540551;
                    sample <= 42;
                end
                42: begin
                    wave <= 17120.710470;
                    sample <= 43;
                end
                43: begin
                    wave <= 17484.946843;
                    sample <= 44;
                end
                44: begin
                    wave <= 17846.187260;
                    sample <= 45;
                end
                45: begin
                    wave <= 18204.369825;
                    sample <= 46;
                end
                46: begin
                    wave <= 18559.433165;
                    sample <= 47;
                end
                47: begin
                    wave <= 18911.316442;
                    sample <= 48;
                end
                48: begin
                    wave <= 19259.959362;
                    sample <= 49;
                end
                49: begin
                    wave <= 19605.302187;
                    sample <= 50;
                end
                50: begin
                    wave <= 19947.285744;
                    sample <= 51;
                end
                51: begin
                    wave <= 20285.851437;
                    sample <= 52;
                end
                52: begin
                    wave <= 20620.941254;
                    sample <= 53;
                end
                53: begin
                    wave <= 20952.497778;
                    sample <= 54;
                end
                54: begin
                    wave <= 21280.464200;
                    sample <= 55;
                end
                55: begin
                    wave <= 21604.784323;
                    sample <= 56;
                end
                56: begin
                    wave <= 21925.402579;
                    sample <= 57;
                end
                57: begin
                    wave <= 22242.264029;
                    sample <= 58;
                end
                58: begin
                    wave <= 22555.314382;
                    sample <= 59;
                end
                59: begin
                    wave <= 22864.499998;
                    sample <= 60;
                end
                60: begin
                    wave <= 23169.767899;
                    sample <= 61;
                end
                61: begin
                    wave <= 23471.065780;
                    sample <= 62;
                end
                62: begin
                    wave <= 23768.342015;
                    sample <= 63;
                end
                63: begin
                    wave <= 24061.545667;
                    sample <= 64;
                end
                64: begin
                    wave <= 24350.626496;
                    sample <= 65;
                end
                65: begin
                    wave <= 24635.534972;
                    sample <= 66;
                end
                66: begin
                    wave <= 24916.222275;
                    sample <= 67;
                end
                67: begin
                    wave <= 25192.640312;
                    sample <= 68;
                end
                68: begin
                    wave <= 25464.741719;
                    sample <= 69;
                end
                69: begin
                    wave <= 25732.479874;
                    sample <= 70;
                end
                70: begin
                    wave <= 25995.808901;
                    sample <= 71;
                end
                71: begin
                    wave <= 26254.683680;
                    sample <= 72;
                end
                72: begin
                    wave <= 26509.059855;
                    sample <= 73;
                end
                73: begin
                    wave <= 26758.893838;
                    sample <= 74;
                end
                74: begin
                    wave <= 27004.142823;
                    sample <= 75;
                end
                75: begin
                    wave <= 27244.764786;
                    sample <= 76;
                end
                76: begin
                    wave <= 27480.718500;
                    sample <= 77;
                end
                77: begin
                    wave <= 27711.963534;
                    sample <= 78;
                end
                78: begin
                    wave <= 27938.460265;
                    sample <= 79;
                end
                79: begin
                    wave <= 28160.169886;
                    sample <= 80;
                end
                80: begin
                    wave <= 28377.054406;
                    sample <= 81;
                end
                81: begin
                    wave <= 28589.076664;
                    sample <= 82;
                end
                82: begin
                    wave <= 28796.200331;
                    sample <= 83;
                end
                83: begin
                    wave <= 28998.389917;
                    sample <= 84;
                end
                84: begin
                    wave <= 29195.610778;
                    sample <= 85;
                end
                85: begin
                    wave <= 29387.829122;
                    sample <= 86;
                end
                86: begin
                    wave <= 29575.012012;
                    sample <= 87;
                end
                87: begin
                    wave <= 29757.127377;
                    sample <= 88;
                end
                88: begin
                    wave <= 29934.144011;
                    sample <= 89;
                end
                89: begin
                    wave <= 30106.031583;
                    sample <= 90;
                end
                90: begin
                    wave <= 30272.760642;
                    sample <= 91;
                end
                91: begin
                    wave <= 30434.302619;
                    sample <= 92;
                end
                92: begin
                    wave <= 30590.629835;
                    sample <= 93;
                end
                93: begin
                    wave <= 30741.715504;
                    sample <= 94;
                end
                94: begin
                    wave <= 30887.533739;
                    sample <= 95;
                end
                95: begin
                    wave <= 31028.059553;
                    sample <= 96;
                end
                96: begin
                    wave <= 31163.268869;
                    sample <= 97;
                end
                97: begin
                    wave <= 31293.138520;
                    sample <= 98;
                end
                98: begin
                    wave <= 31417.646252;
                    sample <= 99;
                end
                99: begin
                    wave <= 31536.770733;
                    sample <= 100;
                end
                100: begin
                    wave <= 31650.491550;
                    sample <= 101;
                end
                101: begin
                    wave <= 31758.789218;
                    sample <= 102;
                end
                102: begin
                    wave <= 31861.645182;
                    sample <= 103;
                end
                103: begin
                    wave <= 31959.041816;
                    sample <= 104;
                end
                104: begin
                    wave <= 32050.962433;
                    sample <= 105;
                end
                105: begin
                    wave <= 32137.391283;
                    sample <= 106;
                end
                106: begin
                    wave <= 32218.313556;
                    sample <= 107;
                end
                107: begin
                    wave <= 32293.715387;
                    sample <= 108;
                end
                108: begin
                    wave <= 32363.583856;
                    sample <= 109;
                end
                109: begin
                    wave <= 32427.906992;
                    sample <= 110;
                end
                110: begin
                    wave <= 32486.673773;
                    sample <= 111;
                end
                111: begin
                    wave <= 32539.874129;
                    sample <= 112;
                end
                112: begin
                    wave <= 32587.498946;
                    sample <= 113;
                end
                113: begin
                    wave <= 32629.540062;
                    sample <= 114;
                end
                114: begin
                    wave <= 32665.990274;
                    sample <= 115;
                end
                115: begin
                    wave <= 32696.843338;
                    sample <= 116;
                end
                116: begin
                    wave <= 32722.093965;
                    sample <= 117;
                end
                117: begin
                    wave <= 32741.737830;
                    sample <= 118;
                end
                118: begin
                    wave <= 32755.771567;
                    sample <= 119;
                end
                119: begin
                    wave <= 32764.192772;
                    sample <= 120;
                end
                120: begin
                    wave <= 32767.000000;
                    sample <= 121;
                end
                121: begin
                    wave <= 32764.192772;
                    sample <= 122;
                end
                122: begin
                    wave <= 32755.771567;
                    sample <= 123;
                end
                123: begin
                    wave <= 32741.737830;
                    sample <= 124;
                end
                124: begin
                    wave <= 32722.093965;
                    sample <= 125;
                end
                125: begin
                    wave <= 32696.843338;
                    sample <= 126;
                end
                126: begin
                    wave <= 32665.990274;
                    sample <= 127;
                end
                127: begin
                    wave <= 32629.540062;
                    sample <= 128;
                end
                128: begin
                    wave <= 32587.498946;
                    sample <= 129;
                end
                129: begin
                    wave <= 32539.874129;
                    sample <= 130;
                end
                130: begin
                    wave <= 32486.673773;
                    sample <= 131;
                end
                131: begin
                    wave <= 32427.906992;
                    sample <= 132;
                end
                132: begin
                    wave <= 32363.583856;
                    sample <= 133;
                end
                133: begin
                    wave <= 32293.715387;
                    sample <= 134;
                end
                134: begin
                    wave <= 32218.313556;
                    sample <= 135;
                end
                135: begin
                    wave <= 32137.391283;
                    sample <= 136;
                end
                136: begin
                    wave <= 32050.962433;
                    sample <= 137;
                end
                137: begin
                    wave <= 31959.041816;
                    sample <= 138;
                end
                138: begin
                    wave <= 31861.645182;
                    sample <= 139;
                end
                139: begin
                    wave <= 31758.789218;
                    sample <= 140;
                end
                140: begin
                    wave <= 31650.491550;
                    sample <= 141;
                end
                141: begin
                    wave <= 31536.770733;
                    sample <= 142;
                end
                142: begin
                    wave <= 31417.646252;
                    sample <= 143;
                end
                143: begin
                    wave <= 31293.138520;
                    sample <= 144;
                end
                144: begin
                    wave <= 31163.268869;
                    sample <= 145;
                end
                145: begin
                    wave <= 31028.059553;
                    sample <= 146;
                end
                146: begin
                    wave <= 30887.533739;
                    sample <= 147;
                end
                147: begin
                    wave <= 30741.715504;
                    sample <= 148;
                end
                148: begin
                    wave <= 30590.629835;
                    sample <= 149;
                end
                149: begin
                    wave <= 30434.302619;
                    sample <= 150;
                end
                150: begin
                    wave <= 30272.760642;
                    sample <= 151;
                end
                151: begin
                    wave <= 30106.031583;
                    sample <= 152;
                end
                152: begin
                    wave <= 29934.144011;
                    sample <= 153;
                end
                153: begin
                    wave <= 29757.127377;
                    sample <= 154;
                end
                154: begin
                    wave <= 29575.012012;
                    sample <= 155;
                end
                155: begin
                    wave <= 29387.829122;
                    sample <= 156;
                end
                156: begin
                    wave <= 29195.610778;
                    sample <= 157;
                end
                157: begin
                    wave <= 28998.389917;
                    sample <= 158;
                end
                158: begin
                    wave <= 28796.200331;
                    sample <= 159;
                end
                159: begin
                    wave <= 28589.076664;
                    sample <= 160;
                end
                160: begin
                    wave <= 28377.054406;
                    sample <= 161;
                end
                161: begin
                    wave <= 28160.169886;
                    sample <= 162;
                end
                162: begin
                    wave <= 27938.460265;
                    sample <= 163;
                end
                163: begin
                    wave <= 27711.963534;
                    sample <= 164;
                end
                164: begin
                    wave <= 27480.718500;
                    sample <= 165;
                end
                165: begin
                    wave <= 27244.764786;
                    sample <= 166;
                end
                166: begin
                    wave <= 27004.142823;
                    sample <= 167;
                end
                167: begin
                    wave <= 26758.893838;
                    sample <= 168;
                end
                168: begin
                    wave <= 26509.059855;
                    sample <= 169;
                end
                169: begin
                    wave <= 26254.683680;
                    sample <= 170;
                end
                170: begin
                    wave <= 25995.808901;
                    sample <= 171;
                end
                171: begin
                    wave <= 25732.479874;
                    sample <= 172;
                end
                172: begin
                    wave <= 25464.741719;
                    sample <= 173;
                end
                173: begin
                    wave <= 25192.640312;
                    sample <= 174;
                end
                174: begin
                    wave <= 24916.222275;
                    sample <= 175;
                end
                175: begin
                    wave <= 24635.534972;
                    sample <= 176;
                end
                176: begin
                    wave <= 24350.626496;
                    sample <= 177;
                end
                177: begin
                    wave <= 24061.545667;
                    sample <= 178;
                end
                178: begin
                    wave <= 23768.342015;
                    sample <= 179;
                end
                179: begin
                    wave <= 23471.065780;
                    sample <= 180;
                end
                180: begin
                    wave <= 23169.767899;
                    sample <= 181;
                end
                181: begin
                    wave <= 22864.499998;
                    sample <= 182;
                end
                182: begin
                    wave <= 22555.314382;
                    sample <= 183;
                end
                183: begin
                    wave <= 22242.264029;
                    sample <= 184;
                end
                184: begin
                    wave <= 21925.402579;
                    sample <= 185;
                end
                185: begin
                    wave <= 21604.784323;
                    sample <= 186;
                end
                186: begin
                    wave <= 21280.464200;
                    sample <= 187;
                end
                187: begin
                    wave <= 20952.497778;
                    sample <= 188;
                end
                188: begin
                    wave <= 20620.941254;
                    sample <= 189;
                end
                189: begin
                    wave <= 20285.851437;
                    sample <= 190;
                end
                190: begin
                    wave <= 19947.285744;
                    sample <= 191;
                end
                191: begin
                    wave <= 19605.302187;
                    sample <= 192;
                end
                192: begin
                    wave <= 19259.959362;
                    sample <= 193;
                end
                193: begin
                    wave <= 18911.316442;
                    sample <= 194;
                end
                194: begin
                    wave <= 18559.433165;
                    sample <= 195;
                end
                195: begin
                    wave <= 18204.369825;
                    sample <= 196;
                end
                196: begin
                    wave <= 17846.187260;
                    sample <= 197;
                end
                197: begin
                    wave <= 17484.946843;
                    sample <= 198;
                end
                198: begin
                    wave <= 17120.710470;
                    sample <= 199;
                end
                199: begin
                    wave <= 16753.540551;
                    sample <= 200;
                end
                200: begin
                    wave <= 16383.500000;
                    sample <= 201;
                end
                201: begin
                    wave <= 16010.652220;
                    sample <= 202;
                end
                202: begin
                    wave <= 15635.061097;
                    sample <= 203;
                end
                203: begin
                    wave <= 15256.790987;
                    sample <= 204;
                end
                204: begin
                    wave <= 14875.906705;
                    sample <= 205;
                end
                205: begin
                    wave <= 14492.473512;
                    sample <= 206;
                end
                206: begin
                    wave <= 14106.557109;
                    sample <= 207;
                end
                207: begin
                    wave <= 13718.223620;
                    sample <= 208;
                end
                208: begin
                    wave <= 13327.539584;
                    sample <= 209;
                end
                209: begin
                    wave <= 12934.571942;
                    sample <= 210;
                end
                210: begin
                    wave <= 12539.388028;
                    sample <= 211;
                end
                211: begin
                    wave <= 12142.055555;
                    sample <= 212;
                end
                212: begin
                    wave <= 11742.642603;
                    sample <= 213;
                end
                213: begin
                    wave <= 11341.217609;
                    sample <= 214;
                end
                214: begin
                    wave <= 10937.849357;
                    sample <= 215;
                end
                215: begin
                    wave <= 10532.606960;
                    sample <= 216;
                end
                216: begin
                    wave <= 10125.559855;
                    sample <= 217;
                end
                217: begin
                    wave <= 9716.777787;
                    sample <= 218;
                end
                218: begin
                    wave <= 9306.330800;
                    sample <= 219;
                end
                219: begin
                    wave <= 8894.289221;
                    sample <= 220;
                end
                220: begin
                    wave <= 8480.723651;
                    sample <= 221;
                end
                221: begin
                    wave <= 8065.704953;
                    sample <= 222;
                end
                222: begin
                    wave <= 7649.304237;
                    sample <= 223;
                end
                223: begin
                    wave <= 7231.592853;
                    sample <= 224;
                end
                224: begin
                    wave <= 6812.642373;
                    sample <= 225;
                end
                225: begin
                    wave <= 6392.524582;
                    sample <= 226;
                end
                226: begin
                    wave <= 5971.311464;
                    sample <= 227;
                end
                227: begin
                    wave <= 5549.075193;
                    sample <= 228;
                end
                228: begin
                    wave <= 5125.888116;
                    sample <= 229;
                end
                229: begin
                    wave <= 4701.822745;
                    sample <= 230;
                end
                230: begin
                    wave <= 4276.951740;
                    sample <= 231;
                end
                231: begin
                    wave <= 3851.347903;
                    sample <= 232;
                end
                232: begin
                    wave <= 3425.084156;
                    sample <= 233;
                end
                233: begin
                    wave <= 2998.233539;
                    sample <= 234;
                end
                234: begin
                    wave <= 2570.869190;
                    sample <= 235;
                end
                235: begin
                    wave <= 2143.064335;
                    sample <= 236;
                end
                236: begin
                    wave <= 1714.892278;
                    sample <= 237;
                end
                237: begin
                    wave <= 1286.426383;
                    sample <= 238;
                end
                238: begin
                    wave <= 857.740065;
                    sample <= 239;
                end
                239: begin
                    wave <= 428.906778;
                    sample <= 240;
                end
                240: begin
                    wave <= -0.000000;
                    sample <= 241;
                end
                241: begin
                    wave <= -428.906778;
                    sample <= 242;
                end
                242: begin
                    wave <= -857.740065;
                    sample <= 243;
                end
                243: begin
                    wave <= -1286.426383;
                    sample <= 244;
                end
                244: begin
                    wave <= -1714.892278;
                    sample <= 245;
                end
                245: begin
                    wave <= -2143.064335;
                    sample <= 246;
                end
                246: begin
                    wave <= -2570.869190;
                    sample <= 247;
                end
                247: begin
                    wave <= -2998.233539;
                    sample <= 248;
                end
                248: begin
                    wave <= -3425.084156;
                    sample <= 249;
                end
                249: begin
                    wave <= -3851.347903;
                    sample <= 250;
                end
                250: begin
                    wave <= -4276.951740;
                    sample <= 251;
                end
                251: begin
                    wave <= -4701.822745;
                    sample <= 252;
                end
                252: begin
                    wave <= -5125.888116;
                    sample <= 253;
                end
                253: begin
                    wave <= -5549.075193;
                    sample <= 254;
                end
                254: begin
                    wave <= -5971.311464;
                    sample <= 255;
                end
                255: begin
                    wave <= -6392.524582;
                    sample <= 256;
                end
                256: begin
                    wave <= -6812.642373;
                    sample <= 257;
                end
                257: begin
                    wave <= -7231.592853;
                    sample <= 258;
                end
                258: begin
                    wave <= -7649.304237;
                    sample <= 259;
                end
                259: begin
                    wave <= -8065.704953;
                    sample <= 260;
                end
                260: begin
                    wave <= -8480.723651;
                    sample <= 261;
                end
                261: begin
                    wave <= -8894.289221;
                    sample <= 262;
                end
                262: begin
                    wave <= -9306.330800;
                    sample <= 263;
                end
                263: begin
                    wave <= -9716.777787;
                    sample <= 264;
                end
                264: begin
                    wave <= -10125.559855;
                    sample <= 265;
                end
                265: begin
                    wave <= -10532.606960;
                    sample <= 266;
                end
                266: begin
                    wave <= -10937.849357;
                    sample <= 267;
                end
                267: begin
                    wave <= -11341.217609;
                    sample <= 268;
                end
                268: begin
                    wave <= -11742.642603;
                    sample <= 269;
                end
                269: begin
                    wave <= -12142.055555;
                    sample <= 270;
                end
                270: begin
                    wave <= -12539.388028;
                    sample <= 271;
                end
                271: begin
                    wave <= -12934.571942;
                    sample <= 272;
                end
                272: begin
                    wave <= -13327.539584;
                    sample <= 273;
                end
                273: begin
                    wave <= -13718.223620;
                    sample <= 274;
                end
                274: begin
                    wave <= -14106.557109;
                    sample <= 275;
                end
                275: begin
                    wave <= -14492.473512;
                    sample <= 276;
                end
                276: begin
                    wave <= -14875.906705;
                    sample <= 277;
                end
                277: begin
                    wave <= -15256.790987;
                    sample <= 278;
                end
                278: begin
                    wave <= -15635.061097;
                    sample <= 279;
                end
                279: begin
                    wave <= -16010.652220;
                    sample <= 280;
                end
                280: begin
                    wave <= -16383.500000;
                    sample <= 281;
                end
                281: begin
                    wave <= -16753.540551;
                    sample <= 282;
                end
                282: begin
                    wave <= -17120.710470;
                    sample <= 283;
                end
                283: begin
                    wave <= -17484.946843;
                    sample <= 284;
                end
                284: begin
                    wave <= -17846.187260;
                    sample <= 285;
                end
                285: begin
                    wave <= -18204.369825;
                    sample <= 286;
                end
                286: begin
                    wave <= -18559.433165;
                    sample <= 287;
                end
                287: begin
                    wave <= -18911.316442;
                    sample <= 288;
                end
                288: begin
                    wave <= -19259.959362;
                    sample <= 289;
                end
                289: begin
                    wave <= -19605.302187;
                    sample <= 290;
                end
                290: begin
                    wave <= -19947.285744;
                    sample <= 291;
                end
                291: begin
                    wave <= -20285.851437;
                    sample <= 292;
                end
                292: begin
                    wave <= -20620.941254;
                    sample <= 293;
                end
                293: begin
                    wave <= -20952.497778;
                    sample <= 294;
                end
                294: begin
                    wave <= -21280.464200;
                    sample <= 295;
                end
                295: begin
                    wave <= -21604.784323;
                    sample <= 296;
                end
                296: begin
                    wave <= -21925.402579;
                    sample <= 297;
                end
                297: begin
                    wave <= -22242.264029;
                    sample <= 298;
                end
                298: begin
                    wave <= -22555.314382;
                    sample <= 299;
                end
                299: begin
                    wave <= -22864.499998;
                    sample <= 300;
                end
                300: begin
                    wave <= -23169.767899;
                    sample <= 301;
                end
                301: begin
                    wave <= -23471.065780;
                    sample <= 302;
                end
                302: begin
                    wave <= -23768.342015;
                    sample <= 303;
                end
                303: begin
                    wave <= -24061.545667;
                    sample <= 304;
                end
                304: begin
                    wave <= -24350.626496;
                    sample <= 305;
                end
                305: begin
                    wave <= -24635.534972;
                    sample <= 306;
                end
                306: begin
                    wave <= -24916.222275;
                    sample <= 307;
                end
                307: begin
                    wave <= -25192.640312;
                    sample <= 308;
                end
                308: begin
                    wave <= -25464.741719;
                    sample <= 309;
                end
                309: begin
                    wave <= -25732.479874;
                    sample <= 310;
                end
                310: begin
                    wave <= -25995.808901;
                    sample <= 311;
                end
                311: begin
                    wave <= -26254.683680;
                    sample <= 312;
                end
                312: begin
                    wave <= -26509.059855;
                    sample <= 313;
                end
                313: begin
                    wave <= -26758.893838;
                    sample <= 314;
                end
                314: begin
                    wave <= -27004.142823;
                    sample <= 315;
                end
                315: begin
                    wave <= -27244.764786;
                    sample <= 316;
                end
                316: begin
                    wave <= -27480.718500;
                    sample <= 317;
                end
                317: begin
                    wave <= -27711.963534;
                    sample <= 318;
                end
                318: begin
                    wave <= -27938.460265;
                    sample <= 319;
                end
                319: begin
                    wave <= -28160.169886;
                    sample <= 320;
                end
                320: begin
                    wave <= -28377.054406;
                    sample <= 321;
                end
                321: begin
                    wave <= -28589.076664;
                    sample <= 322;
                end
                322: begin
                    wave <= -28796.200331;
                    sample <= 323;
                end
                323: begin
                    wave <= -28998.389917;
                    sample <= 324;
                end
                324: begin
                    wave <= -29195.610778;
                    sample <= 325;
                end
                325: begin
                    wave <= -29387.829122;
                    sample <= 326;
                end
                326: begin
                    wave <= -29575.012012;
                    sample <= 327;
                end
                327: begin
                    wave <= -29757.127377;
                    sample <= 328;
                end
                328: begin
                    wave <= -29934.144011;
                    sample <= 329;
                end
                329: begin
                    wave <= -30106.031583;
                    sample <= 330;
                end
                330: begin
                    wave <= -30272.760642;
                    sample <= 331;
                end
                331: begin
                    wave <= -30434.302619;
                    sample <= 332;
                end
                332: begin
                    wave <= -30590.629835;
                    sample <= 333;
                end
                333: begin
                    wave <= -30741.715504;
                    sample <= 334;
                end
                334: begin
                    wave <= -30887.533739;
                    sample <= 335;
                end
                335: begin
                    wave <= -31028.059553;
                    sample <= 336;
                end
                336: begin
                    wave <= -31163.268869;
                    sample <= 337;
                end
                337: begin
                    wave <= -31293.138520;
                    sample <= 338;
                end
                338: begin
                    wave <= -31417.646252;
                    sample <= 339;
                end
                339: begin
                    wave <= -31536.770733;
                    sample <= 340;
                end
                340: begin
                    wave <= -31650.491550;
                    sample <= 341;
                end
                341: begin
                    wave <= -31758.789218;
                    sample <= 342;
                end
                342: begin
                    wave <= -31861.645182;
                    sample <= 343;
                end
                343: begin
                    wave <= -31959.041816;
                    sample <= 344;
                end
                344: begin
                    wave <= -32050.962433;
                    sample <= 345;
                end
                345: begin
                    wave <= -32137.391283;
                    sample <= 346;
                end
                346: begin
                    wave <= -32218.313556;
                    sample <= 347;
                end
                347: begin
                    wave <= -32293.715387;
                    sample <= 348;
                end
                348: begin
                    wave <= -32363.583856;
                    sample <= 349;
                end
                349: begin
                    wave <= -32427.906992;
                    sample <= 350;
                end
                350: begin
                    wave <= -32486.673773;
                    sample <= 351;
                end
                351: begin
                    wave <= -32539.874129;
                    sample <= 352;
                end
                352: begin
                    wave <= -32587.498946;
                    sample <= 353;
                end
                353: begin
                    wave <= -32629.540062;
                    sample <= 354;
                end
                354: begin
                    wave <= -32665.990274;
                    sample <= 355;
                end
                355: begin
                    wave <= -32696.843338;
                    sample <= 356;
                end
                356: begin
                    wave <= -32722.093965;
                    sample <= 357;
                end
                357: begin
                    wave <= -32741.737830;
                    sample <= 358;
                end
                358: begin
                    wave <= -32755.771567;
                    sample <= 359;
                end
                359: begin
                    wave <= -32764.192772;
                    sample <= 360;
                end
                360: begin
                    wave <= -32767.000000;
                    sample <= 361;
                end
                361: begin
                    wave <= -32764.192772;
                    sample <= 362;
                end
                362: begin
                    wave <= -32755.771567;
                    sample <= 363;
                end
                363: begin
                    wave <= -32741.737830;
                    sample <= 364;
                end
                364: begin
                    wave <= -32722.093965;
                    sample <= 365;
                end
                365: begin
                    wave <= -32696.843338;
                    sample <= 366;
                end
                366: begin
                    wave <= -32665.990274;
                    sample <= 367;
                end
                367: begin
                    wave <= -32629.540062;
                    sample <= 368;
                end
                368: begin
                    wave <= -32587.498946;
                    sample <= 369;
                end
                369: begin
                    wave <= -32539.874129;
                    sample <= 370;
                end
                370: begin
                    wave <= -32486.673773;
                    sample <= 371;
                end
                371: begin
                    wave <= -32427.906992;
                    sample <= 372;
                end
                372: begin
                    wave <= -32363.583856;
                    sample <= 373;
                end
                373: begin
                    wave <= -32293.715387;
                    sample <= 374;
                end
                374: begin
                    wave <= -32218.313556;
                    sample <= 375;
                end
                375: begin
                    wave <= -32137.391283;
                    sample <= 376;
                end
                376: begin
                    wave <= -32050.962433;
                    sample <= 377;
                end
                377: begin
                    wave <= -31959.041816;
                    sample <= 378;
                end
                378: begin
                    wave <= -31861.645182;
                    sample <= 379;
                end
                379: begin
                    wave <= -31758.789218;
                    sample <= 380;
                end
                380: begin
                    wave <= -31650.491550;
                    sample <= 381;
                end
                381: begin
                    wave <= -31536.770733;
                    sample <= 382;
                end
                382: begin
                    wave <= -31417.646252;
                    sample <= 383;
                end
                383: begin
                    wave <= -31293.138520;
                    sample <= 384;
                end
                384: begin
                    wave <= -31163.268869;
                    sample <= 385;
                end
                385: begin
                    wave <= -31028.059553;
                    sample <= 386;
                end
                386: begin
                    wave <= -30887.533739;
                    sample <= 387;
                end
                387: begin
                    wave <= -30741.715504;
                    sample <= 388;
                end
                388: begin
                    wave <= -30590.629835;
                    sample <= 389;
                end
                389: begin
                    wave <= -30434.302619;
                    sample <= 390;
                end
                390: begin
                    wave <= -30272.760642;
                    sample <= 391;
                end
                391: begin
                    wave <= -30106.031583;
                    sample <= 392;
                end
                392: begin
                    wave <= -29934.144011;
                    sample <= 393;
                end
                393: begin
                    wave <= -29757.127377;
                    sample <= 394;
                end
                394: begin
                    wave <= -29575.012012;
                    sample <= 395;
                end
                395: begin
                    wave <= -29387.829122;
                    sample <= 396;
                end
                396: begin
                    wave <= -29195.610778;
                    sample <= 397;
                end
                397: begin
                    wave <= -28998.389917;
                    sample <= 398;
                end
                398: begin
                    wave <= -28796.200331;
                    sample <= 399;
                end
                399: begin
                    wave <= -28589.076664;
                    sample <= 400;
                end
                400: begin
                    wave <= -28377.054406;
                    sample <= 401;
                end
                401: begin
                    wave <= -28160.169886;
                    sample <= 402;
                end
                402: begin
                    wave <= -27938.460265;
                    sample <= 403;
                end
                403: begin
                    wave <= -27711.963534;
                    sample <= 404;
                end
                404: begin
                    wave <= -27480.718500;
                    sample <= 405;
                end
                405: begin
                    wave <= -27244.764786;
                    sample <= 406;
                end
                406: begin
                    wave <= -27004.142823;
                    sample <= 407;
                end
                407: begin
                    wave <= -26758.893838;
                    sample <= 408;
                end
                408: begin
                    wave <= -26509.059855;
                    sample <= 409;
                end
                409: begin
                    wave <= -26254.683680;
                    sample <= 410;
                end
                410: begin
                    wave <= -25995.808901;
                    sample <= 411;
                end
                411: begin
                    wave <= -25732.479874;
                    sample <= 412;
                end
                412: begin
                    wave <= -25464.741719;
                    sample <= 413;
                end
                413: begin
                    wave <= -25192.640312;
                    sample <= 414;
                end
                414: begin
                    wave <= -24916.222275;
                    sample <= 415;
                end
                415: begin
                    wave <= -24635.534972;
                    sample <= 416;
                end
                416: begin
                    wave <= -24350.626496;
                    sample <= 417;
                end
                417: begin
                    wave <= -24061.545667;
                    sample <= 418;
                end
                418: begin
                    wave <= -23768.342015;
                    sample <= 419;
                end
                419: begin
                    wave <= -23471.065780;
                    sample <= 420;
                end
                420: begin
                    wave <= -23169.767899;
                    sample <= 421;
                end
                421: begin
                    wave <= -22864.499998;
                    sample <= 422;
                end
                422: begin
                    wave <= -22555.314382;
                    sample <= 423;
                end
                423: begin
                    wave <= -22242.264029;
                    sample <= 424;
                end
                424: begin
                    wave <= -21925.402579;
                    sample <= 425;
                end
                425: begin
                    wave <= -21604.784323;
                    sample <= 426;
                end
                426: begin
                    wave <= -21280.464200;
                    sample <= 427;
                end
                427: begin
                    wave <= -20952.497778;
                    sample <= 428;
                end
                428: begin
                    wave <= -20620.941254;
                    sample <= 429;
                end
                429: begin
                    wave <= -20285.851437;
                    sample <= 430;
                end
                430: begin
                    wave <= -19947.285744;
                    sample <= 431;
                end
                431: begin
                    wave <= -19605.302187;
                    sample <= 432;
                end
                432: begin
                    wave <= -19259.959362;
                    sample <= 433;
                end
                433: begin
                    wave <= -18911.316442;
                    sample <= 434;
                end
                434: begin
                    wave <= -18559.433165;
                    sample <= 435;
                end
                435: begin
                    wave <= -18204.369825;
                    sample <= 436;
                end
                436: begin
                    wave <= -17846.187260;
                    sample <= 437;
                end
                437: begin
                    wave <= -17484.946843;
                    sample <= 438;
                end
                438: begin
                    wave <= -17120.710470;
                    sample <= 439;
                end
                439: begin
                    wave <= -16753.540551;
                    sample <= 440;
                end
                440: begin
                    wave <= -16383.500000;
                    sample <= 441;
                end
                441: begin
                    wave <= -16010.652220;
                    sample <= 442;
                end
                442: begin
                    wave <= -15635.061097;
                    sample <= 443;
                end
                443: begin
                    wave <= -15256.790987;
                    sample <= 444;
                end
                444: begin
                    wave <= -14875.906705;
                    sample <= 445;
                end
                445: begin
                    wave <= -14492.473512;
                    sample <= 446;
                end
                446: begin
                    wave <= -14106.557109;
                    sample <= 447;
                end
                447: begin
                    wave <= -13718.223620;
                    sample <= 448;
                end
                448: begin
                    wave <= -13327.539584;
                    sample <= 449;
                end
                449: begin
                    wave <= -12934.571942;
                    sample <= 450;
                end
                450: begin
                    wave <= -12539.388028;
                    sample <= 451;
                end
                451: begin
                    wave <= -12142.055555;
                    sample <= 452;
                end
                452: begin
                    wave <= -11742.642603;
                    sample <= 453;
                end
                453: begin
                    wave <= -11341.217609;
                    sample <= 454;
                end
                454: begin
                    wave <= -10937.849357;
                    sample <= 455;
                end
                455: begin
                    wave <= -10532.606960;
                    sample <= 456;
                end
                456: begin
                    wave <= -10125.559855;
                    sample <= 457;
                end
                457: begin
                    wave <= -9716.777787;
                    sample <= 458;
                end
                458: begin
                    wave <= -9306.330800;
                    sample <= 459;
                end
                459: begin
                    wave <= -8894.289221;
                    sample <= 460;
                end
                460: begin
                    wave <= -8480.723651;
                    sample <= 461;
                end
                461: begin
                    wave <= -8065.704953;
                    sample <= 462;
                end
                462: begin
                    wave <= -7649.304237;
                    sample <= 463;
                end
                463: begin
                    wave <= -7231.592853;
                    sample <= 464;
                end
                464: begin
                    wave <= -6812.642373;
                    sample <= 465;
                end
                465: begin
                    wave <= -6392.524582;
                    sample <= 466;
                end
                466: begin
                    wave <= -5971.311464;
                    sample <= 467;
                end
                467: begin
                    wave <= -5549.075193;
                    sample <= 468;
                end
                468: begin
                    wave <= -5125.888116;
                    sample <= 469;
                end
                469: begin
                    wave <= -4701.822745;
                    sample <= 470;
                end
                470: begin
                    wave <= -4276.951740;
                    sample <= 471;
                end
                471: begin
                    wave <= -3851.347903;
                    sample <= 472;
                end
                472: begin
                    wave <= -3425.084156;
                    sample <= 473;
                end
                473: begin
                    wave <= -2998.233539;
                    sample <= 474;
                end
                474: begin
                    wave <= -2570.869190;
                    sample <= 475;
                end
                475: begin
                    wave <= -2143.064335;
                    sample <= 476;
                end
                476: begin
                    wave <= -1714.892278;
                    sample <= 477;
                end
                477: begin
                    wave <= -1286.426383;
                    sample <= 478;
                end
                478: begin
                    wave <= -857.740065;
                    sample <= 479;
                end
                479: begin
                    wave <= -428.906778;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            1: begin    // 250 Hz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 1072.106187;
                    sample <= 2;
                end
                2: begin
                    wave <= 2143.064335;
                    sample <= 3;
                end
                3: begin
                    wave <= 3211.727637;
                    sample <= 4;
                end
                4: begin
                    wave <= 4276.951740;
                    sample <= 5;
                end
                5: begin
                    wave <= 5337.595977;
                    sample <= 6;
                end
                6: begin
                    wave <= 6392.524582;
                    sample <= 7;
                end
                7: begin
                    wave <= 7440.607911;
                    sample <= 8;
                end
                8: begin
                    wave <= 8480.723651;
                    sample <= 9;
                end
                9: begin
                    wave <= 9511.758020;
                    sample <= 10;
                end
                10: begin
                    wave <= 10532.606960;
                    sample <= 11;
                end
                11: begin
                    wave <= 11542.177320;
                    sample <= 12;
                end
                12: begin
                    wave <= 12539.388028;
                    sample <= 13;
                end
                13: begin
                    wave <= 13523.171246;
                    sample <= 14;
                end
                14: begin
                    wave <= 14492.473512;
                    sample <= 15;
                end
                15: begin
                    wave <= 15446.256876;
                    sample <= 16;
                end
                16: begin
                    wave <= 16383.500000;
                    sample <= 17;
                end
                17: begin
                    wave <= 17303.199262;
                    sample <= 18;
                end
                18: begin
                    wave <= 18204.369825;
                    sample <= 19;
                end
                19: begin
                    wave <= 19086.046693;
                    sample <= 20;
                end
                20: begin
                    wave <= 19947.285744;
                    sample <= 21;
                end
                21: begin
                    wave <= 20787.164742;
                    sample <= 22;
                end
                22: begin
                    wave <= 21604.784323;
                    sample <= 23;
                end
                23: begin
                    wave <= 22399.268960;
                    sample <= 24;
                end
                24: begin
                    wave <= 23169.767899;
                    sample <= 25;
                end
                25: begin
                    wave <= 23915.456070;
                    sample <= 26;
                end
                26: begin
                    wave <= 24635.534972;
                    sample <= 27;
                end
                27: begin
                    wave <= 25329.233525;
                    sample <= 28;
                end
                28: begin
                    wave <= 25995.808901;
                    sample <= 29;
                end
                29: begin
                    wave <= 26634.547314;
                    sample <= 30;
                end
                30: begin
                    wave <= 27244.764786;
                    sample <= 31;
                end
                31: begin
                    wave <= 27825.807882;
                    sample <= 32;
                end
                32: begin
                    wave <= 28377.054406;
                    sample <= 33;
                end
                33: begin
                    wave <= 28897.914069;
                    sample <= 34;
                end
                34: begin
                    wave <= 29387.829122;
                    sample <= 35;
                end
                35: begin
                    wave <= 29846.274951;
                    sample <= 36;
                end
                36: begin
                    wave <= 30272.760642;
                    sample <= 37;
                end
                37: begin
                    wave <= 30666.829502;
                    sample <= 38;
                end
                38: begin
                    wave <= 31028.059553;
                    sample <= 39;
                end
                39: begin
                    wave <= 31356.063981;
                    sample <= 40;
                end
                40: begin
                    wave <= 31650.491550;
                    sample <= 41;
                end
                41: begin
                    wave <= 31911.026980;
                    sample <= 42;
                end
                42: begin
                    wave <= 32137.391283;
                    sample <= 43;
                end
                43: begin
                    wave <= 32329.342062;
                    sample <= 44;
                end
                44: begin
                    wave <= 32486.673773;
                    sample <= 45;
                end
                45: begin
                    wave <= 32609.217939;
                    sample <= 46;
                end
                46: begin
                    wave <= 32696.843338;
                    sample <= 47;
                end
                47: begin
                    wave <= 32749.456138;
                    sample <= 48;
                end
                48: begin
                    wave <= 32767.000000;
                    sample <= 49;
                end
                49: begin
                    wave <= 32749.456138;
                    sample <= 50;
                end
                50: begin
                    wave <= 32696.843338;
                    sample <= 51;
                end
                51: begin
                    wave <= 32609.217939;
                    sample <= 52;
                end
                52: begin
                    wave <= 32486.673773;
                    sample <= 53;
                end
                53: begin
                    wave <= 32329.342062;
                    sample <= 54;
                end
                54: begin
                    wave <= 32137.391283;
                    sample <= 55;
                end
                55: begin
                    wave <= 31911.026980;
                    sample <= 56;
                end
                56: begin
                    wave <= 31650.491550;
                    sample <= 57;
                end
                57: begin
                    wave <= 31356.063981;
                    sample <= 58;
                end
                58: begin
                    wave <= 31028.059553;
                    sample <= 59;
                end
                59: begin
                    wave <= 30666.829502;
                    sample <= 60;
                end
                60: begin
                    wave <= 30272.760642;
                    sample <= 61;
                end
                61: begin
                    wave <= 29846.274951;
                    sample <= 62;
                end
                62: begin
                    wave <= 29387.829122;
                    sample <= 63;
                end
                63: begin
                    wave <= 28897.914069;
                    sample <= 64;
                end
                64: begin
                    wave <= 28377.054406;
                    sample <= 65;
                end
                65: begin
                    wave <= 27825.807882;
                    sample <= 66;
                end
                66: begin
                    wave <= 27244.764786;
                    sample <= 67;
                end
                67: begin
                    wave <= 26634.547314;
                    sample <= 68;
                end
                68: begin
                    wave <= 25995.808901;
                    sample <= 69;
                end
                69: begin
                    wave <= 25329.233525;
                    sample <= 70;
                end
                70: begin
                    wave <= 24635.534972;
                    sample <= 71;
                end
                71: begin
                    wave <= 23915.456070;
                    sample <= 72;
                end
                72: begin
                    wave <= 23169.767899;
                    sample <= 73;
                end
                73: begin
                    wave <= 22399.268960;
                    sample <= 74;
                end
                74: begin
                    wave <= 21604.784323;
                    sample <= 75;
                end
                75: begin
                    wave <= 20787.164742;
                    sample <= 76;
                end
                76: begin
                    wave <= 19947.285744;
                    sample <= 77;
                end
                77: begin
                    wave <= 19086.046693;
                    sample <= 78;
                end
                78: begin
                    wave <= 18204.369825;
                    sample <= 79;
                end
                79: begin
                    wave <= 17303.199262;
                    sample <= 80;
                end
                80: begin
                    wave <= 16383.500000;
                    sample <= 81;
                end
                81: begin
                    wave <= 15446.256876;
                    sample <= 82;
                end
                82: begin
                    wave <= 14492.473512;
                    sample <= 83;
                end
                83: begin
                    wave <= 13523.171246;
                    sample <= 84;
                end
                84: begin
                    wave <= 12539.388028;
                    sample <= 85;
                end
                85: begin
                    wave <= 11542.177320;
                    sample <= 86;
                end
                86: begin
                    wave <= 10532.606960;
                    sample <= 87;
                end
                87: begin
                    wave <= 9511.758020;
                    sample <= 88;
                end
                88: begin
                    wave <= 8480.723651;
                    sample <= 89;
                end
                89: begin
                    wave <= 7440.607911;
                    sample <= 90;
                end
                90: begin
                    wave <= 6392.524582;
                    sample <= 91;
                end
                91: begin
                    wave <= 5337.595977;
                    sample <= 92;
                end
                92: begin
                    wave <= 4276.951740;
                    sample <= 93;
                end
                93: begin
                    wave <= 3211.727637;
                    sample <= 94;
                end
                94: begin
                    wave <= 2143.064335;
                    sample <= 95;
                end
                95: begin
                    wave <= 1072.106187;
                    sample <= 96;
                end
                96: begin
                    wave <= 0.000000;
                    sample <= 97;
                end
                97: begin
                    wave <= -1072.106187;
                    sample <= 98;
                end
                98: begin
                    wave <= -2143.064335;
                    sample <= 99;
                end
                99: begin
                    wave <= -3211.727637;
                    sample <= 100;
                end
                100: begin
                    wave <= -4276.951740;
                    sample <= 101;
                end
                101: begin
                    wave <= -5337.595977;
                    sample <= 102;
                end
                102: begin
                    wave <= -6392.524582;
                    sample <= 103;
                end
                103: begin
                    wave <= -7440.607911;
                    sample <= 104;
                end
                104: begin
                    wave <= -8480.723651;
                    sample <= 105;
                end
                105: begin
                    wave <= -9511.758020;
                    sample <= 106;
                end
                106: begin
                    wave <= -10532.606960;
                    sample <= 107;
                end
                107: begin
                    wave <= -11542.177320;
                    sample <= 108;
                end
                108: begin
                    wave <= -12539.388028;
                    sample <= 109;
                end
                109: begin
                    wave <= -13523.171246;
                    sample <= 110;
                end
                110: begin
                    wave <= -14492.473512;
                    sample <= 111;
                end
                111: begin
                    wave <= -15446.256876;
                    sample <= 112;
                end
                112: begin
                    wave <= -16383.500000;
                    sample <= 113;
                end
                113: begin
                    wave <= -17303.199262;
                    sample <= 114;
                end
                114: begin
                    wave <= -18204.369825;
                    sample <= 115;
                end
                115: begin
                    wave <= -19086.046693;
                    sample <= 116;
                end
                116: begin
                    wave <= -19947.285744;
                    sample <= 117;
                end
                117: begin
                    wave <= -20787.164742;
                    sample <= 118;
                end
                118: begin
                    wave <= -21604.784323;
                    sample <= 119;
                end
                119: begin
                    wave <= -22399.268960;
                    sample <= 120;
                end
                120: begin
                    wave <= -23169.767899;
                    sample <= 121;
                end
                121: begin
                    wave <= -23915.456070;
                    sample <= 122;
                end
                122: begin
                    wave <= -24635.534972;
                    sample <= 123;
                end
                123: begin
                    wave <= -25329.233525;
                    sample <= 124;
                end
                124: begin
                    wave <= -25995.808901;
                    sample <= 125;
                end
                125: begin
                    wave <= -26634.547314;
                    sample <= 126;
                end
                126: begin
                    wave <= -27244.764786;
                    sample <= 127;
                end
                127: begin
                    wave <= -27825.807882;
                    sample <= 128;
                end
                128: begin
                    wave <= -28377.054406;
                    sample <= 129;
                end
                129: begin
                    wave <= -28897.914069;
                    sample <= 130;
                end
                130: begin
                    wave <= -29387.829122;
                    sample <= 131;
                end
                131: begin
                    wave <= -29846.274951;
                    sample <= 132;
                end
                132: begin
                    wave <= -30272.760642;
                    sample <= 133;
                end
                133: begin
                    wave <= -30666.829502;
                    sample <= 134;
                end
                134: begin
                    wave <= -31028.059553;
                    sample <= 135;
                end
                135: begin
                    wave <= -31356.063981;
                    sample <= 136;
                end
                136: begin
                    wave <= -31650.491550;
                    sample <= 137;
                end
                137: begin
                    wave <= -31911.026980;
                    sample <= 138;
                end
                138: begin
                    wave <= -32137.391283;
                    sample <= 139;
                end
                139: begin
                    wave <= -32329.342062;
                    sample <= 140;
                end
                140: begin
                    wave <= -32486.673773;
                    sample <= 141;
                end
                141: begin
                    wave <= -32609.217939;
                    sample <= 142;
                end
                142: begin
                    wave <= -32696.843338;
                    sample <= 143;
                end
                143: begin
                    wave <= -32749.456138;
                    sample <= 144;
                end
                144: begin
                    wave <= -32767.000000;
                    sample <= 145;
                end
                145: begin
                    wave <= -32749.456138;
                    sample <= 146;
                end
                146: begin
                    wave <= -32696.843338;
                    sample <= 147;
                end
                147: begin
                    wave <= -32609.217939;
                    sample <= 148;
                end
                148: begin
                    wave <= -32486.673773;
                    sample <= 149;
                end
                149: begin
                    wave <= -32329.342062;
                    sample <= 150;
                end
                150: begin
                    wave <= -32137.391283;
                    sample <= 151;
                end
                151: begin
                    wave <= -31911.026980;
                    sample <= 152;
                end
                152: begin
                    wave <= -31650.491550;
                    sample <= 153;
                end
                153: begin
                    wave <= -31356.063981;
                    sample <= 154;
                end
                154: begin
                    wave <= -31028.059553;
                    sample <= 155;
                end
                155: begin
                    wave <= -30666.829502;
                    sample <= 156;
                end
                156: begin
                    wave <= -30272.760642;
                    sample <= 157;
                end
                157: begin
                    wave <= -29846.274951;
                    sample <= 158;
                end
                158: begin
                    wave <= -29387.829122;
                    sample <= 159;
                end
                159: begin
                    wave <= -28897.914069;
                    sample <= 160;
                end
                160: begin
                    wave <= -28377.054406;
                    sample <= 161;
                end
                161: begin
                    wave <= -27825.807882;
                    sample <= 162;
                end
                162: begin
                    wave <= -27244.764786;
                    sample <= 163;
                end
                163: begin
                    wave <= -26634.547314;
                    sample <= 164;
                end
                164: begin
                    wave <= -25995.808901;
                    sample <= 165;
                end
                165: begin
                    wave <= -25329.233525;
                    sample <= 166;
                end
                166: begin
                    wave <= -24635.534972;
                    sample <= 167;
                end
                167: begin
                    wave <= -23915.456070;
                    sample <= 168;
                end
                168: begin
                    wave <= -23169.767899;
                    sample <= 169;
                end
                169: begin
                    wave <= -22399.268960;
                    sample <= 170;
                end
                170: begin
                    wave <= -21604.784323;
                    sample <= 171;
                end
                171: begin
                    wave <= -20787.164742;
                    sample <= 172;
                end
                172: begin
                    wave <= -19947.285744;
                    sample <= 173;
                end
                173: begin
                    wave <= -19086.046693;
                    sample <= 174;
                end
                174: begin
                    wave <= -18204.369825;
                    sample <= 175;
                end
                175: begin
                    wave <= -17303.199262;
                    sample <= 176;
                end
                176: begin
                    wave <= -16383.500000;
                    sample <= 177;
                end
                177: begin
                    wave <= -15446.256876;
                    sample <= 178;
                end
                178: begin
                    wave <= -14492.473512;
                    sample <= 179;
                end
                179: begin
                    wave <= -13523.171246;
                    sample <= 180;
                end
                180: begin
                    wave <= -12539.388028;
                    sample <= 181;
                end
                181: begin
                    wave <= -11542.177320;
                    sample <= 182;
                end
                182: begin
                    wave <= -10532.606960;
                    sample <= 183;
                end
                183: begin
                    wave <= -9511.758020;
                    sample <= 184;
                end
                184: begin
                    wave <= -8480.723651;
                    sample <= 185;
                end
                185: begin
                    wave <= -7440.607911;
                    sample <= 186;
                end
                186: begin
                    wave <= -6392.524582;
                    sample <= 187;
                end
                187: begin
                    wave <= -5337.595977;
                    sample <= 188;
                end
                188: begin
                    wave <= -4276.951740;
                    sample <= 189;
                end
                189: begin
                    wave <= -3211.727637;
                    sample <= 190;
                end
                190: begin
                    wave <= -2143.064335;
                    sample <= 191;
                end
                191: begin
                    wave <= -1072.106187;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            2: begin    // 500 Hz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 2143.064335;
                    sample <= 2;
                end
                2: begin
                    wave <= 4276.951740;
                    sample <= 3;
                end
                3: begin
                    wave <= 6392.524582;
                    sample <= 4;
                end
                4: begin
                    wave <= 8480.723651;
                    sample <= 5;
                end
                5: begin
                    wave <= 10532.606960;
                    sample <= 6;
                end
                6: begin
                    wave <= 12539.388028;
                    sample <= 7;
                end
                7: begin
                    wave <= 14492.473512;
                    sample <= 8;
                end
                8: begin
                    wave <= 16383.500000;
                    sample <= 9;
                end
                9: begin
                    wave <= 18204.369825;
                    sample <= 10;
                end
                10: begin
                    wave <= 19947.285744;
                    sample <= 11;
                end
                11: begin
                    wave <= 21604.784323;
                    sample <= 12;
                end
                12: begin
                    wave <= 23169.767899;
                    sample <= 13;
                end
                13: begin
                    wave <= 24635.534972;
                    sample <= 14;
                end
                14: begin
                    wave <= 25995.808901;
                    sample <= 15;
                end
                15: begin
                    wave <= 27244.764786;
                    sample <= 16;
                end
                16: begin
                    wave <= 28377.054406;
                    sample <= 17;
                end
                17: begin
                    wave <= 29387.829122;
                    sample <= 18;
                end
                18: begin
                    wave <= 30272.760642;
                    sample <= 19;
                end
                19: begin
                    wave <= 31028.059553;
                    sample <= 20;
                end
                20: begin
                    wave <= 31650.491550;
                    sample <= 21;
                end
                21: begin
                    wave <= 32137.391283;
                    sample <= 22;
                end
                22: begin
                    wave <= 32486.673773;
                    sample <= 23;
                end
                23: begin
                    wave <= 32696.843338;
                    sample <= 24;
                end
                24: begin
                    wave <= 32767.000000;
                    sample <= 25;
                end
                25: begin
                    wave <= 32696.843338;
                    sample <= 26;
                end
                26: begin
                    wave <= 32486.673773;
                    sample <= 27;
                end
                27: begin
                    wave <= 32137.391283;
                    sample <= 28;
                end
                28: begin
                    wave <= 31650.491550;
                    sample <= 29;
                end
                29: begin
                    wave <= 31028.059553;
                    sample <= 30;
                end
                30: begin
                    wave <= 30272.760642;
                    sample <= 31;
                end
                31: begin
                    wave <= 29387.829122;
                    sample <= 32;
                end
                32: begin
                    wave <= 28377.054406;
                    sample <= 33;
                end
                33: begin
                    wave <= 27244.764786;
                    sample <= 34;
                end
                34: begin
                    wave <= 25995.808901;
                    sample <= 35;
                end
                35: begin
                    wave <= 24635.534972;
                    sample <= 36;
                end
                36: begin
                    wave <= 23169.767899;
                    sample <= 37;
                end
                37: begin
                    wave <= 21604.784323;
                    sample <= 38;
                end
                38: begin
                    wave <= 19947.285744;
                    sample <= 39;
                end
                39: begin
                    wave <= 18204.369825;
                    sample <= 40;
                end
                40: begin
                    wave <= 16383.500000;
                    sample <= 41;
                end
                41: begin
                    wave <= 14492.473512;
                    sample <= 42;
                end
                42: begin
                    wave <= 12539.388028;
                    sample <= 43;
                end
                43: begin
                    wave <= 10532.606960;
                    sample <= 44;
                end
                44: begin
                    wave <= 8480.723651;
                    sample <= 45;
                end
                45: begin
                    wave <= 6392.524582;
                    sample <= 46;
                end
                46: begin
                    wave <= 4276.951740;
                    sample <= 47;
                end
                47: begin
                    wave <= 2143.064335;
                    sample <= 48;
                end
                48: begin
                    wave <= -0.000000;
                    sample <= 49;
                end
                49: begin
                    wave <= -2143.064335;
                    sample <= 50;
                end
                50: begin
                    wave <= -4276.951740;
                    sample <= 51;
                end
                51: begin
                    wave <= -6392.524582;
                    sample <= 52;
                end
                52: begin
                    wave <= -8480.723651;
                    sample <= 53;
                end
                53: begin
                    wave <= -10532.606960;
                    sample <= 54;
                end
                54: begin
                    wave <= -12539.388028;
                    sample <= 55;
                end
                55: begin
                    wave <= -14492.473512;
                    sample <= 56;
                end
                56: begin
                    wave <= -16383.500000;
                    sample <= 57;
                end
                57: begin
                    wave <= -18204.369825;
                    sample <= 58;
                end
                58: begin
                    wave <= -19947.285744;
                    sample <= 59;
                end
                59: begin
                    wave <= -21604.784323;
                    sample <= 60;
                end
                60: begin
                    wave <= -23169.767899;
                    sample <= 61;
                end
                61: begin
                    wave <= -24635.534972;
                    sample <= 62;
                end
                62: begin
                    wave <= -25995.808901;
                    sample <= 63;
                end
                63: begin
                    wave <= -27244.764786;
                    sample <= 64;
                end
                64: begin
                    wave <= -28377.054406;
                    sample <= 65;
                end
                65: begin
                    wave <= -29387.829122;
                    sample <= 66;
                end
                66: begin
                    wave <= -30272.760642;
                    sample <= 67;
                end
                67: begin
                    wave <= -31028.059553;
                    sample <= 68;
                end
                68: begin
                    wave <= -31650.491550;
                    sample <= 69;
                end
                69: begin
                    wave <= -32137.391283;
                    sample <= 70;
                end
                70: begin
                    wave <= -32486.673773;
                    sample <= 71;
                end
                71: begin
                    wave <= -32696.843338;
                    sample <= 72;
                end
                72: begin
                    wave <= -32767.000000;
                    sample <= 73;
                end
                73: begin
                    wave <= -32696.843338;
                    sample <= 74;
                end
                74: begin
                    wave <= -32486.673773;
                    sample <= 75;
                end
                75: begin
                    wave <= -32137.391283;
                    sample <= 76;
                end
                76: begin
                    wave <= -31650.491550;
                    sample <= 77;
                end
                77: begin
                    wave <= -31028.059553;
                    sample <= 78;
                end
                78: begin
                    wave <= -30272.760642;
                    sample <= 79;
                end
                79: begin
                    wave <= -29387.829122;
                    sample <= 80;
                end
                80: begin
                    wave <= -28377.054406;
                    sample <= 81;
                end
                81: begin
                    wave <= -27244.764786;
                    sample <= 82;
                end
                82: begin
                    wave <= -25995.808901;
                    sample <= 83;
                end
                83: begin
                    wave <= -24635.534972;
                    sample <= 84;
                end
                84: begin
                    wave <= -23169.767899;
                    sample <= 85;
                end
                85: begin
                    wave <= -21604.784323;
                    sample <= 86;
                end
                86: begin
                    wave <= -19947.285744;
                    sample <= 87;
                end
                87: begin
                    wave <= -18204.369825;
                    sample <= 88;
                end
                88: begin
                    wave <= -16383.500000;
                    sample <= 89;
                end
                89: begin
                    wave <= -14492.473512;
                    sample <= 90;
                end
                90: begin
                    wave <= -12539.388028;
                    sample <= 91;
                end
                91: begin
                    wave <= -10532.606960;
                    sample <= 92;
                end
                92: begin
                    wave <= -8480.723651;
                    sample <= 93;
                end
                93: begin
                    wave <= -6392.524582;
                    sample <= 94;
                end
                94: begin
                    wave <= -4276.951740;
                    sample <= 95;
                end
                95: begin
                    wave <= -2143.064335;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            3: begin    //1kHz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 4276.951740;
                    sample <= 2;
                end
                2: begin
                    wave <= 8480.723651;
                    sample <= 3;
                end
                3: begin
                    wave <= 12539.388028;
                    sample <= 4;
                end
                4: begin
                    wave <= 16383.500000;
                    sample <= 5;
                end
                5: begin
                    wave <= 19947.285744;
                    sample <= 6;
                end
                6: begin
                    wave <= 23169.767899;
                    sample <= 7;
                end
                7: begin
                    wave <= 25995.808901;
                    sample <= 8;
                end
                8: begin
                    wave <= 28377.054406;
                    sample <= 9;
                end
                9: begin
                    wave <= 30272.760642;
                    sample <= 10;
                end
                10: begin
                    wave <= 31650.491550;
                    sample <= 11;
                end
                11: begin
                    wave <= 32486.673773;
                    sample <= 12;
                end
                12: begin
                    wave <= 32767.000000;
                    sample <= 13;
                end
                13: begin
                    wave <= 32486.673773;
                    sample <= 14;
                end
                14: begin
                    wave <= 31650.491550;
                    sample <= 15;
                end
                15: begin
                    wave <= 30272.760642;
                    sample <= 16;
                end
                16: begin
                    wave <= 28377.054406;
                    sample <= 17;
                end
                17: begin
                    wave <= 25995.808901;
                    sample <= 18;
                end
                18: begin
                    wave <= 23169.767899;
                    sample <= 19;
                end
                19: begin
                    wave <= 19947.285744;
                    sample <= 20;
                end
                20: begin
                    wave <= 16383.500000;
                    sample <= 21;
                end
                21: begin
                    wave <= 12539.388028;
                    sample <= 22;
                end
                22: begin
                    wave <= 8480.723651;
                    sample <= 23;
                end
                23: begin
                    wave <= 4276.951740;
                    sample <= 24;
                end
                24: begin
                    wave <= 0.000000;
                    sample <= 25;
                end
                25: begin
                    wave <= -4276.951740;
                    sample <= 26;
                end
                26: begin
                    wave <= -8480.723651;
                    sample <= 27;
                end
                27: begin
                    wave <= -12539.388028;
                    sample <= 28;
                end
                28: begin
                    wave <= -16383.500000;
                    sample <= 29;
                end
                29: begin
                    wave <= -19947.285744;
                    sample <= 30;
                end
                30: begin
                    wave <= -23169.767899;
                    sample <= 31;
                end
                31: begin
                    wave <= -25995.808901;
                    sample <= 32;
                end
                32: begin
                    wave <= -28377.054406;
                    sample <= 33;
                end
                33: begin
                    wave <= -30272.760642;
                    sample <= 34;
                end
                34: begin
                    wave <= -31650.491550;
                    sample <= 35;
                end
                35: begin
                    wave <= -32486.673773;
                    sample <= 36;
                end
                36: begin
                    wave <= -32767.000000;
                    sample <= 37;
                end
                37: begin
                    wave <= -32486.673773;
                    sample <= 38;
                end
                38: begin
                    wave <= -31650.491550;
                    sample <= 39;
                end
                39: begin
                    wave <= -30272.760642;
                    sample <= 40;
                end
                40: begin
                    wave <= -28377.054406;
                    sample <= 41;
                end
                41: begin
                    wave <= -25995.808901;
                    sample <= 42;
                end
                42: begin
                    wave <= -23169.767899;
                    sample <= 43;
                end
                43: begin
                    wave <= -19947.285744;
                    sample <= 44;
                end
                44: begin
                    wave <= -16383.500000;
                    sample <= 45;
                end
                45: begin
                    wave <= -12539.388028;
                    sample <= 46;
                end
                46: begin
                    wave <= -8480.723651;
                    sample <= 47;
                end
                47: begin
                    wave <= -4276.951740;
                    sample <= 0;
                end  
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end
            
            4: begin    // 2.5kHz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 10532.606960;
                    sample <= 2;
                end
                2: begin
                    wave <= 19947.285744;
                    sample <= 3;
                end
                3: begin
                    wave <= 27244.764786;
                    sample <= 4;
                end
                4: begin
                    wave <= 31650.491550;
                    sample <= 5;
                end
                5: begin
                    wave <= 32696.843338;
                    sample <= 6;
                end
                6: begin
                    wave <= 30272.760642;
                    sample <= 7;
                end
                7: begin
                    wave <= 24635.534972;
                    sample <= 8;
                end
                8: begin
                    wave <= 16383.500000;
                    sample <= 9;
                end
                9: begin
                    wave <= 6392.524582;
                    sample <= 10;
                end
                10: begin
                    wave <= -4276.951740;
                    sample <= 11;
                end
                11: begin
                    wave <= -14492.473512;
                    sample <= 12;
                end
                12: begin
                    wave <= -23169.767899;
                    sample <= 13;
                end
                13: begin
                    wave <= -29387.829122;
                    sample <= 14;
                end
                14: begin
                    wave <= -32486.673773;
                    sample <= 15;
                end
                15: begin
                    wave <= -32137.391283;
                    sample <= 16;
                end
                16: begin
                    wave <= -28377.054406;
                    sample <= 17;
                end
                17: begin
                    wave <= -21604.784323;
                    sample <= 18;
                end
                18: begin
                    wave <= -12539.388028;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            5: begin    // 5 kHz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 19947.285744;
                    sample <= 2;
                end
                2: begin
                    wave <= 31650.491550;
                    sample <= 3;
                end
                3: begin
                    wave <= 30272.760642;
                    sample <= 4;
                end
                4: begin
                    wave <= 16383.500000;
                    sample <= 5;
                end
                5: begin
                    wave <= -4276.951740;
                    sample <= 6;
                end
                6: begin
                    wave <= -23169.767899;
                    sample <= 7;
                end
                7: begin
                    wave <= -32486.673773;
                    sample <= 8;
                end
                8: begin
                    wave <= -28377.054406;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            6: begin    // 10 kHz Sine Wave
                case (sample)
                0: begin
                    wave <= 0.000000;
                    sample <= 1;
                end
                1: begin
                    wave <= 31650.491550;
                    sample <= 2;
                end
                2: begin
                    wave <= 16383.500000;
                    sample <= 3;
                end
                3: begin
                    wave <= -23169.767899;
                    sample <= 0;
                end
                default: begin
                    wave <= 0;
                    sample <= 0;
                end
                endcase
            end

            default: begin
                wave <= 0;
                sample <= 0;
            end
            endcase    
        end
    end

endmodule