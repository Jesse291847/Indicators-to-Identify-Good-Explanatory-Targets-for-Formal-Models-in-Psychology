# When Are Models Useless?

Code accompanying Boot, Hoekstra, van Dongen, de Ron, van der Maas, and Borsboom, *When Are Models Useless? Indicators of Good Explanatory Targets for Validating Formal Models in Psychology*.

## Ising Attitude Model (Figure 3)

`Ising Model mere thought effect alternative scenarios.R` reproduces Figure 3 in the manuscript.

## Addiction Modeling Framework (Figure 4)

`Budworm modeling framework v0.1.nlogo` is the NetLogo implementation of the Addiction Modeling Framework (Boot et al., 2026). When opened in NetLogo (Wilensky, 1999), it can be used to obtain results similar to those in Figure 4 of the paper by following these steps:

1. Open the model in NetLogo and click `setup-contagion`.
2. Click `intervene-k` five times to give five agents access to the substance.
3. Click go. For the left panel, first set `kappa` to 0.3; the right panel uses the default settings.

Because the model contains stochastic elements results can vary between runs, but will be qualitatively similar, with respect to which phenomenon is produced. In addition, it should be noted that changing `kappa` is only one way to get different scenarios in the model. Any change that could affect the balance between social influence and selection could cause this shift, for details see the full paper AMF by Boot et al., 2026). 
