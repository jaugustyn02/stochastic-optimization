# Projekt zaliczeniowy - Algorytmy minimalizacji stochastycznej
Projekt polega na prostym opracowaniu statystycznym wyników porównania działania wybranych algorytmów minimalizacji stochastycznej.

Do porównania wybraliśmy poniższe algorytmy:
- **Poszukiwanie przypadkowe (Pure Random Search, PRS)**
- **Metoda wielokrotnego startu (multi-start, MS)**

oraz następujące funkcję do zminimalizowania:
- Funkcja Rastrigina
- Funkcja Schwefela
```
runs: 50 
points: 100 

Rastringin funtion:

<<<<<<< HEAD
[1] 6724 - budget
[1] 3362 - prs_num_runs
ms_mean: 0.3382861
ms_sd: 0.4761059
ms_confidence: 0.2754556 0.4011165
prs_mean: 5.556718
prs_sd: 2.826253
prs_confidence: 5.287752 5.825685
difference: 5.218432
=======
dimensions: 2 
ms_mean: 0.3780844 
prs_mean: 5.494307 
difference: 5.116223 
>>>>>>> a1db55c50c9d5c46ffdf6af197fd7b67e6493313

dimensions: 10 
ms_mean: 23.1825
ms_sd: 5.483774
ms_confidence: 14.84718 31.51782
prs_mean: 107.0609
prs_sd: 12.44911
prs_confidence: 104.8266 109.2953
difference: 83.87843

dimensions: 20 
ms_mean: 71.199
ms_sd: 10.42578
ms_confidence: 41.07034 101.3277
prs_mean: 258.3492
prs_sd: 18.44131
prs_confidence: 254.9253 261.773
difference: 187.1502

Schwefel funtion:

dimensions: 2 
ms_mean: -833.2282
ms_sd: 23.44471
ms_confidence: -985.5819 -680.8746
prs_mean: -664.419
prs_sd: 88.59095
prs_confidence: -966.7932 -362.0449
difference: 168.8092

dimensions: 10 
ms_mean: -3216.353
ms_sd: 151.0336
ms_confidence: -9539.163 3106.457
prs_mean: -1527.3
prs_sd: 253.0647
prs_confidence: -2564.191 -490.4085
difference: 1689.053 

dimensions: 20 
<<<<<<< HEAD
ms_mean: -5869.074
ms_sd: 227.7499
ms_confidence: -20246.45 8508.301
prs_mean: -2167.164
prs_sd: 369.795
prs_confidence: -3711.375 -622.9529
difference: 3701.91
=======
ms_mean: -5931.766 
prs_mean: -2164.188 
difference: 3767.578
```
>>>>>>> a1db55c50c9d5c46ffdf6af197fd7b67e6493313
