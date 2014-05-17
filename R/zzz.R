volatile <- new.env(TRUE, emptyenv())

detectCores <- parallel::detectCores
.onLoad <- function(libname, pkgname) {
  cores <- detectCores()
  volatile$detectedCoresSuccess <- !is.na(cores)
  if (is.na(cores)) cores <- 2L # a fallback expecting higher-end desktop ...
  volatile$detectedCores <- cores
}
.onAttach <- function(libname, pkgname)
    packageStartupMessage("WARNING: multicore has been superseded and will be removed shortly")

children <- parallel:::children
collect <- mccollect
exit <- parallel:::mcexit
fork <- parallel:::mcfork
kill <- parallel:::mckill
parallel <- mcparallel
processID <- parallel:::processID
