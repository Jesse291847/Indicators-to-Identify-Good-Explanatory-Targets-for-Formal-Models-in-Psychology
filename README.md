# When Are Models Useless?

Code accompanying Boot, Hoekstra, van Dongen, de Ron, van der Maas, and Borsboom, *When Are Models Useless? Indicators of Good Explanatory Targets for Validating Formal Models in Psychology*.

## Ising Attitude Model (Figure 3)

`Ising Model mere thought effect alternative scenarios.R` reproduces Figure 3 in the manuscript.

## Addiction Modeling Framework (Figure 4)

`Budworm modeling framework v0.1.nlogo` is the NetLogo implementation of the Addiction Modeling Framework (Boot et al., 2026). It can be used to obtain results similar to those in Figure 4 of the paper by following these steps:

1. Open the model in NetLogo and click `setup-contagion`.
2. Click `intervene-k` five times to give five agents access to the substance.
3. Click go. For the left panel, first set `kappa` to 0.3; the right panel uses the default settings.
