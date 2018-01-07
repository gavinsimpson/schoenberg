##' Quantile Quantile diagnostics for GAMs
##'
##' Prepares data in a tidy format suitable for drawing QQ plots of estimated
##' GAMs.
##'
##' @param object an object of class `"gam"`.
##' @param simulate logical;
##' @param type character;
##' @param level numeric; coverage level for simulated confidence bands.
##' @param n.sim numeric; number of simulations.
##' @param ... arguments passed to other methods.
##'
##' @return A data frame.
##'
##' @importFrom stats residuals
##' @importFrom mgcv fix.family.qf
##'
##' @author Gavin L. Simpson
##'
##'
`qq_gam` <- function(object,
                     simulate = TRUE,
                     type = c("deviance", "pearson", "response"),
                     level = 0.9,
                     n.sim = 50,
                     ...) {
    type <- match.arg(type)
    sig2 <- object[["sig2"]]
    if (is.null(sig2)) {
        sig2 <- summary(object)[["dispersion"]]
    }

    D <- residuals(object)
    D <- D[!is.na(D)]                   # remove any added NAs

    f <- fix.family.qf(family(object))

    if (is.null(f)) {
        simulate = FALSE
    }


}
