#' # getParseData() failure for installed packages

#' Parse data not found for `f`
nrow(getParseData(covr.dummy::f))
#' ...only for `g`
nrow(getParseData(covr.dummy::g))

f_srcref <- getSrcref(covr.dummy::f)
f_srcfile <- attr(f_srcref, "srcfile")

#' `f_srcfile` doesn't have `parseData`
ls(f_srcfile)
f_srcfile$original

#' `original` doesn't have `parseData`, but probably should
ls(f_srcfile$original)

g_srcref <- getSrcref(covr.dummy::g)
g_srcfile <- attr(g_srcref, "srcfile")

#' `g_srcfile` has `parseData`, which probably belongs in `g_srcfile$original`
ls(g_srcfile)
g_srcfile$original
ls(g_srcfile$original)

#' both `original` are identical
stopifnot(identical(f_srcfile$original, g_srcfile$original))
