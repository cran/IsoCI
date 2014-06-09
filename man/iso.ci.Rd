\name{iso.ci}
\alias{iso.ci}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate confidence intervals for cumulative distribution function of current stuas failure times
}
\description{
Calculate untransformed and transforemd Wald-type confidence intervals, bootstrap confidente inverals and boostrap-Wald confidnece intervals for cumulative distribution function of current stuas failure times.
}
\usage{
iso.ci(z, d, alpha=0.05, h.opt=0.3, nboots=500, method="wald.tr", seed=1253)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{
a vector of covariate 
}
  \item{d}{
a vector of outcome
}
  \item{alpha}{
a test level for 100*(1-alpha) two-sided confidence intervals.
}
  \item{h.opt}{
an optimal bandwidth for estimating g (for "wald.tr" only)
}
  \item{nboots}{
the number of bootstrap iteration  (for "bt" and  "bt.wald")
}
  \item{method}{
"wald.tr" for untransformed and transformed Wald confidence intervals, "bt" for bootstrap confidence intervals, and "bt.wald" for bootstrap-Wald confidence intervals.
}
  \item{seed}{
seed value for bootstarp and bootstrap-Wald methods
}
}
%% \details{
%%  ~~ If necessary, more details than the description above ~~
%% }
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  \item{z}{ ordered covariate}
  \item{yf}{ NPMLE estimate for cumulative distribution function}
  \item{wald.lhm}{ left side of non-transformed Wald CI}
  \item{wald.rhm}{ right side of non-transformed Wald CI}
  \item{logit.lhm}{ left side of logit transformed Wald CI}
  \item{logit.rhm}{ right side of logit transformed Wald CI}
  \item{llog.lhm}{ left side of log(-log) transforemd Wald CI}
  \item{llog.rhm}{ right side of log(-log) transforemd Wald CI}
  \item{nbt.lhm}{ left side of bootstrap CI}
  \item{nbt.rhm}{ right side of bootstrap CI}
  \item{bt.wald.lhm}{ left side of non-transformed boostrap-Wald CI}
  \item{bt.wald.rhm}{ right side of non-transformed boostrap-Wald CI}
  \item{bt.logit.lhm}{ left side of logit transformed boostrap-Wald CI}
  \item{bt.logit.rhm}{ right side of logit transformed boostrap-Wald CI}
  \item{bt.llog.lhm}{ left side of log(-log) transforemd boostrap-Wald CI}
  \item{bt.llog.rhm}{ right side of log(-log) transforemd boostrap-Wald CI}
}
\references{
Choi, B. Y., Fine, J. P., and Brookhart, M. A. (2013) Practicable confidence intervals for current status data. Statistics in Medicine 32, 1419-1428.

Ghosh, D., Banerjee, M., and Biswas, P. (2008). Inference for Constrained Estimation of Tumor Size Distributions. Biometrics 64, 1009-1017.

Groeneboom, P. and Wellner, J. A. (1992). Information Bounds and Nonparametric Maximum Likelihood Estimation. Boston: Birkhauser.

}
\author{
Choi, B. Y., Fine, J. P., and Brookhart, M. A.
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{bandwidth.choose}}
}
\examples{
# simulating data


n <- 50
z <- rexp(n)
pz <- pexp(z)
d <- rbinom(n,1,pz)

# finding optimal bandwidth for estimationg a density function
h.opt = bandwidth.choose(h.set=seq(0.1,2,len=15),z=z,d=d)

# Untransforemd and transformed Wald-type confidence intervals
fit.wald <- iso.ci(z=z,d=d,h.opt=h.opt$h.opt)

# Bootstrap confidence intervals
\dontrun{fit.bt <- iso.ci(z=z,d=d,method="bt",nboots=100) }

# Untransforemd and transformed bootstrap-Wald-type confidence intervals
\dontrun{fit.bt.wald <- iso.ci(z=z,d=d,method="bt.wald",nboots=100)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{confidenc intervals}
\keyword{transformation}
\keyword{bootstrap}
