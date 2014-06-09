\name{bandwidth.choose}
\alias{bandwidth.choose}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Selection of optiaml bandwidth for nonparametric density estimation of currenst status failure times.
}
\description{
Conduct likelihood-based leave-one-out croos-validation (loocv) to select optimal bandwidth for nonparametric density estimation of currenst status failure times.
}

\usage{
bandwidth.choose(h.set, z, d)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{h.set}{a set of bandwith values
}
  \item{z}{a vector of covariate
}
  \item{d}{a vector of outcome
}
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{h.opt}{an optimal bandwidth}
  \item{result.table}{the 1st column: bandwidth, the 2nd column: loocv-log-likelihood value}

}
\references{
Choi, B. Y., Fine, J. P., and Brookhart, M. A. (2013) Practicable confidence intervals for current status data. Statistics in Medicine 32, 1419-1428.

Ghosh, D., Banerjee, M., and Biswas, P. (2008). Inference for Constrained Estimation of Tumor Size Distributions. Biometrics 64, 1009-1017.

Groeneboom, P. and Wellner, J. A. (1992). Information Bounds and Nonparametric Maximum Likelihood Estimation. Boston: Birkhauser.
}
\author{
Choi, B. Y., Fine, J. P., and Brookhart, M. A.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link{iso.ci}}
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
\keyword{bandwidth}

