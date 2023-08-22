```T : True |  X : False |  ? : Cannot be proved | - : Missing | O : TLS fixes attack | (O) : TLS fixes potential attack | C : "This clause still contradicts the query."```

## DefaultS

### Combined results

| Scenario | Auth A | Auth B |Auth Bp | Auth C | Auth D | Auth E | Auth F | Auth G | Auth I | Auth J | Auth K | Sec W  | Sec X  | Sec Y  | Sec Z  | Reach  |
|:--------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|    1     |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   X    |
|    2     |   X    |   C    |   T    |   X    |   C    |   C    |   C    |   C    |   C    |   C    |   T    |   T    |   C    |   T    |   C    |   X    |
|    3     |   T    |   X    |   T    |   O    |   X    |   T    |   T    |   X    |   T    |   T    |   T    |   X    |   T    |   C    |   T    |   X    |
|    4     |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   X    |
|    5     |   O    |  (O)   |   T    |   O    |  (O)   |  (O)   |  (O)   |   T    |  (O)   |  (O)   |   T    |   T    |  (O)   |   T    |  (O)   |   X    |
|    6     |   T    |   T    |   T    |   O    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   X    |
|    7     |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   T    |   X    |
|    8     |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   C    |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   X    |
|    9     |   T    |   T    |   X    |   T    |   T    |   T    |   T    |   X    |   T    |   X    |   X    |   T    |   T    |   T    |   T    |   X    |

### NoTLS/TLS

| Scenario | Auth A | Auth B |Auth Bp | Auth C | Auth D | Auth E | Auth F | Auth G | Auth I | Auth J | Auth K | Sec W  | Sec X  | Sec Y  | Sec Z  | Reach  |
|:--------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|    1     |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    2     |   XX   |   CC   |   TT   |   XX   |   CC   |   CC   |   CC   |   CC   |   CC   |   CC   |   TT   |   TT   |   CC   |   TT   |   CC   |   CX   |
|    3     |   TT   |   XX   |   TT   |   XT   |   XX   |   TT   |   TT   |   XX   |   TT   |   TT   |   TT   |   XX   |   TT   |   CC   |   TT   |   CX   |
|    4     |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    5     |   XT   |   CT   |   TT   |   XT   |   CT   |   CT   |   CT   |   TT   |   CT   |   CT   |   TT   |   TT   |   CT   |   TT   |   CT   |   CX   |
|    6     |   TT   |   TT   |   TT   |   XT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   T-   |   CX   |
|    7     |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    8     |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CC   |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    9     |   TT   |   TT   |   XX   |   TT   |   TT   |   TT   |   TT   |   CX   |   TT   |   XX   |   XX   |   TT   |   TT   |   TT   |   TT   |   CX   |

### Memory and time requirements (NoTls)

| Scenario |      Auth A     |      Auth B     |     Auth Bp     |      Auth C     |      Auth D     |      Auth E     |      Auth F     |      Auth G     |      Auth I     |      Auth J     |      Auth K     |      Sec W      |      Sec X      |      Sec Y      |      Sec Z      |      Reach      |
|:--------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|
|    1     |    4s / 173MB   |   12s / 298MB   |    3s / 134MB   |    4s / 175MB   |   11s / 271MB   |    7s / 391MB   |    8s / 391MB   |    7s / 264MB   |    4s / 214MB   |    3s / 159MB   |    3s / 142MB   |    2s / 104MB   |    2s / 105MB   |    2s / 100MB   |    2s / 101MB   |    Killed (C)   |
|    2     |   70s / 1173MB  |   12s / 298MB   |   66s / 890MB   |   40s / 590MB   |    Killed (C)   |    Killed (C)   |    Killed (C)   |    Killed (C)   |    Killed (C)   |   67s / 1022MB  |   52s / 890MB   |    6s / 175MB   |    Killed (C)   |    5s / 175MB   |    Killed (C)   |    Killed (C)   |
|    3     |    5s / 199MB   |    5s / 199MB   |    4s / 153MB   |   15s / 227MB   |    5s / 215MB   |   37s / 890MB   |   36s / 890MB   |   39s / 884MB   |    6s / 298MB   |    5s / 208MB   |    4s / 175MB   |    3s / 118MB   |    3s / 118MB   |    Killed (C)   |   12s / 513MB   |    Killed (C)   |
|    4     |    4s / 134MB   |    2s / 88MB    |    4s / 128MB   |    4s / 153MB   |    2s / 81MB    |    7s / 260MB   |    8s / 260MB   |    8s / 227MB   |    4s / 153MB   |    4s / 134MB   |    4s / 134MB   |    2s / 92MB    |    2s / 92MB    |    2s / 92MB    |    2s / 92MB    |    Killed (C)   |
|    5     |   67s / 890MB   |   63s / 776MB   |   29s / 590MB   |   71s / 890MB   |    Killed (C)   |    Killed (C)   |    Killed (C)   |  156s / 2045MB  |    Killed (C)   |   34s / 677MB   |   35s / 669MB   |   24s / 391MB   |    Killed (C)   |   22s / 391MB   |    Killed (C)   |    Killed (C)   |
|    6     |    6s / 228MB   |    6s / 228MB   |    6s / 199MB   |    7s / 228MB   |    7s / 240MB   |   51s / 1029MB  |   50s / 1072MB  |   53s / 1096MB  |    7s / 298MB   |    7s / 228MB   |    6s / 228MB   |    5s / 153MB   |    4s / 150MB   |    4s / 141MB   |   18s / 614MB   |    Killed (C)   |
|    7     |    7s / 260MB   |   20s / 448MB   |    6s / 228MB   |    7s / 283MB   |   22s / 448MB   |   16s / 612MB   |   15s / 605MB   |   19s / 513MB   |    8s / 341MB   |    7s / 260MB   |    7s / 260MB   |    5s / 157MB   |    4s / 158MB   |    5s / 153MB   |    4s / 155MB   |    Killed (C)   |
|    8     |    3s / 164MB   |   12s / 298MB   |    3s / 138MB   |    4s / 175MB   |   10s / 264MB   |    7s / 374MB   |    7s / 374MB   |    7s / 264MB   |    4s / 214MB   |    4s / 174MB   |    3s / 148MB   |    2s / 104MB   |    2s / 104MB   |    2s / 100MB   |    2s / 104MB   |    Killed (C)   |
|    9     |    7s / 277MB   |   19s / 391MB   |    6s / 228MB   |    7s / 290MB   |   17s / 391MB   |   17s / 677MB   |   16s / 677MB   |   15s / 513MB   |    8s / 391MB   |    8s / 297MB   |    6s / 251MB   |    5s / 162MB   |    4s / 175MB   |    4s / 154MB   |    4s / 175MB   |    Killed (C)   |

### Memory and time requirements (Tls)

| Scenario |      Auth A     |      Auth B     |     Auth Bp     |      Auth C     |      Auth D     |      Auth E     |      Auth F     |      Auth G     |      Auth I     |      Auth J     |      Auth K     |      Sec W      |      Sec X      |      Sec Y      |      Sec Z      |      Reach      |
|:--------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|
|    1     |    1s / 81MB    |  141s / 2357MB  |    1s / 72MB    |    1s / 81MB    |  131s / 2357MB  |    1s / 92MB    |    1s / 92MB    |    1s / 92MB    |    1s / 81MB    |    1s / 72MB    |    1s / 81MB    |    1s / 68MB    |    1s / 64MB    |    1s / 64MB    |    1s / 63MB    |  46637s / 154MB |
|    2     |   79s / 1173MB  |   10s / 298MB   |   61s / 890MB   |   42s / 590MB   |    Killed (C)   |    Killed (C)   |    Killed (C)   |    Killed (C)   |    Killed (C)   |   65s / 1022MB  |   62s / 890MB   |    6s / 175MB   |    Killed (C)   |    6s / 175MB   |    Killed (C)   |  47895s / 154MB |
|    3     |    2s / 104MB   |    2s / 104MB   |    2s / 92MB    |    2s / 104MB   |    2s / 118MB   |    4s / 199MB   |    4s / 199MB   |    6s / 228MB   |    2s / 118MB   |    2s / 104MB   |    2s / 104MB   |    2s / 92MB    |    1s / 85MB    |    Killed (C)   |    3s / 175MB   |  48613s / 154MB |
|    4     |   36s / 861MB   |   61s / 1177MB  |   65s / 1087MB  |   72s / 1550MB  |   61s / 1177MB  |  124s / 2327MB  |  134s / 2324MB  |  190s / 2706MB  |   34s / 965MB   |   65s / 1177MB  |   62s / 1351MB  |   28s / 676MB   |   28s / 677MB   |   28s / 677MB   |   29s / 677MB   |  47305s / 154MB |
|    5     |    4s / 175MB   |    4s / 175MB   |    4s / 175MB   |    4s / 175MB   |    5s / 199MB   |    7s / 260MB   |    7s / 260MB   |   28s / 448MB   |    4s / 189MB   |    5s / 175MB   |    6s / 199MB   |    4s / 153MB   |    3s / 136MB   |    4s / 153MB   |    3s / 134MB   |  48757s / 154MB |
|    6     |    2s / 103MB   |    2s / 103MB   |    2s / 97MB    |    2s / 104MB   |    2s / 118MB   |    3s / 175MB   |    3s / 175MB   |    5s / 199MB   |    2s / 104MB   |    2s / 102MB   |    2s / 111MB   |    2s / 92MB    |    2s / 81MB    |    2s / 92MB    |        -        |  47182s / 154MB |
|    7     |    2s / 107MB   |  245s / 2706MB  |    2s / 104MB   |    2s / 113MB   |  278s / 3108MB  |    2s / 134MB   |    2s / 134MB   |    3s / 153MB   |    2s / 118MB   |    2s / 105MB   |    2s / 118MB   |    2s / 104MB   |    1s / 92MB    |    2s / 102MB   |    1s / 92MB    |  47887s / 154MB |
|    8     |    1s / 80MB    |  139s / 2357MB  |    1s / 72MB    |    1s / 81MB    |  159s / 2357MB  |    1s / 99MB    |    1s / 99MB    |    2s / 98MB    |    1s / 81MB    |    1s / 72MB    |    1s / 81MB    |    1s / 67MB    |    1s / 64MB    |    1s / 64MB    |    1s / 64MB    |  47309s / 154MB |
|    9     |    2s / 104MB   |  167s / 2357MB  |    3s / 92MB    |    2s / 110MB   |  179s / 2357MB  |    2s / 146MB   |    2s / 147MB   |    3s / 134MB   |    2s / 118MB   |    3s / 104MB   |    4s / 104MB   |    1s / 81MB    |    1s / 81MB    |    1s / 81MB    |    1s / 81MB    |  48495s / 154MB |

## Code

### Combined results

| Scenario | Auth A | Auth B |Auth Bp | Auth C | Auth D | Auth E | Auth F | Auth G | Auth I | Auth J | Auth K | Sec W  | Sec X  | Sec Y  | Sec Z  | Reach  |
|:--------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|    1     |   T    |   T    |   O    |   T    |   T    |   T    |   T    |  (O)   |   T    |   T    |  (O)   |   T    |   T    |   T    |   T    |   X    |
|    2     |   X    |   X    |   C    |   ?    |   X    |   C    |   C    |   C    |   C    |   C    |   C    |   T    |   C    |   T    |   C    |   X    |
|    3     |   T    |   X    |   X    |   O    |   X    |   O    |   O    |   X    |   O    |   O    |   X    |   X    |   T    |   C    |   T    |   X    |
|    4     |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   C    |   T    |   C    |   C    |   T    |   T    |   T    |   T    |   X    |
|    5     |   O    |   O    |   O    |   O    |   O    |  (O)   |  (O)   |  (O)   |   O    |  (O)   |   O    |   T    |  (O)   |   T    |  (O)   |   X    |
|    6     |   T    |   O    |   O    |   O    |   O    |   T    |   T    |   O    |   T    |   T    |   O    |   O    |   T    |   O    |   T    |   X    |
|    7     |   T    |   T    |   O    |   T    |   T    |   T    |   T    |  (O)   |   T    |   T    |  (O)   |   T    |   T    |   T    |   T    |   X    |
|    8     |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   C    |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   X    |
|    10    |   T    |   T    |   X    |   T    |   T    |   T    |   T    |   C    |   T    |   T    |   C    |   T    |   T    |   T    |   T    |   X    |
|    11    |   T    |   T    |   X    |   T    |   T    |   T    |   T    |   X    |   T    |   X    |   X    |   T    |   T    |   T    |   T    |   X    |

### NoTLS/TLS

| Scenario | Auth A | Auth B |Auth Bp | Auth C | Auth D | Auth E | Auth F | Auth G | Auth I | Auth J | Auth K | Sec W  | Sec X  | Sec Y  | Sec Z  | Reach  |
|:--------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|    1     |   TT   |   TT   |   XT   |   TT   |   TT   |   TT   |   TT   |   CT   |   TT   |   TT   |   CT   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    2     |   XX   |   XX   |   CC   |   ??   |   XX   |   CC   |   CC   |   CC   |   CC   |   CC   |   CC   |   TT   |   CC   |   TT   |   CC   |   CX   |
|    3     |   TT   |   XX   |   XX   |   XT   |   XX   |   XT   |   XT   |   XX   |   XT   |   XT   |   XX   |   XX   |   TT   |   CC   |   TT   |   CX   |
|    4     |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CC   |   TT   |   CC   |   CC   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    5     |   XT   |   XT   |   XT   |   XT   |   XT   |   CT   |   CT   |   CT   |   XT   |   CT   |   XT   |   TT   |   CT   |   TT   |   CT   |   CX   |
|    6     |   TT   |   XT   |   XT   |   XT   |   XT   |   TT   |   TT   |   XT   |   TT   |   TT   |   XT   |   XT   |   TT   |   XT   |   TT   |   CX   |
|    7     |   TT   |   TT   |   XT   |   TT   |   TT   |   TT   |   TT   |   CT   |   TT   |   TT   |   CT   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    8     |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CC   |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    10    |   TT   |   TT   |   XX   |   TT   |   TT   |   TT   |   TT   |   CC   |   TT   |   TT   |   CC   |   TT   |   TT   |   TT   |   TT   |   CX   |
|    11    |   TT   |   TT   |   XX   |   TT   |   TT   |   TT   |   TT   |   CX   |   TT   |   XX   |   XX   |   TT   |   TT   |   TT   |   TT   |   CX   |

### Memory and time requirements (NoTls)

| Scenario |      Auth A     |      Auth B     |     Auth Bp     |      Auth C     |      Auth D     |      Auth E     |      Auth F     |      Auth G     |      Auth I     |      Auth J     |      Auth K     |      Sec W      |      Sec X      |      Sec Y      |      Sec Z      |      Reach      |
|:--------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|
|    1     |   10s / 447MB   |  1922s / 3571MB |    8s / 341MB   |   12s / 448MB   |   56s / 890MB   |   13s / 633MB   |   13s / 633MB   |   13s / 590MB   |   11s / 513MB   |    9s / 391MB   |    9s / 391MB   |    4s / 175MB   |    4s / 175MB   |    3s / 175MB   |    4s / 172MB   |    3s / 153MB   |
|    2     |  377s / 3571MB  |  206s / 2357MB  |   16s / 448MB   |  1875s / 7172MB |   18s / 513MB   |  139s / 1021MB  |  141s / 1021MB  |   48s / 1022MB  |  413s / 4103MB  |   18s / 529MB   |   14s / 448MB   |   11s / 260MB   |   178s / 260MB  |    8s / 260MB   |   342s / 260MB  |    3s / 153MB   |
|    3     |   95s / 1780MB  |   96s / 1780MB  |   66s / 1177MB  |  100s / 2045MB  |   30s / 890MB   |  328s / 4730MB  |  336s / 4730MB  |  263s / 3571MB  |  117s / 2497MB  |   77s / 1558MB  |   79s / 1350MB  |   11s / 391MB   |   14s / 391MB   |    Killed (C)   |  105s / 3108MB  |    5s / 153MB   |
|    4     |  625s / 1781MB  |   158s / 676MB  |  1652s / 3109MB |   26s / 590MB   |    7s / 199MB   | 5082s / 50716MB | 4910s / 50716MB |   63s / 1551MB  |  647s / 2045MB  |  1660s / 3571MB |  1782s / 3571MB |   14s / 298MB   |   13s / 298MB   |   11s / 298MB   |   12s / 298MB   |    3s / 153MB   |
|    5     |  307s / 2707MB  |  287s / 3109MB  |   65s / 1076MB  |  463s / 3109MB  |   71s / 1177MB  |  218s / 2357MB  |  210s / 2357MB  |  228s / 3109MB  |  316s / 3108MB  |   75s / 1177MB  |   79s / 1177MB  |   28s / 590MB   |   180s / 590MB  |   30s / 590MB   |   327s / 590MB  |    4s / 153MB   |
|    6     |   87s / 1780MB  |   86s / 1937MB  |   78s / 1365MB  |  113s / 2045MB  |   29s / 890MB   |  209s / 4728MB  |  207s / 4730MB  |  227s / 3608MB  |   92s / 2045MB  |   78s / 1550MB  |   83s / 1780MB  |   15s / 391MB   |   13s / 391MB   |   65s / 2707MB  |   70s / 2357MB  |    4s / 153MB   |
|    7     |   27s / 677MB   |  8087s / 6242MB |   24s / 532MB   |   32s / 704MB   |   79s / 935MB   |   21s / 776MB   |   20s / 776MB   |   25s / 776MB   |   29s / 776MB   |   29s / 590MB   |   32s / 615MB   |    6s / 199MB   |    6s / 196MB   |    6s / 199MB   |    7s / 192MB   |    4s / 153MB   |
|    8     |   12s / 448MB   |  2490s / 3571MB |   10s / 341MB   |   12s / 448MB   |   81s / 890MB   |   14s / 645MB   |   14s / 648MB   |   15s / 590MB   |   13s / 513MB   |   11s / 391MB   |   11s / 391MB   |    4s / 175MB   |    4s / 154MB   |    4s / 175MB   |    4s / 153MB   |    4s / 153MB   |
|    10    |    5s / 260MB   |   18s / 391MB   |    5s / 199MB   |    6s / 260MB   |   15s / 377MB   |   13s / 612MB   |   12s / 612MB   |   13s / 513MB   |    6s / 298MB   |    5s / 228MB   |    5s / 227MB   |    4s / 155MB   |    4s / 153MB   |    4s / 153MB   |    4s / 153MB   |    4s / 153MB   |
|    11    |    8s / 283MB   |   24s / 401MB   |    6s / 213MB   |    8s / 298MB   |   21s / 391MB   |   17s / 676MB   |   17s / 677MB   |   14s / 513MB   |    9s / 391MB   |    6s / 260MB   |    6s / 228MB   |    4s / 170MB   |    4s / 171MB   |    5s / 163MB   |    4s / 166MB   |    3s / 154MB   |

### Memory and time requirements (Tls)

| Scenario |      Auth A     |      Auth B     |     Auth Bp     |      Auth C     |      Auth D     |      Auth E     |      Auth F     |      Auth G     |      Auth I     |      Auth J     |      Auth K     |      Sec W      |      Sec X      |      Sec Y      |      Sec Z      |      Reach      |
|:--------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|
|    1     |    1s / 134MB   |  633s / 5433MB  |    1s / 118MB   |    1s / 134MB   |  147s / 2357MB  |    2s / 175MB   |    2s / 175MB   |    2s / 175MB   |    2s / 134MB   |    1s / 118MB   |    2s / 134MB   |    2s / 111MB   |    1s / 104MB   |    1s / 104MB   |    1s / 104MB   |    1s / 92MB    |
|    2     |  437s / 3571MB  |  206s / 2357MB  |   16s / 448MB   |  1881s / 7172MB |   21s / 513MB   |  146s / 1021MB  |  145s / 1021MB  |   45s / 1022MB  |  455s / 4103MB  |   21s / 529MB   |   18s / 448MB   |    9s / 260MB   |   177s / 260MB  |   10s / 260MB   |   349s / 260MB  |    1s / 92MB    |
|    3     |    2s / 170MB   |    3s / 175MB   |    2s / 153MB   |    3s / 175MB   |    4s / 199MB   |    5s / 298MB   |    5s / 290MB   |    5s / 326MB   |    3s / 175MB   |    3s / 153MB   |    3s / 175MB   |    2s / 134MB   |    2s / 118MB   |   14s / 134MB   |    4s / 260MB   |    1s / 92MB    |
|    4     |  601s / 5433MB  |  248s / 3108MB  |  590s / 5434MB  |  173s / 3108MB  |  120s / 2045MB  | 3022s / 28983MB | 2793s / 28983MB |  360s / 4730MB  |  574s / 6242MB  |  613s / 5622MB  |  612s / 7172MB  |   90s / 1550MB  |   81s / 1551MB  |   89s / 1550MB  |   76s / 1551MB  |    1s / 92MB    |
|    5     |    5s / 228MB   |    5s / 227MB   |    4s / 204MB   |    5s / 260MB   |    6s / 285MB   |    7s / 298MB   |    7s / 299MB   |   13s / 391MB   |    5s / 228MB   |    4s / 208MB   |    5s / 260MB   |    4s / 199MB   |    3s / 175MB   |    3s / 197MB   |    3s / 175MB   |    1s / 92MB    |
|    6     |    6s / 231MB   |    6s / 260MB   |    6s / 260MB   |    9s / 298MB   |    9s / 341MB   |    7s / 391MB   |    7s / 391MB   |    8s / 448MB   |    6s / 288MB   |    6s / 260MB   |    6s / 341MB   |    6s / 227MB   |    5s / 199MB   |    7s / 392MB   |    6s / 391MB   |    1s / 92MB    |
|    7     |    2s / 153MB   |  1553s / 7172MB |    2s / 153MB   |    3s / 175MB   |  212s / 2706MB  |    4s / 227MB   |    4s / 228MB   |    5s / 228MB   |    3s / 175MB   |    2s / 153MB   |    3s / 175MB   |    2s / 137MB   |    2s / 134MB   |    2s / 134MB   |    2s / 134MB   |    1s / 92MB    |
|    8     |    2s / 123MB   |  599s / 5433MB  |    2s / 118MB   |    2s / 142MB   |  153s / 2557MB  |    3s / 175MB   |    3s / 175MB   |    3s / 175MB   |    2s / 134MB   |    2s / 118MB   |    2s / 134MB   |    2s / 117MB   |    1s / 104MB   |    2s / 109MB   |    2s / 104MB   |    1s / 92MB    |
|    10    |    3s / 175MB   |  157s / 2706MB  |    2s / 153MB   |    3s / 175MB   |  148s / 2357MB  |    4s / 228MB   |    4s / 227MB   |    5s / 260MB   |    3s / 175MB   |    2s / 153MB   |    3s / 175MB   |    2s / 153MB   |    2s / 134MB   |    2s / 153MB   |    2s / 134MB   |    1s / 92MB    |
|    11    |    2s / 134MB   |  206s / 2772MB  |    2s / 134MB   |    2s / 153MB   |  205s / 2706MB  |    3s / 199MB   |    3s / 199MB   |    3s / 186MB   |    2s / 153MB   |    2s / 134MB   |    2s / 153MB   |    2s / 118MB   |    2s / 118MB   |    2s / 118MB   |    2s / 118MB   |    1s / 92MB    |

