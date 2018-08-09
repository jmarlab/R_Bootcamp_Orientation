# View contents of the cloned repo
dir()

# Set working directory to Day 2
setwd("Diff_Exp/")
dir()

# Read the contents of BRCA RNA-Seq dataset
# This dataset is filtered for lowly expressed genes
brca <- read.csv("BRCA_merged_clinicaldata_RNAseq_normalized.csv", fill = T)
dim(brca)


# head(brca) Not recommended because of the size of the dataframe
colnames(brca)[1:20]

# Genes start at column 14 and Columns 2-13 is phenotype data
# Subset the entire dataframe into expression data and phenotype data

# Expression Data
edat <- brca[,12:ncol(brca)]
# Transpose dataframe to make it compatible as a gene x sample matrix
edat <- t(edat)


edat <- voom(edat, plot = T)


# Phenotype data
pdat <- brca[,2:11]

# Separate aspects of phenotype data that are relevant for clinical adjustments
colnames(pdat)

status <- pdat$shortLetterCode # NT= Normal Tissue, TP= Tumor primary, TM= Tumor metastatic
race <- pdat$race
gender <- pdat$gender
patient <- pdat$patient

table(status)
table(race)
table(gender)


# Install and load limma Package (https://bioconductor.org/packages/release/bioc/html/limma.html)
# source("https://bioconductor.org/biocLite.R")
# biocLite("limma")

library(limma)


# Make a design matrix to specify phenotype data for the linear model
# Row number of design matrix needs to match column number of expression data
design <- model.matrix(~0+status)
colnames(design) <- c("Normal", "Metastatic", "Primary")

#dc <- duplicateCorrelation(edat, design, block=patient)
#dc$consensus.correlation

# Fit the linear model
fit <- lmFit(object = edat, design = design)

# Make contrasts to compare between conditions
my.contrasts <- makeContrasts(
  Pri_vs_Nor = Primary-Normal,
  levels = design
)

fit2 <- contrasts.fit(fit = fit, contrasts = my.contrasts)
fit2 <- eBayes(fit2)

deg_Pri_vs_Nor <- topTable(fit2, coef = "Pri_vs_Nor", adjust.method = "BH", p.value = 0.001, number = nrow(fit2))


# Make a design matrix to specify phenotype data for the linear model
# Row number of design matrix needs to match column number of expression data
design <- model.matrix(~0+status+race+gender)
colnames(design)[1:3] <- c("Normal", "Metastatic", "Primary")

# Fit the linear model
fit <- lmFit(object = edat, design = design)
colnames(design) <- make.names(colnames(design))

# Make contrasts to compare between conditions
my.contrasts <- makeContrasts(
  Pri_vs_Nor = Primary-Normal,
  levels = design
)


colnames(fit$coefficients) <- rownames(my.contrasts)

fit2 <- contrasts.fit(fit = fit, contrasts = my.contrasts)
fit2 <- eBayes(fit2)

deg_Pri_vs_Nor_2 <- topTable(fit2, coef = "Pri_vs_Nor", adjust.method = "BH", p.value = 0.001, number = nrow(fit2))

volcanoplot(fit = fit2)

AdjP <- deg_Pri_vs_Nor$adj.P.Val
logFC <- deg_Pri_vs_Nor$logFC

# Make a basic volcano plot
with(deg_Pri_vs_Nor, plot(logFC, -log10(AdjP), pch=20, main="Volcano plot", xlab = "logFC", ylab = "-log10(Adj.P.Value)"))

abline(v = c(-5,5), col = "red", lty = 3, lwd=2)
