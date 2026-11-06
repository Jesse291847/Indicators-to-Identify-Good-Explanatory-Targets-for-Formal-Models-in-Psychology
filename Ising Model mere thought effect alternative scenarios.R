library(IsingSampler)

# ---- Build the likelihood AND plot it ----
plot_likelihood <- function(graph, thresh, beta, thrLabel, showY = TRUE) {
  L <- IsingLikelihood(graph, thresh, beta = beta, responses = c(-1L, 1L))
  
  nNodes    <- ncol(L) - 1
  sumScores <- rowSums(L[, -1])
  scores    <- seq(-nNodes, nNodes, by = 2)
  
  scoreProb <- tapply(L[, 1], factor(sumScores, levels = scores), sum)
  scoreProb[is.na(scoreProb)] <- 0
  
  bp <- barplot(scoreProb,
                axisnames = FALSE,
                yaxt = "n",
                main = bquote(.(thrLabel) * ", N=" * .(nNodes) * "," ~ beta == .(beta)),
                col  = "skyblue",
                border = NA,
                ylim = c(0, 1),
                cex.main = 1.25)

  ticks <- c(-nNodes, 0, nNodes)
  axis(1, at = bp[scores %in% ticks], labels = ticks, cex.axis = 1.3)
  if (showY) axis(2, at = c(0, 0.5, 1), las = 1, cex.axis = 1.3)
}

# ---- Conditions ----
N      <- 20
Nsmall <- 8

Graph20 <- matrix(0.1, N, N);           diag(Graph20) <- 0
Graph8  <- matrix(0.1, Nsmall, Nsmall); diag(Graph8)  <- 0

thr0_20  <- rep(0, N)                  # rows 1 & 3: all thresholds 0
thrSplit <- rep(c(-1.5, 1.5), N / 2)   # row 2: alternating -1.5 / 1.5
thr0_8   <- rep(0, Nsmall)

betas <- c(0.5, 1, 1.5)

# ---- 3 x 3 figure ----
pdf("ising_sumscores_3x3_v2.pdf", width = 12, height = 10)
par(mfrow = c(3, 3), mar = c(3, 4.5, 3.5, 1), oma = c(3.5, 3.5, 0, 0))
par(cex = 1)  # mfrow shrinks cex to 0.66 for 3x3; reset

# Row 1: zero thresholds, N = 20, beta increasing
for (i in 1:3) plot_likelihood(Graph20, thr0_20,  betas[i], quote(tau == 0),
                               showY = (i == 1))
# Row 2: zero thresholds, smaller network (N = 8), beta increasing
for (i in 1:3) plot_likelihood(Graph8,  thr0_8,   betas[i], quote(tau == 0),
                               showY = (i == 1))
# Row 3: split thresholds, N = 20, beta increasing
for (i in 1:3) plot_likelihood(Graph20, thrSplit, betas[i], quote(tau == "" %+-% 1.5),
                               showY = (i == 1))

# Shared axis labels
mtext("Sum score",   side = 1, outer = TRUE, line = 1.5, cex = 1.3, font = 2)
mtext("Probability", side = 2, outer = TRUE, line = 1.5, cex = 1.3, font = 2)

dev.off()



