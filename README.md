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

dimensions: 2 
ms_mean: 0.3780844 
prs_mean: 5.494307 
difference: 5.116223 

dimensions: 10 
ms_mean: 23.1427 
prs_mean: 107.0207 
difference: 83.87805 

dimensions: 20 
ms_mean: 67.87587 
prs_mean: 258.3817 
difference: 190.5058 

Schwefel funtion:

dimensions: 2 
ms_mean: -837.9658 
prs_mean: -666.2216 
difference: 171.7442 

dimensions: 10 
ms_mean: -3237.575 
prs_mean: -1530.045 
difference: 1707.529 

dimensions: 20 
ms_mean: -5931.766 
prs_mean: -2164.188 
difference: 3767.578
```
